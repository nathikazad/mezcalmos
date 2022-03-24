import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/components/TaxiOrderOngoingCard.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["ListOrdersScreen"]["components"]["TaxiPastOrderCard"];

class TaxiPastOrderCard extends StatelessWidget {
  const TaxiPastOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final TaxiOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed<void>(getTaxiOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: mLoadImage(
                                assetInCaseFailed:
                                    'assets/images/customer/taxi/taxiDriverImg.png',
                                url: (order.isOpenOrder())
                                    ? null
                                    : order.serviceProvider?.image)
                            .image,
                      ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          (order.isOpenOrder())
                              ? "${_i18n()['taxiOrder']}"
                              : order.serviceProvider?.name ??
                                  "${_i18n()['taxiOrder']}",
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
                  const Spacer(),
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
              const Divider(),
              Container(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      " ${_i18n()["totalCost"]} : \$${order.cost.toStringAsFixed(0)}",
                    ),
                    (MediaQuery.of(context).size.width > 320)
                        ? Flexible(
                            child: Text(
                              getTaxiOrderStatus(order.status) +
                                  DateFormat(': hh:mm a')
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
