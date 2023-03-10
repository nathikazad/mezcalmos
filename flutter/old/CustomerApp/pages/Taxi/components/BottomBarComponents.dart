import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/old/customerApp/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["BottomBarComponents"];

//final OrderController orderController = Get.find<OrderController>();

Widget verticalSeparator() {
  return VerticalDivider(width: 1, color: Colors.grey.shade300);
}

Widget rideCost(String estimatedPrice) {
  return Expanded(
    flex: 1,
    child: Center(
      child: Text(
        "\$" + estimatedPrice,
        softWrap: false,
        style: TextStyle(
            fontFamily: "psr",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13.5.sp),
      ),
    ),
  );
}

Widget rightRouteInfos(TaxiRequest taxiRequest) {
  // setState(() {});
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              MezcalmosIcons.route,
              size: (Get.height * 0.015).sp,
            ),
            SizedBox(width: 2.w),
            Text(taxiRequest.routeInformation?.distance.distanceStringInKm ??
                "-"),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              MezcalmosIcons.stopwatch,
              size: (Get.height * 0.015).sp,
            ),
            SizedBox(width: 2.w),
            Text(taxiRequest.routeInformation?.duration.longTextVersion ?? "-"),
          ],
        ),
      ],
    ),
  );
}

Widget avatarWithTitleAndDesc({
  required BuildContext pContext,
  required TaxiOrder? order,
  String? description,
  String? title,
  String? asset,
  String? imgUrl,
  bool isCanelIcon = false,
  List<Color>? avatarGradient,
  Widget? avatarChild,
}) {
  return Flexible(
    flex: 3,
    fit: FlexFit.tight,
    child: Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 14.sp,

            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: isCanelIcon
                  ? Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: avatarGradient == null
                            ? null
                            : Color.fromRGBO(255, 235, 236, 1),
                        gradient: avatarGradient != null
                            ? LinearGradient(
                                colors: avatarGradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                      ),
                      child: Center(
                        child: avatarChild ??
                            Icon(
                              Icons.close_rounded,
                              color: Color.fromRGBO(252, 89, 99, 1),
                              // size: 13,
                            ),
                      ),
                    )
                  : mLoadImage(
                      url: imgUrl ?? order?.serviceProvider?.image,
                      assetInCaseFailed: asset ?? aDefaultAvatar,
                      fit: BoxFit.cover,
                      height: getSizeRelativeToScreen(
                          100, pContext.height, pContext.width),
                      width: getSizeRelativeToScreen(
                        100,
                        pContext.height,
                        pContext.width,
                      ),
                    ),
            ),
            backgroundColor:
                Colors.grey.shade100, //Color.fromARGB(255, 222, 222, 222),
          ),
          SizedBox(width: 5.sp),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: description != null
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    title ?? order?.status.toFirebaseFormatString() ?? "-",
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
                description != null
                    ? Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(54, 54, 54, 1),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget messageBtn({required Rxn<TaxiOrder> order, EdgeInsets? margin}) {
  return Obx(
    () => GestureDetector(
      onTap: () {
        BaseMessagingScreen.navigate(
          chatId: order.value!.orderId,
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
              // orderController.hasNewMessageNotification(order.value!.orderId)
              //     ? Positioned(
              //         top: 0,
              //         right: 0,
              //         child: Container(
              //           height: 10,
              //           width: 10,
              //           decoration: BoxDecoration(
              //             color: Colors.red,
              //             shape: BoxShape.circle,
              //             border: Border.all(color: Colors.white),
              //           ),
              //         ),
              //       )
              //     : SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget cancelBtn(TaxiOrder order, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 6),
    child: GestureDetector(
      onTap: () {
        showConfirmationDialog(context, onYesClick: () async {
          final ServerResponse resp =
              await Get.find<TaxiController>().cancelTaxi(order.orderId);

          if (!resp.success) {
            MezSnackbar("Oops", _i18n()['serverCommunicationError'],
                position: SnackPosition.TOP);
          }
        });
        MezRouter.closeDialog()

      },
      child: Container(
        height: 33,
        width: 33,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 235, 236, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Icon(
            Icons.close,
            color: Color.fromRGBO(252, 89, 99, 1),
          ),
        ),
      ),
    ),
  );
}

Widget buildMsgAndCancelBtn(Rxn<TaxiOrder> order, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      messageBtn(order: order),
      SizedBox(
        width: 5,
      ),
      cancelBtn(order.value!, context)
    ],
  );
}
