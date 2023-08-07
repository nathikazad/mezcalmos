import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';

class MezMessageCard extends StatelessWidget {
  final HasuraChat chat;
  final VoidCallback onClick;

  const MezMessageCard({
    required this.chat,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MezCard(
      margin: EdgeInsets.only(bottom: 10),
      contentPadding: EdgeInsets.symmetric(vertical: 15),
      elevation: 0,
      onClick: onClick,
      content: Row(
        children: [
          CircleAvatar(
            radius: 16.5.mezSp,
            backgroundImage: NetworkImage(chat.chatInfo.chatImg),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat.chatInfo.chatTite,
                        style: context.textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        chat.lastMessage!.timestamp.isToday
                            ? chat.lastMessage!.timestamp.timeAgo()
                            : chat.lastMessage!.timestamp.getOrderTime(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            chat.lastMessage!.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Get.find<ForegroundNotificationsController>()
                              .hasNewMessageNotification(chat.id)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                right: 2.0,
                                top: 4.0,
                              ),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                                child: Text(
                                  // TODO: How to get length of new message
                                  "",
                                  style: context.textTheme.labelSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
