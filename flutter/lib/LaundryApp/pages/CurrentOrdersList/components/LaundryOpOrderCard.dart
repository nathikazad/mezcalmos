import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          MezRouter.toNamed(getLaundryOpOrderRoute(laundryOrder.orderId));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //  _orderImageComponent(),

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(laundryOrder.orderTime.toDayAmPm()),
                      SizedBox(
                        height: 3,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                            laundryOrder.customer.image),
                      ),
                    ],
                  )
                  // getOrderWidget()
                ],
              ),
              Divider(),
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
                    " \$${laundryOrder.costsByType?.weighedCost ?? "-"}",
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
      case LaundryOrderStatus.CancelledByCustomer:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "${_i18n()["canceled"]}",
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Colors.red, fontSize: 10.sp),
          ),
        );

      case LaundryOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "${_i18n()["delivered"]}",
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Colors.green, fontSize: 10.sp),
          ),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Color(0xFFFFF0CB),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "${_i18n()["waiting"]}",
            style: Get.textTheme.bodyText1
                ?.copyWith(color: Color(0xFFFFB800), fontSize: 10.sp),
          ),
        );
    }
  }
}
