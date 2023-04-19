import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/CustChatController.dart';

class CustBusinessMessageCard extends StatelessWidget {
  const CustBusinessMessageCard({super.key, required this.business});
  final BusinessCard business;

  @override
  Widget build(BuildContext context) {
    final CustChatController custChatController = CustChatController();
    return MezCard(
      firstAvatarBgImage: CachedNetworkImageProvider(business.image),
      content: Text(
        business.name,
        style: context.textTheme.bodyLarge,
      ),
      action: MessageButton(
        chatId: 0,
        onTap: () {
          custChatController.initiateChat(
            serviceProviderId: business.id,
          );
        },
      ),
    );
  }
}
