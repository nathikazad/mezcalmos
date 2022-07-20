import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

enum ServiceContact { Phone, Email }

class AddLaundryServiceViewController {
  // instances //
  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
      ["pages"]["AddLaundryServiceView"];
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  // inputs //
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneCountry = TextEditingController();
  final TextEditingController name = TextEditingController();

  Rx<ServiceContact> serviceContact = Rx(ServiceContact.Email);

  // init //
  void init() {
    phoneCountry.text = "+52";
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

  Future<void> createLaundry() async {
    await laundryInfoController
        .createLaundry(
            laundryName: name.text, laundryPhoneOrEmail: _getServiceContact)
        .then((ServerResponse value) {
      if (value.success) {
        Get.back();
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
