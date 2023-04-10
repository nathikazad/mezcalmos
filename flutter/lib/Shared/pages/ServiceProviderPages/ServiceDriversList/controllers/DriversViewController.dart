import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class DriversViewController {
  // instances and streams subscriptions

  RxList<DeliveryDriver> drivers = RxList.empty();

  RxnString opDeepLink = RxnString();
  RxnString qrImageLink = RxnString();

  Rxn<ServiceLink> serviceLink = Rxn();

  // getters //
  /// Restaurant already has deep links generated
  bool get hasLinks {
    return serviceLink.value != null &&
        serviceLink.value!.driverDeepLink != null &&
        serviceLink.value!.driverQrImageLink != null;
  }

  // late variables //
  late cModels.ServiceProviderType serviceProviderType;
  late int serviceProviderId;
  late int serviceLinkId;
  Future<void> init(
      {required int serviceProviderId,
      required int servLinkId,
      required cModels.ServiceProviderType serviceProviderType}) async {
    this.serviceProviderId = serviceProviderId;
    serviceLinkId = servLinkId;
    this.serviceProviderType = serviceProviderType;
    await fetchDrivers();
    await fetchServiceLinks();

    mezDbgPrint("Init operators of restaurant id  ====>$serviceProviderId");
  }

  Future<void> fetchServiceLinks() async {
    try {
      serviceLink.value = await get_service_link_by_id(
          serviceLinkId: serviceLinkId, withCache: false);
    } on Exception {
      mezDbgPrint("Service dont have links");
    }
  }

  Future<void> fetchDrivers() async {
    try {
      drivers.value = await get_drivers_by_service_provider_id(
              serviceProviderId: serviceProviderId, withCache: false) ??
          [];
    } on Exception catch (e, stk) {
      mezDbgPrint("Service dont have drivers yet");
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> approveDriver(
      {required bool approved, required int driverId}) async {
    try {
      final cModels.AuthorizeDriverResponse res =
          await CloudFunctions.serviceProvider_authorizeDriver(
        deliveryDriverId: driverId,
        approved: approved,
        deliveryServiceProviderType: partType,
      );
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      await fetchDrivers();
    } on FirebaseException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(errorText: e.message.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  cModels.DeliveryServiceProviderType get partType {
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        return cModels.DeliveryServiceProviderType.Restaurant;
        break;
      case cModels.ServiceProviderType.Laundry:
        return cModels.DeliveryServiceProviderType.Laundry;
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        return cModels.DeliveryServiceProviderType.DeliveryCompany;
        break;
      default:
        return cModels.DeliveryServiceProviderType.DeliveryCompany;
    }
  }
}
