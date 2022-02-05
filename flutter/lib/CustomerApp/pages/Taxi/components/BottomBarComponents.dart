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
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

Widget verticalSeparator() {
  return VerticalDivider(width: 1, color: Colors.grey.shade300);
}

Widget rideCost(String estimatedPrice) {
  return Expanded(
      flex: 1,
      child: Center(
          child: Text("\$" + estimatedPrice,
              softWrap: false,
              style: TextStyle(
                  fontFamily: "psr",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15))));
}

Widget rightRouteInfos(TaxiRequest taxiRequest) {
  // setState(() {});
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              MezcalmosIcons.route,
              size: (Get.height * 0.015).sp,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(taxiRequest.routeInformation?.distance.distanceStringInKm ??
                "-"),
          ],
        ),
        Row(
          children: [
            Icon(
              MezcalmosIcons.stopwatch,
              size: (Get.height * 0.015).sp,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(taxiRequest.routeInformation?.duration.longTextVersion ?? "-"),
          ],
        ),
      ],
    ),
  );
}

Widget taxiAvatarAndName(
    {required BuildContext pContext,
    required TaxiOrder? order,
    String? description,
    String? name,
    String? asset}) {
  return Flexible(
    flex: 3,
    fit: FlexFit.tight,
    child: Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18.sp,
            child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: mLoadImage(
                    url: order?.serviceProvider?.image,
                    assetInCaseFailed: asset ?? aDefaultAvatar,
                    fit: BoxFit.cover,
                    height: getSizeRelativeToScreen(
                        100, pContext.height, pContext.width),
                    width: getSizeRelativeToScreen(
                        100, pContext.height, pContext.width))),
            backgroundColor:
                Colors.grey.shade100, //Color.fromARGB(255, 222, 222, 222),
          ),
          SizedBox(
            width: 5.sp,
          ),
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: description != null
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Container(
                    //  width: name == null ? 100.sp : null,
                    child: Text(
                      name ?? order?.serviceProvider?.name ?? "Taxi",
                      style: TextStyle(
                        fontSize: 16.sp,
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
                              fontSize: 14.sp,
                              fontFamily: 'psr',
                              color: Colors.grey),
                        )
                      : SizedBox(),
                ]),
          ),
        ],
      ),
    ),
  );
}

Widget messageBtn({required TaxiOrder order, EdgeInsets? margin}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(getTaxiMessagesRoute(order.orderId));
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
          children: [
            Get.find<OrderController>().hasNewMessageNotification(order.orderId)
                ? Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      height: 6,
                      width: 6,
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
  );
}

Widget cancelBtn(TaxiOrder order) {
  LanguageController lang = Get.find<LanguageController>();
  return Container(
    margin: EdgeInsets.only(right: 6),
    child: GestureDetector(
      onTap: () async {
        YesNoDialogButton res = await yesNoDialog(
            text: lang.strings?['taxi']?['cancelOrder']
                    ?['confirmation_header'] ??
                "Por favor confirmar",
            body: lang.strings?['taxi']?['cancelOrder']?['confirmation_text'] ??
                "¿Cancelar el viaje actual?");

        if (res == YesNoDialogButton.Yes) {
          ServerResponse resp =
              await Get.find<TaxiController>().cancelTaxi(order.orderId);

          if (!resp.success) {
            MezSnackbar("Oops",
                lang.strings['shared']['snackbars']['serverCommunicationError'],
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

Widget buildMsgAndCancelBtn(TaxiOrder order) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      messageBtn(order: order),
      SizedBox(
        width: 5,
      ),
      cancelBtn(order)
    ],
  );
}
