import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/customerHomeFooterButtons.dart';
import 'package:mezcalmos/CustomerApp/components/servicesCard.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/NotificationsDisplayer.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper>
    with WidgetsBindingObserver {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  OrderController _orderController = Get.find<OrderController>();
  LanguageController lang = Get.find<LanguageController>();
  SideMenuDrawerController _sideMenuDrawerController =
      Get.find<SideMenuDrawerController>();
  AuthController auth = Get.find<AuthController>();

  DateTime? appClosedTime;

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  RxInt numberOfCurrentOrders = RxInt(0);
  StreamSubscription? _orderCountListener;
  @override
  void initState() {
    if (auth.fireAuthUser != null) {
      WidgetsBinding.instance!.addObserver(this);
      _orderCountListener = _orderController.currentOrders.stream.listen((_) {
        numberOfCurrentOrders.value = _orderController.currentOrders.length;
      });
      String? userId = Get.find<AuthController>().fireAuthUser!.uid;
      // listening for notification Permissions!
      _notificationsStreamListener = initializeShowNotificationsListener();
      listenForLocationPermissions();
      Get.find<ForegroundNotificationsController>()
          .startListeningForNotificationsFromFirebase(
              notificationsNode(userId), customerNotificationHandler);
      Future.microtask(() {
        // Fix to Input Focus problems ( we had it in build which gets re-executed after any input focus) !
        navigateToOrdersIfNecessary(_orderController.currentOrders);
      });
    } else {
      Get.put(RestaurantController());
    }
    super.initState();
  }

  @override
  void dispose() {
    _orderCountListener?.cancel();
    _orderCountListener = null;
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<SettingsController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (appClosedTime != null &&
          DateTime.now().difference(appClosedTime!) > Duration(seconds: 10) &&
          Get.currentRoute != kLocationPermissionPage) {
        if (_orderController != null) {
          navigateToOrdersIfNecessary(_orderController.currentOrders);
        }
      }
    } else if (state == AppLifecycleState.paused) {
      appClosedTime = DateTime.now();
    }
  }

  // when app resumes check if there are current orders and if yes navigate to orders page
  void navigateToOrdersIfNecessary(List<Order> currentOrders) {
    mezDbgPrint("navigateToOrdersIfNecessary");

    if (currentOrders.length == 1) {
      // Restaurant
      if (currentOrders[0].orderType == OrderType.Restaurant)
        popEverythingAndNavigateTo(
            getRestaurantOrderRoute(currentOrders[0].orderId));
      // Taxi
      else if (currentOrders[0].orderType == OrderType.Taxi) {
        popEverythingAndNavigateTo(getTaxiOrderRoute(currentOrders[0].orderId));
      }
    } else if (currentOrders.length > 1) {
      popEverythingAndNavigateTo(kOrdersRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    responsiveSize(context);
    // mezDbgPrint("CustomWrapper Build callabck");
    // Navigate to current orders if any after build

// @mont #comment
// needs more organization, each component should be one line
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: _sideMenuDrawerController.getNewKey(),
          drawer: MezSideMenu(),
          appBar: CustomerAppBar(
            autoBack: false,
            myLeading: Icon(Icons.apps),
            onLeadingTaped: () {
              _sideMenuDrawerController.openMenu();
            },
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  //================================Welcome to MEZCALMOS 👋===================
                  mezWellcomeContainer(txt.headline1!),
                  //============================== description=============================
                  mezDescription(txt.subtitle1!.copyWith(fontSize: 14)),
                  SizedBox(
                    height: 10,
                  ),
                  //============================Service title===================================
                  mezServiceTitle(txt.headline1!),

                  //========================= list of services ===========================
                  mezListOfServices(),

                  HomeFooterButtons(),
                ]),
              ),
            ),
          ),
        ));
  }

  Widget mezWellcomeContainer(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Obx(
        () => Text(
          "${lang.strings['customer']['home']['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezDescription(TextStyle textStyle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Obx(
        () => Text("${lang.strings['customer']['home']['appDescription']}",
            style: textStyle),
      ),
    );
  }

  Widget mezServiceTitle(TextStyle textStyle) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${lang.strings['customer']['home']['services']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezListOfServices() {
    return Column(
      children: [
        //====================Taxi===================
        Obx(
          () => ServicesCard(
            title: "${lang.strings['customer']['home']['taxi']["title"]}",
            url: "assets/images/taxiService.png",
            subtitle: "${lang.strings['customer']['home']['taxi']["subtitle"]}",
            ontap: () {
              num noOfCurrentTaxiOrders = _orderController.currentOrders
                  .where((currentOrder) =>
                      currentOrder.orderType == OrderType.Taxi)
                  .length;
              if (noOfCurrentTaxiOrders == 0) {
                Get.toNamed(kTaxiRequestRoute);
              } else {
                String orderId = _orderController.currentOrders
                    .firstWhere((currentOrder) =>
                        currentOrder.orderType == OrderType.Taxi)
                    .orderId;
                Get.toNamed(getTaxiOrderRoute(orderId));
              }
            },
          ),
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        //==================Food====================
        Obx(
          () => ServicesCard(
            title: "${lang.strings['customer']['home']['food']["title"]}",
            url: "assets/images/restaurantService.png",
            subtitle: "${lang.strings['customer']['home']['food']["subtitle"]}",
            ontap: () {
              Get.toNamed(kRestaurantsRoute);
            },
          ),
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        //==================Laundry=================
        Obx(
          () => ServicesCard(
            title: "${lang.strings['customer']['home']['laundry']["title"]}",
            url: "assets/images/laundryService.png",
          ),
        ),
      ],
    );
  }
}
