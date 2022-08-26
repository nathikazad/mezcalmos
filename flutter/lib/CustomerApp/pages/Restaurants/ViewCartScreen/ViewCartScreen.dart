import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ViewCartBody.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

// ignore: constant_identifier_names
enum DropDownResult { Null, String }

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

enum CardChoice { SavedCard, GooglePay, ApplePay }

class _ViewCartScreenState extends State<ViewCartScreen> {
  /// RestaurantController
  RestaurantController _restaurantController = Get.find<RestaurantController>();
  ViewCartController viewCartController = ViewCartController();

  /// _clickedOrderNow
  bool _clickedOrderNow = false;

  /// DropDownResult
  DropDownResult ddResult = DropDownResult.Null;

  /// _textEditingController
  TextEditingController _textEditingController = TextEditingController();

  /// CustomerAuthController
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  /// listOfSavedLocations
  List<SavedLocation> listOfSavedLocations = <SavedLocation>[];

  /// dropDownListValue
  SavedLocation? dropDownListValue;

  /// orderToLocation
  Location? orderToLocation;

  CardChoice cartPaymentChoice = CardChoice.ApplePay;
  CreditCard? savedCardChoice;

  @override
  void initState() {
    super.initState();
    if (Get.find<CustomerAuthController>().customer.value?.savedCards == null)
      savedCardChoice =
          Get.find<CustomerAuthController>().customer.value!.savedCards.first;
    orderToLocation = Get.find<CustomerAuthController>()
        .customer
        .value!
        .defaultLocation
        ?.location;
    // check if cart empty
    // if yes redirect to home page
    _restaurantController.cart.value.cartItems.map((CartItem item) {});
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomerAppBar(
          autoBack: true,
          title: "${_i18n()["myCart"]}",
        ),
        body: Obx(() {
          if (_restaurantController.cart.value.cartItems.length > 0) {
            return SingleChildScrollView(
              child: ViewCartBody(
                viewCartController: viewCartController,
                setLocationCallBack: ({Location? location}) {
                  setState(() {
                    orderToLocation = location;
                  });
                },
                notesTextController: _textEditingController,
              ),
            );
          } else {
            return CartIsEmptyScreen();
          }
        }),
        bottomSheet: (_restaurantController.cart.value.cartItems.length > 0)
            ? MezButton(
                label: '${_i18n()["orderNow"]}',
                enabled: canClick(),
                withGradient: true,
                borderRadius: 0,
                onClick: () async {
                  await checkoutActionButton();
                },
                // bgColor: getTheRightButtonColor(),
                // canClick: canClick(),
                // label: Center(
                //     child: getTheRightWidgetForOrderNowButton(_clickedOrderNow)),
                // function: !_clickedOrderNow ? checkoutActionButton : () {},
              )
            : null,
      ),
    );
  }

  bool canClick() {
    // it returns the pruple or the grey color for the order now button
    if (orderToLocation == null ||
        !(_restaurantController.associatedRestaurant?.isOpen() ?? true)) {
      return false;
    } else {
      return true;
    }
  }

  Color getTheRightButtonColor() {
    // it returns the pruple or the grey color for the order now button
    if (orderToLocation == null ||
        !(_restaurantController.associatedRestaurant?.isOpen() ?? false)) {
      return Colors.grey.shade300;
    } else if (_restaurantController.associatedRestaurant?.isOpen() ?? true) {
      return offRedColor;
    } else {
      return Color(0xffac59fc);
    }
  }

  Widget getTheRightWidgetForOrderNowButton(bool clicked) {
    if (!(_restaurantController.associatedRestaurant?.isOpen() ?? false)) {
      return Container(
        alignment: Alignment.center,
        color: offRedColor,
        child: Text(
          "${_i18n()["notAvailable"]}",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.red),
        ),
      );
    }
    if (clicked) {
      return Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1,
        ),
      );
    } else {
      return Text(
        "${_i18n()['orderNow']}",
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
      );
    }
  }

  /// Call this right after customer presses Checkout
  /// Uses : Make sure that the order has been successfully written to database + already consumed by the listener.
  // Future<void> avoidCheckoutRaceCondition(String orderId) async {
  //   if (Get.find<OrderController>().getOrder(orderId) == null) {
  //     mezDbgPrint(
  //         "[+] s@@d ==> [ CHECKOUT RESTAURANT ORDER ]  RACING CONDITION HAPPENING ... ");
  //     await Get.find<OrderController>()
  //         ._getInProcessOrderStream(orderId)
  //         .firstWhere((order) => order != null);
  //   } else
  //     mezDbgPrint(
  //         "[+] s@@d ==> [ CHECKOUT RESTAURANT ORDER ] NO RACING CONDITION HAPPEND ! ");
  // }

