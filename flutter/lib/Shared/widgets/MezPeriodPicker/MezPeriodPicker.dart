import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezPeriodPicker/controller/MezPeriodPickerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezDateTimePicker"];

//
class MezPeriodPicker extends StatefulWidget {
  const MezPeriodPicker(
      {Key? key,
      required this.startDate,
      required this.numberOfDaysInterval,
      required this.serviceSchedule,
      this.title,
      this.periodOfTime,
      this.confirmBtnText})
      : super(key: key);
  final DateTime? startDate;

  final PeriodOfTime? periodOfTime;
  final int numberOfDaysInterval;
  final Schedule serviceSchedule;
  final String? title;
  final String? confirmBtnText;

  @override
  State<MezPeriodPicker> createState() => _MezPeriodPickerState();
}

class _MezPeriodPickerState extends State<MezPeriodPicker> {
  MezPeriodPickerController _controller = MezPeriodPickerController();
  @override
  void initState() {
    _controller.init(
        period: widget.periodOfTime, schedule: widget.serviceSchedule);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              child: Text(
                widget.title ?? '${_i18n()["title"]}',
                style: Get.textTheme.headline3,
              ),
            ),
            Divider(),
            const SizedBox(
              height: 15,
            ),
            // date picker
            Text(
              '${_i18n()["sDate"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            _datePicker(),
            // time pickers
            const SizedBox(
              height: 25,
            ),
            // date picker
            Text(
              '${_i18n()["startsAt"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Row(
                children: [
                  Flexible(
                      child: _hoursPicker(
                          value: _controller.startHours.value,
                          choices: _controller.getStartHours(),
                          callBack: (int? v) {
                            if (v != null) {
                              _controller.changeHours(hour: v, start: true);
                            }
                          })),
                  SizedBox(width: 15),
                  Flexible(
                      child: _minutesPicker(
                          value: _controller.startMinutes.value,
                          choices: _controller.getStartMinutes(),
                          callBack: (int? v) {
                            if (v != null) {
                              _controller.changeMinutes(
                                  minuteValue: v, start: true);
                            }
                          })),
                  SizedBox(width: 15),
                  Flexible(
                    child: _ampPmWidget(value: _controller.startAmpPm),
                  ),
                ],
              ),
            ),

            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${_i18n()["endsAt"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                            child: _hoursPicker(
                                value: _controller.endtHours.value,
                                choices: _controller.getEndtHours(),
                                callBack: (int? v) {
                                  if (v != null) {
                                    _controller.changeHours(
                                        hour: v, start: false);
                                  }
                                })),
                        SizedBox(width: 15),
                        Flexible(
                            child: _minutesPicker(
                                value: _controller.endMinutes.value,
                                choices: _controller.getEndMinutes(),
                                callBack: (int? v) {
                                  if (v != null) {
                                    _controller.changeMinutes(
                                        minuteValue: v, start: false);
                                  }
                                })),
                        SizedBox(width: 15),
                        Flexible(
                            child: _ampPmWidget(value: _controller.endAmPm)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Flexible(
                    child: MezButton(
                  label: '${_i18n()["cancel"]}',
                  backgroundColor: offRedColor,
                  textColor: Colors.red,
                  onClick: () async {
                    MezRouter.back();
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: MezButton(
                  label: widget.confirmBtnText ?? '${_i18n()["confirm"]}',
                  withGradient: true,
                  onClick: () async {
                    _controller.confirmCallBack();
                  },
                )),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ));
  }

  Container _datePicker() {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<DateTime>(
          decoration: _dropDownDecoration(
            label:
                "${DateFormat.MMMMEEEEd(userLangCode).format(_controller.pickedDate.value)}",
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
          ),
          value: _controller.pickedDate.value,
          onChanged: (DateTime? newValue) async {
            if (newValue != null) {
              _controller.changeDate(newValue);
            }
          },
          items: _controller.getDates
              .map<DropdownMenuItem<DateTime>>((DateTime value) {
            return DropdownMenuItem<DateTime>(
                value: value,
                child: Text(
                    "${DateFormat.MMMMEEEEd(userLangCode).format(value)}"));
          }).toList(),
        ),
      ),
    );
  }

  Widget _hoursPicker(
      {required int? value,
      required Function(int?)? callBack,
      required List<int> choices}) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: _dropDownDecoration(label: "hours"),
        value: value,
        onChanged: callBack,
        items: (choices).map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
              value: value,
              child:
                  Text(value.convertHoursToAmPm().toString().padLeft(2, "0")));
        }).toList(),
      ),
    );
  }

  Container _minutesPicker(
      {required int? value,
      required Function(int?)? callBack,
      required List<int> choices}) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: _dropDownDecoration(label: "minutes"),
        value: value,
        onChanged: callBack,
        items: (choices).map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
              value: value, child: Text(value.toString().padLeft(2, "0")));
        }).toList(),
      ),
    );
  }

  Container _ampPmWidget({required Rx<AmPmEnum> value}) {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<AmPmEnum>(
          decoration:
              _dropDownDecoration(label: "${value.value.toNormalString()}"),
          value: value.value,
          onChanged: null,
          iconSize: 0,
          items: [AmPmEnum.AM, AmPmEnum.PM]
              .map<DropdownMenuItem<AmPmEnum>>((AmPmEnum value) {
            return DropdownMenuItem<AmPmEnum>(
                value: value,
                child: Text(
                  value.toNormalString(),
                  style: TextStyle(color: Colors.black),
                ));
          }).toList(),
        ),
      ),
    );
  }

  InputDecoration _dropDownDecoration(
      {required String label, Widget? prefixIcon}) {
    return InputDecoration(
      filled: true,
      isDense: false,
      fillColor: Colors.grey.shade200,
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      label: Text(label),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }
}
