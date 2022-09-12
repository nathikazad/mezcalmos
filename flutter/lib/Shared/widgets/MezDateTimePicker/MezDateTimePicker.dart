import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/Controllers/MezDateTimePickerController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezDateTimePicker"];

//
class MezDateTimePicker extends StatefulWidget {
  const MezDateTimePicker(
      {Key? key,
      required this.startDate,
      required this.numberOfDaysInterval,
      required this.serviceSchedule,
      required this.pickerMode,
      this.title,
      this.periodOfTime,
      this.isPeriodic = false,
      this.confirmBtnText})
      : super(key: key);
  final DateTime? startDate;
  final bool isPeriodic;
  final PeriodOfTime? periodOfTime;
  final int numberOfDaysInterval;
  final Schedule serviceSchedule;
  final String? title;
  final String? confirmBtnText;
  final MezTimePickerMode pickerMode;

  @override
  State<MezDateTimePicker> createState() => _MezDateTimePickerState();
}

class _MezDateTimePickerState extends State<MezDateTimePicker> {
  MezDateTimePickerController _controller = MezDateTimePickerController();
  @override
  void initState() {
    _controller.init(
        initialDate: widget.startDate,
        numberOfdays: widget.numberOfDaysInterval,
        period: widget.isPeriodic,
        mode: widget.pickerMode,
        initPeriod: widget.periodOfTime,
        schedule: widget.serviceSchedule);
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
            Obx(
              () => Text(
                (_controller.periodic.isTrue)
                    ? "Starts at "
                    : '${_i18n()["sTime"]}',
                style: Get.textTheme.bodyText1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Row(
                children: [
                  Flexible(
                      child: _hoursPicker(
                          value: (_controller.periodic.isTrue)
                              ? _controller.startHours.value
                              : _controller.hours.value,
                          choices: (_controller.periodic.isTrue)
                              ? _controller.getStartHours
                              : null,
                          callBack: (int? v) {
                            if (v != null) {
                              _controller.changeHours(hour: v, start: true);
                            }
                          })),
                  SizedBox(width: 15),
                  Flexible(
                      child: _minutesPicker(
                          value: (_controller.periodic.isTrue)
                              ? _controller.startMinutes.value
                              : _controller.minutes.value,
                          choices: (_controller.periodic.isTrue)
                              ? _controller.getStartMinutes
                              : null,
                          callBack: (int? v) {
                            if (v != null) {
                              _controller.changeMinutes(
                                  minuteValue: v, start: true);
                            }
                          })),
                  SizedBox(width: 15),
                  Flexible(
                      child: _ampPmWidget(
                          value: (_controller.periodic.isTrue)
                              ? _controller.startAmpPm
                              : _controller.amPmValue)),
                ],
              ),
            ),

            if (_controller.periodic.isTrue)
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ends at ",
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
                                  choices: _controller.getEndtHours,
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
                                  choices: _controller.getEndMinutes,
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
                    Get.back();
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
                "${DateFormat.MMMMEEEEd(userLangCode).format(_controller.pickedDate.value!)}",
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
      List<int>? choices}) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration:
            _dropDownDecoration(label: "${_controller.hours.value ?? "hours"}"),
        value: value,
        onChanged: callBack,
        items: (choices ?? _controller.getHours)
            .map<DropdownMenuItem<int>>((int value) {
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
      List<int>? choices}) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: _dropDownDecoration(
            label: "${_controller.minutes.value ?? "minutes"}"),
        value: value,
        onChanged: callBack,
        items: (choices ?? _controller.getMinutes)
            .map<DropdownMenuItem<int>>((int value) {
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