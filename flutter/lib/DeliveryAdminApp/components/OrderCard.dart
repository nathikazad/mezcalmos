import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
    ["DriverOrderCard"];

class DeliveryOrderCard extends StatelessWidget {
  /// Order card for delivery driver used to show current or past order ,
  /// showLeftIcon shoud be false when a current order is passed to this component

  const DeliveryOrderCard({
    Key? key,
    required this.order,
    this.showLeftIcon = true,
    this.isPastOrder = false,
    this.onCardClick,
  }) : super(key: key);
  final DeliveryOrder order;
  final bool isPastOrder;
  final bool showLeftIcon;
  final Function? onCardClick;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return OrderInfosCard(
      orderCardSubWidgets: OrderCardSubWidgets(
          onCardTap: () {
            onCardClick?.call();
          },
          cardTitle: _getOrderTitle(),
          primaryBodyContent: Text(order.dropoffLocation.address),
          cardStatus: _getOrderWidget(context),
          cardTime: Text(order.orderTime.getOrderTime().inCaps),
          rightImage: _getOrderIcon()),
      order: order,
    );
  }

  Widget _getOrderIcon() {
    // if (order.orderType == OrderType.Restaurant) {
    return Container(
      height: 30.sp,
      width: 30.sp,
      // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryBlueColor,
      ),
      child: Center(
        child: Icon(
          Icons.flatware,
          size: 20.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _getOrderWidget(BuildContext context) {
    // if (order.orderType == OrderType.Restaurant) {
    switch (order.status) {
      case DeliveryOrderStatus.CancelledByCustomer:
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["cancelled"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.red),
            ),
          ),
        );
      case DeliveryOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["delivered"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.green),
            ),
          ),
        );
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["inTransit"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
            ),
          ),
        );

      case DeliveryOrderStatus.OrderReceived:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["waiting"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
            ),
          ),
        );
      // }
      default:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["waiting"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
            ),
          ),
        );
    }
  }

  String _getOrderTitle() {
    return "Delivery Order";
  }
}

class OrderInfosCard extends StatelessWidget {
  final OrderCardSubWidgets orderCardSubWidgets;
  final DeliveryOrder order;
  const OrderInfosCard(
      {required this.orderCardSubWidgets, required this.order, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: orderCardSubWidgets.onCardTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Material(
          elevation: 1.5,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            //  margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  orderCardSubWidgets.primaryHeaderContent,
                  orderCardSubWidgets.secondaryHeaderContent,
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // left column

                    Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // first line - name and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Text(
                                  orderCardSubWidgets.cardTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          orderCardSubWidgets.primaryBodyContent,
                          orderCardSubWidgets.secondaryBodyContent,
                          // second line - from
                          SizedBox(height: 5),
                        ],
                      ),
                    ),

                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          orderCardSubWidgets.cardTime,
                          orderCardSubWidgets.rightImage,
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                Container(
                  // height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 15,
                          width: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(money_asset),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Center(
                        child: Text(
                          "\$${order.totalCost.toString()}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        // height: 30,
                        child: orderCardSubWidgets.cardStatus,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCardSubWidgets {
  String cardTitle;
  Widget cardStatus;
  Widget cardTime;
  Widget rightImage;
  void Function() onCardTap;
  Widget primaryBodyContent;
  Widget secondaryBodyContent;
  Widget primaryHeaderContent;
  Widget secondaryHeaderContent;

  OrderCardSubWidgets({
    required this.onCardTap,
    required this.cardTitle,
    required this.cardStatus,
    required this.cardTime,
    required this.rightImage,
    this.primaryBodyContent = const SizedBox(),
    this.secondaryBodyContent = const SizedBox(),
    this.primaryHeaderContent = const SizedBox(),
    this.secondaryHeaderContent = const SizedBox(),
  });
}
