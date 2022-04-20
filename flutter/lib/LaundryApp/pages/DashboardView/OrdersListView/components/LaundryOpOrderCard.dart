import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';

class LaundryOpOrderCard extends StatelessWidget {
  const LaundryOpOrderCard({
    Key? key,
    required this.laundryOrder,
  }) : super(key: key);

  final LaundryOrder laundryOrder;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 8,
        bottom: 8,
        end: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _orderImageComponent(),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      laundryOrder.customer.name,
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      laundryOrder.to.address,
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              getOrderWidget()
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              color: Color(0xFFEDEDED),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total cost : \$ ${laundryOrder.cost}",
                  style: textTheme.bodyText2,
                ),
                const SizedBox(width: 24),
                Flexible(
                  child: Text(
                    "Date :  ${DateFormat("dd/MMM/yyyy h:ma").format(laundryOrder.orderTime)}",
                    style: textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _orderImageComponent() {
    return CachedNetworkImage(
      imageUrl: laundryOrder.customer.image,
      fit: BoxFit.fill,
      imageBuilder: (BuildContext context, ImageProvider<Object> image) {
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: image, fit: BoxFit.cover)),
        );
      },
      placeholder: (_, __) {
        return Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
          ),
          highlightColor: Colors.grey[400]!,
          baseColor: Colors.grey[300]!,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 1),
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: keyAppColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            'C n'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  Widget getOrderWidget() {
    switch (laundryOrder.status) {
      case LaundryOrderStatus.CancelledByAdmin:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.cancel,
            size: 50,
            color: Colors.red,
          ),
        );

      case LaundryOrderStatus.CancelledByCustomer:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.cancel,
            size: 50,
            color: Colors.red,
          ),
        );

      case LaundryOrderStatus.OrderReceieved:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.hourglass_bottom_rounded,
            size: 50,
            color: Colors.grey,
          ),
        );
      case LaundryOrderStatus.OtwPickup:
        return Container(
          height: 50,
          width: 60,
          child: RiveAnimation.asset(
            "assets/animation/motorbikeWithSmokeAnimation.riv",
            fit: BoxFit.cover,
          ),
        );
      case LaundryOrderStatus.PickedUp:
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.check_circle,
            size: 50,
            color: Colors.grey,
          ),
        );
      case LaundryOrderStatus.AtLaundry:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.local_laundry_service_rounded,
            size: 50,
            color: Color(0xFFAC59FC),
          ),
        );

      case LaundryOrderStatus.ReadyForDelivery:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.dry_cleaning_rounded,
            size: 50,
            color: Color(0xFFAC59FC),
          ),
        );
      case LaundryOrderStatus.OtwDelivery:
        return Container(
          height: 50,
          width: 60,
          child: RiveAnimation.asset(
            "assets/animation/motorbikeWithSmokeAnimation.riv",
            fit: BoxFit.cover,
          ),
        );
      case LaundryOrderStatus.Delivered:
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.check_circle,
            size: 50,
            color: Colors.green,
          ),
        );
    }
  }
}
