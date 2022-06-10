import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/components/TwoCirclesAvatars.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:sizer/sizer.dart';

extension OrderCardInfoExtension on OrderInfoCardState {
  OrderInfoCardState opposit() => this == OrderInfoCardState.Maximized
      ? OrderInfoCardState.Minimized
      : OrderInfoCardState.Maximized;
}

// ignore: constant_identifier_names
enum OrderInfoCardState { Maximized, Minimized }

typedef void OnOrderInfoCardStateChange(OrderInfoCardState state);

class AnimatedOrderInfoCard extends StatelessWidget {
  final OrderInfoCardState initialCardState;
  final OnOrderInfoCardStateChange? onCardStateChange;
  // customer part (top row of animated container)
  final String customerName;
  final String customerImage;
  final List<Widget> customerTimeWidgets;
  final VoidCallback onCustomerMsgClick;
  // service provider part (bottom row)
  final String serviceProviderName;
  final String serviceProviderImage;
  final List<Widget> serviceProviderTimeWidgets;
  final VoidCallback onServiceMsgClick;

  final String formattedOrderStatus;
  final Order order;

  const AnimatedOrderInfoCard({
    required this.formattedOrderStatus,
    this.initialCardState = OrderInfoCardState.Minimized,
    this.onCardStateChange,
    required this.customerName,
    required this.customerImage,
    this.customerTimeWidgets = const <Widget>[],
    required this.onCustomerMsgClick,
    required this.serviceProviderName,
    required this.serviceProviderImage,
    this.serviceProviderTimeWidgets = const <Widget>[],
    required this.onServiceMsgClick,
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        cardHeader(),
        Divider(),
        orderCardMainBody(),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: initialCardState == OrderInfoCardState.Minimized
              ? null
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      // Stack(
                      //   clipBehavior: Clip.none,
                      //   children: [
                      //     Positioned(
                      //       top: 30,
                      //       left: 30,
                      //       child: Container(
                      //         color: Colors.yellow,
                      //         child: Row(
                      //           children: customerTimeWidgets,
                      //         ),
                      //       ),
                      //     ),
                      //     customerAnimatedRow(),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       height: 18,
                      //       width: 18,
                      //       decoration: BoxDecoration(
                      //         color: Colors.transparent,
                      //         shape: BoxShape.circle,
                      //         border: Border.all(
                      //           color: Color.fromRGBO(54, 54, 54, 1),
                      //           width: 5,
                      //         ),
                      //       ),
                      //     ),
                      //     customerAnimatedRow(),
                      //   ],
                      // ),
                      customerAnimatedRow(),

                      Row(
                        children: [
                          SizedBox(width: 8),
                          Container(
                            height: 60,
                            width: 1.5,
                            color: Color.fromRGBO(103, 121, 254, 1),
                          ),
                        ],
                      ),
                      serviceProviderAnimatedRow(),
                      // Container(
                      //   padding: EdgeInsets.only(left: 30),
                      //   child: Row(
                      //     children: serviceProviderTimeWidgets,
                      //   ),
                      // ),
                    ],
                  ),
                ),
        )
      ],
    );
  }

  // widgets
  Row cardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 64.w,
            child: Text(
              formattedOrderStatus.replaceAll('', '\u{200B}'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(103, 121, 254, 1),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "\$${order.cost}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
            InkWell(
              onTap: () {
                mezDbgPrint("log state ==> ${initialCardState.opposit()}");
                onCardStateChange?.call(initialCardState.opposit());
              },
              child: Icon(
                initialCardState == OrderInfoCardState.Minimized
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  Row serviceProviderAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on_rounded,
          size: 18,
          color: Color.fromRGBO(103, 121, 254, 1),
        ),
        SizedBox(width: 14),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceProviderName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Row(
                  children: serviceProviderTimeWidgets,
                ),
                SizedBox(width: 15),
                MessageButton(
                  withPadding: false,
                  onTap: onServiceMsgClick,
                  showRedDot: (_serviceDriverChatId() != null)
                      ? Get.find<OrderController>()
                          .hasNewMessageNotification(_serviceDriverChatId()!)
                      : false,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row customerAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromRGBO(54, 54, 54, 1),
              width: 5,
            ),
          ),
        ),
        SizedBox(width: 14),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Row(
                  children: customerTimeWidgets,
                ),
                SizedBox(width: 9),
                MessageButton(
                  withPadding: false,
                  onTap: onCustomerMsgClick,
                  showRedDot: (_customerDriverChatId() != null)
                      ? Get.find<OrderController>()
                          .hasNewMessageNotification(_customerDriverChatId()!)
                      : false,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String? _customerDriverChatId() {
    switch (order.orderType) {
      case OrderType.Laundry:
        return (order as LaundryOrder).getCustomerDriverChatId();

      case OrderType.Restaurant:
        return (order as RestaurantOrder).customerDropOffDriverChatId;

      default:
    }
    return null;
  }

  String? _serviceDriverChatId() {
    switch (order.orderType) {
      case OrderType.Laundry:
        return (order as LaundryOrder).getServiceDriverChatId();

      case OrderType.Restaurant:
        return (order as RestaurantOrder).serviceProviderDropOffDriverChatId;

      default:
    }
    return null;
  }

  Row orderCardMainBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: TwoCirclesAvatar(
            topImg: serviceProviderImage,
            // bottomImg: customerImage,
            bottomIconData: order.orderType == OrderType.Laundry
                ? Icons.local_laundry_service_outlined
                : Icons.restaurant_rounded,
          ),
        ),
        Flexible(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                orderTimeWidget(),
                SizedBox(height: 10),
                routeInformationWidget(),
              ],
            ),
          ),
        ),
        Spacer(),
        Flexible(
          child: InkWell(
            onTap: () {
              Get.toNamed<void>(
                getOrderDetailsRoute(order.orderId),
              );
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.article_rounded,
                color: Color.fromRGBO(103, 121, 254, 1),
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row orderTimeWidget() {
    return Row(
      // direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 10),
        Icon(
          Icons.access_time_filled,
          color: Color.fromRGBO(73, 73, 73, 1),
          size: 18,
        ),
        SizedBox(width: 3),
        Text(
          // 'Today, 10:53 AM',
          DateFormat('EEEE, hh:mm a').format(order.orderTime),
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Flex routeInformationWidget() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Icon(
          Icons.delivery_dining,
          color: Color.fromRGBO(73, 73, 73, 1),
          size: 18,
        ),
        SizedBox(width: 3),
        Flexible(
          child: Text(
            order.routeInformation?.duration.longTextVersion ?? '- - - -',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(width: 16.33),
        Icon(
          Icons.route_outlined,
          color: Color.fromRGBO(73, 73, 73, 1),
          size: 18,
        ),
        SizedBox(width: 3),
        Flexible(
          // flex: 2,
          child: Text(
            order.routeInformation?.distance.distanceStringInKm ?? '- - - -',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
