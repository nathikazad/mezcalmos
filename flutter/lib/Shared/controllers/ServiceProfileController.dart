import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/graphql/delivery_partner/hsDeliveryPartner.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/ServiceInfoEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferView/ServiceOfferView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/OperatorsListView.dart';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart' as pHandler;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ServiceProfileController extends GetxController {
  // constants //
  late int serviceId;
  late int detailsId;
  int? deliveryDetailsId;
  // state vars //
  Rxn<Service> _service = Rxn();
  Rxn<ServiceLink> _serviceLink = Rxn();
  Rxn<DeliveryCost> _serviceDeliveryCost = Rxn();

  RxBool _isAprroved = RxBool(true);
  // getters //
  Service get service => _service.value!;
  ServiceLink? get serviceLink => _serviceLink.value;
  bool get isApproved => _isAprroved.value;
  bool get selfDelivery => (_serviceDeliveryCost.value?.selfDelivery ?? false);
  bool get hasData => _service.value != null;
  bool get isBusiness =>
      service.serviceProviderType == cm.ServiceProviderType.Business;

  bool get isAvailable => _service.value!.state.isOpen;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // methods //
  // init //
  void assignVars(
      {required int serviceDetailsId,
      required int serviceId,
      required int? deliveryDetailsId}) {
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
    this.deliveryDetailsId = deliveryDetailsId;
  }

  Future<void> fetchService() async {
    _service.value = await get_service_details_by_id(
        serviceDetailsId: detailsId, serviceId: serviceId, withCache: false);
    if (_service.value!.serviceLinkId != null) {
      mezDbgPrint(
          "👋 called get service link ===========>${_service.value!.serviceLinkId}");

      unawaited(_fetchServiceLink());
    }
    if (deliveryDetailsId != null) {
      _serviceDeliveryCost.value =
          await get_delivery_cost(deliveryDetailsId: deliveryDetailsId!);
      int? data = await get_service_delivery_partner(
          serviceId: serviceId, providerType: service.serviceProviderType!);
    }

    if (_service.value != null) {
      _isAprroved.value = _service.value!.state.approved;
      _service.refresh();
    }
  }

  Future<void> _fetchServiceLink() async {
    _serviceLink.value = await get_service_link_by_id(
        serviceLinkId: _service.value!.serviceLinkId!);
  }

  Future<void> toggleOnlineOrdering(bool value) async {
    try {
      final bool res = await update_business_online_ordering(
        detailsId: detailsId,
        onlineOrdering: value,
      );
      _service.value!.onlineOrdering = res;
    } catch (e) {
      print(e);
    }
  }

  double get getAppbarHeight {
    double height = 0;
    if (!isApproved) {
      height += kToolbarHeight;
    }
    if (service.state.isClosedIndef) {
      height += kToolbarHeight;
    }
    return height;
  }

  Future<void> switchOpen(bool value) async {
    mezDbgPrint(value);
    bool res = await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedIndefinitely,
        approved: null,
        detailsId: detailsId);
    if (res) {
      unawaited(fetchService());
    }
  }

  Future<void> navigateToEdit() async {
    bool? refetch = await ServiceInfoEditView.navigate(
        serviceDetailsId: detailsId,
        serviceProviderId: serviceId,
        serviceProviderType: service.serviceProviderType!);

    if (refetch == true) {
      unawaited(fetchService());
    }
  }

  Future<void> navigateToOperators() async {
    // ignore: unawaited_futures
    OperatorsListView.navigate(
        serviceProviderId: serviceId,
        serviceLinkId: service.serviceLinkId,
        serviceProviderType: service.serviceProviderType!);
  }

  Future<void> navigateToDeliverySettings() async {
    await DeliverySettingsView.navigate(
        serviceProviderId: serviceId,
        detailsId: detailsId,
        deliveryDetailsID: deliveryDetailsId!,
        serviceProviderType: service.serviceProviderType!);
  }

  Future<void> navigateToDrivers() async {
    if (service.serviceLinkId != null) {
      await ServiceDriversListView.navigateToDrivers(
          serviceLinkId: service.serviceLinkId!,
          serviceProviderId: serviceId,
          controllerType: service.serviceProviderType!);
    }
  }

  Future<void> navigateToOffers() async {
    // ignore: unawaited_futures
    ServiceOfferView.navigate(
        serviceProviderId: serviceId,
        serviceLinkId: service.serviceLinkId,
        serviceProviderType: service.serviceProviderType!);
  }

  Future<void> downloadPdfFromLink(String url) async {
    try {
      if (kIsWeb) {
        return;
      }
      File? file;
      final String fileName = "business_flyer_${DateTime.now()}.pdf";
      // Get the application documents directory
      if (Platform.isIOS) {
        final Directory dir = await getTemporaryDirectory();
        file = File('${dir.path}/$fileName');
      } else if (Platform.isAndroid) {
        final Map<pHandler.Permission, pHandler.PermissionStatus> statuses =
            await [
          pHandler.Permission.storage,
          pHandler.Permission.manageExternalStorage,
          pHandler.Permission.accessMediaLocation,
        ].request();

        var storage = statuses[pHandler.Permission.storage];
        var manageExternalStorage =
            statuses[pHandler.Permission.manageExternalStorage];
        var accessMediaLocation =
            statuses[pHandler.Permission.accessMediaLocation];
        if (storage!.isGranted ||
            manageExternalStorage!.isGranted ||
            accessMediaLocation!.isGranted) {
          final Directory dir = await getTemporaryDirectory();
          file = File('${dir.path}/$fileName');
        }
      }
      // Download the PDF file
      final http.Response response = await http.get(Uri.parse(url));

      // Save the file to the specified path
      await file!.writeAsBytes(response.bodyBytes);
      final String filePath = file.path;
      print('PDF downloaded successfully. File path: $filePath');
      await OpenFile.open(filePath);
    } catch (e) {
      print('Failed to download PDF: $e');
    }
  }

  Future<File?> getDownloadedBusinessImage() async {
    if (kIsWeb) {
      return null;
    }
    final String fileName = "business_story_${DateTime.now()}.png";
    // Get the application documents directory
    File? file;
    if (Platform.isIOS) {
      final Directory dir = await getApplicationDocumentsDirectory();
      file = File('${dir.path}/$fileName');
    } else if (Platform.isAndroid) {
      final Map<pHandler.Permission, pHandler.PermissionStatus> statuses =
          await [
        pHandler.Permission.storage,
      ].request();

      final storage = statuses[pHandler.Permission.storage];
      if (storage!.isGranted) {
        // final String downloadsFolderPath = ;
        final Directory? dir = await getExternalStorageDirectory();
        file = File('${dir!.path}/$fileName');
      }
    }
    try {
      final String filePath = file!.path;

      // Download the PDF file
      final http.Response response = await http.get(Uri.parse(businessStoryEn));

      // Save the file to the specified path
      // File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('Story Image downloaded successfully. File path: $filePath');
    } catch (e) {
      print('Failed to download Story Image: $e');
    }
    return file;
  }
}
