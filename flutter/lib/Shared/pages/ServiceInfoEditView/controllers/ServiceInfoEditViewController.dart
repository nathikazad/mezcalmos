import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

abstract class ServiceInfoEditViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  // TEXT INPUTS //
  TextEditingController serviceNameTxt = TextEditingController();
  TextEditingController primaryServiceDesc = TextEditingController();
  TextEditingController secondayServiceDesc = TextEditingController();

  // OBS //

  Rxn<Service> service = Rxn<Service>();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<Location> newLocation = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();
  final Rxn<LanguageType> editablePrLang = Rxn();
  final Rxn<LanguageType> editableScLang = Rxn();
  final Rxn<File> newImageFile = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool isAvailable = RxBool(false);
  final RxBool isApproved = RxBool(true);

// LATE VARS
  late int serviceId;
  late ServiceProviderType serviceType;

  int? newDescId;
// INIT //

  Future<void> init({
    required int serviceProvierId,
    required ServiceProviderType serviceProviderType,
  }) async {
    serviceType = serviceProviderType;
    serviceId = serviceProvierId;
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$serviceId");

    await fetchService();
    _setServiceInfo();
  }

  Future<void> fetchService() async {}
  void _setServiceInfo() {
    if (service.value != null) {
      serviceNameTxt.text = service.value?.info.name ?? '';

      newLocation.value = service.value!.info.location;
      newImageUrl.value = service.value?.info.image;
      primaryLang.value = service.value!.primaryLanguage;
      secondaryLang.value = service.value!.primaryLanguage.toOpLang();
      editablePrLang.value = service.value!.primaryLanguage;
      editableScLang.value = service.value!.primaryLanguage.toOpLang();

      primaryServiceDesc.text =
          service.value?.info.description?[primaryLang] ?? '';
      secondayServiceDesc.text =
          service.value?.info.description?[secondaryLang] ?? '';
    }
  }

  Future<void> updateServiceDescriptionDescription() async {
    if (!fd.mapEquals(service.value!.info.description, _contructDesc())) {
      if (service.value!.info.descriptionId != null) {
        _contructDesc().forEach((LanguageType key, String value) {
          update_translation(
              langType: key,
              value: value,
              translationId: service.value!.info.descriptionId!);
        });
      } else {
        newDescId = await insert_translation(
            translation: _contructDesc(),
            serviceType: serviceType,
            serviceId: serviceId);
      }
    }
  }

  Future<void> updateServiceInfo() async {}
  //
  Future<bool> saveInfo() async {
    try {
      await updateServiceDescriptionDescription();
      await updateServiceInfo();
      return true;
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
    }
  }

  void setNewLocation(Location? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  // void changePrimaryLang(LanguageType value) {
  //   editablePrLang.value = value;
  //   editableScLang.value = value.toOpLang();
  // }

  // bool validateSecondaryLanguUpdate(LanguageType value) {
  //   if (primaryLang.value != null) {
  //     if (value != primaryLang.value) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     Get.snackbar("${_i18n()["error"]}", "${_i18n()["selectPrimaryFirst"]}");
  //     return false;
  //   }
  // }

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

  bool _updatePrDesc() {
    return (primaryServiceDesc.text != '' &&
        primaryServiceDesc.text !=
            service.value?.info.description?[primaryLang]);
  }

  bool _updateScDesc() {
    return (secondayServiceDesc.text != '' &&
        secondayServiceDesc.text !=
            service.value?.info.description?[secondaryLang]);
  }

  LanguageMap _contructDesc() {
    return {
      primaryLang.value!: primaryServiceDesc.text,
      secondaryLang.value!: secondayServiceDesc.text
    };
  }
}

class RestauarantInfoEditViewController extends ServiceInfoEditViewController {
  Restaurant? restaurant;
  @override
  Future<void> fetchService() async {
    service.value = await get_restaurant_by_id(id: serviceId);
    restaurant = service.value as Restaurant;
    return super.fetchService();
  }

  @override
  Future<void> updateServiceInfo() async {
    service.value = await update_restaurant_info(
        id: serviceId,
        restaurant: restaurant!.copyWith(
          primaryLanguage: primaryLang.value,
          userInfo: restaurant!.info.copyWith(
              name: serviceNameTxt.text,
              location: newLocation.value,
              image: newImageUrl.value,
              descId: newDescId),
        ));
    return super.updateServiceInfo();
  }
}

class DeliveryInfoEditViewController extends ServiceInfoEditViewController {
  DeliveryCompany? dvCompany;
  @override
  Future<void> fetchService() async {
    service.value = await get_delivery_company(companyId: serviceId);
    dvCompany = service.value as DeliveryCompany;
    return super.fetchService();
  }

  @override
  Future<void> updateServiceInfo() async {
    service.value = await update_delivery_company(
        companyId: serviceId,
        deliveryCompany: dvCompany!.copyWith(
          primaryLanguage: primaryLang.value,
          userInfo: dvCompany!.info.copyWith(
              name: serviceNameTxt.text,
              location: newLocation.value,
              image: newImageUrl.value,
              descId: newDescId),
        ));
  }
}
