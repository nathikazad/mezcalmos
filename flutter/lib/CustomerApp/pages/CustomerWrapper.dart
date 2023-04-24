import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceView/AllServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/deepLinkHandler.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/UserProfileView/UserProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper> {
  AuthController authController = Get.find<AuthController>();
  CustomerAuthController? customerAuthController;


  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();

  DateTime? appClosedTime;

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  RxInt numberOfCurrentOrders = RxInt(0);

  StreamSubscription<dynamic>? _authStateChnagesListener;

  @override
  void initState() {
    super.initState();

    if (authController.fireAuthUser != null) {
      customerAuthController = Get.find<CustomerAuthController>();
     
      //  _doIfFireAuthUserIsNotNull();
    }
    startAuthListener();
    DeepLinkHandler.startDynamicLinkCheckRoutine(
        CustomerDeepLinkHandler.handleDeepLink);
  }

  @override
  void dispose() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    super.dispose();
  }

  // void appReturnFromBackground() {
  //   final DateTime? lastTimeAppReturnedFromBackground =
  //       Get.find<AppLifeCycleController>().lastTimeAppReturnedFromBackground;
  //   if (lastTimeAppReturnedFromBackground != null &&
  //       DateTime.now().difference(lastTimeAppReturnedFromBackground) >
  //           Duration(seconds: 1)) if (appClosedTime != null &&
  //       DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
  //       !MezRouter.isCurrentRoute(SharedRoutes.kLocationPermissionPage)) {
  //     _navigateToOrdersIfNecessary();
  //   }
  // }

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (authController.isUserSignedIn) {
          return _getBody();
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      }),
    );
  }

  Widget _getBody() {
    switch (_index.value) {
      case 0:
        return AllServiceView();
      case 1:
        return CustomerOrdersListView(
          asTab: true,
        );
      case 3:
        return UserProfileView(
          asTab: true,
        );

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _navBar() {
    return Obx(
      () => authController.isUserSignedIn
          ? BottomNavigationBar(
              selectedLabelStyle: context.textTheme.bodyLarge,
              unselectedLabelStyle: context.textTheme.bodyMedium,
              currentIndex: _index.value,
              onTap: (int v) {
                _index.value = v;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.feed_outlined),
                    label: 'Feed',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ])
          : SizedBox(),
    );
  }

  void startAuthListener() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _authStateChnagesListener =
        authController.authStateStream.listen((User? fireUser) {
      if (fireUser != null) {
        //  _doIfFireAuthUserIsNotNull();
      } else {
        _notificationsStreamListener?.cancel();
        _notificationsStreamListener = null;
        appLifeCycleController.cleanAllCallbacks();
      }
    });
  }

  Widget mezWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezDescription(TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => Text("${_i18n()['appDescription']}", style: textStyle),
      ),
    );
  }

  Widget mezServiceTitle(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Obx(
        () => Text(
          "${_i18n()['services']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezListOfServices() {
    return Obx(
      () => Column(
        children: [
          ServicesCard(
            title: "${_i18n()['food']["title"]}",
            url: "assets/images/customer/foodService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {
              // getServiceRoute(
              //     orderType: OrderType.Restaurant,
              //     serviceRoute: CustRestaurantListView.navigate,
              //     singleOrderRoute: (int orderId) {
              //       ViewRestaurantOrderScreen.navigate(orderId: orderId);
              //     });
            },
          ),
          ServicesCard(
            title: "${_i18n()['laundry']["title"]}",
            subtitle: "${_i18n()['laundry']["subtitle"]}",
            url: "assets/images/customer/laundryService.png",
            onTap: () {
              // getServiceRoute(
              //     orderType: OrderType.Laundry,
              //     serviceRoute: CustLaundriesListView.navigate,
              //     singleOrderRoute: (int orderId) {
              //       CustLaundryOrderView.navigate(orderId: orderId);
              //     });
            },
          ),
          ServicesCard(
            title: "${_i18n()['courier']["title"]}",
            subtitle: "${_i18n()['courier']["subtitle"]}",
            url: "assets/images/customer/courrierService.png",
            onTap: () {
              // getServiceRoute(
              //     orderType: OrderType.Courier,
              //     serviceRoute: CustCourierServicesListView.navigate,
              //     singleOrderRoute: (int orderId) {
              //       CustCourierOrderView.navigate(orderId: orderId);
              //     });
            },
          ),
        ],
      ),
    );
  }

  // Future<void> getServiceRoute(
  //     {required OrderType orderType,
  //     required Future<void> Function() serviceRoute,
  //     required void Function(int) singleOrderRoute}) async {
  //   if (Get.find<AuthController>().fireAuthUser != null &&
  //       _orderController != null) {
  //     if (_orderController!.firstOrderIdBasedOnType(orderType) != null) {
  //       singleOrderRoute(_orderController!.firstOrderIdBasedOnType(orderType)!);
  //     } else {
  //       await serviceRoute();
  //     }
  //   } else {
  //     await serviceRoute();
  //   }
  // }

  // Future<void> _navigateToOrdersIfNecessary() async {
  //   if (_orderController != null) {
  //     await _orderController!.fetchCurrentOrders();
  //     if (_orderController!.hasOneOrder) {
  //       switch (_orderController!.hasOneOrderType) {
  //         case OrderType.Restaurant:
  //           unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
  //               ViewRestaurantOrderScreen.navigate(
  //                   orderId: _orderController!.hasOneOrderId!)));
  //           break;
  //         case OrderType.Laundry:
  //           unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
  //               CustLaundryOrderView.navigate(
  //                   orderId: _orderController!.hasOneOrderId!)));
  //           break;
  //         case OrderType.Courier:
  //           unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
  //               CustCourierOrderView.navigate(
  //                   orderId: _orderController!.hasOneOrderId!)));
  //           break;
  //         default:
  //       }
  //       // if (_orderController!.hasOneOrderType == OrderType.Restaurant) {
  //       //   // MezRouter.popEverythingAndNavigateTo(RestaurantOrderRoutes()
  //       //   //     .getRestaurantOrderRoute(_orderController!.hasOneOrderId!));
  //       //   // ignore: unawaited_futures
  //       //   MezRouter.popEverythingTillBeforeHome().then((_) =>
  //       //       ViewRestaurantOrderScreen.navigate(
  //       //           orderId: _orderController!.hasOneOrderId!));
  //       //   // } else if (_orderController!.hasOneOrderType == OrderType.Taxi) {
  //       //   //   MezRouter.popEverythingAndNavigateTo(
  //       //   //       getTaxiOrderRoute(_orderController!.hasOneOrderId!));
  //       // } else if (_orderController!.hasOneOrderType == OrderType.Laundry) {
  //       //   // ignore: unawaited_futures
  //       //   MezRouter.popEverythingTillBeforeHome().then((_) =>
  //       //       CustLaundryOrderView.navigate(
  //       //           orderId: _orderController!.hasOneOrderId!));
  //       // }
  //     } else if (_orderController!.hasManyOrders) {
  //       // ignore: unawaited_futures
  //       MezRouter.popEverythingTillBeforeHome()
  //           .then((_) => CustomerOrdersListView.navigate());
  //     }
  //   }
  // }
}
