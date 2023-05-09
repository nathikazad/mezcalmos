import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceView/AllServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/deepLinkHandler.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListView.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/UserProfileView.dart';

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

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (authController.user != null) {
          return _getBody();
        } else {
          return AllServiceView();
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
      case 2:
        return MessagesListView(
          serviceProviderType: ServiceProviderType.Customer,
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
              items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "${_i18n()['home']}"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), label: "${_i18n()['orders']}"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sms_outlined),
                      label: "${_i18n()['messages']}"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
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
