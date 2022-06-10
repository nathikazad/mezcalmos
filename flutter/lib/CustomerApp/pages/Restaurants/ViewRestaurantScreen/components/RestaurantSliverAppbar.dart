import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart'
    show TwoLettersGenerator;
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RestaurantSliverAppBar extends StatelessWidget {
  RestaurantSliverAppBar(
      {Key? key,
      required this.restaurant,
      required this.scrollController,
      required this.tabController,
      required this.onTap,
      required this.onInfoTap,
      required this.showInfo})
      : super(key: key);

  final Restaurant restaurant;
  final AutoScrollController scrollController;
  final TabController tabController;

  final void Function(int index) onTap;
  final void Function() onInfoTap;
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: 220,
      automaticallyImplyLeading: false,
      bottom:
          (restaurant.getCategories.length > 1 && !showInfo) ? bottom : null,
      leading: _BackButtonAppBar(),
      actions: <Widget>[
        getAppbarIconsButton(),
      ],
      pinned: true,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(
              bottom:
                  (restaurant.getCategories.length > 1 && !showInfo) ? 60 : 12),
          // centerTitle: true,
          title: Container(
            padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  // fit: FlexFit.tight,
                  child: Container(
                    // alignment: Alignment.center,
                    // padding: const EdgeInsets.only(left: 8, right: 3),
                    child: Text(
                      (showInfo) ? "Informations" : restaurant.info.name,
                      style: Get.textTheme.headline3
                          ?.copyWith(color: Colors.white, fontSize: 14.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                if (!showInfo)
                  InkWell(
                      onTap: onInfoTap,
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 14.sp,
                        color: Colors.white,
                      ))
              ],
            ),
          ),
          background: _backgroundImageComponent(),
        );
      }),
    );
  }

  Widget _backgroundImageComponent() {
    return CachedNetworkImage(
      imageUrl: restaurant.info.image,
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
            restaurant.info.name.generateTwoFirstLetters(),
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
          isScrollable: true,
          controller: tabController,
          labelColor: primaryBlueColor,
          labelStyle: Get.textTheme.bodyText1,
          unselectedLabelStyle:
              Get.textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelColor: Colors.grey.shade700,
          indicatorPadding: const EdgeInsets.all(5),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Get.theme.primaryColorLight,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              color: SecondaryLightBlueColor),
          tabs: List.generate(restaurant.getCategories.length, (int index) {
            return Tab(
              text: restaurant.getCategories[index].name?[userLanguage],
            );
          }),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _BackButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          if (showInfo) {
            onInfoTap();
          } else {
            Get.back();
          }
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: primaryBlueColor,
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
