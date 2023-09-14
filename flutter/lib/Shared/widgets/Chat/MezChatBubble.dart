import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:sizer/sizer.dart';

class MezChatBubble extends StatelessWidget {
  final String? imageUrl;
  final String message;
  final DateTime timestamp;

  const MezChatBubble({
    this.imageUrl,
    required this.message,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Avatar

        CircleAvatar(
          radius: 20,
          backgroundImage: imageUrl != null
              ? CachedNetworkImageProvider(imageUrl!)
              : AssetImage(aDefaultAvatar) as ImageProvider,
        ),

        hTinySepartor,
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: const EdgeInsets.all(8.0),
            constraints: BoxConstraints(maxWidth: 60.w),
            decoration: BoxDecoration(
                color: primaryBlueColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timestamp.toDayAmPm(showDate: false),
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white, fontSize: 9.mezSp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
