import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["EditInfoView"]["controllers"]["EditInfoController"];

//
class ROpEditInfoController {
  // RestaurantInfoController restaurantInfoController =
  //     Get.find<RestaurantInfoController>();

  late RestaurantInfoController restaurantInfoController;

  StreamSubscription? restListner;

  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  TextEditingController restaurantNameTxt = TextEditingController();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<Location> newLocation = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();
  final Rxn<File> newImageFile = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool btnClicked = RxBool(false);
  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();
  final RxBool showStripe = RxBool(false);
  String? stripeUrl;
  final RxBool showSetupStripe = RxBool(false);
  final RxBool showStripeReqs = RxBool(false);
  RxString currentUrl = RxString("");

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  Future<void> init({required String restaurantId}) async {
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$restaurantId");
    Get.put(RestaurantInfoController(), permanent: false);
    restaurantInfoController = Get.find<RestaurantInfoController>();
    restaurantInfoController.init(restId: restaurantId);
    restaurant.value =
        await restaurantInfoController.getRestaurantAsFuture(restaurantId);
    restaurantInfoController
        .getRestaurant(restaurantId)
        .listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      }
    });
    if (restaurant.value != null) {
      _settingSchedules();
      restaurantNameTxt.text = restaurant.value?.info.name ?? '';
      newLocation.value = restaurant.value!.info.location;
      newImageUrl.value = restaurant.value?.info.image ?? '';
      primaryLang.value = restaurant.value!.primaryLanguage;
      secondaryLang.value = restaurant.value!.secondaryLanguage;
    }
  }

  void _settingSchedules() {
    mezDbgPrint(
        "Restaurant schedule ===================> ${restaurant.value!.schedule!.toFirebaseFormattedJson()}");
    oldSchedule.value = Schedule.clone(restaurant.value!.schedule!);
    newSchedule.value = Schedule.clone(restaurant.value!.schedule!);
    schedulePreview.value = Schedule.clone(newSchedule.value!);
  }

  Future<void> updateLaundryInfo() async {
    btnClicked.value = true;
    if (restaurantNameTxt.text != '' &&
        restaurantNameTxt.text != restaurant.value?.info.name) {
      await restaurantInfoController.setRestaurantName(restaurantNameTxt.text);
    }
    if (newImageFile.value != null) {
      await restaurantInfoController
          .uploadImgToDb(imageFile: newImageFile.value!)
          .then((String value) {
        restaurantInfoController.setRestaurantImage(value);
      });
    }
    if (newLocation.value != null &&
        newLocation.value?.address != restaurant.value?.info.location.address) {
      await restaurantInfoController.setLocation(newLocation.value!);
    }
    if (primaryLang.value != null &&
        primaryLang.value != restaurant.value?.primaryLanguage) {
      await restaurantInfoController.setPrimaryLanguage(primaryLang.value!);
    }
    if (secondaryLang.value != null &&
        secondaryLang.value != restaurant.value?.secondaryLanguage) {
      await restaurantInfoController.setSecondaryLanguage(secondaryLang.value!);
    } else if (secondaryLang.value == null) {
      await restaurantInfoController.setSecondaryLanguage(null);
    }

    if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
      await restaurantInfoController.setSchedule(newSchedule.value!);
    }

    btnClicked.value = false;
  }

  void setNewLocation(Location? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  bool validatePrimaryLanguUpdate(LanguageType value) {
    if (value != secondaryLang.value) {
      return true;
    } else {
      return false;
    }
  }

  // stripe and payments methods //
  void checkStripe() {
    if (restaurant.value!.paymentInfo.stripe != null &&
        restaurant.value!.paymentInfo.acceptedPayments[PaymentType.Card] ==
            true) {
      updateServiceProvider(restaurant.value!.info.id, OrderType.Restaurant)
          .then((ServerResponse value) {
        _checkStripeDetails();
      });
    }
  }

  void handleCardCheckBoxClick() {
    if (restaurant.value!.paymentInfo.acceptedPayments[PaymentType.Card] ==
        true) {
      restaurantInfoController.setCardPayment(false);
    } else {
      restaurantInfoController.setCardPayment(true);
    }
  }

  void handleStripeUrlChanges(String url) {
    if (url == "https://example.com/return") {
      _returnUrlHandler();
    } else if (url == "https://example.com/reauth") {
      _reauthUrlHandler();
    }
  }

  void _reauthUrlHandler() {
    onboardServiceProvider(restaurant.value!.info.id, OrderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      }
    });
  }

  void _returnUrlHandler() {
    showStripe.value = false;
    updateServiceProvider(restaurant.value!.info.id, OrderType.Restaurant)
        .then((ServerResponse value) {
      _checkStripeDetails();
    });
  }

  void _checkStripeDetails() {
    if (restaurant.value!.paymentInfo.stripe?.detailsSubmitted == false) {
      showSetupStripe.value = true;
    } else if (restaurant.value!.paymentInfo.stripe?.chargesEnabled == false ||
        restaurant.value!.paymentInfo.stripe?.payoutsEnabled == false) {
      showStripeReqs.value = true;
    }
    mezDbgPrint("Checking boooools ");
    mezDbgPrint(
        "details ==========>>>>> ${restaurant.value!.paymentInfo.stripe?.detailsSubmitted}");
    mezDbgPrint(
        "charges ==========>>>>> ${restaurant.value!.paymentInfo.stripe?.chargesEnabled}");
    mezDbgPrint(
        "payouts ==========>>>>> ${restaurant.value!.paymentInfo.stripe?.payoutsEnabled}");
  }

  void showPaymentSetup() {
    onboardServiceProvider(restaurant.value!.info.id, OrderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      }
    });
  }

  void closePaymentSetup() {
    stripeUrl = null;
    showStripe.value = false;
  }

  bool get showSetupBtn {
    return (restaurant.value!.paymentInfo.acceptedPayments[PaymentType.Card] ==
                true &&
            restaurant.value!.paymentInfo.stripe == null) ||
        (restaurant.value!.paymentInfo.acceptedPayments[PaymentType.Card] ==
                true &&
            (!restaurant.value!.paymentInfo.detailsSubmitted ||
                !restaurant.value!.paymentInfo.chargesEnabled));
  }

  bool get showStatusIcon {
    return (restaurant.value!.paymentInfo.stripe?.requirements.isNotEmpty ==
        true);
  }

  bool validateSecondaryLanguUpdate(LanguageType value) {
    if (primaryLang.value != null) {
      if (value != primaryLang.value) {
        return true;
      } else {
        return false;
      }
    } else {
      Get.snackbar("${_i18n()["error"]}", "${_i18n()["selectPrimaryFirst"]}");
      return false;
    }
  }

  //

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

  void dispose() {
    newLocation.close();
    newImageUrl.close();
    primaryLang.close();
    secondaryLang.close();
    restaurant.close();
    restaurantNameTxt.clear();
    restListner?.cancel();
    restaurantInfoController.dispose();
    Get.delete<RestaurantInfoController>();
  }
}
