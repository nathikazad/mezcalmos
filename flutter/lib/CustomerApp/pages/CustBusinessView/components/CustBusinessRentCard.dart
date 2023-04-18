import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:sizer/sizer.dart';

class CustBusinessRentCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final String imageUrl;
  final String label;
  final String price;
  final double? elevation;

  const CustBusinessRentCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.imageUrl,
      required this.label,
      required this.price,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      child: Padding(
        padding: contentPadding,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
              radius: 17.5.sp,
              backgroundImage: CachedNetworkImageProvider(imageUrl)),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 7,
            child: Text(
              label,
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '\$$price/hour',
            style: context.textTheme.bodyLarge,
          )
        ]),
      ),
    );
  }
}