//itemviewscreen
  Future<void> checkoutActionButton() async {
    _restaurantController.cart.value.toLocation = orderToLocation;
    _restaurantController.cart.value.notes = _textEditingController.text;
    MapHelper.Route? routeInfo;

    await MapHelper.getDurationAndDistance(
      _restaurantController.cart.value.restaurant!.info.location,
      orderToLocation!,
    )
        //    ).catchError((Object? e, StackTrace stk) {
        // MezSnackbar("Error", "${_i18n()["errorText"]}",
        //     position: SnackPosition.TOP);
        // })
        .then((MapHelper.Route value) {
      mezDbgPrint("Route info succesfully ===================> $routeInfo");
      routeInfo = value;
      _restaurantController.cart.value.setRouteInformation =
          MapHelper.RouteInformation(
        polyline: routeInfo!.encodedPolyLine,
        distance: routeInfo!.distance,
        duration: routeInfo!.duration,
      );
    }).whenComplete(() async {
      String? stripePaymentId;

      if (_restaurantController.cart.value.paymentType == PaymentType.Card) {
        switch (viewCartController.getCardChoice) {
          case CardChoice.ApplePay:
            final ServerResponse paymentIntentResponse = await getPaymentIntent(
                customerId: Get.find<AuthController>().user!.id,
                serviceProviderId:
                    _restaurantController.cart.value.restaurant!.info.id,
                orderType: OrderType.Restaurant,
                paymentAmount: _restaurantController.cart.value.totalCost);
            stripePaymentId = extractPaymentIdFromIntent(
                paymentIntentResponse.data['paymentIntent'].toString());
            await acceptPaymentWithApplePay(
                paymentAmount: _restaurantController.cart.value.totalCost,
                paymentIntentData: paymentIntentResponse.data,
                merchantName:
                    _restaurantController.cart.value.restaurant!.info.name);
            break;
          case CardChoice.GooglePay:
            final ServerResponse paymentIntentResponse = await getPaymentIntent(
                customerId: Get.find<AuthController>().user!.id,
                serviceProviderId:
                    _restaurantController.cart.value.restaurant!.info.id,
                orderType: OrderType.Restaurant,
                paymentAmount: _restaurantController.cart.value.totalCost);
            stripePaymentId = extractPaymentIdFromIntent(
                paymentIntentResponse.data['paymentIntent'].toString());
            await acceptPaymentWithGooglePay(
                paymentAmount: _restaurantController.cart.value.totalCost,
                paymentIntentData: paymentIntentResponse.data,
                merchantName:
                    _restaurantController.cart.value.restaurant!.info.name);
            break;
          case CardChoice.SavedCard:
            stripePaymentId = await acceptPaymentWithSavedCard(
                serviceProviderId:
                    _restaurantController.cart.value.restaurant!.info.id,
                paymentAmount: _restaurantController.cart.value.totalCost,
                card: viewCartController.card.value!);
            break;
        }
      }

      final ServerResponse _serverResponse = await _restaurantController
          .checkout(stripePaymentId: stripePaymentId);

      if (_serverResponse.success) {
        _restaurantController.clearCart();
        popEverythingAndNavigateTo(
            getRestaurantOrderRoute(_serverResponse.data["orderId"]));
      } else {
        print(_serverResponse);
        if (_serverResponse.errorCode == "serverError") {
          // do something
        } else if (_serverResponse.errorCode == "inMoreThanThreeOrders") {
          // do something
        } else if (_serverResponse.errorCode == "restaurantClosed") {
          // do something
        } else {
          // do something
        }
      }
    });
  }
}
