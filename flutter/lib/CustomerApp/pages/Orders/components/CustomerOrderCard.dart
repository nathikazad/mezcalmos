import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/TaxiOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:sizer/sizer.dart';

class CustomerOrderCard extends StatelessWidget {
  const CustomerOrderCard({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return OrderInfosCard(
      order: order,
      orderCardSubWidgets: OrderCardSubWidgets(
          onCardTap: handleRouting,
          primaryBodyContent: _getRightBody(),
          cardTitle: _getServiceProvider()?.name ?? "",
          cardStatus: _getOrderStatus(),
          cardTime: Text(order.orderTime.getOrderTime()),
          rightImage: _rightImage()),
    );
  }

  Widget _rightImage() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Positioned(
            left: -40,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(
                  _getServiceProvider()?.image ?? ""),
            ),
          ),
          _getOrderWidget(),
        ],
      ),
    );
  }

  Widget _getRightBody() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Container(
          child: Row(
            children: [
              Icon(Icons.flatware),
              SizedBox(
                width: 5,
              ),
              Text(order.cost.toPriceString()),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.delivery_dining),
              SizedBox(
                width: 5,
              ),
              Text(50.toPriceString())
            ],
          ),
        );

      case OrderType.Laundry:
        return Container(
          child: Row(
            children: [
              Icon(Icons.local_laundry_service),
              SizedBox(
                width: 5,
              ),
              Text((order as LaundryOrder)
                      .costsByType
                      ?.weighedCost
                      .toPriceString() ??
                  "_"),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.delivery_dining),
              SizedBox(
                width: 5,
              ),
              Text(50.toPriceString())
            ],
          ),
        );
      case OrderType.Taxi:
        return Container(
          child: Row(
            children: [
              Icon(Icons.route),
              SizedBox(
                width: 5,
              ),
              Text((order as TaxiOrder)
                      .routeInformation
                      ?.distance
                      .distanceStringInKm ??
                  ""),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.watch_later),
              SizedBox(
                width: 5,
              ),
              Text((order as TaxiOrder)
                      .routeInformation
                      ?.duration
                      .shortTextVersion ??
                  "")
            ],
          ),
        );

      default:
        return Container();
    }
  }

  UserInfo? _getServiceProvider() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return (order as RestaurantOrder).restaurant;
      case OrderType.Laundry:
        return (order as LaundryOrder).laundry;
      case OrderType.Taxi:
        return (order as TaxiOrder).driver;

      default:
        return null;
    }
  }

  Widget _getOrderWidget() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 20,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: primaryBlueColor),
          child: Icon(
            _getOrderIcon(),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  IconData _getOrderIcon() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Icons.flatware;
      case OrderType.Laundry:
        return Icons.local_laundry_service;
      case OrderType.Taxi:
        return Icons.local_taxi;

      default:
        return Icons.error;
    }
  }

  void handleRouting() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        Get.toNamed(getRestaurantOrderRoute(order.orderId));

        break;
      case OrderType.Laundry:
        Get.toNamed(getLaundyOrderRoute(order.orderId));

        break;
      case OrderType.Taxi:
        Get.toNamed(getTaxiOrderRoute(order.orderId));

        break;
      default:
    }
  }

  Widget _getOrderStatus() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : SecondaryLightBlueColor),
          child: Text(
            (order as RestaurantOrder).getOrderStatus(),
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 10.sp,
                color: (order.isCanceled()) ? Colors.red : primaryBlueColor),
          ),
        );

      case OrderType.Laundry:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : SecondaryLightBlueColor),
          child: Text(
            (order as LaundryOrder).orderStatusTitleForCustomer(),
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 10.sp,
                color: (order.isCanceled()) ? Colors.red : primaryBlueColor),
          ),
        );
      case OrderType.Taxi:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : SecondaryLightBlueColor),
          child: Text(
            (order as TaxiOrder).getTaxiOrderStatus(),
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 10.sp,
                color: (order.isCanceled()) ? Colors.red : primaryBlueColor),
          ),
        );

      default:
        return Container();
    }
  }
}
