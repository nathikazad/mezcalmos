import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/Controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["RestaurantSliverAppBar"];
//

class NewRestaurantAppBar extends StatelessWidget {
  const NewRestaurantAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CustomerRestaurantController controller;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0.4,
        centerTitle: true,
        expandedHeight: 220,
        leadingWidth: 35,
        automaticallyImplyLeading: false,
        bottom: controller.showCategoriesChips ? bottom : null,
        leading: _BackButtonAppBar(),
        actions: <Widget>[
          getAppbarIconsButton(),
        ],
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.6,
          titlePadding:
              EdgeInsets.only(bottom: controller.showCategoriesChips ? 60 : 12),
          centerTitle: true,
          title: Container(
            alignment: Alignment.bottomCenter,
            width: 55.w,
            padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
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
                        style: Get.textTheme.headline3
                            ?.copyWith(color: Colors.white, fontSize: 14.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (!controller.showInfo.value)
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 0),
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
        ));
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

  PreferredSizeWidget? get bottom {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.only(
          top: 8,
        ),
        padding: const EdgeInsets.all(4),
        child: TabBar(
          isScrollable: (controller.showSpecials) ? false : true,
          controller: (controller.showSpecials)
              ? controller.mainTabsController
              : controller.categoriesTabsController,
          labelColor: primaryBlueColor,
          labelStyle: Get.textTheme.bodyText1,
          unselectedLabelStyle: Get.textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.w500, color: Colors.grey.shade800),
          unselectedLabelColor: Colors.grey.shade700,
          indicatorPadding: const EdgeInsets.all(5),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Get.theme.primaryColorLight,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              shape: BoxShape.rectangle,
              color: secondaryLightBlueColor),
          tabs: (controller.showSpecials)
              ? [
                  Tab(
                    text: "Items",
                  ),
                  Tab(
                    text: "Specials",
                  ),
                ]
              : List.generate(controller.restaurant.value!.getCategories.length,
                  (int index) {
                  return Tab(
                    text: controller.restaurant.value!.getCategories[index]
                        .name?[userLanguage],
                  );
                }),
          //  onTap: onTap,
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
              Get.back();
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
          Get.toNamed(kOrdersRoute);
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
          Get.toNamed(kSignInRouteOptional);
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
              Get.toNamed(kNotificationsRoute);
            },
            child: Badge(
              badgeColor: Colors.red,
              showBadge: true,
              position: BadgePosition.topEnd(top: 0, end: 0),
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
    return Obx(() {
      return Row(
        children: [
          if (!Get.find<AuthController>().isUserSignedIn) _noUserButton(),
          if (Get.find<AuthController>().isUserSignedIn)
            _notificationAppBarIcon(),
          if (Get.find<AuthController>().isUserSignedIn) _ordersAppBarIcon(),
        ],
      );
    });
  }
}
