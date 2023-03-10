import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/location/hsServiceLocation.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class ServiceInfoEditViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  // TEXT INPUTS //
  TextEditingController serviceNameTxt = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController primaryServiceDesc = TextEditingController();
  TextEditingController secondayServiceDesc = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // OBS //

  Rxn<ServiceInfo> service = Rxn<ServiceInfo>();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<MezLocation> newLocation = Rxn();

  final Rx<LanguageType> primaryLang = Rx(LanguageType.EN);
  final Rx<LanguageType> secondaryLang = Rx(LanguageType.ES);
  final Rxn<LanguageType> editablePrLang = Rxn();
  final Rxn<LanguageType> editableScLang = Rxn();
  final Rxn<File> newImageFile = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool isAvailable = RxBool(false);
  final RxBool isApproved = RxBool(true);

// LATE VARS
  late int detailsId;
  late int serviceId;
  late ServiceProviderType serviceType;

  int? newDescId;
// INIT //

  Future<void> init({
    required int serviceDetailsId,
    required int serviceId,
    required ServiceProviderType serviceProvidertype,
  }) async {
    serviceType = serviceProvidertype;
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$detailsId");

    await fetchService();
    _setServiceInfo();
  }

  Future<void> fetchService() async {
    service.value = await get_service_info(
        serviceDetailsId: detailsId, serviceId: serviceId, withCache: false);
  }

  void _setServiceInfo() {
    if (service.value != null) {
      mezDbgPrint("Description id ========>>>${service.value?.descriptionId}");
      mezDbgPrint("Description id ========>>>${service.value?.description}");
      serviceNameTxt.text = service.value?.name ?? '';
      phoneNumber.text = service.value?.phoneNumber ?? '';

      newLocation.value = service.value!.location;
      newImageUrl.value = service.value?.image;

      primaryServiceDesc.text = service.value?.description?[primaryLang] ?? '';
      secondayServiceDesc.text =
          service.value?.description?[secondaryLang] ?? '';
    }
  }

  Future<void> updateServiceDescriptionDescription() async {
    // if (!fd.mapEquals(service.value!.description, _contructDesc())) {
    if (service.value!.descriptionId != null) {
      _contructDesc().forEach((LanguageType key, String value) {
        update_translation(
            langType: key,
            value: value,
            translationId: service.value!.descriptionId!);
      });
    } else {
      newDescId = await insert_translation(
          translation: _contructDesc(),
          serviceType: serviceType,
          serviceId: serviceId);
      service.value?.descriptionId = newDescId;
      // }
    }
  }

  Future<void> updateServiceLocation() async {
    if (newLocation.value?.address != service.value?.location.address) {
      await update_service_location(
          locationId: service.value!.locationId!, location: newLocation.value!);
    }
  }

  Future<void> updateServiceInfo() async {
    try {
      mezDbgPrint(_constructServiceInfo().phoneNumber);
      service.value = await update_service_info(
          serviceInfo: _constructServiceInfo(), detailsId: detailsId);
      showSavedSnackBar();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar();
    }
  }

  //
  Future<bool> saveInfo() async {
    try {
      await updateServiceDescriptionDescription();
      await updateServiceLocation();

      await updateServiceInfo();
      return true;
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
    }
  }

  void setNewLocation(MezLocation? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  ServiceInfo _constructServiceInfo() {
    return ServiceInfo(
        location: newLocation.value!,
        hasuraId: 1,
        phoneNumber: phoneNumber.text,
        descriptionId: newDescId,
        image: newImageUrl.value,
        name: serviceNameTxt.text);
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
        primaryServiceDesc.text != service.value?.description?[primaryLang]);
  }

  bool _updateScDesc() {
    return (secondayServiceDesc.text != '' &&
        secondayServiceDesc.text != service.value?.description?[secondaryLang]);
  }

  LanguageMap _contructDesc() {
    return {
      primaryLang.value: primaryServiceDesc.text,
      secondaryLang.value: secondayServiceDesc.text
    };
  }

  void dispose() {
    secondayServiceDesc.dispose();
    primaryServiceDesc.dispose();
    phoneNumber.dispose();
    serviceNameTxt.dispose();
  }
}
