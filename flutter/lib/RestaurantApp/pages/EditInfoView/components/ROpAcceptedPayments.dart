import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

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
            "Accepted payments",
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
                    "Cash",
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
                    Flexible(
                      flex: 3,
                      child: Text(
                        "Card",
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    if (widget.viewController.showStatusIcon)
                      _stripeStatusWidget(context),
                    Spacer(
                      flex: 4,
                    ),
                    if (widget.viewController.showSetupBtn) _stripeSetupBtn()
                  ]),
              activeColor: primaryBlueColor,
              value: widget.viewController.restaurant.value!.paymentInfo
                      .acceptedPayments[PaymentType.Card] ==
                  true,
              onChanged: (bool? v) {
                widget.viewController.handleCardCheckBoxClick();
              }),

          //       ),
          //     SizedBox(
          //       width: 5,
          //     ),
          //     Flexible(
          //       flex: 1,
          //       child: Checkbox(
          //           shape: CircleBorder(),
          //           activeColor: primaryBlueColor,
          //           value: widget.viewController.restaurant.value!.paymentInfo
          //                   .acceptedPayments[PaymentType.Card] ==
          //               true,
          //           onChanged: (bool? v) {
          //             widget.viewController.handleCardCheckBoxClick();
          //           }),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  InkWell _stripeSetupBtn() {
    return InkWell(
      onTap: () {
        widget.viewController.showPaymentSetup();
      },
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: primaryBlueColor),
        child: RichText(
            text: TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.store,
            size: 18,
            color: Colors.white,
          )),
          WidgetSpan(
              child: SizedBox(
            width: 5,
          )),
          TextSpan(
            text: "Setup",
            style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
          )
        ])),
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
                text:
                    "${widget.viewController.restaurant.value!.paymentInfo.stripe?.status.toNormalString()}",
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
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.viewController.restaurant.value!.paymentInfo
                  .shouldFixPayouts)
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                      "Thanks for setup , you can now receive payments but you will not be able to withdraw money to your bank account"),
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
                        text:
                            "Please sign in to your stripe account and make sure you fill in all the requiremnts below",
                        style: Get.textTheme.bodyText2),
                  ],
                ),
              ),
              Divider(),
              Text(
                "Requirements :",
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
                      "Email ID : ${widget.viewController.restaurant.value!.paymentInfo.stripe?.email}",
                      style: Get.textTheme.bodyText1,
                    ),
                  ],
                ),
            ],
          ),
        );
      else {
        return Container(
          child: Text("Empty"),
        );
      }
    });
  }
}
