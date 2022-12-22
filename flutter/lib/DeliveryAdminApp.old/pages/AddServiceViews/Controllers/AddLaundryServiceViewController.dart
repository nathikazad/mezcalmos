import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/laundryInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

enum ServiceContact { Phone, Email }

// enum ServiceProviderType { Laundry, Restaurant }

class AddServiceViewController {
  // instances //
  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
      ["pages"]["AddLaundryServiceView"];
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  RestaurantsInfoController _restaurantInfoController =
      Get.find<RestaurantsInfoController>();
  // inputs //
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneCountry = TextEditingController();
  final TextEditingController name = TextEditingController();

  Rx<ServiceContact> serviceContact = Rx(ServiceContact.Email);
  Rx<ServiceProviderType> serviceType = Rx(ServiceProviderType.Laundry);

  // init //
  void init({required ServiceProviderType serviceType}) {
    phoneCountry.text = "+52";
    this.serviceType.value = serviceType;
  }

// dispose //
  void dispose() {
    phone.dispose();
    phoneCountry.dispose();
    name.dispose();
    email.dispose();
  }

  // form validations //

  String? requiredValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '${_i18n()["required"]}';
    } else
      return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return '${_i18n()["required"]}';
    } else if (!((phoneCountry.text + value).trim().isPhoneNumber)) {
      return '${_i18n()["phoneNotCorrect"]}';
    } else
      return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '${_i18n()["required"]}';
    } else if (!value.isEmail) {
      return '${_i18n()["emailNotCorrect"]}';
    } else {
      return null;
    }
  }

  void switchPhone() {
    serviceContact.value = ServiceContact.Phone;
  }

  void switchEmail() {
    serviceContact.value = ServiceContact.Email;
  }

  String _contructPhoneNumber() {
    return ((phoneCountry.text + phone.text).trim());
  }

  String get _getServiceContact {
    if (serviceContact == ServiceContact.Email) {
      return email.text.inCaps;
    } else {
      return _contructPhoneNumber();
    }
  }

  Future<void> saveService() async {
    if (serviceType == ServiceProviderType.Laundry) {
      await _createLaundry();
    } else {
      await _createRestaurant();
    }
  }

  Future<void> _createLaundry() async {
    await laundryInfoController
        .createLaundry(
            laundryName: name.text, laundryPhoneOrEmail: _getServiceContact)
        .then((ServerResponse value) {
      if (value.success) {
        MezRouter.back();
      } else {
        Get.snackbar(
          "Error",
          "${value.errorMessage}",
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    });
  }

  Future<void> _createRestaurant() async {
    await _restaurantInfoController
        .createRestaurant(
            restaurantName: name.text, laundryPhoneOrEmail: _getServiceContact)
        .then((ServerResponse value) {
      if (value.success) {
        MezRouter.back();
      } else {
        Get.snackbar(
          "Error",
          "${value.errorMessage}",
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    });
  }
}
