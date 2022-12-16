import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart' as c;
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildItems.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/pages/PickLocationview.dart' as t;
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/authScreen/components/MezButtonWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../CustomerApp/controllers/restaurant/restaurantController.dart';
import '../../CustomerApp/pages/Restaurants/ViewCartScreen/components/OrderSummaryCard.dart';
import '../../Shared/models/Utilities/ServerResponse.dart';

enum ViewDrawerType { myOrder, pickLocationView }

class EndWebSideBar extends StatefulWidget {
  EndWebSideBar({Key? key}) : super(key: key);

  @override
  State<EndWebSideBar> createState() => _EndWebSideBarState();
}

class _EndWebSideBarState extends State<EndWebSideBar> {
  Rx<ViewDrawerType> viewType = ViewDrawerType.myOrder.obs;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("inside the End web drawer ====> ${viewType.value}");

    Get.put<AppLifeCycleController>(
      AppLifeCycleController(logs: true),
      permanent: true,
    );
    return Container(
        width: 350,
        height: Get.height,
        color: Colors.white,
        child: Obx(
          () => Get.find<RestaurantController>().cart.value.cartItems.length > 0
              ? Scaffold(
                  appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      leading: Obx(
                        () => IconButton(
                          onPressed: () {
                            if (viewType.value == ViewDrawerType.myOrder) {
                              mezDbgPrint("this is myOrders");
                              Navigator.of(context).pop();
                            } else {
                              mezDbgPrint("this is pickloaction");
                              viewType.value = ViewDrawerType.myOrder;
                            }
                          },
                          icon: Icon(
                            (viewType == ViewDrawerType.myOrder)
                                ? Icons.close
                                : Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  body: Obx(() =>
                      _buildBodyWidget(context: context, viewType: viewType)))
              : Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          Get.find<MezWebSideBarController>()
                              .closeWebEndDrawer();
                        },
                        icon: Icon(Icons.close)),
                  ),
                  body: Center(
                    child: Text("Cart is empty...!"),
                  ),
                ),
        ));
  }

  Widget _buildBodyWidget(
      {required BuildContext context, required Rx<ViewDrawerType> viewType}) {
    if (viewType == ViewDrawerType.myOrder) {
      return ViewCartScreenForWeb(
        type: viewType.value,
        onChanged: (value) {
          viewType.value = value;
        },
      );
    } else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Pick your location",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: c.PickLocationView(
                t.PickLocationMode.AddNewLocation, aLocationPicker, true),
          ),
        ],
      );
  }
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

dynamic _i18n1() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["ViewCartBody"];

class ViewCartScreenForWeb extends StatefulWidget {
  ViewCartScreenForWeb({Key? key, required this.type, required this.onChanged})
      : super(key: key);
  ViewDrawerType type;
  final ValueChanged<ViewDrawerType>? onChanged;

  @override
  State<ViewCartScreenForWeb> createState() => _ViewCartScreenForWebState();
}

class _ViewCartScreenForWebState extends State<ViewCartScreenForWeb> {
  // RestaurantController
  RestaurantController _restaurantController = Get.find<RestaurantController>();
  ViewCartController viewCartController = ViewCartController();

  /// _textEditingController
  TextEditingController _textEditingController = TextEditingController();

  /// orderToLocation
  Location? orderToLocation;

  CardChoice cartPaymentChoice = CardChoice.ApplePay;
  CreditCard? savedCardChoice;

