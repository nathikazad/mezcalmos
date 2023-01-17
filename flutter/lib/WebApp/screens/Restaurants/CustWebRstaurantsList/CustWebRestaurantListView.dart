import 'dart:async';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantsListView/controllers/CustRestaurantListViewController.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/CustWebRstaurantsList/components/listViewBody.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

class CustWebRestaurantListView extends StatefulWidget {
  CustWebRestaurantListView({Key? key}) : super(key: key);

  @override
  State<CustWebRestaurantListView> createState() =>
      _CustWebRestaurantListViewState();
}

class _CustWebRestaurantListViewState extends State<CustWebRestaurantListView> {
  Rx<bool> isControllerIntilized = false.obs;
  final ScrollController controller = ScrollController();
  final MezWebSideBarController mezWebSideBarController =
      MezWebSideBarController();

  CustRestaurantListViewController viewController =
      CustRestaurantListViewController();

  Future<bool> waitWhile2(Future<bool> test(),
      [Duration pollInterval = Duration.zero]) async {
    var completer = new Completer<bool>();
    check() async {
      var val = await test();
      if (val) {
        mezDbgPrint("the test is @@@@complate 😃😃😃😃😃😃😃 ${val}");
        completer.complete(true);
      } else {
        mezDbgPrint("the test is not @@@@complate 😃😃😃😃😃😃😃 ${val}");
        new Timer(pollInterval, check);
      }
    }

    check();
    return completer.future;
  }

  Future<bool> _InitillaizeAllControllers() async {
    return waitWhile2(() {
      return setupFirebase(launchMode: typeMode.toLaunchMode());
    }, Duration(milliseconds: 500))
        .then((value) {
      mezDbgPrint("🔴🔴🔴🔴🔴🔴🔴🔴 the value@@@@@@ is $value");
      return value;
    });
  }

  @override
  void initState() {
    _InitillaizeAllControllers().then((value) {
      isControllerIntilized = true.obs;
      mezDbgPrint(
          " 🧪  🧪  🧪  🧪  🧪  @22222 the isControllerIntilized just changed ${isControllerIntilized.value}  🧪  🧪  🧪  🧪 ");
      viewController.init();
      setState(() {});

      return value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    mezDbgPrint("this is just called list of restaurants 🔥");
    mezDbgPrint(
        "]]]]]]]]]] build  resturants list 🍔 test 🧪  and time 📅 ${DateTime.now().toString()}");
    mezDbgPrint(
        " 🛂🛂🛂🛂🛂🛂 the controller is intialized %} ${Get.isRegistered<AuthController>()}");
    // final AuthController _authcontroller = Get.put<AuthController>(
    //   AuthController(signInCallback, signOutCallback),
    //   permanent: true,
    // );
    final LanguageController Lcontroller = Get.find<LanguageController>();

    return Obx(
      () => (isControllerIntilized.value == true)
          ? Scaffold(
              key: mezWebSideBarController.drawerKey,
              endDrawer: mezWebSideBarController.endDrawerContent,
              drawer: mezWebSideBarController.frontDrawerContent,
              bottomNavigationBar: MezBottomBar(),
              appBar: InstallAppBarComponent(),
              body: Scaffold(
                  appBar: WebAppBarComponent(
                      mezWebSideBarController: mezWebSideBarController,
                      automaticallyGetBack: false,
                      type: Get.find<AuthController>().isUserSignedIn != false
                          ? WebAppBarType.WithCartActionButton.obs
                          : WebAppBarType.WithSignInActionButton.obs),
                  body: ListRestauBody(
                    viewController: viewController,
                  )),
            )
          : Scaffold(
              body: Center(child: MezLoaderWidget()),
            ),
    );
  }
}
