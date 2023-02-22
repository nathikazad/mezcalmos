import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as cloudFunctionModels;
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

class CustLaundryOrderRequestViewController {
  // instances //

  TextEditingController orderNote = TextEditingController();

  final LocationPickerController locationPickerController =
      LocationPickerController();

  final AuthController authController = Get.find<AuthController>();
  // state vars
  Rxn<Laundry> laundry = Rxn();
  Rxn<MezLocation> customerLoc = Rxn();
  RxnNum shippingCost = RxnNum();
  DeliveryCost? get deliveryCost {
    return laundry.value!.deliveryCost;
  }

  RxBool isShippingSet = RxBool(false);
  num _orderDistanceInKm = 0;
  bool get isUserSignedIn => authController.isUserSignedIn;
  num get getOrderDistance => _orderDistanceInKm;
  bool get canOrder {
    return customerLoc.value != null &&
        _orderDistanceInKm <= 10 &&
        isShippingSet.isTrue;
  }

  Future<void> init({required Laundry laundry}) async {
    this.laundry.value = laundry;

    mezDbgPrint(
        "Laundry lenght  =============> ${this.laundry.value!.laundryCosts.lineItems}");

    if (authController.isUserSignedIn) {
      customerLoc.value = Get.find<CustomerAuthController>()
          .customer
          ?.defaultLocation
          ?.location;
    }
    if (customerLoc.value != null) {
      // ignore: unawaited_futures
      updateShippingPrice();
    }
  }

  void switchLocation(MezLocation location) {
    customerLoc.value = location;
    updateShippingPrice();
  }

  Future<bool> updateShippingPrice() async {
    isShippingSet.value = false;
    final MezLocation? loc = customerLoc.value;

    if (loc != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        laundry.value!.info.location,
        loc,
      );

      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        mezDbgPrint("🤣  ${routeInfo.distance.distanceInMeters}");
        if (_orderDistanceInKm <= 15) {
          final num _shippingCost =
              deliveryCost!.costPerKm * (_orderDistanceInKm);
          mezDbgPrint(
              "[[+]] Calculated final ShippingCost  ========>>>>>>>$shippingCost");
          if (_shippingCost < deliveryCost!.minimumCost) {
            mezDbgPrint(
                "LESS THAN MINIMUM COST ===================== $shippingCost << ${deliveryCost!.minimumCost}");
            shippingCost.value = deliveryCost!.minimumCost.ceil();
          } else {
            shippingCost.value = _shippingCost.ceil();
          }

          // await saveCart();
          isShippingSet.value = true;

          return true;
        } else {
          shippingCost.value = null;
          // await saveCart();
          isShippingSet.value = true;

          return true;
        }
      } else {
        shippingCost.value = null;
        // await saveCart();
        isShippingSet.value = false;
        return false;
      }
    } else {
      shippingCost.value = null;
      //   await saveCart();
      isShippingSet.value = true;

      return true;
    }
  }

  Future<num?> createLaundryOrder() async {
    final LaundryRequest _laundryRequest = LaundryRequest(
        laundryId: laundry.value!.info.hasuraId, deliveryCost: 50);
    mezDbgPrint(orderNote.text);
    MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        laundry.value!.info.location, customerLoc.value!);

    if (route != null) {
      _laundryRequest.routeInformation = MapHelper.RouteInformation(
        polyline: route.encodedPolyLine,
        distance: route.distance,
        duration: route.duration,
      );

      _laundryRequest.laundryId = laundry.value!.info.hasuraId;
      _laundryRequest.from = laundry.value!.info.location;
      _laundryRequest.to = customerLoc.value!;
      _laundryRequest.notes = orderNote.text;
      _laundryRequest.paymentType = PaymentType.Cash;

      mezDbgPrint("👋👋👋👋 paylod  👋👋👋👋");
      mezDbgPrint(_laundryRequest.toString());
      return await _checkoutOrder(_laundryRequest);
    }
    return null;
  }

  Future<num?> _checkoutOrder(LaundryRequest laundryRequest) async {
    try {
      cloudFunctionModels.ReqLaundryResponse response =
          await CloudFunctions.laundry_requestLaundry(
        storeId: laundryRequest.laundryId,
        customerAppType: cloudFunctionModels.CustomerAppType.Native,
        customerLocation: cloudFunctionModels.Location(
            laundryRequest.to!.latitude,
            laundryRequest.to!.longitude,
            laundryRequest.to!.address),
        deliveryCost: 50,
        paymentType: laundryRequest.paymentType.toFirebaseFormatEnum(),
        notes: laundryRequest.notes,
        tripDistance:
            laundryRequest.routeInformation!.distance.distanceInMeters,
        tripDuration: laundryRequest.routeInformation!.duration.seconds,
        tripPolyline: laundryRequest.routeInformation!.polyline,
        deliveryType: cloudFunctionModels.DeliveryType.Delivery,
      );
      return response.orderId;
    } catch (e, stk) {
      mezDbgPrint("error function");
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(
        errorTitle: "Server error please try again",
      );
    }
    return null;
  }
}
