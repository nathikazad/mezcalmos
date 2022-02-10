import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:rive/rive.dart';

class LaundryOngoigOrderCard extends StatelessWidget {
  LaundryOngoigOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(getLaundyOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.local_laundry_service_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      //  if (order.serviceProvider != null)
                      // Positioned(
                      //     top: 0,
                      //     right: 0,
                      //     child: CircleAvatar(
                      //         radius: 14,
                      //         backgroundColor: Colors.blueAccent,
                      //         child: Icon(
                      //           Icons.local_laundry_service_rounded,
                      //           size: 20,
                      //           // size: 18.sp,
                      //           color: Colors.white,
                      //         )))
                    ],
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceProvider?.name ?? "Laundry order",
                          style: txt.headline3,
                        ),
                        if (MediaQuery.of(context).size.width > 320)
                          Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                order.to.address,
                                style: txt.subtitle1,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  getLaundryOrderWidget((order as LaundryOrder).status),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Divider(),
              mezOrdercart(txt)
            ],
          ),
        ),
      ),
    );
  }

  Container mezOrdercart(TextTheme txt) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} : \$${order.cost}",
          ),
          Spacer(),
          Icon(
            Ionicons.time_outline,
            size: 16.sp,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            getLaundryOrderStatus((order as LaundryOrder).status),
            style: txt.bodyText2,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
          )
        ],
      ),
    );
  }
}

Widget getLaundryOrderWidget(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrdersStatus.OtwPickup:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.PickedUp:
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrdersStatus.AtLaundry:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrdersStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.dry_cleaning_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );
    case LaundryOrdersStatus.OtwDelivery:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.green,
        ),
      );
  }
}

String getLaundryOrderStatus(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return 'Order Canceled';

    case LaundryOrdersStatus.CancelledByCustomer:
      return 'Order Canceled';

    case LaundryOrdersStatus.OrderReceieved:
      return 'Order Received';
    case LaundryOrdersStatus.OtwPickup:
      return 'Pick-up On the way';
    case LaundryOrdersStatus.PickedUp:
      return 'Order picked-up';
    case LaundryOrdersStatus.AtLaundry:
      return 'Order at laundry';
    case LaundryOrdersStatus.ReadyForDelivery:
      return 'Ready For Delivery';
    case LaundryOrdersStatus.OtwDelivery:
      return 'Delivery on the way';
    case LaundryOrdersStatus.Delivered:
      return 'Order Delivered';
    default:
      return 'Unknown Status';
  }
}
