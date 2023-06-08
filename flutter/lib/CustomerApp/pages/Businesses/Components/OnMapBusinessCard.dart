import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['OnMapBusinessCard'];

class OnMapBusinessCard extends StatelessWidget {
  final BusinessCard business;
  final EdgeInsetsGeometry margin;
  const OnMapBusinessCard(
      {super.key,
      required this.business,
      this.margin = const EdgeInsets.only(bottom: 75, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey.shade400)]),
      child: InkWell(
        onTap: () => CustBusinessView.navigate(
          businessId: business.id,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: CachedNetworkImage(
                  width: 60.mezSp,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: business.image),
            ),
            SizedBox(width: 5),
            Container(
                width: 65.mezW,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      business.name,
                      style: context.textTheme.displaySmall?.copyWith(
                          fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
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
                                padding: const EdgeInsets.only(left: 2),
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
                ))
          ],
        ),
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
