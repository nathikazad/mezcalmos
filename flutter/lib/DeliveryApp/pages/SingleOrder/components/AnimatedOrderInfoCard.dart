import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/OrderDetailsScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/TwoCirclesAvatars.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["AnimatedOrderInfoCard"];

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
  bool showMsgIconInOneLine;
  bool isCustomerRowFirst;

  // customer part (top row of animated container)
  final String customerName;
  final String customerImage;
  final Widget customerTimeWidget;
  final VoidCallback onCustomerMsgClick;

  // service provider part (bottom row)
  final String serviceProviderName;
  final String serviceProviderImage;
  final Widget serviceProviderTimeWidget;
  final VoidCallback onServiceMsgClick;

  final String formattedOrderStatus;
  final String? subtitle;
  final String? secondSubtitle;
  final DeliveryOrder order;
  final bool enableExpand;

  AnimatedOrderInfoCard({
    required this.formattedOrderStatus,
    this.showMsgIconInOneLine = false,
    this.isCustomerRowFirst = true,
    this.subtitle,
    this.secondSubtitle,
    this.initialCardState = OrderInfoCardState.Minimized,
    this.onCardStateChange,
    this.enableExpand = true,
    required this.customerName,
    required this.customerImage,
    required this.customerTimeWidget,
    required this.onCustomerMsgClick,
    required this.serviceProviderName,
    required this.serviceProviderImage,
    required this.serviceProviderTimeWidget,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Column(
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
                                Container(
                                  height: 60,
                                  width: 1.5,
                                  color: Color.fromRGBO(103, 121, 254, 1),
                                ),
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 22,
                                  color: Color.fromRGBO(103, 121, 254, 1),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: isCustomerRowFirst
                                  ? mainAnimatedContainerItems
                                  : mainAnimatedContainerItems.reversed
                                      .toList(),
                            )
                          ],
                        ),
                      ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
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
                if (subtitle != null) Text(subtitle!),
                if (secondSubtitle != null)
                  Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(secondSubtitle!)),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "\$${order.packageCost}",
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
                if (enableExpand) {
                  mezDbgPrint("log state ==> ${initialCardState.opposit()}");
                  onCardStateChange?.call(initialCardState.opposit());
                }
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

  List<Widget> get mainAnimatedContainerItems => <Widget>[
        _customerAnimatedRow(),
        SizedBox(
          height: showMsgIconInOneLine ? 50 : 20,
        ),
        _serviceProviderAnimatedRow(),
      ];

  Row _serviceProviderAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  serviceProviderName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            if (!showMsgIconInOneLine)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: serviceProviderTimeWidget,
              )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        // todo fix obx @m66are
        MessageButton(
          withPadding: false,
          onTap: onServiceMsgClick,
          chatId: order.chatWithServiceProviderId!,
        ),
      ],
    );
  }

  Row _customerAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    customerName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            if (!showMsgIconInOneLine)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: customerTimeWidget,
              )
          ],
        ),
        SizedBox(width: 15),
        MessageButton(
          withPadding: false,
          onTap: onCustomerMsgClick,
          chatId: order.chatWithCustomerId,
        ),
      ],
    );
  }

  Row orderCardMainBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 1,
          child: TwoCirclesAvatar(
            topImg: serviceProviderImage,
            // bottomImg: customerImage,
            bottomIconData:
                order.serviceProviderType == ServiceProviderType.Laundry
                    ? Icons.local_laundry_service_outlined
                    : Icons.restaurant_rounded,
          ),
        ),
        Flexible(
          flex: 9,
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
        InkWell(
          onTap: () {
            OrderDetailsScreen.navigate(orderId: order.id);
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
          DateFormat('EE, hh:mm a').format(order.orderTime.toLocal()),
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
    return Row(
      // direction: Axis.horizontal,
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
            order.routeInformation?.duration.inMinutesText() ?? '- - - -',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.route_outlined,
          color: Color.fromRGBO(73, 73, 73, 1),
          size: 18,
        ),
        SizedBox(width: 3),
        Flexible(
          child: Text(
            order.routeInformation?.distance.toKmText() ?? '- - - -',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.payments,
          color: Color.fromRGBO(73, 73, 73, 1),
          size: 18,
        ),
        SizedBox(width: 3),
        Flexible(
          child: Text(
            " ${_i18n()["${order.paymentType.toNormalString().toLowerCase()}"]}",
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
