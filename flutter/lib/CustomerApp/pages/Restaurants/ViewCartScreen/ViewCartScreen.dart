import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ViewCartBody.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

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

  /// _textEditingController
  TextEditingController _textEditingController = TextEditingController();

  /// CustomerAuthController
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  /// orderToLocation
  Location? orderToLocation;

  CardChoice cartPaymentChoice = CardChoice.ApplePay;
  CreditCard? savedCardChoice;

  @override
  void initState() {
    super.initState();

    getCustomerCart(
      customerId: Get.find<AuthController>().user!.hasuraId,
    ).then((value) {
      if (value != null) {
        mezDbgPrint("Got cart! ===> ${value.restaurant?.info}");
        _restaurantController.cart.value = value;
        mezDbgPrint(
            "Cart items =====================>>>${_restaurantController.cart.value.cartItems}");
        if (Get.find<CustomerAuthController>().customer?.savedCards == null)
          savedCardChoice =
              Get.find<CustomerAuthController>().customer!.savedCards.first;
        orderToLocation = Get.find<CustomerAuthController>()
            .customer!
            .defaultLocation
            ?.location;
        if (orderToLocation != null) {
          _restaurantController.cart.value.toLocation = orderToLocation;
        }
      }
    });

    _restaurantController
        .updateShippingPrice()
        .then((bool value) => _restaurantController.cart.refresh());

    // check if cart empty
    // if yes redirect to home page
    if (_restaurantController.cart.value.cartPeriod != null) {
      _restaurantController.cart.value.deliveryTime =
          _restaurantController.cart.value.cartPeriod?.start;
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                if (location != null && location.isValidLocation()) {
                  _restaurantController.cart.value.toLocation = location;
                  _restaurantController.updateShippingPrice().then(
                      (bool value) => _restaurantController.cart.refresh());
                }
              },
              notesTextController: _textEditingController,
            ),
          );
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomSheet: Obx(
        () {
          if (_restaurantController.cart.value.cartItems.length > 0) {
            return MezButton(
              label: (_restaurantController.associatedRestaurant?.isOpen() ==
                      false)
                  ? '${_i18n()["scheduleOrder"]}'
                  : '${_i18n()["orderNow"]}',
              enabled: _restaurantController.canOrder,
              withGradient: true,
              borderRadius: 0,
              onClick: () async {
                if (_restaurantController.canOrder) {
                  await checkoutActionButton();
                } else {
                  _restaurantController.cart.refresh();
                }
              },
            );
          } else
            return SizedBox();
        },
      ),
    );
  }

  bool canClick() {
    // it returns the pruple or the grey color for the order now button
    if (orderToLocation == null ||
        (_restaurantController.associatedRestaurant?.isOpen() == false &&
            _restaurantController.cart.value.deliveryTime == null)) {
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

  Future<void> checkoutActionButton() async {
    _restaurantController.cart.value.toLocation = orderToLocation;
    _restaurantController.cart.value.notes = _textEditingController.text;
    try {
      // if (_restaurantController.getOrderDistance <= 10) {
      // if (true) {
      final String? stripePaymentId =
          await acceptPaymentByCardChoice(viewCartController.getCardChoice);

      final ServerResponse _serverResponse = await _restaurantController
          .checkout(stripePaymentId: stripePaymentId);

      mezDbgPrint("datatatatataat => ${_serverResponse.data}");

      if (_serverResponse.success) {
        _restaurantController.clearCart();
        popEverythingAndNavigateTo(
          getRestaurantOrderRoute(
            _serverResponse.data["orderId"],
          ),
        );
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
      // } else {
      //   print(_serverResponse);
      //   if (_serverResponse.errorCode == "serverError") {
      //     // do something
      //   } else if (_serverResponse.errorCode == "inMoreThanThreeOrders") {
      //     // do something
      //   } else if (_serverResponse.errorCode == "restaurantClosed") {
      //     // do something
      //   } else {
      //     // do something
      //   }
      // }
      // } else {
      //   MezSnackbar(
      //     '${_i18n()["ops"]}',
      //     '${_i18n()["distanceError"]}',
      //   );
      // }
    } catch (e, s) {
      mezDbgPrint(
        "Error happened during generating order's routeInfos / Stripe payment ===> #$e\n\nStackTrace ==> #$s",
      );
    }
  }

  /// returns stripePaymentId
  Future<String?> acceptPaymentByCardChoice(CardChoice choice) async {
    String? stripePaymentId;

    //viewCartController.getCardChoice
    if (_restaurantController.cart.value.paymentType == PaymentType.Card) {
      switch (choice) {
        case CardChoice.ApplePay:
          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId: _restaurantController
                  .cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
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
          // TODO:544D-HASURA

          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId: _restaurantController
                  .cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
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
              serviceProviderId: _restaurantController
                  .cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
              paymentAmount: _restaurantController.cart.value.totalCost,
              card: viewCartController.card.value!);
          break;
      }
    }
    return stripePaymentId;
  }
}
