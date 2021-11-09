import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/TwoAvatarsComponent.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('hh:mm a');

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  RxList<Order> inProcessOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();

  @override
  void initState() {
    super.initState();
    inProcessOrders.value = controller.inProcessOrders;
    mezDbgPrint("ListOrdersScreen:init value");
    mezDbgPrint(controller.inProcessOrders);
    controller.ordersStream.listen((event) {
      inProcessOrders.value = event;
      mezDbgPrint("ListOrdersScreen:listener value");
      mezDbgPrint(controller.inProcessOrders);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
                "menu", Get.find<SideMenuDraweController>().openMenu),
            drawer: MezSideMenu(),
            body: Obx(() {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("Orders",
                        style: const TextStyle(
                            color: const Color(0xff1d1d1d),
                            fontWeight: FontWeight.w400,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 45.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: buildOrders(),
                  ),
                ],
              );
            })));
  }

  Widget buildOrders() {
    return SingleChildScrollView(
      child: Column(
        children:
            inProcessOrders.fold<List<Widget>>(<Widget>[], (children, element) {
          switch (element.orderType) {
            case OrderType.Restaurant:
              var s = element as RestaurantOrder;
              mezDbgPrint("${s.restaurantOrderStatus}");
              children.add(DeliveryAdminOrderComponent(
                type: OrderType.Restaurant,
                status: s.restaurantOrderStatus,
                url: s.restaurant.image,
                //TODO: add user infos
                image: "https://randomuser.me/api/portraits/men/79.jpg",
                userName: "Jammy",
                //============
                title: "${s.restaurant.name}",
                price: "${element.cost}",
                quantity: "${element.quantity}",
                date: "${f.format(element.orderTime)}",
                ontap: () =>
                    Get.toNamed(getRestaurantOrderRoute(element.orderId)),
              ));

              break;
            // TODO:
            //add each type to its relevant type order
            default:
          }

          return children;
        }),
      ),
    );
  }
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
  DeliveryAdminOrderComponent(
      {required this.type,
      required this.url,
      required this.ontap,
      this.image,
      this.title,
      this.userName,
      this.price,
      this.quantity,
      this.date,
      this.status,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: _getOrderColor(status!),
        child: Row(
          children: [
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
                children: [
                  Text("$userName- $title",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0),
                      textAlign: TextAlign.left),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 14,
                      ),
                      Text(" $price",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontWeight: FontWeight.w300,
                              fontFamily: "FontAwesome5Pro",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      Spacer(),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      Spacer(),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 14,
                      ),
                      Text(" $quantity",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontWeight: FontWeight.w300,
                              fontFamily: "FontAwesome5Pro",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      Spacer(),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 5,
                      ),
                      Spacer(),
                      Icon(
                        Icons.schedule_outlined,
                        size: 14,
                      ),
                      Text(" $date",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontWeight: FontWeight.w300,
                              fontFamily: "FontAwesome5Pro",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left)
                    ],
                  )
                ],
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
      case RestaurantOrderStatus.Cancelled:
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x26db3434));
        break;
      case RestaurantOrderStatus.OrderReceieved:
      case RestaurantOrderStatus.ReadyForPickup:
      case RestaurantOrderStatus.OnTheWay:
      case RestaurantOrderStatus.Delivered:
      case RestaurantOrderStatus.OrderReceieved:
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
