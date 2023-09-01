import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class DvConvoCard extends StatelessWidget {
  final WhMessage message;
  final VoidCallback onClick;

  const DvConvoCard({required this.message, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      onClick: onClick,
      firstAvatarIcon: message.icon,
      firstAvatarIconColor: message.resolved ? primaryBlueColor : Colors.grey,
      firstAvatarBgColor:
          message.resolved ? secondaryLightBlueColor : Colors.grey.shade300,
      margin: const EdgeInsets.only(bottom: 8),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.from,
            style: context.textTheme.bodyLarge,
          ),
          Text(
            message.text.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium,
          ),
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.watch_later_outlined,
                    size: 15.0,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(text: message.timestamp.getEstimatedTime()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
