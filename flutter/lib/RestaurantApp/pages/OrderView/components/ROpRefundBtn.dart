import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextButton(
          onPressed: canRefund()
              ? () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext ctx) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Refund",
                                    style: Get.textTheme.headline3,
                                  ),
                                ),
                                Divider(),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Amount :",
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
                                      if (v == null ||
                                          num.tryParse(v) == null) {
                                        return "Required a valid number";
                                      } else if (num.parse(v) >
                                          maximumRefund()) {
                                        return "Maximum is : ${maximumRefund()}";
                                      }
                                      return null;
                                    },
                                    style: Get.textTheme.bodyText1,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.attach_money_rounded)),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]')),
                                    ]),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.find<ROpOrderController>()
                                            .refundCustomerCustomAmount(
                                                widget.order.orderId,
                                                num.parse(refundAmount.text))
                                            .then((ServerResponse value) {
                                          mezDbgPrint("$value");
                                          Get.back();
                                        });
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5),
                                      child: Text("Refund"),
                                    ))
                              ],
                            ),
                          ),
                        );
                      });
                }
              : null,
          style: TextButton.styleFrom(
            backgroundColor: canRefund() ? Colors.black : Colors.grey,
            primary: Colors.white,
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              "Refund customer",
            ),
          )),
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
