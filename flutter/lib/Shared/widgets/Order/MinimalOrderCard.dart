import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList']["components"]["ROpOrderCard"];

class MinimalOrderCard extends StatefulWidget {
  const MinimalOrderCard({
    Key? key,
    required this.order,
    required this.onTap,
    this.forCustomer = false,
    this.showOrderType = false,
  }) : super(key: key);

  final MinimalOrder order;
  final bool forCustomer;
  final bool showOrderType;
  final Function()? onTap;
  @override
  State<MinimalOrderCard> createState() => _MinimalOrderCardState();
}

class _MinimalOrderCardState extends State<MinimalOrderCard> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.order.title.inCaps,
                          style: Get.textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            if (widget.forCustomer &&
                                widget.order.totalCost != null)
                              Row(
                                children: <Widget>[
                                  Icon(
                                    widget.order.orderType == OrderType.Laundry
                                        ? Icons.local_laundry_service_sharp
                                        : Icons.flatware,
                                    color: blackColor,
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    widget.order.totalCost!.toPriceString(),
                                    style: Get.textTheme.titleSmall?.copyWith(
                                      color: blackColor,
                                    ),
                                  )
                                ],
                              ),
                            if (widget.forCustomer &&
                                widget.order.deliveryCost != null)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(
                                    Icons.delivery_dining,
                                    color: blackColor,
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    widget.order.deliveryCost!.toPriceString(),
                                    style: Get.textTheme.titleSmall?.copyWith(
                                      color: blackColor,
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                        if (widget.order.toAdress != null &&
                            widget.forCustomer == false)
                          Text(
                            widget.order.toAdress!.inCaps,
                            style: Get.textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.order.orderTime.toDayAmPm(),
                        style: Get.textTheme.bodyMedium?.copyWith(
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (widget.order.image != null &&
                          widget.order.image!.isURL &&
                          showImage &&
                          !widget.forCustomer)
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    right: widget.showOrderType ? 28 : 0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 26,
                                  child: CircleAvatar(
                                    radius: 23,
                                    backgroundImage: CachedNetworkImageProvider(
                                        widget.order.image!),
                                    onBackgroundImageError:
                                        (Object e, StackTrace? stk) {
                                      setState(() {
                                        showImage = false;
                                      });
                                    },
                                  ),
                                )),
                            if (widget.showOrderType)
                              Positioned(
                                right: -8,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                        radius: 23,
                                        backgroundColor: primaryBlueColor,
                                        child: Icon(
                                          widget.order.orderType.toIcon(),
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  )
                  // getOrderWidget()
                ],
              ),
              const Divider(),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (widget.order.totalCost != null)
                    Image.asset(
                      aMoney,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  if (widget.order.totalCost != null)
                    SizedBox(
                      width: 2.w,
                    ),
                  if (widget.order.totalCost != null)
                    Text(
                      widget.order.totalCost?.toPriceString() ?? "_",
                      style: Get.textTheme.bodyLarge,
                    ),
                  Spacer(),
                  getOrderWidget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getOrderWidget() {
    switch (widget.order.status) {
      case MinimalOrderStatus.Cancelled:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: cancelledBackgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["canceled"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Colors.red, fontSize: 10.sp),
          ),
        );

      case MinimalOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: deliveredBackgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["delivered"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Color(0xFF6779FE), fontSize: 10.sp),
          ),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: waitingBackgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["waiting"]}',
            style: Get.textTheme.bodyLarge
                ?.copyWith(color: Color(0xFFFF9900), fontSize: 10.sp),
          ),
        );
    }
  }
}
