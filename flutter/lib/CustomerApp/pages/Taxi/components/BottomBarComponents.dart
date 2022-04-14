import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["BottomBarComponents"];

final OrderController orderController = Get.find<OrderController>();

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

Widget taxiAvatarAndName({
  required BuildContext pContext,
  required TaxiOrder? order,
  String? description,
  String? name,
  String? asset,
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
              child: mLoadImage(
                url: order?.serviceProvider?.image,
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
                  //  width: name == null ? 100.sp : null,
                  child: Text(
                    name ?? order?.serviceProvider?.name ?? "Taxi",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'psb',
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
                            fontSize: 10.sp,
                            fontFamily: 'psr',
                            color: Colors.grey),
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

Widget messageBtn({required Rxn<TaxiOrder>  order, EdgeInsets? margin}) {
  return Obx(
    ()=> GestureDetector(
      onTap: () {
        Get.toNamed<void>(
          getTaxiMessagesRoute(order.value!.orderId),
        );
      },
      child: Container(
        margin: margin ?? EdgeInsets.only(left: 6),
        height: getSizeRelativeToScreen(16, Get.height, Get.width),
        width: getSizeRelativeToScreen(16, Get.height, Get.width),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 232, 239, 254),
          borderRadius: BorderRadius.circular(4),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2))
          ],
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
             orderController.hasNewMessageNotification(order.value!.orderId)
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ))
                    : SizedBox(),
              
              Center(
                child: Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 103, 121, 254),
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget cancelBtn(TaxiOrder order) {
  return Container(
    margin: EdgeInsets.only(right: 6),
    child: GestureDetector(
      onTap: () async {
        final YesNoDialogButton res = await yesNoDialog(
            text: _i18n()?['confirmation_header'] ?? "Por favor confirmar",
            body:
                _i18n()?['confirmation_text'] ?? "¿Cancelar el viaje actual?");

        if (res == YesNoDialogButton.Yes) {
          final ServerResponse resp =
              await Get.find<TaxiController>().cancelTaxi(order.orderId);

          if (!resp.success) {
            MezSnackbar("Oops", _i18n()['serverCommunicationError'],
                position: SnackPosition.TOP);
          }
          // no need for else here , because we are handling UI changes already upon CanceledbyCustomer.
        }
      },
      child: Container(
        height: getSizeRelativeToScreen(16, Get.height, Get.width),
        width: getSizeRelativeToScreen(16, Get.height, Get.width),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 177, 179),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Icon(
            MezcalmosIcons.times_circle,
            color: Color.fromARGB(255, 255, 0, 8),
            size: 16,
          ),
        ),
      ),
    ),
  );
}

Widget buildMsgAndCancelBtn(Rxn<TaxiOrder> order) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      messageBtn(order: order),
      SizedBox(
        width: 5,
      ),
      cancelBtn(order.value!)
    ],
  );
}
