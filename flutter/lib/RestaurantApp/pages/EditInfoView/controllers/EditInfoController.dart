import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["EditInfoView"]["controllers"]["EditInfoController"];

//
class EditInfoController {
  // // LaundryInfoController laundryInfoController =
  // //     Get.find<LaundryInfoController>();
  // final Rxn<Laundry> laundry = Rxn<Laundry>();
  // TextEditingController laundryNameController = TextEditingController();
  // final Rxn<String> newImageUrl = Rxn();
  // final Rxn<Location> newLocation = Rxn();

  // final Rxn<LanguageType> primaryLang = Rxn();
  // final Rxn<LanguageType> secondaryLang = Rxn();
  // final Rxn<File> newImageFile = Rxn();

  // final RxBool imageLoading = RxBool(false);
  // final RxBool btnClicked = RxBool(false);
  // final Rxn<Schedule> newSchedule = Rxn();
  // final Rxn<Schedule> schedulePreview = Rxn();
  // final Rxn<Schedule> oldSchedule = Rxn();
  // final Rxn<LaundryCosts> laundryCosts = Rxn();
  // final Rxn<List<LaundryCostLineItem>> categories = Rxn();

  // imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  // void init() {
  //   laundry.value = laundryInfoController.laundry.value;

  //   if (laundry.value != null) {
  //     laundryNameController.text = laundry.value?.info.name ?? '';
  //     settingSchedules();
  //     newLocation.value = laundry.value!.info.location;
  //     newImageUrl.value = laundry.value?.info.image ?? '';
  //     primaryLang.value = laundry.value!.primaryLanguage;
  //     secondaryLang.value = laundry.value!.secondaryLanguage;
  //   }
  // }

  // void settingSchedules() {
  //   newSchedule.value = Schedule.clone(laundry.value!.schedule!);
  //   schedulePreview.value = Schedule.clone(newSchedule.value!);
  //   oldSchedule.value = Schedule.clone(laundry.value!.schedule!);
  // }

  // Future<void> updateLaundryInfo() async {
  //   btnClicked.value = true;
  //   if (laundryNameController.text != '' &&
  //       laundryNameController.text != laundry.value?.info.name) {
  //     await laundryInfoController.setLaundryName(laundryNameController.text);
  //   }
  //   if (newImageFile.value != null) {
  //     await laundryInfoController
  //         .uploadUserImgToFbStorage(imageFile: newImageFile.value!)
  //         .then((String value) {
  //       laundryInfoController.setLaundryImage(value);
  //     });
  //   }
  //   if (newLocation.value != null &&
  //       newLocation.value?.address != laundry.value?.info.location.address) {
  //     await laundryInfoController.setLocation(newLocation.value!);
  //   }
  //   if (primaryLang.value != null &&
  //       primaryLang.value != laundry.value?.primaryLanguage) {
  //     await laundryInfoController.setPrimaryLanguage(primaryLang.value!);
  //   }
  //   if (secondaryLang.value != null &&
  //       secondaryLang.value != laundry.value?.secondaryLanguage) {
  //     await laundryInfoController.setSecondaryLanguage(secondaryLang.value!);
  //   } else if (secondaryLang.value == null) {
  //     await laundryInfoController.setSecondaryLanguage(null);
  //   }

  //   if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
  //     await laundryInfoController.setSchedule(newSchedule.value!);
  //   }

  //   btnClicked.value = false;
  // }

  // void setNewLocation(Location? newLoc) {
  //   if (newLoc != null) {
  //     newLocation.value = newLoc;
  //   }
  // }

  // bool validatePrimaryLanguUpdate(LanguageType value) {
  //   if (value != secondaryLang.value) {
  //     return true;
  //   } else {
  //     return false;
  //   }
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

  // //

  // Future<void> editImage(context) async {
  //   final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

  //   if (_from != null) {
  //     imageLoading.value = true;

  //     final imPicker.XFile? _res =
  //         await imagePicker(picker: _imagePicker, source: _from);

  //     try {
  //       if (_res != null) {
  //         newImageFile.value = File(_res.path);
  //       }
  //       imageLoading.value = false;
  //     } catch (e) {
  //       imageLoading.value = false;
  //       mezDbgPrint(
  //           "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
  //     }
  //   }
  // }

  // Future<void> dispose() async {
  //   laundry.value = laundryInfoController.laundry.value;

  //   laundryNameController.text = laundry.value?.info.name ?? '';

  //   newLocation.value = laundry.value!.info.location;
  //   newImageUrl.value = laundry.value?.info.image ?? '';
  //   primaryLang.value = laundry.value!.primaryLanguage;
  //   secondaryLang.value = laundry.value!.secondaryLanguage;
  // }
}
