import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["CreditCardInfo"];
//

class CreditCardInfo extends StatelessWidget {
  const CreditCardInfo({Key? key, required this.paymentInfo}) : super(key: key);
  final StripeOrderPaymentInfo paymentInfo;
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                '${_i18n()["creditCardInfo"]}',
                style: txt.bodyText1,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (paymentInfo.brand != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${_i18n()["cardType"]}',
                            style: txt.bodyText2,
                          ),
                          Text(
                              paymentInfo.brand!
                                  .toFirebaseFormatString()
                                  .inCaps,
                              style: txt.bodyText1),
                        ],
                      ),
                    ),
                  if (paymentInfo.last4 != null)
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${_i18n()["last4"]}',
                            style: txt.bodyText2,
                          ),
                          Text(paymentInfo.last4.toString(),
                              style: txt.bodyText1),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ]),
        ));
  }
}
