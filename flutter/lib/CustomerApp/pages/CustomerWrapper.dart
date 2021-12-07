import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/NotificationsDisplayer.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
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
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
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
    _notificationsStreamListener = initializeShowNotificationsListener();
    // listening for notification Permissions!
    listenForLocationPermissions();
    Get.find<FBNotificationsController>()
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
      if (currentOrders[0].orderType == OrderType.Restaurant)
        popEverythingAndNavigateTo(
            getRestaurantOrderRoute(currentOrders[0].orderId));
      else
        mezDbgPrint("Navigate to other order type");
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
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.07,
                ),
                //================================Welcome to MEZCALMOS 👋===================
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Welcome to MEZCALMOS 👋",
                    style: txt.headline1,
                    textAlign: TextAlign.left,
                  ),
                ),
                //============================== description=============================
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text(
                    "Your one stop palce to find all your needed local services and where you can enjoy fast and hight quality services.",
                    style: txt.subtitle1!.copyWith(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //============================Services===================================
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${lang.strings['customer']['home']['services']}",
                    style: txt.headline1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //====================Taxi===================
                ServicesCard(
                  title: "${lang.strings['customer']['home']['taxi']}",
                  url: "assets/images/taxiService.png",
                  subtitle:
                      "Get the nearest taxi arrount and get your destinatiion asap .",
                  ontap: () => Get.toNamed(kTaxisRoute),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //==================Food====================
                ServicesCard(
                  title: "${lang.strings['customer']['home']['food']}",
                  url: "assets/images/restaurantService.png",
                  subtitle:
                      "Get the nearest taxi arrount and get your destinatiion asap .",
                  ontap: () {
                    Get.toNamed(kRestaurantsRoute);
                  },
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //==================Laundry=================
                ServicesCard(
                  title: "Laundry",
                  url: "assets/images/laundryService.png",
                ),
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  child: Center(
                    child: InkWell(
                      child: Text("need help ? Conatct our support team"),
                      onTap: () {
                        mezDbgPrint("conatct our support team");
                      },
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color:
            subtitle != null ? Colors.white : Color.fromRGBO(82, 82, 82, 0.03),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100.h,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
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
                        style: txt.headline1!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 37.sp),
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
                              style: txt.subtitle1!.copyWith(fontSize: 13.7.sp),
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
        onTap: ontap,
      ),
    );
  }
}
