import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"]["laundeyOrderHeader"];

class LaundryOrderHeader extends StatelessWidget {
  /// The header of the delivery driver laundry order bottom card .
  /// shows the customer info and message button
  const LaundryOrderHeader({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          Icons.local_laundry_service,
          size: 40.sp,
          color: Theme.of(context).primaryColorLight,
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["laundryOrder"]}",
                style: textTheme.headline3!.copyWith(fontSize: 13.sp),
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd MMM yy h:m')
                        .format(order.orderTime.toLocal()),
                    style: textTheme.subtitle1,
                  )
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  mezDbgPrint(
                    (order.getCurrentPhase() == LaundryOrderPhase.Pickup)
                        ? order.serviceProviderPickupDriverChatId!
                        : order.serviceProviderDropOffDriverChatId!,
                  );
                  MezRouter.toNamed(getMessagesRoute(
                      orderId: order.orderId,
                      orderType: OrderType.Laundry,
                      chatId:
                          (order.getCurrentPhase() == LaundryOrderPhase.Pickup)
                              ? order.serviceProviderPickupDriverChatId!
                              : order.serviceProviderDropOffDriverChatId!,
                      recipientType: ParticipantType.DeliveryAdmin));
                },
                icon: Icon(
                  Icons.textsms_rounded,
                  color: Theme.of(context).primaryColorLight,
                )),
            Obx(
              () => Get.find<OrderController>()
                      .hasNewMessageNotification(order.orderId)
                  ? _newMessageRedDot(context)
                  : Container(),
            )
          ],
        ),
      ],
    );
  }

  Widget _newMessageRedDot(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xfff6efff), width: 2),
            color: const Color(0xffff0000)),
      ),
    );
  }
}
