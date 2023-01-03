import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/routes/AuthRoutes.dart';
import 'package:mezcalmos/WebApp/screens/notificationScreen/notificationPopUpWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/widgets/mezOverly.dart';

import 'package:qlevar_router/qlevar_router.dart';

enum WebAppBarType {
  Normal,
  WithSignInActionButton,
  WithCartActionButton,
  DontShowMenu
}

class WebAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  WebAppBarComponent(
      {Key? key,
      required this.type,
      this.automaticallyGetBack = false,
      this.notifsRouteCallback,
      this.leadingFunction})
      : super(key: key);

  final Rx<WebAppBarType> type;
  Function? leadingFunction;
  final bool? automaticallyGetBack;
  Function? notifsRouteCallback;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("this is the type of appBar $type");
    return LayoutBuilder(builder: (context, constraints) {
      // ,ake this an app bar widget
      if (MezCalmosResizer.isDesktop(context) ||
          MezCalmosResizer.isSmallDesktop(context) ||
          MezCalmosResizer.isTablet(context) ||
          MezCalmosResizer.isSmallTablet(context)) {
        return AppBarWedgetForDesktop(
          type: type,
          automaticallyGetBack: automaticallyGetBack,
          leadingFunction: leadingFunction,
          notifsRouteCallback: notifsRouteCallback,
        );
      } else {
        return AppbarWidgetForMobile(
          type: type,
          automaticallyGetBack: automaticallyGetBack,
          leadingFunction: leadingFunction,
          notifsRouteCallback: notifsRouteCallback,
        );
      }
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class AppbarWidgetForMobile extends StatefulWidget {
  AppbarWidgetForMobile(
      {Key? key,
      required this.type,
      this.automaticallyGetBack,
      this.leadingFunction,
      this.notifsRouteCallback})
      : super(key: key);

  final Rx<WebAppBarType> type;

  Function? leadingFunction;
  final bool? automaticallyGetBack;
  Function? notifsRouteCallback;

  @override
  State<AppbarWidgetForMobile> createState() => _AppbarWidgetForMobileState();
}

class _AppbarWidgetForMobileState extends State<AppbarWidgetForMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.white,
      padding: EdgeInsets.only(
          right: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

              // padding: EdgeInsets.all(10),
              child: widget.automaticallyGetBack == true
                  ? Container(
                      // margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          //border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            QR.back();
                          },
                          child: Container(
                              width: 40,
                              height: kToolbarHeight - 10,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Color.fromRGBO(103, 121, 254, 1),
                                ),
                              )),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    )),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (Get.find<FirbaseAuthController>().fireAuthUser?.uid !=
                            null &&
                        widget.type.value != WebAppBarType.DontShowMenu)
                      Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.find<MezWebSideBarController>()
                                  .openWebDrawer();
                              mezDbgPrint(
                                  "😆😆😆😆😆😆😆😆😆😆 this is a test for the drawre");
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                            )),
                      ),
                    SizedBox(
                      width:
                          Get.find<FirbaseAuthController>().fireAuthUser?.uid !=
                                  null
                              ? null
                              : MezCalmosResizer.getWepPageHorizontalPadding(
                                  context),
                    ),
                    Image.asset(
                      logo,
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          //fontFamily: 'psr',
                          color: Colors.black,
                          fontSize: 20,
                        )),
                        children: <TextSpan>[
                          TextSpan(
                            text: "MEZ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "CALMOS",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 103, 122, 253),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ...actionWidgetsBuilder(type: widget.type.value)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> actionWidgetsBuilder({required WebAppBarType type}) {
    TextStyle txt = GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(103, 121, 254, 1));

    List<Widget> myWidgets = [];
    mezDbgPrint("=========================>" + type.toString());

    switch (type) {
      case WebAppBarType.WithCartActionButton:
        mezDbgPrint("web appBar with  cart button");
        myWidgets = <Widget>[
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  QR.to("/notifications");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(225, 228, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Badge(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromRGBO(103, 121, 254, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  mezDbgPrint("this one has been clicked ");
                  QR.to("/cart");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(225, 228, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Badge(
                      showBadge: false,
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color.fromRGBO(103, 121, 254, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ];
        break;
      case WebAppBarType.WithSignInActionButton:
        mezDbgPrint("web appBar type with sign in button ");
        myWidgets = <Widget>[
          InkWell(
            onTap: (() {
              QR.to("/signIn");
            }),
            child: Container(
              child: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Color.fromRGBO(225, 228, 255, 1),
              ),
            ),
          )
        ];
        break;
      case WebAppBarType.Normal:
        myWidgets = [];
        break;
      default:
    }
    return myWidgets;
  }
}

class AppBarWedgetForDesktop extends StatefulWidget {
  AppBarWedgetForDesktop(
      {Key? key,
      required this.type,
      this.automaticallyGetBack,
      this.notifsRouteCallback,
      this.leadingFunction})
      : super(key: key);
  final Rx<WebAppBarType> type;
  Function? leadingFunction;
  final bool? automaticallyGetBack;
  Function? notifsRouteCallback;

  @override
  State<AppBarWedgetForDesktop> createState() => _AppBarWedgetForDesktopState();
}

class _AppBarWedgetForDesktopState extends State<AppBarWedgetForDesktop>
    with OverlayStateMixin {
  final MezWebSideBarController drawerController =
      Get.find<MezWebSideBarController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.white,
      padding: EdgeInsets.only(
          right: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MezCalmosResizer.getWepPageHorizontalPadding(context) - 10,
              // padding: EdgeInsets.all(10),
              child: widget.automaticallyGetBack == true
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          //border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            QR.back();
                            // Navigator.of(context).pop();
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.arrow_back,
                                color: Color.fromRGBO(103, 121, 254, 1),
                              )),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    )),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (Get.find<FirbaseAuthController>().fireAuthUser?.uid !=
                        null)
                      Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 5),
                        child: IconButton(
                            onPressed: () {
                              //  widget.leadingFunction!.call();
                              // Scaffold.of(context).openDrawer();

                              drawerController.openWebDrawer();
                              mezDbgPrint(
                                  "😆😆😆😆😆😆😆😆😆😆 this is a test for the drawre");
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                            )),
                      ),
                    Image.asset(
                      logo,
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          //fontFamily: 'psr',
                          color: Colors.black,
                          fontSize: 25,
                        )),
                        children: <TextSpan>[
                          TextSpan(
                            text: "MEZ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "CALMOS",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 103, 122, 253),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ...actionWidgetsBuilder(type: widget.type.value)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> actionWidgetsBuilder({required WebAppBarType type}) {
    TextStyle txt = GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(103, 121, 254, 1));

    List<Widget> myWidgets = [];
    mezDbgPrint("=========================>" + type.toString());

    switch (type) {
      case WebAppBarType.WithCartActionButton:
        mezDbgPrint("web appBar with  cart button");
        myWidgets = <Widget>[
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  // widget.notifsRouteCallback?.call();

                  toggleOverlay(Container(
                    margin: EdgeInsets.only(top: 1.5 * kToolbarHeight),
                    height: Get.height * 0.8,
                    width: Get.width * 0.4,
                    child: NotificationPopUpWidget(
                      overlayController: controller,
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(225, 228, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Badge(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromRGBO(103, 121, 254, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              ActionButton(
                func: () {
                  drawerController.openWebEndDrawer();
                },
                titleWidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Obx(
                      () => Text(
                        "Cart${Get.find<RestaurantController>().cart.value.cartItems.length > 0 ? " (${Get.find<RestaurantController>().cart.value.cartItems.length})" : ""}",
                        style: txt.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                bgColor: Color.fromRGBO(103, 121, 254, 1),
              ),
            ],
          ),
        ];
        break;
      case WebAppBarType.WithSignInActionButton:
        mezDbgPrint("web appBar type with sign in button ");
        myWidgets = <Widget>[
          ActionButton(
            func: () {
              QR.toName(AuthRoutes.signInScreen);
            },
            titleWidget: Text(
              "Log in",
              style: txt,
            ),
            bgColor: Color.fromRGBO(225, 228, 255, 1),
          ),
        ];
        break;
      case WebAppBarType.Normal:
        myWidgets = [];
        break;
      default:
    }
    return myWidgets;
  }
}

class ActionButton extends StatelessWidget {
  ActionButton(
      {Key? key, required this.titleWidget, this.bgColor, required this.func})
      : super(key: key);
  final Widget titleWidget;
  final Function func;
  Color? bgColor = Color.fromRGBO(103, 121, 254, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func.call();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: bgColor!),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: Center(child: titleWidget),
      ),
    );
  }
}
