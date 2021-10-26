import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerWrapper extends GetWidget<AuthController>
    with WidgetsBindingObserver {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  OrderController _orderController = Get.find<OrderController>();
  RxInt numberOfCurrentOrders = RxInt(0);
  DateTime? appClosedTime;
  CustomerWrapper() {
    WidgetsBinding.instance!.addObserver(this);
    _orderController.getCurrentOrders().listen((currentOrders) {
      numberOfCurrentOrders.value = currentOrders.length;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (appClosedTime != null &&
          DateTime.now().difference(appClosedTime!) > Duration(seconds: 10)) {
        navigateToOrdersIfNecessary(_orderController.currentOrders);
      }
    } else if (state == AppLifecycleState.paused) {
      appClosedTime = DateTime.now();
    }
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    print("navigateToOrdersIfNecessary");
    if (currentOrders.length == 1) {
      if (currentOrders[0].orderType == OrderType.Restaurant)
        Get.offNamedUntil(
            getCurrentRestaurantOrderRoute(currentOrders[0].orderId),
            (Route<dynamic> route) {
          return (route.settings.name == kWrapperRoute);
        });
      else
        print("Navigate to other order type");
    } else if (currentOrders.length > 1) {
      Get.offNamedUntil(kOrdersRoute, (Route<dynamic> route) {
        return (route.settings.name == kWrapperRoute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    print("CustomWrapper Build callabck");
    // Navigate to current orders if any after build
    Future.microtask(() {
      _orderController.getCurrentOrders().first.then((currentOrders) {
        print("CustomWrapper Build callabck first");
        navigateToOrdersIfNecessary(currentOrders);
      });
    });
    return Scaffold(
        key: _sideMenuDrawerController.getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text("Mezcalmos"),
        //   actions: [
        //     TextButton(
        //         onPressed: () => Get.toNamed(kOrdersRoute),
        //         child: Obx(() =>
        //             Text("Orders" + numberOfCurrentOrders.value.toString())))
        //   ],
        // ),
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", () => _sideMenuDrawerController.openMenu(), actionIcons: [
          ActionIconsComponents.notificationIcon(),
          ActionIconsComponents.orderIcon()
        ]),
        body: SafeArea(
          child: Column(
            children: [
              // SizedBox(
              //   height: Get.height * 0.005,
              // ),
              // restaurantAppBarComponent(
              //     "menu",
              //   ,
              //   ["notifications", "oredrs"]),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text("Services",
                    style: TextStyle(
                        color: Color(0xff1d1d1d),
                        // fontWeight: FontWeight.w400,
                        fontFamily: "psr",
                        fontSize: 45.sp),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: const Color(0xfffceb4d).withOpacity(0.25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TaxiImage(
                        sw: 47,
                        sh: 47,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text("Taxi",
                            style: const TextStyle(
                                color: const Color(0xff000f1c),
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProductSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: const Color(0xff5582ff).withOpacity(0.25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FoodImage(
                          sw: 47,
                          sh: 47,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text("Food",
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ProductSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Get.toNamed(kRestaurantsRoute),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              // OutlinedButton(
              //     onPressed: () ,
              //     child: Text("Restaurants"))
            ],
          ),
        ));
  }
}
