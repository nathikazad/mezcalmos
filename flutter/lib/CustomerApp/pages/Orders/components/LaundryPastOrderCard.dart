import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/LaundryOngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

import '../../../router.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['components']['LaundryPastOrderCard'];

class LaundryPastOrderCard extends StatelessWidget {
  LaundryPastOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
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
                      //         backgroundColor: Colors.amber.shade500,
                      //         child: Icon(
                      //           Icons.local_taxi_rounded,
                      //           size: 20,
                      //           // size: 18.sp,
                      //           color: Colors.white,
                      //         )))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceProvider?.name ?? "Laundry order",
                          overflow: TextOverflow.ellipsis,
                          style: txt.headline3,
                          maxLines: 2,
                        ),
                        Text(
                          order.to.address,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: txt.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  !order.isCanceled()
                      ? Icon(
                          Ionicons.checkmark_circle,
                          color: Colors.green,
                          size: 50,
                        )
                      : Icon(
                          Ionicons.close_circle,
                          color: Colors.red,
                          size: 50,
                        ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " ${_i18n()["totalCost"]} : ${(order.getPrice() != null) ? '\$${order.getPrice()}' : '-'}",
                    ),
                    (MediaQuery.of(context).size.width > 320)
                        ? Flexible(
                            child: Text(
                              getLaundryOrderStatus(order.status) +
                                  ' at :' +
                                  DateFormat(' hh:mm a')
                                      .format(order.orderTime),
                              style: txt.bodyText2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          )
                        : Text(
                            getLaundryOrderStatus(order.status),
                            style: txt.bodyText1,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
