import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezImageslider.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

class CustBusinessItemAppbar extends StatelessWidget {
  const CustBusinessItemAppbar({super.key, required this.itemDetails});
  final BusinessItemDetails itemDetails;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      centerTitle: true,
      expandedHeight: 280,
      leadingWidth: 35,
      automaticallyImplyLeading: false,
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
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: !isCollapsed
                ? Text(
                    itemDetails.name.getTranslation(userLanguage),
                    style: context.textTheme.displayMedium!
                        .copyWith(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: isCollapsed ? 1.0 : 0.0,
                          // opacity: 1.0,
                          child: MezIconButton(
                            shadowColor: Colors.transparent,
                            icon: null,
                            iconColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            materialColor: Colors.transparent,
                            child: Container(
                                padding: EdgeInsets.all(5.5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Icon(
                                  Icons.favorite,
                                  size: 7.mezSp,
                                  color: Colors.white,
                                )),
                            onTap: () {},
                          )),
                      AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: isCollapsed ? 1.0 : 0.0,
                          // opacity: 1.0,
                          child: MezIconButton(
                            shadowColor: Colors.transparent,
                            icon: null,
                            iconColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            materialColor: Colors.transparent,
                            child: Container(
                                padding: EdgeInsets.all(3.75),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Icon(
                                  Icons.zoom_in,
                                  size: 9.mezSp,
                                  color: Colors.white,
                                )),
                            onTap: () {},
                          )),
                    ],
                  ),
          ),
          background: MezImageSlider(
            images: itemDetails.image ?? [],
          ),
        );
      }),
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
        // if (Get.find<AuthController>().isUserSignedIn) _ordersAppBarIcon(),
      ],
    );
  }
}
