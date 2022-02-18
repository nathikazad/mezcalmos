import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Components/LaundryControllButtons.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

class DriverBottomLaundryOrderCard extends StatelessWidget {
  final LaundryOrder order;
  DriverBottomLaundryOrderCard({Key? key, required this.order})
      : super(key: key);
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();
  AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _getOrderStatus(),
                style: textTheme.bodyText2,
              ),
              Divider(),
              _orderHeaderInfo(context, textTheme),
              Divider(),
              // From to component
              _orderFromToComponent(textTheme),
              Divider(),
              // Order bottom card footer component (to be refactored)
              if (order.inProcess() &&
                  order.status != LaundryOrderStatus.AtLaundry)
                LaundryControllButtons(order: order),
              if (order.status == LaundryOrderStatus.Delivered ||
                  order.status == LaundryOrderStatus.AtLaundry)
                _orderDeliveredBottomComponent(textTheme),
              if (order.status == LaundryOrderStatus.CancelledByAdmin ||
                  order.status == LaundryOrderStatus.CancelledByCustomer)
                _orderBottomCanceledComponent(textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderBottomCanceledComponent(TextTheme textTheme) {
    return Row(
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.redAccent,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order canceled',
                        style: textTheme.bodyText1,
                      ),
                      Text(
                        DateFormat('dd MMM yy h:m').format(order.orderTime),
                        style: textTheme.subtitle1,
                      )
                    ],
                  ))
                ],
              );
  }

  Widget _orderDeliveredBottomComponent(TextTheme textTheme) {
    return Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Deliverd',
                        style: textTheme.bodyText1,
                      ),
                      Text(
                        DateFormat('dd MMM yy h:m').format(order.orderTime),
                        style: textTheme.subtitle1,
                      )
                    ],
                  ))
                ],
              );
  }

  Widget _orderHeaderInfo(BuildContext context, TextTheme textTheme) {
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
                        'Laundry Order',
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
                                .format(order.orderTime),
                            style: textTheme.subtitle1,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.textsms_rounded,
                      color: Theme.of(context).primaryColorLight,
                    )),
              ],
            );
  }

  Widget _orderFromToComponent(TextTheme textTheme) {
    List<Widget> fromToWidgets = [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: Icon(
              Icons.local_laundry_service,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                order.serviceProvider?.name ?? 'Laundry Agency',
                style: textTheme.bodyText1,
              ),
            ],
          )
        ],
      ),
      Container(
        height: 30,
        width: 3,
        margin: EdgeInsets.only(left: 16),
        color: Colors.grey.shade500,
      ),
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(order.customer.image),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.customer.name,
                  style: textTheme.bodyText1,
                ),
                Text(
                  order.to.address,
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (order.getCurrentPhase() == LaundryOrderPhase.Dropoff)
            ? fromToWidgets
            : fromToWidgets.reversed.toList());
  }

  String _getOrderStatus() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return 'Ready for pick-up';
      case LaundryOrderStatus.OtwPickup:
        return 'Pick-up on the way';
      case LaundryOrderStatus.PickedUp:
        return 'Order Picked up';
      case LaundryOrderStatus.AtLaundry:
        return 'Order at laundry';
      case LaundryOrderStatus.ReadyForDelivery:
        return 'Order ready for delivery';
      case LaundryOrderStatus.OtwDelivery:
        return 'Delivery on the way';
      case LaundryOrderStatus.Delivered:
        return 'Order Delivered';
      case LaundryOrderStatus.CancelledByAdmin:
        return 'Order Canceled';
      case LaundryOrderStatus.CancelledByCustomer:
        return 'Order Canceled';

      default:
        return '';
    }
  }
}
