import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/MezDateTimePicker.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["DeliveryTimePicker"];

//
class DeliveryTimePicker extends StatefulWidget {
  const DeliveryTimePicker({Key? key, required this.viewCartController})
      : super(key: key);
  final CustCartViewController viewCartController;

  @override
  State<DeliveryTimePicker> createState() => _DeliveryTimePickerState();
}

class _DeliveryTimePickerState extends State<DeliveryTimePicker> {
  @override
  void initState() {
    if (widget.viewCartController.cart.cartPeriod != null) {
      widget.viewCartController.cart.deliveryTime =
          widget.viewCartController.cart.getStartTime();
      //  controller.saveCart();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            '${_i18n()["dvTime"]}',
            style: Get.textTheme.bodyLarge,
          ),
          if (widget.viewCartController.cart.cartPeriod != null)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                  "(${widget.viewCartController.cart.cartPeriod!.toNormalString(format: DateFormat.MMMd(userLangCode))})"),
            ),
          if (widget.viewCartController.cart.restaurant?.isOpen() == false)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 14.sp,
                    color: Color(0xFF494949),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Flexible(
                    child: Text(
                      '${_i18n()["restClosed"]}',
                      style: Get.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 8,
          ),
          Card(
            child: InkWell(
              onTap: (widget.viewCartController.cart.deliveryTime != null)
                  ? null
                  : () async {
                      await _pickDeliveryTime(context);
                    },
              //  borderRadius: BorderRadius.circular(10),
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: Colors.black,
                        size: 14.sp,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      (widget.viewCartController.cart.deliveryTime == null)
                          ? Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                  (widget.viewCartController.cart.restaurant
                                              ?.isOpen() ==
                                          false)
                                      ? '${_i18n()["pickTime"]}'
                                      : '${_i18n()["now"]}',
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  )),
                            )
                          : Flexible(
                              fit: FlexFit.tight,
                              child: Text(_formattedTime,
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    fontSize: 12.sp,
                                  )),
                            ),
                      if (widget.viewCartController.cart.deliveryTime == null)
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      if (widget.viewCartController.cart.deliveryTime != null)
                        InkWell(
                          onTap: () {
                            _pickDeliveryTime(context);
                          },
                          customBorder: CircleBorder(),
                          child: Ink(
                            // padding: const EdgeInsets.all(3),
                            // decoration: BoxDecoration(
                            //     color: secondaryLightBlueColor,
                            //     shape: BoxShape.circle),
                            child: Icon(
                              Icons.expand_more,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      // if (widget.viewCartController.cart.deliveryTime != null &&
                      //     widget.viewCartController.shoudSchedule == false)
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 8),
                      //     child: InkWell(
                      //      // customBorder: CircleBorder(),
                      //       onTap: () {
                      //         widget.viewCartController.cart.deliveryTime =
                      //             null;
                      //         widget.viewCartController.cartController.cart
                      //             .refresh();
                      //       },
                      //       child: Ink(
                      //         child: Icon(
                      //           Icons.expand_more,
                      //           size: 24,
                      //           color: Colors.grey.shade800,
                      //         ),
                      //       ),
                      //     ),
                      //   )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (widget.viewCartController.cart.deliveryTime != null &&
              widget.viewCartController.cart.deliveryTime!
                  .toLocal()
                  .isBefore(DateTime.now().toLocal()))
            _timeError()
        ],
      ),
    );
  }

  Future<void> _pickDeliveryTime(BuildContext context) async {
    if (widget.viewCartController.cart.restaurant?.schedule != null) {
      await showModalBottomSheet<DateTime>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ), //for giving border to datePickerSheet
          ),
          context: context,
          isDismissible: true,
          builder: (BuildContext ctx) {
            return MezDateTimePicker(
              fixed7days: !widget.viewCartController.cart.isSpecial,
              startDate: widget.viewCartController.cart.deliveryTime?.toLocal(),
              periodOfTime: widget.viewCartController.cart.cartPeriod,
              numberOfDaysInterval:
                  widget.viewCartController.cart.isSpecial ? 1 : 7,
              serviceSchedule:
                  widget.viewCartController.cart.restaurant!.schedule!,
            );
          }).then((DateTime? value) {
        if (value != null) {
          widget.viewCartController.cart.deliveryTime = value;
          widget.viewCartController.cartController.cart.refresh();
        }
      });
    } else {
      mezDbgPrint(
          "[OPS] Restaurant have no schedule!=>${widget.viewCartController.cart.restaurant?.toJson()}}");
    }
  }

  Container _timeError() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '${_i18n()["timeError"]}',
              style: Get.textTheme.bodyLarge
                  ?.copyWith(color: Colors.red, fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }

  String get _formattedTime =>
      "${DateFormat.MMMEd(userLangCode).format(widget.viewCartController.cart.deliveryTime!.toLocal()).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(widget.viewCartController.cart.deliveryTime!.toLocal())}";
}
