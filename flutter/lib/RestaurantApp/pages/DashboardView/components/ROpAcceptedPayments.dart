import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/ROpPaymentsPageController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['components']['ROpAcceptedPayments'];

class ROpAcceptedPayments extends StatefulWidget {
  const ROpAcceptedPayments({Key? key, required this.viewController})
      : super(key: key);
  final ROpPaymentsPageController viewController;

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
            style: Get.textTheme.bodyText2,
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
                              ?.acceptedPayments[PaymentType.Cash] ==
                          true,
                      onChanged: (bool? v) {}),
                ),
              ],
            ),
          ),
          Divider(
            endIndent: 10,
            indent: 5,
            height: 7,
            thickness: 0.3,
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Bank Transfer',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                // SizedBox(
                //   width: 8,
                // ),
                if (widget.viewController.isBankTrue)
                  MezIconButton(
                      onTap: () async {
                        await handleBank();
                      },
                      iconSize: 20,
                      icon: Icons.edit),
                const SizedBox(
                  width: 5,
                ),
                Checkbox(
                    shape: CircleBorder(),
                    activeColor: primaryBlueColor,
                    value: widget.viewController.isBankTrue,
                    onChanged: (bool? v) async {
                      if (!widget.viewController.isBankTrue) {
                        await handleBank();
                      } else {
                        await widget.viewController.removeBank();
                      }
                    }),
              ],
            ),
          ),
          Divider(
            endIndent: 10,
            indent: 5,
            height: 7,
            thickness: 0.3,
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${_i18n()["card"]}',
                            style: Get.textTheme.bodyText1,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Image.asset(
                            "assets/images/shared/stripeColoredLogo.png",
                            height: 16,
                            width: 40,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          if (widget.viewController.showStatusIcon)
                            _stripeStatusWidget(context),
                          const SizedBox(
                            width: 5,
                          ),
                          if (widget.viewController.showSetupBtn)
                            _stripeSetupBtn()
                        ],
                      ),
                    ],
                  ),
                ),
                Checkbox(
                    shape: CircleBorder(),
                    activeColor: primaryBlueColor,
                    value: widget.viewController.restaurant.value!.paymentInfo
                            ?.acceptedPayments[PaymentType.Card] ==
                        true,
                    onChanged: (bool? v) {
                      widget.viewController.handleCardCheckBoxClick(v!);
                    }),
              ],
            ),
          ),
          // CheckboxListTile(
          //     checkboxShape: CircleBorder(),
          //     contentPadding: EdgeInsets.zero,
          //     title: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               '${_i18n()["card"]}',
          //               style: Get.textTheme.bodyText1,
          //             ),
          //             const SizedBox(
          //               width: 3,
          //             ),
          //             Image.asset(
          //               "assets/images/shared/stripeColoredLogo.png",
          //               height: 16,
          //               width: 40,
          //             )
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 8,
          //         ),
          //         Row(
          //           children: [
          //             if (widget.viewController.showStatusIcon)
          //               _stripeStatusWidget(context),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             if (widget.viewController.showSetupBtn) _stripeSetupBtn()
          //           ],
          //         ),
          //       ],
          //     ),
          //     activeColor: primaryBlueColor,
          //     value: widget.viewController.restaurant.value!.paymentInfo
          //             .acceptedPayments[PaymentType.Card] ==
          //         true,
          //     onChanged: (bool? v) {
          //       widget.viewController.handleCardCheckBoxClick(v!);
          //     }),
          if (widget.viewController.showFeesOption)
            Container(
              //     margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text("${_i18n()["chargeCustomer"]}")),
                  Obx(
                    () => Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: primaryBlueColor,
                      value: widget.viewController.getChargeFessOnCustomer(),
                      onChanged: (bool v) {
                        widget.viewController.switchChargeFees(v);
                      },
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  Future<void> handleBank() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (BuildContext ctx) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "Bank account informations",
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bank name",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(ctx).viewInsets.bottom),
                    child: TextFormField(
                      controller: widget.viewController.bankName,
                      decoration: InputDecoration(hintText: "Bank name"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Account number",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(ctx).viewInsets.bottom),
                    child: TextFormField(
                      controller: widget.viewController.bankNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                      ],
                      decoration: InputDecoration(hintText: "Account number"),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: MezButton(
                        label: "Cancel",
                        backgroundColor: offRedColor,
                        textColor: Colors.red,
                        onClick: () async {
                          Get.back();
                        },
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          child: MezButton(
                        label: "Confirm",
                        onClick: () async {
                          await widget.viewController
                              .pushBankInfos(
                                  bankName: widget.viewController.bankName.text,
                                  bankNumber: num.parse(
                                      widget.viewController.bankNumber.text))
                              .then((value) => Get.back(closeOverlays: true));
                        },
                      )),
                    ],
                  ),
                ],
              ));
        });
  }

  Widget _stripeSetupBtn() {
    return InkWell(
      onTap: () {
        widget.viewController.showPaymentSetup();
      },
      child: Ink(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: primaryBlueColor),
          child: Row(
            children: [
              Icon(
                Icons.store,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${_i18n()["setup"]}',
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          )),
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
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: offRedColor, borderRadius: BorderRadius.circular(8)),
          child: Container(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.help,
                size: 18,
                color: Colors.red,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${_i18n()["requirements"]}',
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
              ),
            ]),
          )),
    );
  }

  Widget _reqWidget() {
    return Obx(() {
      if (widget.viewController.restaurant.value!.paymentInfo?.getReqs
              .isNotEmpty ==
          true)
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.viewController.restaurant.value!.paymentInfo
                      ?.shouldFixPayouts ==
                  true)
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
                    widget.viewController.restaurant.value!.paymentInfo?.stripe
                            ?.requirements.length ??
                        0,
                    (int index) => Container(
                          margin: EdgeInsets.only(top: 5, bottom: 3),
                          child: Text(
                              "- ${widget.viewController.restaurant.value!.paymentInfo?.stripe?.requirements[index]}"),
                        )),
              ),
              if (widget.viewController.restaurant.value!.paymentInfo?.stripe
                      ?.email !=
                  null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      "${_i18n()["emailId"]} : ${widget.viewController.restaurant.value!.paymentInfo?.stripe?.email}",
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