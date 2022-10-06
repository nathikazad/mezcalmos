import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class IncomingOrderCard extends StatelessWidget {
  final TaxiOrder order;
  final bool isPast;
  const IncomingOrderCard({required this.order, this.isPast = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Future.delayed(
        Duration.zero,
        () => Get.toNamed<void>(
          order.status != TaxiOrdersStatus.Scheduled && !isPast
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Get.find<TaxiAuthController>()
                        .taxiState
                        ?.inOrderNegotation
                        ?.orderId ==
                    order.orderId &&
                order.status == TaxiOrdersStatus.LookingForTaxiScheduled &&
                !isPast) ...[
              Row(
                children: [
                  Icon(
                    Icons.blur_on,
                    color: Color.fromRGBO(226, 17, 50, 0.93),
                    size: 20,
                  ),
                  SizedBox(width: 9),
                  Text(
                    "Waiting for customer’s response",
                    style: TextStyle(
                      color: Color.fromRGBO(226, 17, 50, 0.93),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(height: 14)
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
                            flex: order.scheduledTime != null ? 2 : 5,
                            child: order.scheduledTime != null && !isPast
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
                                          color:
                                              Color.fromRGBO(33, 145, 37, 0.86),
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

                      if (order.scheduledTime != null && !isPast)
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
                      if (order.scheduledTime != null && !isPast)
                        SizedBox(height: 5),

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
                      if (!isPast)
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
                        )
                      else
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: order.status == TaxiOrdersStatus.DroppedOff
                                ? Color.fromRGBO(33, 145, 37, 0.12)
                                : Color.fromRGBO(226, 17, 50, 0.08),
                            borderRadius: BorderRadius.circular(13.5),
                          ),
                          child:
                              Text(order.status.getPastOrdersFormattedStatus(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: order.status ==
                                            TaxiOrdersStatus.DroppedOff
                                        ? Color.fromRGBO(33, 145, 37, 0.86)
                                        : Color.fromRGBO(226, 17, 50, 0.93),
                                  )),
                        )
                    ],
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isPast) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.black,
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              DateFormat('hh:mm a').format(
                                  order.scheduledTime ?? order.orderTime),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        )
                      ],
                      Container(
                        height: isPast ? 70 : 86,
                        width: isPast ? 70 : 86,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: mLoadImage(url: order.customer.image).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
