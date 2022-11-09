import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList']["components"]["ROpOrderCard"];

class ROpOrderCard extends StatelessWidget {
  const ROpOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          MezRouter.toNamed(getROpOrderRoute(order.orderId));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  //  _orderImageComponent(),
                  // const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.customer.name,
                          style: textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          order.to.address,
                          style: textTheme.bodyText2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(order.orderTime.toDayAmPm()),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            CachedNetworkImageProvider(order.customer.image),
                      ),
                    ],
                  )
                  // getOrderWidget()
                ],
              ),
              const Divider(),
              Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    aMoney,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    " \$${order.itemsCost}",
                    style: Get.textTheme.bodyText1,
                  ),
                  Spacer(),
                  getOrderWidget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImageComponent() {
    return CachedNetworkImage(
      imageUrl: order.customer.image,
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
    switch (order.status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["canceled"]}',
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Colors.red, fontSize: 10.sp),
          ),
        );

      case RestaurantOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["delivered"]}',
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Colors.green, fontSize: 10.sp),
          ),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            '${_i18n()["waiting"]}',
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Colors.amber, fontSize: 10.sp),
          ),
        );
    }
  }
}
