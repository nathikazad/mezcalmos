import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustMessagesView/controllers/CustChatController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';

class CustBusinessMessageCard extends StatelessWidget {
  const CustBusinessMessageCard(
      {super.key,
      required this.business,
      required this.offeringName,
      this.contentPadding});
  final BusinessCard business;
  final EdgeInsets? contentPadding;
  final Map<Language, String> offeringName;

  @override
  Widget build(BuildContext context) {
    final CustChatController custChatController = CustChatController();
    final List<IconData> acceptedIconList = getAcceptedPaymentIcon();
    print("BUSINESS DATA ${business.id} ${business.detailsId}");
    return MezCard(
      contentPadding: contentPadding,
      elevation: 0,
      firstAvatarBgImage: CachedNetworkImageProvider(business.image),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            business.name,
            style: context.textTheme.bodyLarge,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SizedBox(
                  child: Row(
                    children: [
                      for (int index = 0;
                          index < acceptedIconList.length;
                          index++)
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            acceptedIconList[index],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryBlueColor,
                    ),
                    Text(
                      "${business.avgRating ?? 0}(${business.reviewCount ?? 0})",
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      action: MessageButton(
        chatId: 0,
        onTap: () {
          // check if user not logged in
          if (Get.find<AuthController>().user == null) {
            SignInView.navigateAtOrderTime();
          } else {
            custChatController.initiateChat(
              businessId: business.id,
              businessImage: business.image,
              offeringName: offeringName,
            );
          }
        },
      ),
    );
  }

  List<IconData> getAcceptedPaymentIcon() {
    final Map<PaymentType, bool> payments = business.acceptedPayments;
    final List<IconData> iconList = [];
    payments.map((key, value) {
      if (value) {
        switch (key) {
          case PaymentType.Cash:
            iconList.add(Icons.payments);
            break;
          case PaymentType.Card:
            iconList.add(Icons.credit_card);
            break;
          case PaymentType.BankTransfer:
            iconList.add(Icons.account_balance);
            break;
        }
      }
      return MapEntry(key, value);
    });

    return iconList;
  }
}
