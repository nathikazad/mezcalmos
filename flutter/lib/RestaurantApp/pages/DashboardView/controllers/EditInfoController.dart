import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpTabsViewView/controllers/ROpTabsViewViewController.dart';
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
    ["ROpEditInfoView"]["controllers"]["ROpEditInfoController"];

//
class ROpEditInfoController {
  // RestaurantInfoController restaurantInfoController =
  //     Get.find<RestaurantInfoController>();

  RestaurantInfoController? restaurantInfoController;

  StreamSubscription? restListner;

  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  TextEditingController restaurantNameTxt = TextEditingController();
  TextEditingController prRestaurantDescTxt = TextEditingController();
  TextEditingController scRestaurantDescTxt = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController bankNumber = TextEditingController();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<Location> newLocation = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();
  final Rxn<LanguageType> editablePrLang = Rxn();
  final Rxn<LanguageType> editableScLang = Rxn();
  final Rxn<File> newImageFile = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool isAvailable = RxBool(false);
  final RxBool btnClicked = RxBool(false);
  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();
  final RxBool showStripe = RxBool(false);
  String? stripeUrl;
  final RxBool showSetupStripe = RxBool(false);
  final RxBool setupClicked = RxBool(false);
  final RxBool showStripeReqs = RxBool(false);
  RxString currentUrl = RxString("");
  RxDouble cuurentPage = RxDouble(0);

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  ROpTabsViewViewController? tabsViewViewController;

  Future<void> init({
    required String restaurantId,
    ROpTabsViewViewController? tabsViewViewController,
  }) async {
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$restaurantId");
    this.tabsViewViewController = tabsViewViewController;
    if (!RestaurantInfoController().initialized) {
      Get.put(RestaurantInfoController(), permanent: false);
    }
    restaurantInfoController = Get.find<RestaurantInfoController>();
    if (restaurantInfoController != null) {
      restaurantInfoController!.init(restId: restaurantId);
      restaurant.value =
          await restaurantInfoController!.getRestaurantAsFuture(restaurantId);
      restaurantInfoController!
          .getRestaurant(restaurantId)
          .listen((Restaurant? event) {
        if (event != null) {
          restaurant.value = event;
          _updateResTInfo();
        }
      });
      _updateResTInfo();
    }
  }

  void _updateResTInfo() {
    if (restaurant.value != null) {
      _settingSchedules();
      isAvailable.value = restaurant.value!.state.available;
      restaurantNameTxt.text = restaurant.value?.info.name ?? '';
      bankName.text = restaurant.value!.paymentInfo.bankInfo?.bankName ?? "";
      bankNumber.text =
          restaurant.value!.paymentInfo.bankInfo?.accountNumber.toString() ??
              "";

      newLocation.value = restaurant.value!.info.location;
      newImageUrl.value = restaurant.value?.info.image ?? '';
      primaryLang.value = restaurant.value!.primaryLanguage;
      secondaryLang.value = restaurant.value!.secondaryLanguage;
      editablePrLang.value = restaurant.value!.primaryLanguage;
      editableScLang.value = restaurant.value!.secondaryLanguage;
      mezDbgPrint(
          "UPDATing DESCCCCC =========>>>PR lang : ${primaryLang.value}");
      mezDbgPrint(
          "UPDATing DESCCCCC =========>>>DESC : ${restaurant.value?.description}");
      mezDbgPrint(
          "UPDATing DESCCCCC =========>>>SC lang : ${secondaryLang.value}");
      mezDbgPrint(
          "UPDATing DESCCCCC =========>>>DESC : ${restaurant.value?.description}");

      prRestaurantDescTxt.text =
          restaurant.value?.description?[primaryLang] ?? '';
      scRestaurantDescTxt.text =
          restaurant.value?.description?[secondaryLang] ?? '';
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
      mezDbgPrint("Updating restuarnt name .....=>${restaurantNameTxt.text}");

      await restaurantInfoController!.setRestaurantName(restaurantNameTxt.text);
      mezDbgPrint("Restuarnt name done ....=>${restaurantNameTxt.text}");
    }
    if (_updatePrDesc() || _updateScDesc()) {
      mezDbgPrint(
          "Updating restuarnt primary description .....=>${restaurantNameTxt.text}");

      await restaurantInfoController!.setRestaurantDesc(_contructDesc());
      mezDbgPrint("Restuarnt name done ....=>${restaurantNameTxt.text}");
    }
    if (newImageFile.value != null) {
      await restaurantInfoController!
          .uploadImgToDb(imageFile: newImageFile.value!)
          .then((String value) {
        restaurantInfoController!.setRestaurantImage(value);
      });
    }
    if (newLocation.value != null &&
        newLocation.value?.address != restaurant.value?.info.location.address) {
      await restaurantInfoController!.setLocation(newLocation.value!);
    }
    if (editablePrLang.value != null &&
        editablePrLang.value != primaryLang.value) {
      mezDbgPrint("SEEETTING PRIMARY LANG =======>${editablePrLang.value}");
      await restaurantInfoController!.setPrimaryLanguage(editablePrLang.value!);
      mezDbgPrint("SEEETTING SECOND LANG =======>${editableScLang.value}");
      await restaurantInfoController!
          .setSecondaryLanguage(editablePrLang.value?.toOpLang());
    }

    if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
      await restaurantInfoController!.setSchedule(newSchedule.value!);
    }
    if (isAvailable.value != restaurant.value!.state.available) {
      await restaurantInfoController!.setAvailabilty(isAvailable.value);
    }

