import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['components']['LaundryOngoingOrderCard'];

class LaundryOngoigOrderCard extends StatelessWidget {
  const LaundryOngoigOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed<void>(getLaundyOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                      // if (order.serviceProvider != null)
                      //   Positioned(
                      //     top: 0,
                      //     right: 0,
                      //     child: CircleAvatar(
                      //       radius: 14,
                      //       backgroundColor: Colors.blueAccent,
                      //       child: Icon(
                      //         Icons.local_laundry_service_rounded,
                      //         size: 20,
                      //         // size: 18.sp,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.serviceProvider?.name ?? "Laundry order",
                          style: txt.headline3,
                        ),
                        if (MediaQuery.of(context).size.width > 320)
                          Column(
                            children: <Widget>[
                              const SizedBox(height: 8),
                              Text(
                                order.to.address,
                                style: txt.subtitle1,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  getLaundryOrderWidget((order).status),
                  const SizedBox(width: 10)
                ],
              ),
              const Divider(),
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
        children: <Widget>[
          Text(
            " ${_i18n()["totalCost"]} : ${(order.getPrice() != null) ? '\$${order.getPrice()}' : '-'}",
          ),
          const Spacer(),
          Icon(
            Ionicons.time_outline,
            size: 16.sp,
          ),
          const SizedBox(width: 5),
          Text(
            getLaundryOrderStatus((order).status),
            style: txt.bodyText2,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }
}

Widget getLaundryOrderWidget(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrderStatus.PickedUpFromCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrderStatus.AtLaundry:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrderStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.dry_cleaning_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrderStatus.Delivered:
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

String getLaundryOrderStatus(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return _i18n()["status"]['canceled'];

    case LaundryOrderStatus.OrderReceieved:
      return _i18n()["status"]['orderReceived'];
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return _i18n()["status"]['otwPickUp'];
    case LaundryOrderStatus.PickedUpFromCustomer:
      return _i18n()["status"]['pickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return _i18n()["status"]['atLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return _i18n()["status"]['readyForDelivery'];
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return _i18n()["status"]['otwDelivery'];
    case LaundryOrderStatus.Delivered:
      return _i18n()["status"]['delivered'];
    default:
      return 'Unknown Status';
  }
}
