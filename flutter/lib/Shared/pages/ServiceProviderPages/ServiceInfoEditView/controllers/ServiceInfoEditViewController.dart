import 'dart:async';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/location/hsServiceLocation.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class ServiceInfoEditViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  // TEXT INPUTS //
  TextEditingController serviceNameTxt = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController prefixTextFieldController = TextEditingController();
  TextEditingController primaryServiceDesc = TextEditingController();
  TextEditingController secondayServiceDesc = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // OBS //

  Rxn<ServiceInfo> service = Rxn<ServiceInfo>();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<MezLocation> newLocation = Rxn();

  Rxn<ServiceProviderLanguage> languages = Rxn();

  final Rxn<imPicker.XFile> newImageFile = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool isAvailable = RxBool(false);
  final RxBool isApproved = RxBool(true);
  Rxn<BusinessProfile> mainBusniessProfile = Rxn<BusinessProfile>();
  Rxn<BusinessProfile> newBusniessProfile = Rxn<BusinessProfile>();

// LATE VARS
  late int detailsId;
  late int serviceId;
  late ServiceProviderType serviceType;

  int? newDescId;

  Language? get secLang => languages.value?.secondary;

  bool get isBusiness => serviceType == ServiceProviderType.Business;
// INIT //

  Future<void> init({
    required int serviceDetailsId,
    required int serviceId,
    required ServiceProviderType serviceProvidertype,
  }) async {
    prefixTextFieldController.text = '+52';
    serviceType = serviceProvidertype;
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$detailsId");

    await fetchService();

    _setServiceInfo();
    if (isBusiness) {
      unawaited(_fetchBusinessProfile());
    }
  }

  Future<void> _fetchBusinessProfile() async {
    mainBusniessProfile.value =
        await get_business_profile_by_id(businessId: serviceId);
    newBusniessProfile.value = mainBusniessProfile.value;
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
      // phoneNumber.text = service.value?.phoneNumber ?? '';

      if (service.value!.phoneNumber == null) {
        prefixTextFieldController.text = '';
        phoneNumber.text = '+52';
      } else if (service.value!.phoneNumber!.contains(' ')) {
        prefixTextFieldController.text =
            service.value?.phoneNumber?.split(' ')[0] ?? '';
        phoneNumber.text = service.value?.phoneNumber?.split(' ')[1] ?? '';
      } else {
        phoneNumber.text = service.value?.phoneNumber ?? '';
        prefixTextFieldController.text = '+52';
      }

      newLocation.value = service.value!.location;
      newImageUrl.value = service.value?.image;
      languages.value = service.value?.languages;

      primaryServiceDesc.text =
          service.value?.description?[languages.value!.primary] ?? '';
      secondayServiceDesc.text =
          service.value?.description?[languages.value!.secondary] ?? '';
    }
  }

  Future<void> updateServiceDescription() async {
    if (!fd.mapEquals(service.value!.description, _contructDesc())) {
      mezDbgPrint(
          "Descriptions are not equal ! ${service.value!.descriptionId}");
      if (service.value!.descriptionId != null) {
        _contructDesc().forEach((Language key, String value) {
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
        mezDbgPrint("newDescId ==========>>>$newDescId");
        service.value?.descriptionId = newDescId;
      }
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
      await updateServiceDescription();
      await updateServiceLocation();
      await updateBsProfile();
      if (newImageFile.value != null) {
        final String path = "/services/${serviceType.name}/$serviceId/images";
        newImageUrl.value = await uploadImgToFbStorage(
            imageFile: newImageFile.value!, storageFolder: path);
      }
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
        languages: languages.value!,
        phoneNumber: '${prefixTextFieldController.text} ${phoneNumber.text}',
        descriptionId: newDescId,
        image: newImageUrl.value,
        name: serviceNameTxt.text.inCaps);
  }

  // void changePrimaryLang(Language value) {
  //   editablePrLang.value = value;
  //   editableScLang.value = value.toOpLang();
  // }

  // bool validateSecondaryLanguUpdate(Language value) {
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
          newImageFile.value = _res;
        }
        imageLoading.value = false;
      } catch (e) {
        imageLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  Future<void> updateBsProfile() async {
    if (isBusiness && mainBusniessProfile.value != newBusniessProfile.value) {
      mainBusniessProfile.value = await update_business_profile_by_id(
          businessId: serviceId, newProfile: newBusniessProfile.value!);
      newBusniessProfile.value = mainBusniessProfile.value;
    }
  }

  // bool _updatePrDesc() {
  //   return (primaryServiceDesc.text != '' &&
  //       primaryServiceDesc.text != service.value?.description?[primaryLang]);
  // }

  // bool _updateScDesc() {
  //   return (secondayServiceDesc.text != '' &&
  //       secondayServiceDesc.text != service.value?.description?[secondaryLang]);
  // }

  LanguageMap _contructDesc() {
    final LanguageMap _desc = <Language, String>{
      languages.value!.primary: primaryServiceDesc.text.inCaps
    };
    if (languages.value!.secondary != null) {
      _desc[languages.value!.secondary!] = secondayServiceDesc.text.inCaps;
    }
    return _desc;
  }

  void dispose() {
    secondayServiceDesc.dispose();
    primaryServiceDesc.dispose();
    phoneNumber.dispose();
    serviceNameTxt.dispose();
  }

  List<String> getSecLangsOptions() {
    List<Language> data = [];
    data.addAll(Language.values);
    data.remove(languages.value!.primary);
    return data.map((Language e) => e.toFirebaseFormatString()).toList();
  }

  void switchBusinessType({required BusinessProfile type}) {
    newBusniessProfile.value = type;

    mezDbgPrint("old business Profile =======>${mainBusniessProfile.value}");
    mezDbgPrint("New business Profile =======>${newBusniessProfile.value}");
  }
}
