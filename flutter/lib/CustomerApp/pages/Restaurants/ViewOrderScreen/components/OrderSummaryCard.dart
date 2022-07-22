import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_i18n()["orderSummary"]}',
                  style: txt.bodyText1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["orderCost"]}',
                          style: txt.bodyText2,
                        ),
                        Text('\$' + (order.itemsCost).toString(),
                            style: txt.bodyText2),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["deliveryCost"]}',
                          style: txt.bodyText2,
                        ),
                        Flexible(
                            child: ShippingCostComponent(
                          shippingCost: order.shippingCost,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["totalCost"]}',
                          style: txt.bodyText1,
                        ),
                        Text(
                          (order.itemsCost + order.shippingCost)
                              .toPriceString(),
                          style: txt.bodyText1!.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Divider()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_i18n()["deliveryLocation"]}',
                  style: txt.bodyText1,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      size: 18,
                      color: primaryBlueColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        order.restaurant.location.address,
                        style: Get.textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
