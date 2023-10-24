// ignore_for_file: unawaited_futures

import 'dart:async';

import 'package:badges/badges.dart' as badge;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/notificationHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDealsView/CustDealsView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/CustHomeView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustProfileView/CustProfileView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:uni_links/uni_links.dart';

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
  RxList<Widget> tabs = RxList<Widget>(<Widget>[
    CustHomeView(),
    CustomerOrdersListView(asTab: true),
    CustProfileView(),
  ]);

  @override
  void initState() {
    super.initState();
    logEventToServer("Customer Wrapper init");
    if (authController.fireAuthUser != null) {
      customerAuthController = Get.find<CustomerAuthController>();
      _startListeningForNotifications();
      MezRouter.registerReturnToViewCallback(SharedRoutes.kHomeRoute, () {
        _checkOrders();
      });

      _checkOrders();

      handleInfluencerDeals();
    }
    startAuthListener();
    // DeepLinkHandler.startDynamicLinkCheckRoutine(
    //     CustomerDeepLinkHandler.handleDeepLink);

    _startListeningForLinks();
  }

  void handleInfluencerDeals() {
    customerAuthController?.getInfluencerIdForCustomer().then((value) {
      if (customerAuthController?.influencerId != null) {
        tabs.value.insert(2, CustDealsView());
        _index.value = 2;
        mezDbgPrint("Refreshing tabs ===========> 😁😁😁😁😁😁😁😁😁😁😁");
        tabs.refresh();
      }
    });
  }

  void _checkOrders() {
    if (_index.value == 0) {
      mezDbgPrint(
          "✅ ===========>CustomerWrapper Check ORders  ======>${MezRouter.bodyArguments}");
      final bool showOrders = MezRouter.backResult == true;
      if (showOrders) {
        _index.value = 1;
      }
    }
  }

  @override
  void dispose() {
    _authStateChnagesListener?.cancel();
    _authStateChnagesListener = null;
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (authController.user != null) {
          return tabs[_index.value];
        } else {
          return CustHomeView();
        }
      }),
    );
  }

  // Widget _getBody() {
  //   switch (_index.value) {
  //     case 0:
  //       return CustHomeView();
  //     case 1:
  //       return CustomerOrdersListView(
  //         asTab: true,
  //       );
  //     case 2:
  //       return CustDealsView();
  //     case 3:
  //       return CustProfileView();

  //     default:
  //       return Scaffold(
  //         body: Container(
  //           alignment: Alignment.center,
  //           child: Text("Error"),
  //         ),
  //       );
  //   }
  // }

  Widget _navBar() {
    return Obx(
      () => authController.user != null
          ? BottomNavigationBar(
              selectedLabelStyle: context.textTheme.bodyLarge,
              unselectedLabelStyle: context.textTheme.bodyMedium,
              currentIndex: _index.value,
              unselectedItemColor: pickLocationHintTextFieldColor,
              onTap: (int v) {
                _index.value = v;
              },
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                          _index.value == 0 ? Icons.home : Icons.home_outlined),
                      label: "${_i18n()['home']}"),
                  BottomNavigationBarItem(
                      icon: badge.Badge(
                          badgeColor: Colors.red,
                          badgeContent: Text(
                            numberOfCurrentOrders.value.toString(),
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          showBadge: numberOfCurrentOrders > 0,
                          child: Icon(_index.value == 1
                              ? Icons.history
                              : Icons.history_outlined)),
                      label: "${_i18n()['orders']}"),
                  if (customerAuthController?.influencerId != null)
                    BottomNavigationBarItem(
                      icon: badge.Badge(
                        badgeColor: Colors.red,
                        position: badge.BadgePosition(top: 0, end: 0),
                        child: Icon(_index.value == 2
                            ? Icons.discount
                            : Icons.discount_outlined),
                      ),
                      label: "${_i18n()['deals']}",
                    ),
                  BottomNavigationBarItem(
                      icon: Icon(_index.value == 3
                          ? Icons.person
                          : Icons.person_outline),
                      label: "${_i18n()['profile']}"),
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
        _startListeningForNotifications();
      } else {
        _notificationsStreamListener?.cancel();
        _notificationsStreamListener = null;
        appLifeCycleController.cleanAllCallbacks();
      }
    });
  }

  Future<void> _startListeningForNotifications() async {
    _notificationsStreamListener = initializeShowNotificationsListener();
    final String? userId = Get.find<AuthController>().fireAuthUser!.uid;
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            customerNotificationsNode(userId!), customerNotificationHandler);
  }

  Future<void> _startListeningForLinks() async {
    mezDbgPrint("startListeningForLinks");
    String? initialLink;
    try {
      initialLink = await getInitialLink();
    } catch (error) {
      // Handle error
    }
    // Parse the initial link (if it exists)
    if (initialLink != null) {
      CustomerLinkHandler.handleLink(Uri.parse(initialLink));
    }

    // Subscribe to incoming links
    if (kIsWeb == false) {
      linkStream.listen((String? link) {
        // Parse the link
        if (link != null) {
          CustomerLinkHandler.handleLink(Uri.parse(link));
        }
      });
    }
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
        children: <Widget>[
          ServicesCard(
            title: "${_i18n()['food']["title"]}",
            url: "assets/images/customer/foodService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {},
          ),
          ServicesCard(
            title: "${_i18n()['laundry']["title"]}",
            subtitle: "${_i18n()['laundry']["subtitle"]}",
            url: "assets/images/customer/laundryService.png",
            onTap: () {},
          ),
          ServicesCard(
            title: "${_i18n()['courier']["title"]}",
            subtitle: "${_i18n()['courier']["subtitle"]}",
            url: "assets/images/customer/courrierService.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
