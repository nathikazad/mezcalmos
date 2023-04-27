import 'package:badges/badges.dart' as badge;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustBusinessViewAppbar extends StatelessWidget {
  const CustBusinessViewAppbar({super.key, required this.viewController});
  final CustBusinessViewController viewController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      centerTitle: true,
      expandedHeight: 280,
      leadingWidth: 35,
      automaticallyImplyLeading: false,
      bottom: _tabbar(),
      leading: _BackButtonAppBar(),
      actions: <Widget>[
        getAppbarIconsButton(),
      ],
      pinned: true,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        bool isCollapsed = constraints.biggest.height -
                (MediaQuery.of(context).padding.top + kToolbarHeight + 100) >=
            0.0;

        return FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.only(bottom: kToolbarHeight + 5),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: isCollapsed ? 1.0 : 0.0,
                  // opacity: 1.0,
                  child: MezIconButton(
                    icon: Icons.favorite_border,
                    iconSize: 16.sp,
                    iconColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    materialColor: Colors.transparent,
                    onTap: () {},
                  )),
              //  Spacer(),
              Text(
                viewController.business!.details.name,
                style:
                    context.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
              SizedBox(width: 23.sp),
              // Spacer(),
            ],
          ),
          background: _backgroundImageComponent(),
        );
      }),
    );
  }

  PreferredSize _tabbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kTextTabBarHeight),
      child: Container(
        color: Colors.white,
        child: TabBar(
            padding: EdgeInsets.zero,
            indicatorColor: primaryBlueColor,
            indicatorPadding: EdgeInsets.zero,
            controller: viewController.tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.store_outlined),
              ),
              Tab(
                icon: Icon(Icons.info_outline),
              ),
            ]),
      ),
    );
  }

  Widget _backgroundImageComponent() {
    return CachedNetworkImage(
      imageUrl: viewController.business!.details.image,
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
            viewController.business!.details.name.generateTwoFirstLetters(),
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

  Widget _BackButtonAppBar() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: InkWell(
          onTap: () {
            MezRouter.back();
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
}
