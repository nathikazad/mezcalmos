import 'package:badges/badges.dart' as badge;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["RestaurantSliverAppBar"];
//

class RestaurantSliverAppBar extends StatelessWidget {
  const RestaurantSliverAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CustomerRestaurantController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverAppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.4,
        centerTitle: true,
        expandedHeight: 270,
        leadingWidth: 35,
        automaticallyImplyLeading: false,
        bottom: getBottom(context),
        leading: _BackButtonAppBar(),
        actions: <Widget>[
          getAppbarIconsButton(),
        ],
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.6,
          titlePadding: EdgeInsets.only(bottom: _getBottomPadding()),
          centerTitle: true,
          collapseMode: CollapseMode.pin,
          title: Container(
            alignment: Alignment.bottomCenter,
            width: 55.w,
            padding: EdgeInsets.only(
                bottom: controller.showInfo.isTrue ? 5 : 12, left: 5, right: 5),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      //  margin: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        (controller.showInfo.value)
                            ? "${_i18n()["info"]}"
                            : controller.restaurant.value!.info.name,
                        style: context.txt.displaySmall
                            ?.copyWith(color: Colors.white, fontSize: 14.mezSp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (!controller.showInfo.value)
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 2),
                      child: InkWell(
                          onTap: controller.onInfoTap,
                          child: Icon(
                            Icons.info_outline_rounded,
                            size: 15.sp,
                            color: Colors.white,
                          )),
                    )
                ],
              ),
            ),
          ),
          background: _backgroundImageComponent(),
        ),
      ),
    );
  }

  PreferredSizeWidget? getBottom(BuildContext context) {
    if (controller.isInitialzed == false) {
      return PreferredSize(
        preferredSize: Size.fromHeight(15),
        child: LinearProgressIndicator(color: primaryBlueColor),
      );
    } else if (controller.showInfo.isFalse) {
      return bottomFilters(context);
    }
    return null;
  }

  Widget _backgroundImageComponent() {
    return CachedNetworkImage(
      imageUrl: controller.restaurant.value!.info.image,
      fit: BoxFit.cover,
      imageBuilder: (BuildContext context, ImageProvider<Object> image) =>
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withOpacity(0.8),
              const Color(0x00000000).withOpacity(0.1),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
      placeholder: (_, __) {
        return Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
          ),
          highlightColor: Colors.grey[400]!,
          enabled: true,
          //   period: Duration(milliseconds: 100),
          baseColor: Colors.grey[300]!,
          direction: ShimmerDirection.ltr,
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          height: 63,
          width: 63,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            controller.restaurant.value!.info.name.generateTwoFirstLetters(),
            style: const TextStyle(
              color: Color.fromRGBO(172, 89, 252, 0.8),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget bottomFilters(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Theme(
        data: Get.theme.copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: [
            if (controller.showSpecials) _mainMenuTabs(context),
            _menuFilterChips(userLanguage, context),
          ],
        ),
      ),
    );
  }

  Widget _menuFilterChips(LanguageType userLanguage, BuildContext context) {
    return Container(
      width: double.infinity,
      color: Get.theme.scaffoldBackgroundColor,
      padding: EdgeInsets.only(bottom: 7),
      child: Obx(
        () {
          if (controller.showMenuTabs || controller.showSpecialTabs) {
            return TabBar(
              padding: EdgeInsets.only(left: 6, top: 7),
              isScrollable: true,
              controller: controller.getTabController,
              labelColor: primaryBlueColor,
              labelStyle: context.txt.bodyLarge,
              unselectedLabelStyle: context.txt.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              unselectedLabelColor: Colors.grey.shade700,
              indicatorPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                shape: BoxShape.rectangle,
                color: secondaryLightBlueColor,
              ),
              tabs: (controller.showSpecialTabs)
                  ? List.generate(controller.getGroupedSpecials().length,
                      (int index) {
                      return Tab(
                        text: controller
                            .getGroupedSpecials()
                            .keys
                            .toList()[index]
                            .toDayName()
                            .inCaps,
                      );
                    })
                  : (controller.showMenuTabs)
                      ? List.generate(
                          controller.restaurant.value!.getAvailableCategories
                              .length, (int index) {
                          return Tab(
                            text: controller
                                    .restaurant
                                    .value!
                                    .getAvailableCategories[index]
                                    .name?[userLanguage]
                                    ?.inCaps ??
                                "",
                          );
                        })
                      : [],
              onTap: controller.animateAndScrollTo,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget _mainMenuTabs(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        color: Colors.white,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Container(
                // shape: RoundedRectangleBorder(),
                // elevation: 0,
                child: InkWell(
                  onTap: () {
                    controller.mainTab.value = RestaurantViewTab.Menu;
                    controller.assignKeys();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: controller.isOnMenuView
                            ? Border(
                                bottom: BorderSide(
                                  color: primaryBlueColor,
                                  width: 2,
                                ),
                              )
                            : null),
                    alignment: Alignment.center,
                    child: Text(
                      '${_i18n()["menu"]}',
                      style: controller.isOnMenuView
                          ? context.txt.headlineMedium?.copyWith(
                              color: primaryBlueColor,
                            )
                          : context.txt.titleSmall,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                // shape: RoundedRectangleBorder(),
                // elevation: 0,
                child: InkWell(
                  onTap: () {
                    controller.mainTab.value = RestaurantViewTab.Specials;
                    controller.assignKeys();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: controller.isOnSpecialView
                            ? Border(
                                bottom: BorderSide(
                                    color: primaryBlueColor, width: 2))
                            : null),
                    child: Text(
                      '${_i18n()["specials"]}',
                      style: controller.isOnSpecialView
                          ? context.txt.headlineMedium?.copyWith(
                              color: primaryBlueColor,
                            )
                          : context.txt.titleSmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _BackButtonAppBar() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: InkWell(
          onTap: () {
            if (controller.showInfo.isTrue) {
              controller.onInfoTap();
            } else {
              MezRouter.back();
            }
          },
          child: Ink(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: primaryBlueColor,
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          MezRouter.toNamed(CustomerRoutes.customerOrdersRoute);
        },
        child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
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
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 16),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          SignInView.navigateAtOrderTime();
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
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
          padding: const EdgeInsets.only(left: 3, right: 7),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              MezRouter.toNamed(SharedRoutes.kNotificationsRoute);
            },
            child: badge.Badge(
              badgeColor: Colors.red,
              showBadge: true,
              position: badge.BadgePosition.topEnd(top: 0, end: 0),
              child: Ink(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
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
    return Row(
      children: [
        if (!Get.find<AuthController>().isUserSignedIn) _noUserButton(),
        if (Get.find<AuthController>().isUserSignedIn)
          _notificationAppBarIcon(),
        if (Get.find<AuthController>().isUserSignedIn) _ordersAppBarIcon(),
      ],
    );
  }

  double _getBottomPadding() {
    double pad = 12;
    if (controller.showSpecials) {
      pad = 60;
    }
    if (controller.showMenuTabs || controller.showSpecialTabs) {
      pad = pad + 50;
    }
    if (controller.showInfo.isTrue) {
      pad = 12;
    }

    return pad;
  }
}
