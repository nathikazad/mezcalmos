import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    customerName,
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(time.getOrderTime(),
                      style: TextStyle(color: offShadeGreyColor))
                ],
              ),
              smallSepartor,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.price_check_outlined,
                              color: offShadeGreyColor,
                            )),
                        TextSpan(
                          text: price.toPriceString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: offShadeGreyColor),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: hSmallSepartor),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.circle,
                              size: 5.sp,
                              color: offShadeGreyColor,
                            )),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: hSmallSepartor),
                        TextSpan(
                          text: '$numItems ' +
                              '${_i18n()['item']}'
                                  .toPlural(isPlural: numItems != 1),
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: offShadeGreyColor),
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
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
