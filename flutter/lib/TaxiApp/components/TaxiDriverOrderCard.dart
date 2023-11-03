import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

class TaxiDriverOrderCard extends StatelessWidget {
  const TaxiDriverOrderCard(
      {super.key, required this.order, required this.onClick});
  final TaxiOrder order;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 15,
                    backgroundImage:
                        CachedNetworkImageProvider(order.customer.image),
                  ),
                  hSmallSepartor,
                  Text(
                    order.customer.name,
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
              Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.person_pin_circle,
                    size: 15,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(text: "From : " + order.pickupLocation.address),
              ])),
              Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.pin_drop_rounded,
                    size: 15,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(text: "To : " + order.dropoffLocation.address),
              ])),
              Divider(),
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Text.rich(TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                        child: Icon(
                          Icons.route,
                          size: 18,
                          color: primaryBlueColor,
                        ),
                      ),
                      WidgetSpan(child: hTinySepartor),
                      TextSpan(
                          text: order.routeInformation.distance.toKmText()),
                    ])),
                    VerticalDivider(),
                    Text.rich(TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                        child: Icon(
                          Icons.watch_later_rounded,
                          size: 18,
                          color: primaryBlueColor,
                        ),
                      ),
                      WidgetSpan(child: hTinySepartor),
                      TextSpan(
                          text:
                              order.routeInformation.duration.inMinutesText()),
                    ])),
                    VerticalDivider(),
                    Text.rich(TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        order.carType.icon,
                        size: 18,
                        color: primaryBlueColor,
                      )),
                      WidgetSpan(child: hTinySepartor),
                      TextSpan(
                        text: order.carType.name,
                      ),
                    ])),
                    VerticalDivider(),
                    Text.rich(TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        Icons.payments,
                        size: 18,
                        color: primaryBlueColor,
                      )),
                      WidgetSpan(child: hTinySepartor),
                      TextSpan(
                          text: order.rideCost.toPriceString(),
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: primaryBlueColor)),
                    ])),
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
