import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:rive/rive.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    Key? key,
    required this.ordersStates,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  final RestaurantOrderStatus ordersStates;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint('Card Rebuild : ' + ordersStates.toString());
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getOrderWidget(RestaurantOrderStatus.CancelledByAdmin),
                Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                  child: Text(
                    getOrderStatus(RestaurantOrderStatus.CancelledByAdmin),
                    style: txt.headline3,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(getRestaurantMessagesRoute(order.orderId));
                    },
                    customBorder: CircleBorder(),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Icon(
                            Icons.textsms,
                            color: Colors.white,
                          ),
                        ),
                        Get.find<OrderController>()
                                .orderHaveNewMessageNotifications(order.orderId)
                            ? Positioned(
                                left: 27,
                                top: 10,
                                child: Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xfff6efff),
                                          width: 2),
                                      color: const Color(0xffff0000)),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              getOrderHelperText(ordersStates),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}

Widget getOrderWidget(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
          size: 50,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
          size: 50,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case RestaurantOrderStatus.PreparingOrder:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/cooking.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.OnTheWay:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.ReadyForPickup:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag,
          size: 50,
          color: Colors.grey,
        ),
      );

    case RestaurantOrderStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_check,
          size: 50,
          color: Colors.green,
        ),
      );
  }
}

String getOrderStatus(RestaurantOrderStatus status) {
  LanguageController lang = Get.find<LanguageController>();
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["recievied"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["delivered"]}';

    default:
      return 'Unknown status';
  }
}

String getOrderHelperText(RestaurantOrderStatus status) {
  LanguageController lang = Get.find<LanguageController>();
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["recievied"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["delivered"]}';

    default:
      return 'Unknown status';
  }
}
