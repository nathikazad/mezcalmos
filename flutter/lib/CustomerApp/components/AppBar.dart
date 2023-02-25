import 'package:badges/badges.dart' as bage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/CustomerApp/router/ordersRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

class CustomerAppBar extends GetWidget<AuthController>
    implements PreferredSizeWidget {
  final String? title;
  final bool? autoBack;
  final AppBarLeftButtonType leftBtnType;
  bool showPastOrders;

  CustomerAppBar(
      {Key? key,
      this.title,
      this.autoBack = false,
      this.showPastOrders = true,
      this.leftBtnType = AppBarLeftButtonType.Back})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 20,
      title: (title != null)
          ? FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title!,
                style: Get.textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: 180,
              child: FittedBox(
                child: MezcalmosSharedWidgets.fillTitle(
                    actionLength: 2,
                    showLogo: (Get.width > 320) ? true : false),
              ),
            ),
      automaticallyImplyLeading: autoBack ?? false,
      leading: (leftBtnType == AppBarLeftButtonType.Menu)
          ? _MenuButtonAppBar()
          : _BackButtonAppBar(),
      actions: [getAppbarIconsButton()],
      centerTitle: true,
    );
  }

  Widget _BackButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          MezRouter.back();
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 127, 255),
              Color.fromARGB(255, 198, 90, 252),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _MenuButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          //  MezRouter.back();
          Get.find<SideMenuDrawerController>().openMenu();
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 127, 255),
              Color.fromARGB(255, 198, 90, 252),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 33,
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          MezRouter.toNamed(OrdersRoutes.customerOrder);
        },
        child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryLightBlueColor,
          ),
          child: Icon(
            Icons.watch_later,
            size: 20,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _noUserButton() {
    return Container(
      // padding: const EdgeInsets.only(left: 3, right: 16),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          MezRouter.toNamed(SharedRoutes.kSignInRouteOptional);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryLightBlueColor,
          ),
          child: Icon(
            Icons.person,
            size: 20,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _notificationAppBarIcon() {
    return Obx(() {
      if (Get.find<ForegroundNotificationsController>().notifications.length >
          0) {
        return Padding(
          padding: const EdgeInsets.only(right: 3),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              MezRouter.toNamed(SharedRoutes.kNotificationsRoute);
            },
            child: bage.Badge(
              badgeColor: Colors.red,
              showBadge: true,
              position: bage.BadgePosition.topEnd(top: 0, end: 0),
              child: Ink(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryLightBlueColor,
                ),
                child: Icon(
                  Icons.notifications,
                  color: primaryBlueColor,
                  size: 20,
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget getAppbarIconsButton() {
    mezDbgPrint(
        "👋👋👋👋👋 No user icon state =======>>>>>> ${Get.find<AuthController>().isUserSignedIn}");
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 5,
          ),
          if (controller.user == null) _noUserButton(),
          if (controller.user != null) _notificationAppBarIcon(),
          if (controller.user != null && showPastOrders) _ordersAppBarIcon(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
