import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/controllers/MessagesListViewController.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustBusinessMessageCard extends StatelessWidget {
  const CustBusinessMessageCard(
      {super.key,
      required this.business,
      required this.offeringName,
      this.contentPadding,
      this.margin = const EdgeInsets.only(bottom: 12.5)});
  final BusinessCard business;
  final EdgeInsets? contentPadding;
  final Map<Language, String> offeringName;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final CustMessagesListViewController custChatController =
        CustMessagesListViewController();
    print("BUSINESS DATA ${business.id} ${business.detailsId}");
    return MezCard(
        elevation: 0,
        margin: margin,
        radius: 20.mezSp,
        contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
        firstAvatarBgImage: CachedNetworkImageProvider(business.image),
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
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              business.name,
              style: context.textTheme.displaySmall
                  ?.copyWith(fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _getAcceptedPaymentIcons(business.acceptedPayments),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 17.5.mezSp,
                        color: Color(0xFF6779FE),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('${business.avgRating ?? '0'}',
                          style: context.textTheme.bodySmall),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, bottom: 3),
                        child: Text(
                          '(${business.reviewCount})',
                          style: context.textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Row _getAcceptedPaymentIcons(Map<PaymentType, bool> acceptedPayments) {
    final List<IconData> iconList = [];
    acceptedPayments.forEach((PaymentType key, bool value) {
      if (value) {
        switch (key) {
          case PaymentType.Cash:
            iconList.add(Icons.payments_outlined);
            break;
          case PaymentType.Card:
            iconList.add(Icons.credit_card_outlined);
            break;
          case PaymentType.BankTransfer:
            iconList.add(Icons.account_balance_outlined);
            break;
        }
      }
    });

    return Row(
      children: <Icon>[
        for (IconData icon in iconList)
          Icon(
            icon,
            size: 15.mezSp,
          )
      ],
    );
  }
}
