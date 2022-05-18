import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
        Obx(
          () => (Get.find<ForegroundNotificationsController>()
                  .notifications
                  .isNotEmpty)
              ? _notificationAppBarIcon()
              : Container(),
        ),
        _ordersAppBarIcon(),
      ],
      pinned: true,
      //  floating: true,

      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double top = constraints.constrainHeight();
        final double collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 60;
        // WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        //   onCollapsed(collapsedHight != top);
        // });

        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(
              bottom:
                  (restaurant.getCategories.length > 1 && !showInfo) ? 60 : 12),
          // centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                restaurant.info.name,
                style: Get.textTheme.headline3
                    ?.copyWith(color: Colors.white, fontSize: 14.sp),
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
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: Get.theme.primaryColorLight,
          indicatorWeight: 3,
          labelColor: Colors.black,
          tabs: restaurant.getCategories.map((Category e) {
            return Tab(text: e.name?[userLanguage] ?? "");
          }).toList(),
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
            color: customerAppColor,
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 8),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kOrdersRoute);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.watch_later,
            size: 20,
            color: customerAppColor,
          ),
        ),
      ),
    );
  }

  Widget _notificationAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kNotificationsRoute);
        },
        child: Badge(
          badgeColor: Colors.red,
          showBadge: true,
          position: BadgePosition.topEnd(top: 10, end: 0),
          child: Ink(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.notifications,
              color: customerAppColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
