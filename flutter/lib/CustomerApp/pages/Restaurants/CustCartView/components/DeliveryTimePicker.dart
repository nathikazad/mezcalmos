import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/MezDateTimePicker.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["DeliveryTimePicker"];

//
class DeliveryTimePicker extends StatefulWidget {
  const DeliveryTimePicker({
    Key? key,
    required this.deliveryTime,
    required this.periodOfTime,
    required this.isServiceOpen,
    required this.fixed7days,
    required this.numberOfDays,
    required this.onValue,
    required this.schedule,
    this.shoudSchedule = false,
    required this.onClear,
  }) : super(key: key);
  // final CustCartViewController viewCartController;
  final PeriodOfTime? periodOfTime;
  final DateTime? deliveryTime;
  final Schedule? schedule;
  final bool isServiceOpen;
  final bool fixed7days;
  final bool shoudSchedule;

  final int numberOfDays;
  final Function(DateTime?) onValue;
  final Function() onClear;

  @override
  State<DeliveryTimePicker> createState() => _DeliveryTimePickerState();
}

class _DeliveryTimePickerState extends State<DeliveryTimePicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get scheduleRequired => widget.schedule?.isOpen() == false;
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
            style: context.txt.bodyLarge,
          ),
          if (widget.periodOfTime != null)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                  "(${widget.periodOfTime!.toNormalString(format: DateFormat.MMMd(userLangCode))})"),
            ),
          if (widget.isServiceOpen == false)
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: context.txt.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 8,
          ),
          FormField<DateTime?>(validator: (DateTime? value) {
            if (scheduleRequired && value == null) {
              return "${_i18n()['required']}";
            } else if (value != null &&
                value.toLocal().isBefore(DateTime.now().toLocal())) {
              return '${_i18n()["timeError"]}';
            }

            return null;
          }, builder: (FormFieldState<DateTime?> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: InkWell(
                    onTap: () async => _pickDeliveryTime(context, field),
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
                            (widget.deliveryTime == null)
                                ? Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                        (widget.isServiceOpen == false)
                                            ? '${_i18n()["pickTime"]}'
                                            : '${_i18n()["now"]}',
                                        style: context.txt.bodyLarge?.copyWith(
                                          fontSize: 12.sp,
                                        )),
                                  )
                                : Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(_formattedTime.inCaps,
                                        style: context.txt.bodyLarge?.copyWith(
                                          fontSize: 12.sp,
                                        )),
                                  ),
                            //if (widget.deliveryTime == null)
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                            ),
                            /*if (widget.deliveryTime != null)
                              InkWell(
                                onTap: () {
                                  _pickDeliveryTime(context, field);
                                },
                                customBorder: CircleBorder(),
                                child: Ink(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: secondaryLightBlueColor,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: primaryBlueColor,
                                  ),
                                ),
                              ),
                            if (widget.deliveryTime != null &&
                                widget.shoudSchedule == false)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: InkWell(
                                  customBorder: CircleBorder(),
                                  onTap: () {
                                    widget.onClear.call();
                                    field.setValue(null);
                                  },
                                  child: Ink(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: offRedColor,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: redAccentColor,
                                    ),
                                  ),
                                ),
                              )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (field.hasError)
                  Container(
                      child: Text("${field.errorText}",
                          style: context.theme.inputDecorationTheme.errorStyle))
              ],
            );
          }),

          // if (widget.deliveryTime != null &&
          //     widget.deliveryTime!.toLocal().isBefore(DateTime.now().toLocal()))
          //   _timeError(),
          // if (widget.deliveryTime == null && widget.schedule?.isOpen() == false)
          //   _timeError(title: "Please select a delivery time")
        ],
      ),
    );
  }

  Future<void> _pickDeliveryTime(
      BuildContext context, FormFieldState<Object?> field) async {
    if (widget.schedule != null) {
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
              fixed7days: widget.fixed7days,
              startDate: widget.deliveryTime?.toLocal(),
              periodOfTime: widget.periodOfTime,
              numberOfDaysInterval: widget.numberOfDays,
              serviceSchedule: widget.schedule!,
            );
          }).then((DateTime? value) {
        if (value != null) {
          field.setValue(value);
          widget.onValue.call(value);
        }
      });
    } else {
      mezDbgPrint("[OPS] Restaurant have no schedule!=>");
    }
  }

  Container _timeError({String? title}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              title ?? '${_i18n()["timeError"]}',
              style: context.txt.bodyLarge
                  ?.copyWith(color: Colors.red, fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }

  String get _formattedTime =>
      "${DateFormat.MMMEd(userLangCode).format(widget.deliveryTime!.toLocal()).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(widget.deliveryTime!.toLocal())}";
}
