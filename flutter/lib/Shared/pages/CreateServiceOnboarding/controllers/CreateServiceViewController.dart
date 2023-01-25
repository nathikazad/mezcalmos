import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class CreateServiceViewController {
  // instances //
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  PageController pageController = PageController(initialPage: 0);
  // text inputs //
  TextEditingController serviceName = TextEditingController();
  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();

  // obs //
  RxnNum previewCost = RxnNum();
  Rxn<DeliveryCost> deliveryCost = Rxn();
  RxInt currentPage = RxInt(0);
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  Rx<ServiceInput> serviceInput = Rx(ServiceInput());

  // info inputs //

  final Rxn<Location> newLocation = Rxn();
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  // schedule //
  final Rx<Schedule> newSchedule = Rx(Schedule.fromData(defaultSchedule));
  final Rx<Schedule> schedulePreview = Rx(Schedule.fromData(defaultSchedule));
  final Rx<Schedule> oldSchedule = Rx(Schedule.fromData(defaultSchedule));
  // vars
  late ServiceProviderType serviceType;

  // getters //

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(newImageFile.value!);
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }

  // methods //
  void init({required ServiceProviderType serviceProviderType}) {
    serviceType = serviceProviderType;
  }

  Future<void> getDeliveryCompanies() async {
    deliveryCompanies.clear();
    final DeliveryCompany? data = await get_delivery_company(companyId: 1);
    if (data != null) {
      deliveryCompanies.add(data);
    }
  }

  Future<void> _setImage() async {
    if (newImageFile.value != null) {
      // todo compress and upload image to db and set it to the object
      //   newImageUrl.value = await _authController.uploadUserImgToFbStorage(
      //       imageFile: newImageFile.value!, isCompressed: false);
      // }
    }
  }

  Future<void> editImage(context) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      imageLoading.value = true;

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          newImageFile.value = File(_res.path);
        }
        imageLoading.value = false;
      } catch (e) {
        imageLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  void setNewLocation(Location newLoc) {
    newLocation.value = newLoc;
  }

  void switchDeliveryType(ServiceDeliveryType? value) {
    serviceInput.value.deliveryType = value;
    serviceInput.refresh();
  }

  String getTitle() {
    switch (currentPage.value) {
      case 0:
        return "Informations";
      case 1:
        return "Schedule";
      case 2:
        return "Delivery";

      default:
        return "";
    }
  }

  String getSaveButtonTitle() {
    if (currentPage.value == 2) {
      return "Save";
    } else
      return "Next";
  }

  void handleBack() {
    if (currentPage == 0) {
      MezRouter.back();
    } else {
      pageController
          .animateToPage(currentPage.value - 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
          .whenComplete(() => currentPage.value = pageController.page!.toInt());
    }
  }

  Future<void> handleNext() async {
    switch (currentPage.value) {
      case 0:
        handleInfoPageNext();
        break;
      case 1:
        handleScheduleNext();
        break;

      default:
        await _createService();
    }
  }

  void calculatePreview() {
    final double dist = double.parse(distancePreview.text);
    final double kmCost = double.parse(costPerKm.text);
    final double min = double.parse(costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(costPerKm.text) != null &&
        double.tryParse(minCost.text) != null &&
        double.tryParse(costPerKm.text) != null;
  }

  DeliveryCost _constructDeliveryCost() {
    mezDbgPrint("freeKmRange.text =====> [BBB] ===> ${freeKmRange.text}");
    return DeliveryCost(
        id: null,
        serviceProviderType: serviceType,
        serviceProviderId: Random().nextInt(5),
        minimumCost: double.parse(minCost.text),
        freeDeliveryKmRange: double.tryParse(freeKmRange.text),
        costPerKm: double.parse(costPerKm.text));
  }

  void handleInfoPageNext() {
    if (_infoIsValid) {
      serviceInput.value.serviceInfo = ServiceInfo(
          location: newLocation.value!,
          hasuraId: Random().nextInt(5),
          image: newImageUrl.value,
          name: serviceName.text);
    }
    pageController
        .animateToPage(currentPage.value + 1,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn)
        .whenComplete(() => currentPage.value = pageController.page!.toInt());
  }

  void handleScheduleNext() {
    serviceInput.value.schedule = newSchedule.value;
    pageController
        .animateToPage(currentPage.value + 1,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn)
        .whenComplete(() => currentPage.value = pageController.page!.toInt());
  }

  bool get _infoIsValid =>
      serviceName.text.length > 3 && newLocation.value != null;

  Future<void> _createService() async {
    if (serviceInput.value.deliveryType == ServiceDeliveryType.Self_delivery) {
      serviceInput.value.deliveryPartnerId = null;
      serviceInput.value.selfDeliveryCost = _constructDeliveryCost();
    } else {
      serviceInput.value.selfDeliveryCost = null;
    }

    mezDbgPrint(serviceInput.value.toString());
  }
}
