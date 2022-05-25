import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
        ["Orders"]["IncomingOrders"]["IncomingViewScreen"]["components"]
    ["IPositionedBottomBar"];

class IncomingPositionedBottomBar extends StatelessWidget {
  final TaxiOrder order;

  IncomingPositionedBottomBar({required this.order});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: (GetStorage().read(getxGmapBottomPaddingKey) + 55) as double,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 7, //Get.width > 320 ? 7 : 0,
                child: avatarAndDistanceToClient(context)),
            Container(
              color: Color.fromARGB(255, 236, 236, 236),
              width: 1.1.sp,
              height: 35,
            ),
            Expanded(
              flex: 4, //Get.width > 320 ? 4 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  emptyOrWidgetSmallPhones(
                    child: Transform.scale(
                      scale: 1.5.sp,
                      child: Container(
                        height: 10.sp,
                        width: 10.sp,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(money_asset),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " \$${order.cost.toString()}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 236, 236, 236),
              width: 1.1.sp,
              height: 35,
            ),
            SizedBox(
              width: 5.sp,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MezcalmosIcons.stopwatch,
                        size: 10,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${order.routeInformation!.duration.shortTextVersion}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MezcalmosIcons.route,
                        size: 10,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        order.routeInformation!.distance.distanceStringInKm,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget avatarAndDistanceToClient(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          // radius: 30.0,
          child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: mLoadImage(
                  url: order.customer.image,
                  assetInCaseFailed: aDefaultAvatar,
                  fit: BoxFit.cover,
                  height: getSizeRelativeToScreen(
                      100, context.height, context.width),
                  width: getSizeRelativeToScreen(
                      100, context.height, context.width))),
          backgroundColor:
              Colors.grey.shade100, //Color.fromARGB(255, 222, 222, 222),
          // radius: 1,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.sp,
                  child: Text(
                    order.customer.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                ),
                Text(
                  "${order.distanceToClient.toStringAsFixed(1)} km ${_i18n()["far"]}",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
              ]),
        )
      ],
    );
  }
}

class CurrentTaxiOrderPositionedBottomBar extends StatelessWidget {
  final TaxiOrder order;

  const CurrentTaxiOrderPositionedBottomBar({required this.order});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: (GetStorage().read(getxGmapBottomPaddingKey) + 55) as double,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 216, 225, 249),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 6, //Get.width > 320 ? 7 : 0,
                child: avatarAndDistanceToClient(context)),
            Container(
              color: Color.fromARGB(255, 236, 236, 236),
              width: 1.1.sp,
              height: 35,
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " \$${order.cost.toString()}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 236, 236, 236),
              width: 1.1.sp,
              height: 35,
            ),
            SizedBox(
              width: 5.sp,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MezcalmosIcons.stopwatch,
                        size: 10,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${order.routeInformation!.duration.shortTextVersion}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MezcalmosIcons.route,
                        size: 10,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        order.routeInformation!.distance.distanceStringInKm,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 236, 236, 236),
              width: 1.1.sp,
              height: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed<void>(
                    getMessagesRoute(
                        chatId: order.orderId,
                        orderId: order.orderId,
                        recipientType: ParticipantType.Customer),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.textsms_sharp,
                            // color: Color.fromARGB(255, 103, 121, 254),
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        Get.find<OrderController>().hasNewMessageNotification()
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget avatarAndDistanceToClient(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          // radius: 30.0,
          child: ClipOval(
            clipBehavior: Clip.antiAlias,
            child: mLoadImage(
              url: order.customer.image,
              assetInCaseFailed: aDefaultAvatar,
              fit: BoxFit.cover,
              height:
                  getSizeRelativeToScreen(100, context.height, context.width),
              width:
                  getSizeRelativeToScreen(100, context.height, context.width),
            ),
          ),
          backgroundColor:
              Colors.grey.shade100, //Color.fromARGB(255, 222, 222, 222),
          // radius: 1,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.sp,
                  child: Text(
                    order.customer.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                ),
                Text(
                  "${order.distanceToClient.toStringAsFixed(1)} km ${_i18n()["far"]}",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
              ]),
        )
      ],
    );
  }
}
