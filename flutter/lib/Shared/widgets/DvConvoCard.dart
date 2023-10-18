import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class DvConvoCard extends StatelessWidget {
  final DeliveryMinimalOrder message;
  final VoidCallback onClick;

  const DvConvoCard({required this.message, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      onClick: onClick,
      firstAvatarBgImage: message.customer?.image != null
          ? CachedNetworkImageProvider(message.customer!.image!)
          : null,
      margin: const EdgeInsets.only(bottom: 8),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.customer?.name ?? message.phone_number.toString(),
            style: context.textTheme.bodyLarge,
          ),
          // Text(
          //   message.text.body,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   style: context.textTheme.bodyMedium,
          // ),
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.watch_later_outlined,
                    size: 15.0,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(text: DateTime.parse(message.time).getOrderTime()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
