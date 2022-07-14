import 'package:flutter/material.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

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
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // left column

                Flexible(
                  flex: 7,
                  fit: FlexFit.tight,
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
                                fontSize: 17,
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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      orderCardSubWidgets.cardTime,
                      orderCardSubWidgets.rightImage,
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Container(
              // height: 30,
              child: Row(
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
                  Center(
                    child: Text(
                      "\$${order.cost.toString()}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    // height: 30,
                    child: orderCardSubWidgets.cardStatus,
                  ),
                ],
              ),
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
