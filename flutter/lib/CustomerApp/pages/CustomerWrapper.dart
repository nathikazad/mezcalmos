import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
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

  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  // MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();
  SideMenuDrawerController _sideMenuDrawerController =
      Get.find<SideMenuDrawerController>();
  OrderController _orderController = Get.find<OrderController>();
  RxInt numberOfCurrentOrders = RxInt(0);
  DateTime? appClosedTime;
  StreamSubscription? _orderCountListener;
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _orderCountListener = _orderController.currentOrders.stream.listen((_) {
      numberOfCurrentOrders.value = _orderController.currentOrders.length;
    });
    String userId = Get.find<AuthController>().fireAuthUser!.uid;
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
        navigateToOrdersIfNecessary(_orderController.currentOrders);
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
            userMenu: false,
            myLeading: Icon(Icons.apps),
            onLeadingTaped: () {
              _sideMenuDrawerController.openMenu();
            },
            title: null,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  //================================Welcome to MEZCALMOS 👋===================

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(8),
                    child: Obx(
                      () => Text(
                        "${lang.strings['customer']['home']['welcomeText']}",
                        style: txt.headline1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  //============================== description=============================
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Obx(
                      () => Text(
                        "${lang.strings['customer']['home']['appDescription']}",
                        style: txt.bodyText2,
                      ),
                    ),
                  ),

                  //============================Services===================================
                  Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => Text(
                        "${lang.strings['customer']['home']['services']}",
                        style: txt.headline1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  //====================Taxi===================
                  Obx(
                    () => ServicesCard(
                      title:
                          "${lang.strings['customer']['home']['taxi']["title"]}",
                      url: "assets/images/taxiService.png",
                      subtitle:
                          "${lang.strings['customer']['home']['taxi']["subtitle"]}",
                      ontap: () {
                        Order? _temp = _orderController.hasOrderOfType(
                            typeToCheck: OrderType.Taxi);
                        if (_temp != null) {
                          popEverythingAndNavigateTo(
                              getTaxiOrderRoute(_temp.orderId));
                        } else {
                          Get.toNamed(kTaxiRequestRoute);
                        }
                      },
                    ),
                  ),
                  //==================Food====================
                  Obx(
                    () => ServicesCard(
                      title:
                          "${lang.strings['customer']['home']['food']["title"]}",
                      url: "assets/images/restaurantService.png",
                      subtitle:
                          "${lang.strings['customer']['home']['food']["subtitle"]}",
                      ontap: () {
                        Get.toNamed(kRestaurantsRoute);
                      },
                    ),
                  ),

                  //==================Laundry=================
                  Obx(
                    () => ServicesCard(
                      title:
                          "${lang.strings['customer']['home']['laundry']["title"]}",
                      url: "assets/images/laundryService.png",
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  HomeFooterButtons(),
                ]),
              ),
            ),
          ),
        ));
  }
}

class HomeFooterButtons extends StatelessWidget {
  HomeFooterButtons({
    Key? key,
  }) : super(key: key);
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Obx(
      () => Column(
        children: [
          InkWell(
            onTap: () {
              lang.changeUserLanguage();
            },
            child: Ink(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 31.sp,
                    width: 31.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(lang.oppositFlag))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(lang.oppositToLang, style: txt.bodyText1),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async => await launch(tPrivacyPolicy),
            child: Ink(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.lock_closed,
                    // color: Theme.of(context).primaryColorLight,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    lang.strings['shared']['navDrawer']["legal"],
                    style: txt.bodyText1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesCard extends StatelessWidget {
  ServicesCard(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.url,
      this.ontap})
      : super(key: key);
  final String title;
  final String? subtitle;
  final String url;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(8),
      color: subtitle != null ? Colors.white : Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.7 - 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //================= title=============
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${title}",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: txt.headline1!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 35.sp),
                        ),
                      ),
                      //================ subtitle============
                      Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            subtitle == null ? EdgeInsets.only(left: 10) : null,
                        child: subtitle != null
                            ? Text(
                                "${subtitle}",
                                style:
                                    txt.subtitle1!.copyWith(fontSize: 13.7.sp),
                              )
                            : Text(
                                "Comming soon ...",
                                style: txt.subtitle1!.copyWith(
                                    fontSize: 13.7.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Image.asset(
                      url,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
