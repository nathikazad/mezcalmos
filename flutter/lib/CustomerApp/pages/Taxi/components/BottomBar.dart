import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

// @SAAD - TODO : REFACTORE THIS.
class BottomBar extends StatefulWidget {
  TaxiRequest taxiRequest;

  BottomBar({required this.taxiRequest});
  @override
  State<BottomBar> createState() {
    return _BottomBarState();
  }
}

class _BottomBarState extends State<BottomBar> {
  LanguageController lang = Get.find<LanguageController>();
  RxDouble _bottomPadding =
      ((GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0).obs;

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Obx(
      () => Positioned(
          bottom: _bottomPadding.value,
          left: 15,
          right: 15,
          child: Container(
              margin: EdgeInsets.only(bottom: 45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(81, 132, 255, 1),
                  Color.fromRGBO(206, 73, 252, 1)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Container(
                  height: getSizeRelativeToScreen(25, Get.height, Get.width),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                        buildBottomBatByStatus(widget.taxiRequest, context),
                  )))),
    );
  }

  Widget messageBtn({EdgeInsets? margin}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(getTaxiMessagesRoute(widget.taxiRequest.orderId!));
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
              widget.taxiRequest.orderId != null &&
                      Get.find<OrderController>().hasNewMessageNotification(
                          widget.taxiRequest.orderId!)
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

  Widget cancelBtn() {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: GestureDetector(
        onTap: () async {
          YesNoDialogButton res = await yesNoDialog(
              text: lang.strings?['taxi']?['cancelOrder']
                      ?['confirmation_header'] ??
                  "Por favor confirmar",
              body: lang.strings?['taxi']?['cancelOrder']
                      ?['confirmation_text'] ??
                  "¿Cancelar el viaje actual?");

          if (res == YesNoDialogButton.Yes) {
            ServerResponse resp = await Get.find<TaxiController>()
                .cancelTaxi(widget.taxiRequest.orderId!);

            if (!resp.success) {
              MezSnackbar("Oops", "Failed to communicate with the server :(.",
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

  Widget reCreateOrderBtn() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          popEverythingAndNavigateTo(kTaxiRequestRoute,
              args: widget.taxiRequest.reCreate());
        },
        child: Container(
          height: getSizeRelativeToScreen(16, Get.height, Get.width),
          width: getSizeRelativeToScreen(16, Get.height, Get.width),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Icon(
              Icons.replay_circle_filled_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMsgAndCancelBtn() {
    return Expanded(
        flex: 1,
        child: Row(
          children: [messageBtn(), Spacer(), cancelBtn()],
        ));
  }

  Widget taxiAvatarAndName(
      {required BuildContext pContext,
      String? description,
      String? name,
      String? asset}) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18.0.sp,
              child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: mLoadImage(
                      url: widget.taxiRequest.driverInfo?.image,
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
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: description != null
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Container(
                    width: name == null ? 100.sp : null,
                    child: Text(
                      name ?? widget.taxiRequest.driverInfo?.name ?? "Taxi",
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
          ],
        ),
      ),
    );
  }

  Widget rideCost() {
    return Expanded(
        flex: 1,
        child: Center(
            child: Text("\$" + widget.taxiRequest.estimatedPrice.toString(),
                softWrap: false,
                style: TextStyle(
                    fontFamily: "psr",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15))));
  }

  Widget verticalSeparator() {
    return VerticalDivider(width: 1, color: Colors.grey.shade300);
  }

  Widget rightRouteInfos() {
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
              Text(widget.taxiRequest.routeInformation?.distance
                      .distanceStringInKm ??
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
              Text(widget
                      .taxiRequest.routeInformation?.duration.longTextVersion ??
                  "-"),
            ],
          ),
        ],
      ),
    );
  }

  Widget incrementDecrementPrice() {
    TaxiController taxiController = Get.put<TaxiController>(TaxiController());
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (widget.taxiRequest.status == null) {
                  widget.taxiRequest.decrementPrice();
                  setState(() {});
                } else {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.taxiRequest.estimatedPrice - 5);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Icon(
                  Icons.remove,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              widget.taxiRequest.estimatedPrice.toString(),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'psb', fontSize: 20),
            ),
            InkWell(
              onTap: () {
                if (widget.taxiRequest.status == null) {
                  widget.taxiRequest.incrementPrice();
                  setState(() {});
                } else {
                  Order? order = Get.find<OrderController>()
                      .hasOrderOfType(typeToCheck: OrderType.Taxi);
                  if (order != null) {
                    taxiController.updateRideCost(
                        orderId: order.orderId,
                        cost: widget.taxiRequest.estimatedPrice + 5);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1)),
                child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildBottomBatByStatus(
      TaxiRequest? taxiRequest, BuildContext pContext) {
    List<Widget> _widgies = [];
    switch (taxiRequest?.status) {
      case null:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos()
        ]);
        _bottomPadding.value =
            (GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0;
        break;
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos()
        ]);
        _bottomPadding.value =
            (GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0;
        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll([
          taxiAvatarAndName(
              description: "Ride finished :)", pContext: pContext),
          verticalSeparator(),
          rideCost(),
          verticalSeparator(),
          messageBtn(margin: EdgeInsets.symmetric(horizontal: 6))
        ]);
        _bottomPadding.value = 10.0;

        break;

      case TaxiOrdersStatus.Expired:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s Ride.",
              description: "Your ride has been expired :("),
          reCreateOrderBtn()
        ]);
        _bottomPadding.value = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext, description: "Ride Canceled by Taxi :("),
          messageBtn(margin: EdgeInsets.symmetric(horizontal: 6)),
          reCreateOrderBtn(),
        ]);
        _bottomPadding.value = 10.0;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll([
          taxiAvatarAndName(
              pContext: pContext,
              asset: taxi_driver_marker_asset,
              name:
                  "${Get.find<AuthController>().fireAuthUser!.displayName}'s Ride.",
              description: "You have canceled your ride :("),
          reCreateOrderBtn()
        ]);
        _bottomPadding.value = 10.0;
        break;

      default:
        _widgies.assignAll([
          taxiAvatarAndName(
            pContext: pContext,
          ),
          verticalSeparator(),
          rideCost(),
          verticalSeparator(),
          buildMsgAndCancelBtn()
        ]);
        _bottomPadding.value = 10.0;
    }
    return _widgies;
  }
}

class ResendButton extends StatelessWidget {
  ResendButton({Key? key, required this.function}) : super(key: key);
  final GestureTapCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        height: 40,
        child: Center(
            child: Text(
          "Resend",
          style: TextStyle(color: Colors.white),
        )),
      ),
      onTap: function,
    );
  }
}
