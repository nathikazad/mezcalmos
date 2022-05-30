import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

class OrderInfosCard extends StatelessWidget {
  final OrderCardSubWidgets orderCardSubWidgets;
  final Order order;
  const OrderInfosCard(
      {required this.orderCardSubWidgets, required this.order, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: orderCardSubWidgets.onCardTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: -1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...[
              orderCardSubWidgets.primaryHeaderContent,
              orderCardSubWidgets.secondaryHeaderContent,
              SizedBox(height: 14),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // left column

                Flexible(
                  flex: 2,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // first line - name and price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Text(
                              orderCardSubWidgets.cardTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      orderCardSubWidgets.primaryBodyContent,
                      orderCardSubWidgets.secondaryBodyContent,
                      // second line - from
                      SizedBox(height: 5),
                    ],
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      orderCardSubWidgets.cardTime,
                      orderCardSubWidgets.rightImage,
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 15,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(money_asset),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "\$${order.cost.toString()}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                orderCardSubWidgets.cardStatus,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCardSubWidgets {
  String cardTitle;
  Widget cardStatus;
  Widget cardTime;
  Widget rightImage;
  void Function() onCardTap;
  Widget primaryBodyContent;
  Widget secondaryBodyContent;
  Widget primaryHeaderContent;
  Widget secondaryHeaderContent;

  OrderCardSubWidgets({
    required this.onCardTap,
    required this.cardTitle,
    required this.cardStatus,
    required this.cardTime,
    required this.rightImage,
    this.primaryBodyContent = const SizedBox(),
    this.secondaryBodyContent = const SizedBox(),
    this.primaryHeaderContent = const SizedBox(),
    this.secondaryHeaderContent = const SizedBox(),
  });
}
