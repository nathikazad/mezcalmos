import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/controllers/MessagesListViewController.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Offerings']['CustBusinessMessageCard'];

class CustBusinessMessageCard extends StatefulWidget {
  const CustBusinessMessageCard(
      {super.key,
      required this.business,
      required this.offering,
      this.contentPadding,
      this.margin = const EdgeInsets.only(bottom: 12.5)});
  final BusinessCard business;
  final EdgeInsets? contentPadding;
  final BusinessItemDetails offering;
  final EdgeInsets margin;

  @override
  State<CustBusinessMessageCard> createState() =>
      _CustBusinessMessageCardState();
}

class _CustBusinessMessageCardState extends State<CustBusinessMessageCard> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final CustMessagesListViewController custChatController =
        CustMessagesListViewController();
    print("BUSINESS DATA ${widget.business.id} ${widget.business.detailsId}");
    final bool ifNotFromBusiness = !(MezRouter.isRouteInStack(
        CustBusinessView.constructUrl(businessId: widget.business.id)));
    return MezCard(
        elevation: 0,
        margin: widget.margin,
        radius: 20.mezSp,
        onClick: () async {
          if (ifNotFromBusiness) {
            await CustBusinessView.navigate(businessId: widget.business.id);
          } else {
            await MezRouter.back();
          }
        },
        contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
        firstAvatarBgImage: CachedNetworkImageProvider(widget.business.image),
        action: isLoading
            ? CircularProgressIndicator()
            : MessageButton(
                chatId: 0,
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  // check if user not logged in
                  if (Get.find<AuthController>().user == null) {
                    await SignInView.navigateAtOrderTime();
                  } else {
                    await custChatController.initiateChat(
                        businessId: widget.business.id,
                        offeringName: widget.offering.name,
                        phoneNumber: widget.business.phoneNo,
                        offeringImage:
                            widget.offering.firstImage ?? defaultUserImgUrl);
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.business.name,
              style: context.textTheme.displaySmall
                  ?.copyWith(fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                businessLastActiveTimeAgo(),
                // _getAcceptedPaymentIcons(widget.business.acceptedPayments),
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
                      // Text('${widget.business.avgRating ?? '0'}',
                      //     style: context.textTheme.bodySmall),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 2),
                      //   child: Text(
                      //     '(${widget.business.reviewCount})',
                      //     style: context.textTheme.bodyMedium,
                      //   ),
                      // )
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Text(
                                      '${widget.business.avgRating ?? '0'}',
                                      style: context.textTheme.bodySmall)),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Text(
                                      '(${widget.business.reviewCount ?? '0'})',
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(fontSize: 7.mezSp)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget businessLastActiveTimeAgo() {
    String createTimeAgoString() {
      if (widget.business.lastActive == null) {
        return '';
      }
      final DateTime now = DateTime.now();
      final DateTime lastActiveTime = widget.business.lastActive!;
      final Duration difference = now.difference(lastActiveTime);
      if (difference.inDays > 0) {
        return '${difference.inDays} days';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} min';
      } else {
        return '${difference.inMinutes} min';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Text(
        'Active ${createTimeAgoString()} ago',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
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
