import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpRefundButton"];

class ROpRefundButton extends StatefulWidget {
  const ROpRefundButton({
    Key? key,
    required this.order,
  }) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpRefundButton> createState() => _ROpRefundButtonState();
}

class _ROpRefundButtonState extends State<ROpRefundButton> {
  TextEditingController refundAmount = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    refundAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MezButton(
        label: "${_i18n()["refundCustomer"]}",
        withGradient: true,
        enabled: canRefund(),
        onClick: canRefund()
            ? () async {
                // ignore: unawaited_futures
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  context: context,
                  isDismissible: false,
                  enableDrag: false,
                  isScrollControlled: true,
                  builder: (BuildContext ctx) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(ctx).viewInsets.bottom),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                '${_i18n()["refundYourCustomer"]}',
                                style: Get.textTheme.headline3,
                              ),
                            ),
                            Divider(),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${_i18n()["amount"]} :",
                              style: Get.textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                                controller: refundAmount,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? v) {
                                  if (v == null || num.tryParse(v) == null) {
                                    return "${_i18n()["req"]}";
                                  } else if (num.parse(v) > maximumRefund()) {
                                    return "${_i18n()["maxError"]}${maximumRefund().toPriceString()}";
                                  } else if (!(num.parse(v) > 0)) {
                                    return "${_i18n()["minError"]}";
                                  }
                                  return null;
                                },
                                style: Get.textTheme.bodyText1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    suffix: Text(
                                      "| ${_i18n()["refundMax"]} ${maximumRefund().toPriceString()}",
                                      textAlign: TextAlign.center,
                                    ),
                                    prefixIcon:
                                        Icon(Icons.attach_money_rounded)),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]')),
                                ]),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "${_i18n()["to"]}",
                              style: Get.textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${widget.order.customer.name}",
                              style: Get.textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(widget.order.stripePaymentInfo?.brand!
                                    .toIcon()),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${widget.order.stripePaymentInfo?.brand!.toName()}",
                                  style: Get.textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("•" * 12 +
                                    "${widget.order.stripePaymentInfo?.last4}")
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: MezButton(
                                  label: "${_i18n()["cancel"]}",
                                  height: 50,
                                  onClick: () async {
                                    Get.back();
                                  },
                                  backgroundColor: offRedColor,
                                  textColor: Colors.red,
                                )),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: MezButton(
                                  label: "${_i18n()["confirmRefund"]}",
                                  height: 50,
                                  withGradient: true,
                                  onClick: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await Get.find<ROpOrderController>()
                                          .refundCustomerCustomAmount(
                                              widget.order.orderId,
                                              num.parse(refundAmount.text))
                                          .then((ServerResponse value) {
                                        if (value.success) {
                                          Get.back();

                                          showStatusInfoDialog(context,
                                              primaryIcon: Icons.price_check,
                                              showSmallIcon: false,
                                              status:
                                                  "${_i18n()["dialogTitle"]}",
                                              description:
                                                  "${_i18n()["dialogDesc"]}");
                                        } else {
                                          Get.snackbar("Error",
                                              value.errorMessage ?? "Error");
                                        }
                                      });
                                    }
                                  },
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            : null,
      ),
    );
  }

  bool canRefund() {
    if (widget.order.refundAmount != null) {
      return (widget.order.refundAmount! < widget.order.totalCost!);
    } else
      return true;
  }

  num maximumRefund() {
    if (widget.order.refundAmount != null) {
      return (widget.order.totalCost! - widget.order.refundAmount!);
    } else {
      return widget.order.totalCost!;
    }
  }
}
