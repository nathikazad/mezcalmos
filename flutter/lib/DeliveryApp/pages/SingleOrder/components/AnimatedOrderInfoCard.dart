import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/DvOrderDetailsView.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/TwoCirclesAvatars.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["AnimatedOrderInfoCard"];

extension OrderCardInfoExtension on OrderInfoCardState {
  OrderInfoCardState opposit() => this == OrderInfoCardState.Maximized
      ? OrderInfoCardState.Minimized
      : OrderInfoCardState.Maximized;
}

enum OrderInfoCardState { Maximized, Minimized }

typedef void OnOrderInfoCardStateChange(OrderInfoCardState state);

class AnimatedOrderInfoCard extends StatelessWidget {
  final OrderInfoCardState initialCardState;
  final OnOrderInfoCardStateChange? onCardStateChange;
  bool isCustomerRowFirst;

  final String customerName;
  final String customerImage;
  final Widget customerTimeWidget;
  final VoidCallback onCustomerMsgClick;

  final String serviceProviderName;
  final String serviceProviderImage;
  final Widget serviceProviderTimeWidget;
  final VoidCallback onServiceMsgClick;

  final String formattedOrderStatus;
  final String? subtitle;
  final String? secondSubtitle;
  final DeliveryOrder order;
  final bool enableExpand;
  final DvOrderViewcontroller viewController;

  AnimatedOrderInfoCard({
    required this.formattedOrderStatus,
    required this.viewController,
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
        if (order.routeInformation != null) routeInformationWidget(),
        Divider(),
        orderCardMainBody(context),
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
                                if (order.pickupLocation != null)
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
                                if (order.pickupLocation != null)
                                  Container(
                                    height: 50,
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
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: isCustomerRowFirst
                                    ? mainAnimatedContainerItems
                                    : mainAnimatedContainerItems.reversed
                                        .toList(),
                              ),
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
        MezIconButton(
          onTap: () {
            if (enableExpand) {
              onCardStateChange?.call(initialCardState.opposit());
            }
          },
          iconSize: 20,
          padding: const EdgeInsets.all(3),
          icon: initialCardState == OrderInfoCardState.Minimized
              ? Icons.keyboard_arrow_up_rounded
              : Icons.keyboard_arrow_down_rounded,
        )
      ],
    );
  }

  List<Widget> get mainAnimatedContainerItems => <Widget>[
        _customerAnimatedRow(),
        if (order.pickupLocation != null)
          SizedBox(
            height: 38,
          ),
        if (order.pickupLocation != null) _serviceProviderAnimatedRow(),
      ];

  Row _serviceProviderAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(
              width: 8,
            ),
            if (order.serviceProviderDriverChatId != null)
              MessageButton(
                withPadding: false,
                onTap: onServiceMsgClick,
                chatId: order.serviceProviderDriverChatId!,
              ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: serviceProviderTimeWidget,
          ),
        )
      ],
    );
  }

  Widget _customerAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              customerName,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8),
            if (order.isDriverAssigned && order.customerDriverChatId != null)
              MessageButton(
                withPadding: false,
                onTap: onCustomerMsgClick,
                chatId: order.customerDriverChatId!,
              ),
          ],
        ),
        if (order.isDriverAssigned)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: customerTimeWidget,
            ),
          )
      ],
    );
  }

  Widget orderCardMainBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: TwoCirclesAvatar(
                      topImg: customerImage,
                      bottomIconData: order.orderType.toIcon()),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: MezButton(
                    height: 40,
                    borderRadius: 30,
                    icon: Icons.arrow_forward,
                    label: "${_i18n()['details']}",
                    onClick: () async {
                      // ignore: unawaited_futures
                      OrderDetailsScreen.navigate(orderId: order.orderId);
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${order.costs.totalCost?.toPriceString(rounded: true)}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                "${order.costs.orderItemsCost?.toPriceString(rounded: true)} + ${order.costs.deliveryCost?.toPriceString(rounded: true)}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                ),
              ),
              Text(
                  "${_i18n()["${order.paymentType.toNormalString().toLowerCase()}"]}")
            ],
          ),
          if (viewController.showEditPrice)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: MezIconButton(
                onTap: () {
                  _showPriceSheet(context);
                },
                icon: Icons.edit,
                iconSize: 20,
                padding: const EdgeInsets.all(3),
              ),
            )
        ],
      ),
    );
  }

  Row orderTimeWidget() {
    return Row(
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
          order.orderTime.toLocal().getOrderTime(withDayName: true),
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
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
      ],
    );
  }

  Future<dynamic> _showPriceSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Form(
                  key: viewController.updatePriceFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_i18n()['updateTitle']}",
                          style: context.txt.bodyLarge,
                        ),
                      ),
                      Divider(
                        height: 25,
                      ),
                      Text("${_i18n()['updateReason']}"),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: viewController.openOrderReasonText,
                        style: context.txt.bodyLarge,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "${_i18n()['required']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("${_i18n()['updatePrice']}"),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: viewController.openOrderPriceText,
                        style: context.txt.bodyLarge,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money_rounded),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "${_i18n()['required']}";
                          } else if (double.tryParse(v) == null) {
                            return "${_i18n()['notValid']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MezButton(
                        height: 50,
                        label: "${_i18n()['save']}",
                        onClick: () async {
                          await viewController.requestPriceChange(ctx);
                          // await viewController.editTax();
                          // await MezRouter.back();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MezButton(
                        height: 45,
                        label: "${_i18n()['cancel']}",
                        backgroundColor: offRedColor,
                        textColor: Colors.red,
                        onClick: () async {
                          Navigator.pop(context);
                          // await MezRouter.back();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
