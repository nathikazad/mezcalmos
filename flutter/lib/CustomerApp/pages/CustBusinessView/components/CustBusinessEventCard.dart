import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:sizer/sizer.dart';

class CustBusinessEventCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final String label;
  final String price;
  final String? imageUrl;
  final Schedule schedule;
  final double? elevation;

  const CustBusinessEventCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.label,
      required this.price,
      required this.imageUrl,
      required this.schedule,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      child: Padding(
        padding: contentPadding,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CircleAvatar(
                radius: 17.5.sp,
                backgroundImage: imageUrl == null
                    ? null
                    : CachedNetworkImageProvider(imageUrl!),
                backgroundColor: backgroundShadeColor,
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 7,
                child: Text(
                  label,
                  style:
                      context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Text(
                '\$$price/hour',
                style: context.textTheme.bodyLarge,
              )
            ]),
            Divider(),
            MezServiceOpenHours(schedule: schedule),
          ],
        ),
      ),
    );
  }
}
