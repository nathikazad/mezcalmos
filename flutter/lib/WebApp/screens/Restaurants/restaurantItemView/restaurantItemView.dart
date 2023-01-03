// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/RestaurantItemViewForMobile.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/components/restauarntItemViewForDesktop.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/endWebSideBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

import '../../../../Shared/controllers/restaurantsInfoController.dart';

enum ViewItemScreenMode { AddItemMode, EditItemMode }

class RestaurantItemView extends StatefulWidget {
  const RestaurantItemView({Key? key}) : super(key: key);

  @override
  State<RestaurantItemView> createState() => _RestaurantItemViewState();
}

class _RestaurantItemViewState extends State<RestaurantItemView> {
  Rxn<CartItem> cartItem = Rxn<CartItem>();
  late ViewItemScreenMode mode;
  Restaurant? currentRestaurant;

  MezWebSideBarController mezWebSideBarController = MezWebSideBarController();

  ViewDrawerType viewType = ViewDrawerType.myOrder;

  @override
  void initState() {
    mezDbgPrint(
        "===========> this is the mode ${QR.params['mode'].toString()} <=============");
    _getRestaurant();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   _getRestaurant();
  //   super.didChangeDependencies();
  // }

  void _getRestaurant() async {
    mezDbgPrint(
        "===========> this is the mode ${QR.params['mode'].toString()} <=============");
    setupFirebase(launchMode: typeMode.toLaunchMode()).then((value) {
      Get.put<ForegroundNotificationsController>(
          ForegroundNotificationsController(),
          permanent: true);
      // RestaurantController restaurantCartController =
      //     Get.find<RestaurantController>();
      mode = QR.params['mode'].toString() == "add" || QR.params['mode'] == null
          ? ViewItemScreenMode.AddItemMode
          : ViewItemScreenMode.EditItemMode;
      mezDbgPrint("===========> this is the mode ${mode} <=============");
      if (mode == ViewItemScreenMode.AddItemMode) {
        Get.find<RestaurantsInfoController>()
            .getRestaurant(QR.params['id'].toString())
            .then((value) {
          if (value != null) {
            setState(() {
              currentRestaurant = value;
              var item = value.findItemById(id: QR.params['itemId'].toString());

              cartItem.value = CartItem(item!, QR.params['id'].toString());

              if (item != null) {
                print("this is another test ${item.toJson()}");
              } else {
                // QR.to("/404");
              }
            });
          } else {
            //QR.to("/404");
          }
        });
      } else if (QR.params['mode'].toString() == "edit") {
        mezDbgPrint(
            "👋===========> this is the mode ${mode}  and the id is ${QR.params['idInCart'].toString()}<=============");
        Get.find<RestaurantController>()
            .cart
            .value
            .cartItems
            .forEach((element) {
          mezDbgPrint("this is the id of the item ${element.idInCart}");
        });
        try {
          CartItem? x = Get.find<RestaurantController>()
              .cart
              .value
              .cartItems
              .firstWhere((CartItem item) {
            return item.idInCart == "${QR.params['idInCart'].toString()}";
          });
          mezDbgPrint(
              "🛒🛒🛒🛒🛒🛒🛒🛒 x value is ${x.toFirebaseFunctionFormattedJson()}");
          mezDbgPrint(
              "the lengeth of this shit is ${Get.find<RestaurantController>().cart.value.cartItems.length}");
          cartItem.value = CartItem.clone(x);

          Get.find<RestaurantsInfoController>()
              .getRestaurant(cartItem.value!.restaurantId)
              .then((Restaurant? value) {
            setState(() {
              currentRestaurant = value;
            });
          });
        } catch (e) {
          mezDbgPrint("this is a problem here happen e ${e.toString()}");
          //QR.to("/404");
        }
      }
      cartItem.refresh();
      var xLang = QR.params["lang"].toString().contains("es")
          ? LanguageType.ES
          : LanguageType.EN;
      print("xLang is now ${xLang}");
      if (mounted) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.find<LanguageController>().changeLangForWeb(xLang);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("the restaurant id is ${QR.params['itemId'].toString()}");
    // s=re
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          final GlobalKey<ScaffoldState> _key = GlobalKey();
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            final FirbaseAuthController _authcontroller =
                Get.find<FirbaseAuthController>();

            return (cartItem != null)
                ? Scaffold(
                    key: mezWebSideBarController.drawerKey,
                    drawer: mezWebSideBarController.frontDrawerContent,
                    endDrawer: mezWebSideBarController.endDrawerContent,
                    appBar: InstallAppBarComponent(),
                    bottomNavigationBar: MezBottomBar(),
                    body: LayoutBuilder(builder: (context, constraints) {
                      if (MezCalmosResizer.isMobile(context) ||
                          MezCalmosResizer.isSmallMobile(context)) {
                        return RestaurantItemViewForMobile(
                            cartItem: cartItem,
                            currentRestaurant: currentRestaurant.obs,
                            viewItemScreenMode: mode,
                            mezWebSideBarController: mezWebSideBarController);
                      } else {
                        return Scaffold(
                          appBar: WebAppBarComponent(
                            mezWebSideBarController: mezWebSideBarController,
                            automaticallyGetBack:
                                (MezCalmosResizer.isMobile(context) ||
                                        MezCalmosResizer.isSmallMobile(context))
                                    ? false
                                    : true,
                            type: _authcontroller.fireAuthUser?.uid != null
                                ? WebAppBarType.WithCartActionButton.obs
                                : WebAppBarType.WithSignInActionButton.obs,
                          ),
                          body: RestaurantItemViewForDesktop(
                              viewItemScreenMode: mode,
                              cartItem: cartItem,
                              currentRestaurant: currentRestaurant.obs,
                              mezWebSideBarController: mezWebSideBarController),
                        );
                      }
                    }),
                  )
                : Scaffold(
                    body: Center(
                      child: MezLoaderWidget(),
                    ),
                  );
          } else {
            return Scaffold();
          }
        });
  }
}
