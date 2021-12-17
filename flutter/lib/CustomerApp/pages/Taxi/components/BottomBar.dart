import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/Themes/styles/textStyleTheme.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/ResponsiveUtilities.dart';
import 'package:mezcalmos/Shared/utilities/ImageUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';

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
  OrderController controller = Get.find<OrderController>();
  double _bottomPadding = GetStorage().read(getxGmapBottomPaddingKey) + 15;

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Positioned(
        bottom: _bottomPadding,
        left: 15,
        right: 15,
        child: Container(
            margin: EdgeInsets.only(bottom: _bottomPadding),
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
                  children: buildBottomBatByStatus(widget.taxiRequest.status),
                ))));
  }

  Widget messageBtn() {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(getCustomerMessagesRoute(
            controller.hasOrderOfType(typeToCheck: OrderType.Taxi)!.orderId));
      },
      child: Container(
        margin: EdgeInsets.only(left: 6),
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
                      controller.hasNewMessageNotification(
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
        onTap: () async => await showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: Text(lang.strings?['taxi']?['cancelOrder']
                        ?['confirmation_header'] ??
                    "Por favor confirmar"),
                content: Text(lang.strings?['taxi']?['cancelOrder']
                        ?['confirmation_text'] ??
                    "¿Cancelar el viaje actual?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.find<TaxiController>().cancelTaxi(controller
                            .hasOrderOfType(typeToCheck: OrderType.Taxi)!
                            .orderId);
                      },
                      child: Text(
                          lang.strings?['taxi']?['taxiView']?['yes'] ?? 'Si')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                          lang.strings?['taxi']?['taxiView']?['no'] ?? 'No'))
                ],
              );
            }),
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

  Widget buildMsgAndCancelBtn() {
    return Expanded(
        flex: 1,
        child: Row(
          children: [messageBtn(), Spacer(), cancelBtn()],
        ));
  }

  Widget taxiAvatarAndPrice({String? description}) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              // radius: 30.0,
              child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: mLoadImage(
                      url: widget.taxiRequest.driverInfo!.image,
                      assetInCaseFailed: aDefaultAvatar,
                      fit: BoxFit.cover,
                      height: getSizeRelativeToScreen(
                          100, context.height, context.width),
                      width: getSizeRelativeToScreen(
                          100, context.height, context.width))),
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
                    width: 100.sp,
                    child: Text(
                      widget.taxiRequest.driverInfo!.name,
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
            child: Text(widget.taxiRequest.estimatedPrice.toString() + "\$",
                softWrap: false,
                style: textStyleTheme.headline2?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15))));
  }

  Widget verticalSeparator() {
    return VerticalDivider(width: 1, color: Colors.grey.shade300);
  }

  Widget rightRouteInfos() {
    setState(() {});
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(MezcalmosIcons.route,
                  size:
                      getSizeRelativeToScreen(32, Get.width.w, Get.height.h).w),
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
              Icon(MezcalmosIcons.stopwatch,
                  size:
                      getSizeRelativeToScreen(32, Get.width.w, Get.height.h).w),
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

  List<Widget> buildBottomBatByStatus(TaxiOrdersStatus? status) {
    List<Widget> _widgies = [];
    switch (status) {
      case null:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos()
        ]);
        _bottomPadding = GetStorage().read(getxGmapBottomPaddingKey) + 15;
        break;
      case TaxiOrdersStatus.LookingForTaxi:
        _widgies.assignAll([
          incrementDecrementPrice(),
          Expanded(flex: 1, child: verticalSeparator()),
          rightRouteInfos()
        ]);
        _bottomPadding = GetStorage().read(getxGmapBottomPaddingKey) + 15;
        break;

      case TaxiOrdersStatus.DroppedOff:
        _widgies.assignAll([
          taxiAvatarAndPrice(description: "Ride finished :)"),
          verticalSeparator(),
          rideCost(),
          verticalSeparator(),
          messageBtn()
        ]);
        _bottomPadding = 10;

        break;

      case TaxiOrdersStatus.Expired:
        _widgies.assignAll([
          Center(
            child: Text(
              "Ride Expired :(",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 14.sp, fontFamily: 'psr', color: Colors.grey),
            ),
          )
        ]);
        _bottomPadding = 10;
        break;

      case TaxiOrdersStatus.CancelledByTaxi:
        _widgies.assignAll([
          taxiAvatarAndPrice(description: "Ride Canceled by Taxi :("),
          verticalSeparator(),
          rideCost(),
          verticalSeparator(),
          messageBtn()
        ]);
        _bottomPadding = 10;
        break;

      case TaxiOrdersStatus.CancelledByCustomer:
        _widgies.assignAll([
          Center(
            child: Text(
              "Ride Canceled :(",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 14.sp, fontFamily: 'psr', color: Colors.grey),
            ),
          )
        ]);
        _bottomPadding = 10;
        break;

      default:
        _widgies.assignAll([
          taxiAvatarAndPrice(),
          verticalSeparator(),
          rideCost(),
          verticalSeparator(),
          buildMsgAndCancelBtn()
        ]);
        _bottomPadding = 10;
    }

    return _widgies;
  }
}
