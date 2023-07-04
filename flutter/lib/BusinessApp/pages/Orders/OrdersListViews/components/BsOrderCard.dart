import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsOrderCard'];

class BsOrderCard extends StatelessWidget {
  final String imageUrl;
  final String customerName;
  final DateTime time;
  final int numItems;
  final num price;
  final void Function() onTap;

  const BsOrderCard({
    required this.imageUrl,
    required this.customerName,
    required this.time,
    required this.numItems,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerName,
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Row(
                        children: [
                          Icon(
                            Icons.price_check_outlined,
                            size: 18.sp,
                            color: offShadeGreyColor,
                          ),
                          Text(price.toPriceString(),
                              style: TextStyle(color: offShadeGreyColor)),
                          hSmallSepartor,
                          Icon(
                            Icons.circle,
                            size: 5.sp,
                            color: offShadeGreyColor,
                          ),
                          hSmallSepartor,
                          Text('$numItems ${_i18n()['items']}',
                              style: TextStyle(color: offShadeGreyColor))
                        ],
                      ),
                    ],
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(time.getOrderTime(),
                      style: TextStyle(color: offShadeGreyColor)),
                  meduimSeperator,
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: CachedNetworkImageProvider(imageUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
