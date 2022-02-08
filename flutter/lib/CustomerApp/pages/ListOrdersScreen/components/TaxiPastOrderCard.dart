import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/TaxiOrderOngoingCard.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

class TaxiPastOrderCard extends StatelessWidget {
  TaxiPastOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  TaxiOrder order;

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(getTaxiOrderRoute(order.orderId));
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
                          radius: 25,
                          backgroundImage: mLoadImage(
                                  assetInCaseFailed:
                                      'assets/images/customer/taxi/taxiDriverImg.png',
                                  url: order.serviceProvider?.image)
                              .image),
                      //  if (order.serviceProvider != null)
                      Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.amber.shade500,
                              child: Icon(
                                Icons.local_taxi_rounded,
                                size: 20,
                                // size: 18.sp,
                                color: Colors.white,
                              )))
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
                          order.serviceProvider?.name ?? "Taxi order",
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
                          size: 40,
                        )
                      : Icon(
                          Ionicons.close_circle,
                          color: Colors.red,
                          size: 40,
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
                      " ${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} : \$${order.cost.toStringAsFixed(0)}",
                    ),
                    (MediaQuery.of(context).size.width > 320)
                        ? Flexible(
                            child: Text(
                              getTaxiOrderStatus(order.status) +
                                  ' at :' +
                                  DateFormat(' hh:mm a')
                                      .format(order.orderTime.toLocal()),
                              style: txt.bodyText1!.copyWith(fontSize: 11.sp),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          )
                        : Text(
                            getTaxiOrderStatus(order.status),
                            style: txt.bodyText1!.copyWith(fontSize: 11.sp),
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
