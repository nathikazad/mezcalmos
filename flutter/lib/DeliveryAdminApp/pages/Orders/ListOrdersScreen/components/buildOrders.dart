import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/TwoAvatarsComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

final f = new DateFormat('hh:mm a');

final currency = new NumberFormat("#,##0.00", "en_US");

Widget buildOrders(RxList<Order> inProcessOrders) {
  inProcessOrders.value.sort((a, b) => b.orderTime.compareTo(a.orderTime));
  return SingleChildScrollView(
    child: Column(
      children: inProcessOrders.fold<List<Widget>>(
        <Widget>[],
        (children, element) {
          RestaurantOrder s = element as RestaurantOrder;
          // mezDbgPrint("${s.restaurantOrderStatus}");
          children.add(
            DeliveryAdminOrderComponent(
              type: OrderType.Restaurant,
              status: s.status,
              url: s.restaurant.image,
              image: "${s.customer.image}",
              userName: "${s.customer.name}",
              title: "${s.restaurant.name}",
              price: "${currency.format(element.cost)}",
              quantity: "${element.quantity}",
              date: "${f.format(element.orderTime.toLocal())}",
              ontap: () =>
                  Get.toNamed(getRestaurantOrderRoute(element.orderId)),
            ),
          );

          return children;
        },
      ),
    ),
  );
}

class DeliveryAdminOrderComponent extends StatelessWidget {
  final OrderType type;
  final GestureTapCallback ontap;
  final String url;
  final String? image;
  final String? title;
  final String? userName;
  final String? price;
  final String? quantity;
  final String? date;
  RestaurantOrderStatus? status;

  DeliveryAdminOrderComponent({
    required this.type,
    required this.url,
    required this.ontap,
    this.image,
    this.title,
    this.userName,
    this.price,
    this.quantity,
    this.date,
    this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: _getOrderColor(status!),
        child: Row(
          children: <Widget>[
            TowAvatarsComponent(
              type: type,
              url: url,
              customerImage: image,
            ),
            Container(
              width: Get.width * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("$userName- $title",
                      style: const TextStyle(
                          color: Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0),
                      textAlign: TextAlign.left),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 14,
                      ),
                      Text(
                        " $price",
                        style: const TextStyle(
                            color: Color(0xff000f1c),
                            fontWeight: FontWeight.w300,
                            fontFamily: "FontAwesome5Pro",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 14,
                      ),
                      Text(
                        " $quantity",
                        style: const TextStyle(
                            color: Color(0xff000f1c),
                            fontWeight: FontWeight.w300,
                            fontFamily: "FontAwesome5Pro",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.schedule_outlined,
                        size: 14,
                      ),
                      Text(
                        " $date",
                        style: const TextStyle(
                          color: Color(0xff000f1c),
                          fontWeight: FontWeight.w300,
                          fontFamily: "FontAwesome5Pro",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  // padding: const EdgeInsets.only(top: 20),
                  child: _getOrderIcon(status!),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: ontap,
    );
  }

  BoxDecoration _getOrderColor(RestaurantOrderStatus status) {
    BoxDecoration? myDecoration;
    switch (status) {
      case RestaurantOrderStatus.PreparingOrder:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x2fff9300));
        break;
      case RestaurantOrderStatus.CancelledByCustomer:
      case RestaurantOrderStatus.CancelledByAdmin:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x3bff0000));
        break;
      case RestaurantOrderStatus.OrderReceieved:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x26db3434));
        break;
      case RestaurantOrderStatus.Delivered:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x3328af37));
        break;
      case RestaurantOrderStatus.ReadyForPickup:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x65d3962b));
        break;
      case RestaurantOrderStatus.OnTheWay:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x224064fa));

        break;
      default:
    }

    return myDecoration!;
  }
}

Widget _getOrderIcon(RestaurantOrderStatus status) {
  Widget? myWidget;

  switch (status) {
    case RestaurantOrderStatus.PreparingOrder:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(stoveIcon),
      );
      break;
    case RestaurantOrderStatus.CancelledByCustomer:
    case RestaurantOrderStatus.CancelledByAdmin:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(circularCancel),
      );
      break;
    case RestaurantOrderStatus.ReadyForPickup:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(box),
      );
      break;
    case RestaurantOrderStatus.OnTheWay:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(truck),
      );
      break;
    case RestaurantOrderStatus.Delivered:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(tick),
      );
      break;
    case RestaurantOrderStatus.OrderReceieved:
      myWidget = Container(
        height: 30,
        width: 30,
        child: Image.asset(waiting),
      );

      break;
    default:
  }
  return myWidget!;
}
