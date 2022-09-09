import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['components']['ROpAcceptedPayments'];

class ROpAcceptedPayments extends StatefulWidget {
  const ROpAcceptedPayments({Key? key, required this.viewController})
      : super(key: key);
  final ROpEditInfoController viewController;

  @override
  State<ROpAcceptedPayments> createState() => _ROpAcceptedPaymentsState();
}

class _ROpAcceptedPaymentsState extends State<ROpAcceptedPayments> {
  @override
  void initState() {
    widget.viewController.checkStripe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["acceptedPayments"]}',
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    '${_i18n()["cash"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Checkbox(
                      shape: CircleBorder(),
                      activeColor: primaryBlueColor,
                      value: widget.viewController.restaurant.value!.paymentInfo
                              .acceptedPayments[PaymentType.Cash] ==
                          true,
                      onChanged: (bool? v) {}),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CheckboxListTile(
              checkboxShape: CircleBorder(),
              contentPadding: EdgeInsets.zero,
              title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // flex: 5,
                      child: Text(
                        '${_i18n()["card"]}',
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    if (widget.viewController.showStatusIcon)
                      _stripeStatusWidget(context),
                    SizedBox(
                      width: 8,
                    ),
                    if (!widget.viewController.showSetupBtn) _stripeSetupBtn()
                  ]),
              activeColor: primaryBlueColor,
              value: widget.viewController.restaurant.value!.paymentInfo
                      .acceptedPayments[PaymentType.Card] ==
                  true,
              onChanged: (bool? v) {
                widget.viewController.handleCardCheckBoxClick();
              }),

          //       ),

          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _stripeSetupBtn() {
    return Flexible(
      flex: 5,
      child: InkWell(
        onTap: () {
          widget.viewController.showPaymentSetup();
        },
        child: Ink(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryBlueColor),
            child: Text(
              '${_i18n()["setup"]}',
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
            )),
      ),
    );
  }

  Widget _stripeStatusWidget(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                content: Container(
                  child: _reqWidget(),
                ),
              );
            });
      },
      child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(8)),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: '${_i18n()["requirements"]}',
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.black),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: 3,
              )),
              WidgetSpan(
                  child: Icon(
                Icons.help,
                size: 18,
                color: Colors.black,
              ))
            ]),
          )),
    );
  }

  Widget _reqWidget() {
    return Obx(() {
      if (widget
          .viewController.restaurant.value!.paymentInfo.getReqs.isNotEmpty)
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.viewController.restaurant.value!.paymentInfo
                  .shouldFixPayouts)
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text('${_i18n()["setupHelper"]}'),
                ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.help_outline,
                        size: 18,
                      ),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: 5,
                    )),
                    TextSpan(
                        text: '${_i18n()["reqsHelper"]}',
                        style: Get.textTheme.bodyText2),
                  ],
                ),
              ),
              Divider(),
              Text(
                "${_i18n()["reqs"]} :",
                style: Get.textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    widget.viewController.restaurant.value!.paymentInfo.stripe
                            ?.requirements.length ??
                        0,
                    (int index) => Container(
                          margin: EdgeInsets.only(top: 5, bottom: 3),
                          child: Text(
                              "- ${widget.viewController.restaurant.value!.paymentInfo.stripe?.requirements[index]}"),
                        )),
              ),
              if (widget.viewController.restaurant.value!.paymentInfo.stripe
                      ?.email !=
                  null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      "${_i18n()["emailId"]} : ${widget.viewController.restaurant.value!.paymentInfo.stripe?.email}",
                      style: Get.textTheme.bodyText1,
                    ),
                  ],
                ),
            ],
          ),
        );
      else {
        return Container(
          child: Text("${_i18n()["empty"]}"),
        );
      }
    });
  }
}
