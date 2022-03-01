import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:sizer/sizer.dart';

class DriverOrderCard extends StatelessWidget {
  final Order order;
  DriverOrderCard({Key? key, required this.order}) : super(key: key);

  AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(getCurrentOrderRoute(order.orderId));
        },
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getOrderIcon(context),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getOrderTitle(),
                          style: textTheme.headline3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 12.sp,
                            ),
                            Flexible(
                                child: Text(
                              order.to.address,
                              maxLines: 1,
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 0.3,
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(DateFormat('dd MMM yy h:m')
                      .format(order.orderTime.toLocal())),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 12.sp)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getOrderIcon(context) {
    if (order.orderType == OrderType.Restaurant) {
      return Icon(
        Icons.food_bank,
        size: 45.sp,
        color: Theme.of(context).primaryColorLight,
      );
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return Icon(
        Icons.local_laundry_service_rounded,
        size: 45.sp,
        color: Theme.of(context).primaryColorLight,
      );
    } else {
      return CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(order.customer.image),
      );
    }
  }

  String _getOrderTitle() {
    if (order.orderType == OrderType.Restaurant) {
      return 'Restaurant Delivery';
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return 'Laundry Delivery';
    } else {
      return 'Laundry pick-up';
    }
  }
}