    btnClicked.value = false;
  }

  void switchAv(bool value) {
    isAvailable.value = value;
  }

  void setNewLocation(Location? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  void changePrimaryLang(LanguageType value) {
    editablePrLang.value = value;
    editableScLang.value = value.toOpLang();
  }

  Future<void> switchSelfDelivery(bool v) async {
    await restaurantInfoController!.switchSelfDelivery(v);
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

  void handleCardCheckBoxClick(bool v) {
    restaurantInfoController!.setCardPayment(v);
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

  Future<void> switchChargeFees(bool v) async {
    await restaurantInfoController!.switchFeesOption(v);
  }

  void showPaymentSetup() {
    setupClicked.value = true;
    onboardServiceProvider(restaurant.value!.info.id, OrderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      } else {
        Get.snackbar("Error", value.errorMessage ?? "Error");
      }
    }).whenComplete(() => setupClicked.value = false);
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

  bool getChargeFessOnCustomer() {
    return restaurant.value!.paymentInfo.stripe?.chargeFeesOnCustomer ?? true;
  }

  bool get showFeesOption {
    return (restaurant.value!.paymentInfo.acceptedPayments[PaymentType.Card] ==
            true &&
        restaurant.value!.paymentInfo.stripe != null);
  }

  bool get showStatusIcon {
    return (restaurant.value!.paymentInfo.stripe?.requirements.isNotEmpty ==
        true);
  }

  bool get getAvailable {
    return restaurant.value!.state.available;
  }

  bool get isBankTrue {
    return restaurant
            .value!.paymentInfo.acceptedPayments[PaymentType.BankTransfer] ==
        true;
  }

  // Bank //
  Future pushBankInfos(
      {required String bankName, required num bankNumber}) async {
    mezDbgPrint("Value =================>$isBankTrue");

    await restaurantInfoController!.pushBankInfo(bankName, bankNumber);
  }

  Future removeBank() async {
    mezDbgPrint("Value =================>$isBankTrue");
    bankName.clear();
    bankNumber.clear();

    await restaurantInfoController!.removeBank();
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

  bool _updatePrDesc() {
    return (prRestaurantDescTxt.text != '' &&
        prRestaurantDescTxt.text !=
            restaurant.value?.description?[primaryLang]);
  }

  bool _updateScDesc() {
    return (scRestaurantDescTxt.text != '' &&
        scRestaurantDescTxt.text !=
            restaurant.value?.description?[secondaryLang]);
  }

  LanguageMap _contructDesc() {
    return {
      primaryLang.value!: _updatePrDesc()
          ? prRestaurantDescTxt.text
          : restaurant.value!.description![primaryLang]!,
      secondaryLang.value!: _updateScDesc()
          ? scRestaurantDescTxt.text
          : restaurant.value!.description![secondaryLang]!,
    };
  }

  void dispose() {
    newLocation.close();
    newImageUrl.close();
    primaryLang.close();
    secondaryLang.close();
    restaurant.close();
    restaurantNameTxt.clear();
    restListner?.cancel();
    restaurantInfoController!.dispose();
    Get.delete<RestaurantInfoController>();
  }
}
