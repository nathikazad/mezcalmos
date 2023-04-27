import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustRequestCourierViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  AuthController _authController = Get.find<AuthController>();

  PageController pageController = PageController(initialPage: 0);

  RxList<CourierItem> items = RxList.empty();
  RxList<TextEditingController> itemsNames = RxList.empty();
  RxList<TextEditingController> itemsNotes = RxList.empty();
  RxList<TextEditingController> itemsEstCosts = RxList.empty();
  RxList<File> imagesFiles = RxList.empty();
  RxList<String> imagesUrls = RxList.empty();
  RxList<int> imagesLoading = RxList.empty();
  TextEditingController fromLocText = TextEditingController();
  Rxn<MezLocation> fromLoc = Rxn();
  RxMap<int, imPicker.XFile> newImages = RxMap({});
  Rxn<MezLocation> toLoc = Rxn();
  Rxn<DateTime> deliveryTime = Rxn();
  Rxn<DeliveryCompany> company = Rxn();
  RxInt currentPage = RxInt(0);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();
  Rxn<num> shippingCost = Rxn();
  DeliveryCost? deliveryCost;

  MapHelper.RouteInformation? routeInfo;
  late int courierId;

  // getters //

  bool get isFromLocation => fromLoc.value != null;
  // bool get canOrder

  // methods //
  Future<void> init({required int courierId}) async {
    this.courierId = courierId;

    company.value = await get_delivery_company(companyId: courierId);
    unawaited(
        get_delivery_cost(deliveryDetailsId: company.value!.deliveryDetailsId!)
            .then((DeliveryCost? value) => deliveryCost = value));
    if (_authController.isUserSignedIn) {
      toLoc.value = Get.find<CustomerAuthController>()
          .customer
          ?.savedLocations
          .firstWhereOrNull(
              (SavedLocation element) => element.defaultLocation == true)
          ?.location;
    }

    addNewEmptyItem();
  }

  void addNewEmptyItem() {
    items.add(CourierItem(name: "", estCost: 0));
    itemsNames.add(TextEditingController());
    imagesFiles.add(File(""));
    // imagesUrls.add("");
    itemsNotes.add(TextEditingController());
    itemsEstCosts.add(TextEditingController());
  }

  void removeItem(int index) {
    items.removeAt(index);
    imagesFiles.removeAt(index);
    imagesUrls.removeAt(index);
    newImages.remove(index);
    itemsNames.removeAt(index);
    itemsEstCosts.removeAt(index);
    itemsNotes.removeAt(index);
  }

  void removeItemImage(int index) {
    imagesFiles[index] = File("");
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

  Future<num?> handleNext() async {
    if (currentPage == 0) {
      if (fromKey.currentState?.validate() == true) {
        FocusManager.instance.primaryFocus?.unfocus();
        unawaited(pageController
            .animateToPage(currentPage.value + 1,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
            .whenComplete(
                () => currentPage.value = pageController.page!.toInt()));
      }
    } else if (secondFormKey.currentState?.validate() == true) {
      // call cloud func
      await _makeOrder();
    }

    return null;
  }

  Future<void> _makeOrder() async {
    bool nameAndImageChecker =
        await Get.find<AuthController>().nameAndImageChecker();
    if (nameAndImageChecker) {
      await _callCloudFunc();
    }
  }

  Future<void> _callCloudFunc() async {
    try {
      await _uploadItemsImages();
      cModels.CreateCourierResponse res =
          await CloudFunctions.delivery3_createCourierOrder(
        toLocation: cModels.Location(
            lat: toLoc.value!.position.latitude!,
            lng: toLoc.value!.position.longitude!,
            address: toLoc.value!.address),
        items: items
            .asMap()
            .entries
            .map(
              (MapEntry<int, CourierItem> e) => cModels.CourierItem(
                name: itemsNames[e.key].text,
                image: e.value.image,
                estimatedCost: num.tryParse(itemsEstCosts[e.key].text),
                notes: itemsNotes[e.key].text,
              ),
            )
            .toList(),
        fromLocationText:
            (fromLocText.text.length > 4) ? fromLocText.text : null,
        fromLocationGps: (fromLoc.value != null)
            ? cModels.Location(
                lat: fromLoc.value!.position.latitude!,
                lng: fromLoc.value!.position.longitude!,
                address: fromLoc.value!.address)
            : null,
        deliveryCompanyId: company.value!.info.hasuraId,
        deliveryCost: shippingCost.value,
        scheduledTime: deliveryTime.value?.toUtc().toString(),
        customerAppType: cModels.CustomerAppType.Native,
        tripDistance: routeInfo?.distance.distanceInMeters,
        tripDuration: routeInfo?.duration.seconds,
        tripPolyline: routeInfo?.polyline,
      );
      if (res.success == true) {
        await MezRouter.popEverythingTillBeforeHome().then((_) =>
            CustCourierOrderView.navigate(orderId: res.orderId!.toInt()));
      } else {
        showErrorSnackBar(errorText: res.error.toString());
        mezDbgPrint(res.error);
      }
      // ignore: unawaited_futures
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> _uploadItemsImages() async {
    await Future.forEach(newImages.keys, (int key) async {
      await uploadImgToFbStorage(
              imageFile: newImages[key]!,
              storageFolder:
                  "CourierOrders/${Get.find<AuthController>().hasuraUserId!}/items")
          .then((String url) => items[key].image = url);
    });
  }

  void addFromLoc({required MezLocation location, String? address}) {
    fromLoc.value = location;
    fromLocText.text = address ?? fromLoc.value?.address.toString() ?? "";
    updateShippingPrice();
  }

  Future<void> updateShippingPrice() async {
    num? _orderDistanceInKm;
    if (fromLoc.value != null && toLoc.value != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        toLoc.value!,
        fromLoc.value!,
      );

      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        mezDbgPrint("🤣  ${routeInfo.distance.distanceInMeters}");
        if (_orderDistanceInKm <= 15) {
          final num shippingCost =
              deliveryCost!.costPerKm * (_orderDistanceInKm);
          mezDbgPrint(
              "[[+]] Calculated final ShippingCost  ========>>>>>>>$shippingCost");
          if (shippingCost < deliveryCost!.minimumCost) {
            mezDbgPrint(
                "LESS THAN MINIMUM COST ===================== $shippingCost << ${deliveryCost!.minimumCost}");
            this.shippingCost.value = deliveryCost!.minimumCost.ceil();
          } else {
            this.shippingCost.value = shippingCost.ceil();
          }
          this.routeInfo = MapHelper.RouteInformation(
            polyline: routeInfo.encodedPolyLine,
            distance: routeInfo.distance,
            duration: routeInfo.duration,
          );

          // await saveCart();
        } else {}
      } else {}
    } else {}
  }

  Future<void> addItemImage(
      {required int itemIndex, required BuildContext context}) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      imagesLoading.add(itemIndex);

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          imagesFiles[itemIndex] = File(_res.path);
          newImages.addAll({itemIndex: _res});
        }
        imagesLoading.remove(itemIndex);
      } catch (e) {
        imagesLoading.remove(itemIndex);
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  void setToLocation(MezLocation location) {
    toLoc.value = location;
    updateShippingPrice();
    mezDbgPrint("set to loc =========>${toLoc.value}");
  }
}
