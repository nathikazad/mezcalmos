import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:mezcalmos/TaxiApp/router.dart';

class IncomingOrderCard extends StatelessWidget {
  final TaxiOrder order;
  const IncomingOrderCard({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Future.delayed(
        Duration.zero,
        () => Get.toNamed<void>(
          order.status != TaxiOrdersStatus.Scheduled
              ? getIncomingOrderRoute(order.orderId)
              : getTaxiOrderRoute(order.orderId),
        ),
      ),
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
        child: Row(
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
                        flex: order.scheduledTime != null ? 2 : 5,
                        child: order.scheduledTime != null
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(68),
                                  color: Color.fromRGBO(33, 145, 37, 0.08),
                                ),
                                child: Center(
                                  child: Text(
                                    getScheduleDateDiffrence(
                                      order.scheduledTime!,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Color.fromRGBO(33, 145, 37, 0.86),
                                    ),
                                  ),
                                ),
                              )
                            : Text(
                                order.customer.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(money_asset),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 2,
                              child: Text(
                                "\$${order.cost.toString()}",
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
                      )
                    ],
                  ),
                  SizedBox(height: 5),

                  if (order.scheduledTime != null)
                    Text(
                      DateFormat('EEEE, dd MMM - hh:mm a').format(
                        order.scheduledTime!,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  if (order.scheduledTime != null) SizedBox(height: 5),

                  // second line - from
                  Text(
                    'From: ${order.from.address}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  // thrd line - To
                  Text(
                    'To: ${order.to.address}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  // route infos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (order.scheduledTime == null)
                        Expanded(
                          flex: 4,
                          child: iconWithText(
                            Icons.location_on_rounded,
                            "${order.distanceToClient.toStringAsFixed(1)}km",
                          ),
                        ),
                      Expanded(
                        flex: order.scheduledTime == null ? 4 : 5,
                        child: iconWithText(
                          Icons.route,
                          "${(order.routeInformation!.distance.distanceInMeters / 1000).toStringAsFixed(1)}m",
                        ),
                      ),
                      Expanded(
                        flex: order.scheduledTime == null ? 4 : 5,
                        child: iconWithText(
                          Icons.access_time,
                          "${order.routeInformation!.duration.shortTextVersion}",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: mLoadImage(url: order.customer.image).image,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row iconWithText(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Icon(
            icon,
            size: 14,
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  String getScheduleDateDiffrence(DateTime scheduleTime) {
    final Duration _d = scheduleTime.difference(DateTime.now());
    return "${_d.toString().substring(0, 4).replaceFirst(':', 'h ')}m";
  }
}
