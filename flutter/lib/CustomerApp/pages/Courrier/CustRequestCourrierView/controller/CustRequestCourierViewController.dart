import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/CourierItem.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
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
  RxMap<int, File> newImages = RxMap({});
  Rxn<MezLocation> toLoc = Rxn();
  Rxn<DateTime> deliveryTime = Rxn();
  Rxn<DeliveryCompany> company = Rxn();
  RxInt currentPage = RxInt(0);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  Rxn<num> shippingCost = Rxn();
  DeliveryCost? deliveryCost;

  MapHelper.RouteInformation? routeInfo;
  late int courierId;

  // getters //

  bool get isFromLocation => fromLoc.value != null;

  // methods //
  Future<void> init({required int courierId}) async {
    this.courierId = courierId;

    company.value = await get_delivery_company(companyId: courierId);
    unawaited(
        get_delivery_cost(deliveryDetailsId: company.value!.deliveryDetailsId!)
            .then((DeliveryCost? value) => deliveryCost = value));
    toLoc.value = Get.find<CustomerAuthController>()
        .customer
        ?.savedLocations
        .firstWhereOrNull(
            (SavedLocation element) => element.defaultLocation == true)
        ?.location;

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
        unawaited(pageController
            .animateToPage(currentPage.value + 1,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
            .whenComplete(
                () => currentPage.value = pageController.page!.toInt()));
      }
    } else {
      // call cloud func
      await _makeOrder();
    }
    return null;
  }

  Future<void> _makeOrder() async {
    mezDbgPrint("Making a courier order ========> ${toLoc.value}");
    try {
      await _uploadItemsImages();
      cModel.CreateCourierResponse res =
          await CloudFunctions.delivery2_createCourierOrder(
        toLocation: cModel.Location(
            lat: toLoc.value!.position.latitude!,
            lng: toLoc.value!.position.latitude!,
            address: toLoc.value!.address),
        items: items
            .asMap()
            .entries
            .map(
              (MapEntry<int, CourierItem> e) => cModel.CourierItem(
                name: itemsNames[e.key].text,
                image: e.value.image,
                estimatedCost: num.tryParse(itemsEstCosts[e.key].text),
                notes: itemsNotes[e.key].text,
              ),
            )
            .toList(),
        deliveryCompanyId: company.value!.info.hasuraId,
        deliveryCost: shippingCost.value,
        customerAppType: cModel.CustomerAppType.Native,
        tripDistance: routeInfo?.distance.distanceInMeters,
        tripDuration: routeInfo?.duration.seconds,
        tripPolyline: routeInfo?.polyline,
      );
      // ignore: unawaited_futures
      MezRouter.popEverythingTillBeforeHome().then(
          (_) => CustCourierOrderView.navigate(orderId: res.orderId.toInt()));
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> _uploadItemsImages() async {
    await Future.forEach(newImages.keys, (int key) async {
      await Get.find<AuthController>()
          .uploadImgToFbStorage(
              imageFile: newImages[key]!,
              path: "/Courier/items/${DateTime.now().toIso8601String()}")
          .then((String url) => items[key].image = url);
    });
  }

  void addFromLoc({required MezLocation location, String? address}) {
    fromLoc.value = location;
    fromLocText.text = address ?? fromLoc.value?.address.toString() ?? "";
    updateShippingPrice();
  }

  Future<void> updateShippingPrice() async {
    final MezLocation? loc = fromLoc.value;
    num? _orderDistanceInKm;
    if (loc != null && toLoc.value != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        toLoc.value!,
        loc,
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
          newImages.addAll({itemIndex: File(_res.path)});
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
