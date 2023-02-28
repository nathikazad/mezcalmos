import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['CreateServiceView'];

class CreateServiceViewController {
  // instances //
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  PageController pageController = PageController(initialPage: 0);
  GlobalKey<FormState> costFormKey = GlobalKey();
  GlobalKey<FormState> infoFromKey = GlobalKey();
  // text inputs //
  TextEditingController serviceName = TextEditingController();
  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();
  TextEditingController radius = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phone = TextEditingController();

  // obs //
  RxnNum previewCost = RxnNum();
  Rxn<DeliveryCost> deliveryCost = Rxn();
  RxInt currentPage = RxInt(0);
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  Rx<ServiceInput> serviceInput = Rx(ServiceInput());

  // info inputs //

  final Rxn<MezLocation> newLocation = Rxn();
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

  Future<void> _setImage() async {
    if (newImageFile.value != null) {
      newImageUrl.value = await uploadServiceImgToFbStorage(
          imageFile: newImageFile.value!, isCompressed: false);
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

  void setNewLocation(MezLocation newLoc) {
    newLocation.value = newLoc;
  }

  void switchDeliveryType(ServiceDeliveryType? value) {
    serviceInput.value.deliveryType = value;
    serviceInput.refresh();
  }

  String getTitle() {
    switch (currentPage.value) {
      case 1:
        return "${_i18n()['info']}";
      case 2:
        return "${_i18n()['schedule']}";
      case 3:
        return "${_i18n()['delivery']}";

      default:
        return "";
      // FittedBox(
      //         fit: BoxFit.fitWidth,
      //         child: MezcalmosSharedWidgets.fillTitle(
      //             actionLength: 2,
      //             showLogo: (Get.width > 320) ? true : false),
      //       ),
    }
  }

  String getSaveButtonTitle() {
    if (currentPage.value == 2) {
      return "${_i18n()['save']}";
    } else
      return "${_i18n()['next']}";
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

  Future<bool?> handleNext() async {
    switch (currentPage.value) {
      case 0:
        goToInfoPage();
        break;
      case 1:
        await handleInfoPageNext();
        break;
      case 2:
        handleScheduleNext();
        break;

      default:
        return _createService();
    }
    return null;
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
    return DeliveryCost(
        id: null,
        selfDelivery: serviceInput.value.isSelfDelivery,
        minimumCost: double.parse(minCost.text),
        freeDeliveryKmRange: num.tryParse(freeKmRange.text)?.toDouble(),
        costPerKm: num.parse(costPerKm.text).toDouble());
  }

  Future<void> handleInfoPageNext() async {
    if (infoFromKey.currentState?.validate() == true) {
      await _setImage();
      serviceInput.value.serviceInfo = ServiceInfo(
          location: newLocation.value!,
          hasuraId: Random().nextInt(5),
          image: newImageUrl.value,
          name: serviceName.text);
      unawaited(pageController
          .animateToPage(currentPage.value + 1,
              duration: Duration(milliseconds: 500), curve: Curves.easeIn)
          .whenComplete(
              () => currentPage.value = pageController.page!.toInt()));
    }
  }

  void goToInfoPage() {
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

  bool isFormValid() {
    switch (currentPage.value) {
      case 0:
        return true;
      case 1:
        return true;
      case 2:
        if (!serviceInput.value.isSelfDelivery) {
          if (serviceInput.value.deliveryPartnerId == null) {
            Get.snackbar("${_i18n()['selectCompany']}",
                "${_i18n()['selectCompanyText']}",
                backgroundColor: Colors.black, colorText: Colors.white);
          }
          return serviceInput.value.isValid;
        } else {
          return _isDeliveryCostValid;
        }

      default:
        return false;
    }
  }

  bool get _infoIsValid =>
      serviceName.text.length > 3 &&
      newLocation.value != null &&
      newImageUrl.value != null;
  bool get _isDeliveryCostValid {
    return costFormKey.currentState?.validate() == true;
  }

  Future<bool> _createService() async {
    mezDbgPrint("Clciked");
    if (serviceInput.value.deliveryType == ServiceDeliveryType.Self_delivery) {
      serviceInput.value.deliveryPartnerId = null;
      serviceInput.value.selfDeliveryCost = _constructDeliveryCost();
    } else {
      serviceInput.value.selfDeliveryCost = null;
    }
    mezDbgPrint(serviceInput.value.toString());
    final bool res = await _pushServiceToDb();
    return res;
  }

  Future<bool> _pushServiceToDb() async {
    mezDbgPrint(
        "Creating restaurant with this paylod ====>>>\n ${_constructServiceDetails()}");
    try {
      await CloudFunctions.restaurant2_createRestaurant(
          name: serviceInput.value.serviceInfo!.name,
          image: serviceInput.value.serviceInfo!.image,
          location: cModel.Location(
              serviceInput.value.serviceInfo!.location.latitude,
              serviceInput.value.serviceInfo!.location.longitude,
              serviceInput.value.serviceInfo!.location.address),
          schedule: serviceInput.value.schedule!.toFirebaseFormattedJson(),
          deliveryDetails: cModel.DeliveryDetails(
            serviceInput.value.selfDeliveryCost!.minimumCost,
            serviceInput.value.selfDeliveryCost!.costPerKm,
            10,
            serviceInput.value.selfDeliveryCost!.freeDeliveryMinimumCost,
            serviceInput.value.selfDeliveryCost!.freeDeliveryKmRange,
            true,
            false,
            serviceInput.value.isSelfDelivery,
          ),
          language: {cModel.Language.EN: true});
      return true;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message?.toString() ?? "Unknown Error");
      throwError(e);
      throwError(stk);
      return false;
    }
    // final HttpsCallable cloudFunction = FirebaseFunctions.instance
    //     .httpsCallable('restaurant2-createRestaurant');
    // try {
    //   final HttpsCallableResult response =
    //       await cloudFunction.call(_constructServiceDetails());
    //   mezDbgPrint("Response : ${response.data}");

    //   return ServerResponse.fromJson(response.data);
    // } catch (e, stk) {
    //   mezDbgPrint("Errrooooooooor =======> $e,$stk");
    //   return ServerResponse(ResponseStatus.Error,
    //       errorMessage: "Server Error", errorCode: "serverError");
    // }
  }

  Map<String, Object?> _constructServiceDetails() {
    return {
      "name": serviceInput.value.serviceInfo!.name,
      "image": serviceInput.value.serviceInfo!.image,
      "location":
          serviceInput.value.serviceInfo!.location.toFirebaseFormattedJson(),
      "schedule": serviceInput.value.schedule!.toFirebaseFormattedJson(),
      "delivery": true,
      "customerPickup": false,
      "selfDelivery":
          serviceInput.value.deliveryType == ServiceDeliveryType.Self_delivery,
      "deliveryPartnerId": serviceInput.value.deliveryPartnerId,
      "deliveryDetails": serviceInput.value.selfDeliveryCost?.toJson(),
    };
  }

  Future<String> uploadServiceImgToFbStorage({
    required File imageFile,
    bool isCompressed = false,
  }) async {
    File compressedFile = imageFile;
    if (isCompressed == false) {
      // this holds userImgBytes of the original
      final Uint8List originalBytes = await imageFile.readAsBytes();
      // this is the bytes of our compressed image .
      final Uint8List _compressedVersion =
          await compressImageBytes(originalBytes);
      // Get the actual File compressed
      compressedFile = await writeFileFromBytesAndReturnIt(
          filePath: imageFile.path, imgBytes: _compressedVersion);
    }
    String _uploadedImgUrl;
    final List<String> splitted = imageFile.path.split('.');
    final String imgPath =
        "restaurants/$serviceName/avatar/$serviceName.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .putFile(compressedFile);
    } on firebase_core.FirebaseException catch (e) {
      mezDbgPrint(e.message.toString());
    } finally {
      _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .getDownloadURL();
    }

    return _uploadedImgUrl;
  }
}
