import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class IncomingPositionedBottomBar extends StatelessWidget {
  // IncomingOrdersController controller = Get.find<IncomingOrdersController>();
  final LanguageController lang = Get.find<LanguageController>();
  final TaxiOrder order;

  IncomingPositionedBottomBar({required this.order});

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        left: 10,
        right: 10,
        bottom: GetStorage().read(getxGmapBottomPaddingKey) + 55,
        child: Container(
            padding: EdgeInsets.all(5.sp),
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromARGB(255, 216, 225, 249),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset(0, 7)),
                ]),
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
                  height: 35.sp,
                ),
                Expanded(
                  flex: 4, //Get.width > 320 ? 4 : 0,
                  child: Row(
                    mainAxisAlignment: Get.width > 320
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      emptyOrWidgetSmallPhones(
                        child: Transform.scale(
                            scale: 1.5.sp,
                            child: Container(
                              height: 10.sp,
                              width: 20.sp,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(money_asset),
                              )),
                            )),
                      ),
                      Text(
                        order.cost.toString(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'psb',
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 236, 236, 236),
                  width: 1.1.sp,
                  height: 35.sp,
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
                            size: 16,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            "${order.routeInformation.duration.shortTextVersion}",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'psr',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            MezcalmosIcons.route,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            order.routeInformation.distance.distanceStringInKm,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'psr',
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
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
          width: 5.sp,
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
                      fontSize: 16.sp,
                      fontFamily: 'psb',
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                  ),
                ),
                Text(
                  "${order.distanceToClient.toStringAsFixed(1)} km ${lang.strings['taxi']['incoming']["far"]}",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14.sp, fontFamily: 'psr', color: Colors.grey),
                ),
              ]),
        )
      ],
    );
  }
}
