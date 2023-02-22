import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/TaxiOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

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
          cardTime: Text(
            order.orderTime.getOrderTime().inCaps,
            maxLines: 1,
          ),
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
            left: -28,
            child: CircleAvatar(
              radius: 23,
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
              (order as RestaurantOrder).shippingCost == 0
                  ? Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: ShippingCostComponent(
                        shippingCost: (order as RestaurantOrder).shippingCost,
                        alignment: MainAxisAlignment.start,
                      ),
                    )
                  : Text(
                      (order as RestaurantOrder).shippingCost.toPriceString())
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
              (order as LaundryOrder).shippingCost == 0
                  ? Flexible(
                      flex: 6,
                      child: ShippingCostComponent(
                        shippingCost: (order as LaundryOrder).shippingCost,
                        alignment: MainAxisAlignment.start,
                      ),
                    )
                  : Text((order as LaundryOrder).shippingCost.toPriceString())
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
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 23,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: primaryBlueColor),
          child: Icon(
            _getOrderIcon(),
            size: 30,
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
        MezRouter.toNamed(getRestaurantOrderRoute(order.orderId));

        break;
      case OrderType.Laundry:
        MezRouter.toNamed(getLaundryOrderRoute(order.orderId));

        break;
      // case OrderType.Taxi:
      //   MezRouter.toNamed(getTaxiOrderRoute(order.orderId));

      //   break;
      default:
    }
  }

  Widget _getOrderStatus() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : secondaryLightBlueColor),
          child: Text(
            (order as RestaurantOrder).getOrderStatus(),
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 10.sp,
                color: (order.isCanceled()) ? Colors.red : primaryBlueColor),
          ),
        );

      case OrderType.Laundry:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : secondaryLightBlueColor),
          child: Text(
            (order as LaundryOrder).orderStatusTitleForCustomer(),
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 10.sp,
                color: (order.isCanceled()) ? Colors.red : primaryBlueColor),
          ),
        );
      case OrderType.Taxi:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: (order.isCanceled())
                  ? Colors.red.withOpacity(0.2)
                  : secondaryLightBlueColor),
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
