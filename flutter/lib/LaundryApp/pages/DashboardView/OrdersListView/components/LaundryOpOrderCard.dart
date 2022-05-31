import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
        ['DashboardView']['OrdersListView']['LaundryOpOrdersListView']
    ['components']['LaundryOpOrderCard'];

class LaundryOpOrderCard extends StatelessWidget {
  const LaundryOpOrderCard({
    Key? key,
    required this.laundryOrder,
  }) : super(key: key);

  final LaundryOrder laundryOrder;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(getLaundryOpOrderRoute(laundryOrder.orderId));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _orderImageComponent(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          laundryOrder.customer.name,
                          style: textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
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
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${_i18n()["totalCost"]} \$ ${laundryOrder.cost}",
                      style: textTheme.bodyText2,
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      child: Text(
                        "${_i18n()["date"]}  ${DateFormat("dd/MMM/yyyy h:ma").format(laundryOrder.orderTime)}",
                        style: textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
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

  Widget _orderImageComponent() {
    return CachedNetworkImage(
      imageUrl: laundryOrder.customer.image,
      fit: BoxFit.fill,
      imageBuilder: (BuildContext context, ImageProvider<Object> image) {
        return Container(
          height: 60,
          width: 60,
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
            color: primaryBlueColor,
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
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return Container(
          height: 50,
          width: 60,
          child: RiveAnimation.asset(
            "assets/animation/motorbikeWithSmokeAnimation.riv",
            fit: BoxFit.cover,
          ),
        );
      case LaundryOrderStatus.PickedUpFromCustomer:
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
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
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
