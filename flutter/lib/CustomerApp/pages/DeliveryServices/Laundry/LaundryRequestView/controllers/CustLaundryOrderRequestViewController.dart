import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/LaundryRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as cloudFunctionModels;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustLaundryOrderRequestViewController {
  // instances //

  TextEditingController orderNote = TextEditingController();

  final LocationPickerController locationPickerController =
      LocationPickerController();
  final GlobalKey<FormState> formKey = GlobalKey();

  final AuthController authController = Get.find<AuthController>();
  // state vars
  Rxn<Laundry> laundry = Rxn();
  Rxn<MezLocation> customerLoc = Rxn();
  RxnNum shippingCost = RxnNum();
  Rx<cloudFunctionModels.DeliveryType> dvType =
      Rx(cloudFunctionModels.DeliveryType.Delivery);
  bool get showDelivery =>
      dvType.value == cloudFunctionModels.DeliveryType.Delivery;

  DeliveryCost? get deliveryCost {
    return laundry.value!.deliveryCost;
  }

  List<int> selectedCompanies = [];
  RxDouble estDeliveryCost = RxDouble(40);

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
              (deliveryCost!.costPerKm * (_orderDistanceInKm)) +
                  getShippingCostFromBase();
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

  double getShippingCostFromBase() {
    mezDbgPrint(
        "Gett shipping cost from base =====>${deliveryCost?.costPerKmFromBase}");
    double result = 0;
    if (deliveryCost?.costPerKmFromBase != null) {
      final double dist = MapHelper.calculateDistance(
          MapHelper.alitasLoc.toLocationData(),
          laundry.value!.info.location.toLocationData());
      mezDbgPrint("distance from base ========>$dist");
      final double cost = dist * deliveryCost!.costPerKmFromBase!;
      result = cost;
    }
    mezDbgPrint("shipping cost from base ==========>$result");
    return result;
  }

  LaundryRequest _constructLaundryRequest(MapHelper.Route route) {
    final LaundryRequest _laundryRequest = LaundryRequest(
        laundryId: laundry.value!.info.hasuraId,
        deliveryCost: shippingCost.value!);
    _laundryRequest.routeInformation = MapHelper.RouteInformation(
      polyline: route.encodedPolyLine,
      distance: route.distance,
      duration: route.duration,
    );

    _laundryRequest.laundryId = laundry.value!.info.hasuraId;
    _laundryRequest.from = laundry.value!.info.location;
    _laundryRequest.to = customerLoc.value!;
    _laundryRequest.notes = orderNote.text.inCaps;
    _laundryRequest.paymentType = PaymentType.Cash;
    return _laundryRequest;
  }

  Future<void> createLaundryOrder() async {
    final bool nameAndImageChecker =
        await Get.find<AuthController>().nameAndImageChecker();
    bool? isOpen =
        await get_service_is_open(detailsId: laundry.value!.serviceDetailsId);
    if (isOpen != true) {
      showServiceClosedSnackBar();
      return;
    }
    if (nameAndImageChecker) {
      MapHelper.Route? route = await MapHelper.getDurationAndDistance(
          laundry.value!.info.location, customerLoc.value!);

      if (route != null) {
        final LaundryRequest _laundryRequest = _constructLaundryRequest(route);

        await _checkoutOrder(_laundryRequest);
      } else {
        showRouteErrorSnackBar();
      }
    }
  }

  Future<void> _checkoutOrder(LaundryRequest laundryRequest) async {
    try {
      final cloudFunctionModels.ReqLaundryResponse response =
          await CloudFunctions.laundry3_requestLaundry(
        fromCustomerDeliveryOffer: estDeliveryCost.value,
        chosenCompanies: selectedCompanies,
        storeId: laundryRequest.laundryId,
        customerAppType: cloudFunctionModels.CustomerAppType.Native,
        customerLocation: cloudFunctionModels.Location(
            lat: laundryRequest.to!.latitude,
            lng: laundryRequest.to!.longitude,
            address: laundryRequest.to!.address),
        // deliveryCost: shippingCost.value! * 2,
        paymentType: laundryRequest.paymentType.toFirebaseFormatEnum(),
        notes: laundryRequest.notes,
        tripDistance:
            laundryRequest.routeInformation!.distance.distanceInMeters,
        tripDuration: laundryRequest.routeInformation!.duration.seconds,
        tripPolyline: laundryRequest.routeInformation!.polyline,
        deliveryType: dvType.value,
      );
      if (response.orderId == null) {
        mezDbgPrint(response.error);
        showErrorSnackBar(errorText: response.error.toString());
      } else {
        await MezRouter.popEverythingTillBeforeHome().then((value) =>
            CustLaundryOrderView.navigate(orderId: response.orderId!.toInt()));
      }
    } on FirebaseFunctionsException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(
        errorText: e.message.toString(),
      );
    } catch (e) {
      showErrorSnackBar();
      mezDbgPrint(e);
    }
  }

  void switchDeliveryType({required cloudFunctionModels.DeliveryType type}) {
    dvType.value = type;

    //  _cartRxn.value?.deliveryType = dvType.value;
    if (dvType.value == cloudFunctionModels.DeliveryType.Pickup) {
      shippingCost.value = null;
    }
  }
}