  @override
  void initState() {
    super.initState();
    mezDbgPrint(
        "Cart items =====================>>>${_restaurantController.cart.value.cartItems}");
    if (Get.find<CustomerAuthController>().customer.value?.savedCards == null)
      savedCardChoice =
          Get.find<CustomerAuthController>().customer.value!.savedCards.first;
    orderToLocation = Get.find<CustomerAuthController>()
        .customer
        .value!
        .defaultLocation
        ?.location;
    if (orderToLocation != null) {
      _restaurantController.cart.value.toLocation = orderToLocation;
    }
    try {
      _restaurantController
          .updateShippingPrice()
          .then((bool value) => _restaurantController.cart.refresh());
    } catch (e) {
      mezDbgPrint("this is a huge problem =========== ${e.toString()}");
    }

    // check if cart empty
    // if yes redirect to home page

    if (_restaurantController.cart.value.cartPeriod != null) {
      _restaurantController.cart.value.deliveryTime =
          _restaurantController.cart.value.cartPeriod?.start;
    }
    mezDbgPrint(
        "item is special ===== ${_restaurantController.cart.value.cartItems.first.isSpecial}");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     onPressed: () {
      //       mezDbgPrint("this is a test one 111");
      //       checkoutActionButton();
      //     },
      //     child: Text("this is a test"),
      //   ),
      body: Container(
        child: SingleChildScrollView(
          child: Obx(
            () => _restaurantController.cart.value.cartItems.length > 0
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Text(
                              "${_i18n()["myCart"]}",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Spacer(),

                            // clear carqt button
                            _ClearCartButton(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildItemExpentionPanelWidget(),
                      SizedBox(
                        height: 50,
                      ),
                      _buildSummaryAndLoactionPicker(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildNoteWidget(_textEditingController),
                      SizedBox(
                        height: 10,
                      ),
                      _buildOrderNowButton(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Center(
                    child: Text("Your cart is empty .."),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemExpentionPanelWidget() {
    // this will be for the expenssion panel widget
    return CartItemsBuilder(
      isWebVersion: true,
    );
  }

  void _setLocationCallback({Location? location}) {
    mezDbgPrint("this is a test inside _setLocationCallback");
    if (location != null && location.isValidLocation()) {
      setState(() {
        orderToLocation = location;
      });
      _restaurantController.cart.value.toLocation = location;
      _restaurantController
          .updateShippingPrice()
          .then((bool value) => _restaurantController.cart.refresh());
    }
  }

  Widget _buildSummaryAndLoactionPicker() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: OrderSummaryCard(
        isWebWidget: true,
        setLocationCallBack: ({Location? location}) {
          mezDbgPrint("this is a test inside _setLocationCallback");
          // --
          if (location != null && location.isValidLocation()) {
            setState(() {
              orderToLocation = location;
            });
            _restaurantController.cart.value.toLocation = location;
            _restaurantController
                .updateShippingPrice()
                .then((bool value) => _restaurantController.cart.refresh());
          }
        },
        controller: _restaurantController,
        pickerWidget: Container(
          child: Column(
            children: [
              Divider(
                thickness: 1,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${_i18n1()["deliveryLocation"]} :",
                  style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(73, 73, 73, 1)),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              DropDownLocationList(
                webRedrectionCallback: () async {
                  mezDbgPrint("this is in side this EndwebSideBar");
                  setState(() {
                    mezDbgPrint("====== widget.type ${widget.type}");
                    widget.type = ViewDrawerType.pickLocationView;
                    widget.onChanged!.call(widget.type);
                    mezDbgPrint("====== widget.type ${widget.type}");
                  });
                  return null;
                },
                isWebVersion: true,
                onValueChangeCallback: _setLocationCallback,
                bgColor: Color.fromRGBO(240, 242, 255, 1),
                checkDistance: true,
                serviceProviderLocation:
                    _restaurantController.cart.value.restaurant?.info.location,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteWidget(TextEditingController noteTextController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text("${_i18n1()['notesTitle']}",
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w700),
                controller: noteTextController,
                maxLines: 7,
                minLines: 4,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "${_i18n1()["notes"]}",
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                    fillColor: Colors.white)),
          ),
        ],
      ),
    );
  }

  /// returns stripePaymentId
  Future<String?> acceptPaymentByCardChoice(CardChoice choice) async {
    String? stripePaymentId;

    //viewCartController.getCardChoice
    if (_restaurantController.cart.value.paymentType == PaymentType.Card) {
      switch (choice) {
        case CardChoice.ApplePay:
          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<FirbaseAuthController>().user!.id,
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
              customerId: Get.find<FirbaseAuthController>().user!.id,
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
    return stripePaymentId;
  }

  Future<bool> checkoutActionButton() async {
    viewCartController.pickerChoice.value = {PickerChoice.Cash: null};
    mezDbgPrint(
        "checkout func called ${viewCartController.getCardChoice.toString()}");
    _restaurantController.cart.value.toLocation = orderToLocation;
    _restaurantController.cart.value.notes = _textEditingController.text;
    try {
      if (_restaurantController.getOrderDistance <= 1000000) {
        final String? stripePaymentId =
            await acceptPaymentByCardChoice(viewCartController.getCardChoice);

        final ServerResponse _serverResponse = await _restaurantController
            .checkout(stripePaymentId: stripePaymentId);

        if (_serverResponse.success) {
          mezDbgPrint(
              "navigate to orders by id screen ${_serverResponse.data["orderId"]} and route will be  orders/${_serverResponse.data["orderId"]}");
          var xQroute = QR.currentPath;
          var params = QR.currentPath.split("?");
          await QR.navigator.replaceAll(
              "orders/${_serverResponse.data["orderId"]}?${params[1]}");
          _restaurantController.clearCart();

          // popEverythingAndNavigateTo(
          //     getRestaurantOrderRoute(_serverResponse.data["orderId"]));
          return true;
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
      } else {
        MezSnackbar(
          '${_i18n()["ops"]}',
          '${_i18n()["distanceError"]}',
        );
      }
      return false;
    } catch (e, s) {
      mezDbgPrint(
        "Error happened during generating order's routeInfos / Stripe payment ===> #$e\n\nStackTrace ==> #$s",
      );
      return false;
    }
  }

  /// order now button

  Widget _buildOrderNowButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(103, 121, 254, 1),
            Color.fromRGBO(172, 89, 252, 1),
          ],
        ),
      ),
      child: MezButton(
        btnMargin: const EdgeInsets.symmetric(horizontal: 0),
        onPress: () async {
          mezDbgPrint("==================?>tis is atest");

          viewCartController.clickedCheckout.value = true;
          final bool _isCheckoutFailed = !(await checkoutActionButton());
          if (_isCheckoutFailed) {
            viewCartController.clickedCheckout.value = false;
          }

          // try {
          // if (_restaurantController.canOrder &&
          //     !viewCartController.clickedCheckout.value) {
          // if (true) {
          //   viewCartController.clickedCheckout.value = true;
          //   mezDbgPrint("we are calling checkout");
          //   final bool _isCheckoutFailed = !(await checkoutActionButton());
          //   mezDbgPrint("checkout func called");
          //   if (_isCheckoutFailed) {
          //     viewCartController.clickedCheckout.value = false;
          //   }
          // } else {
          //   _restaurantController.cart.refresh();
          // }
          // } on Exception catch (e) {
          //   mezDbgPrint(
          //       "⚠️⚠️⚠️⚠️⚠️⚠️⚠️catch an exception on checout func ${e.toString()}");
          // }
        },
        content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(103, 121, 254, 1),
                  Color.fromRGBO(172, 89, 252, 1),
                ],
              ),
            ),
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              child: Text(
                "Order Now",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }

  Widget _ClearCartButton() {
    return InkWell(
      onTap: () async {
        await showConfirmationDialog(context,
            title: _i18n()["clearCart"],
            helperText: _i18n()["clearCartConfirm"],
            primaryButtonText: _i18n()["yesClear"],
            onNoClick: () {
              Navigator.of(context).pop();
            },
            secondaryButtonText: _i18n()["no"],
            onYesClick: () async {
              Navigator.of(context).pop();
              _restaurantController.clearCart();
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.trashCan,
              color: Color.fromRGBO(226, 17, 50, 1),
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Clear cart",
                style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(226, 17, 50, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
