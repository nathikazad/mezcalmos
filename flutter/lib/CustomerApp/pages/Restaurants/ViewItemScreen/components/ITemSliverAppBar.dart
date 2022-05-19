import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:shimmer/shimmer.dart';

class ItemSliverAppBar extends StatelessWidget {
  const ItemSliverAppBar({Key? key, required this.item}) : super(key: key);
  final Item item;
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: (item.image != null) ? 220 : 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      leading: _BackButtonAppBar(),
      actions: <Widget>[
        getAppbarIconsButton(),
      ],
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(12),
        // collapseMode: CollapseMode.parallax,
        centerTitle: true,
        title: Text(
          item.name[userLanguage]!,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
        background: (item.image != null)
            ? CachedNetworkImage(
                imageUrl: item.image!,
                fit: BoxFit.cover,
                imageBuilder:
                    (BuildContext context, ImageProvider<Object> image) =>
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
                        Colors.black.withOpacity(0.7),
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
              )
            : null,
      ),
    );
  }

  Widget _BackButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          Get.back();
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
    return Obx(() {
      if (Get.find<ForegroundNotificationsController>().notifications.length >
          0) {
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
      } else {
        return Container();
      }
    });
  }

  Widget _noUserButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kSignInRouteOptional);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightCustomerAppColor,
          ),
          child: Icon(
            Icons.person,
            size: 20,
            color: customerAppColor,
          ),
        ),
      ),
    );
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
