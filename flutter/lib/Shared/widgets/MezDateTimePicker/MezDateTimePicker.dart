import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
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
      this.title,
      this.confirmBtnText})
      : super(key: key);
  final DateTime startDate;
  final int numberOfDaysInterval;
  final Schedule serviceSchedule;
  final String? title;
  final String? confirmBtnText;

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
        schedule: widget.serviceSchedule);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
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
              '${_i18n()["sTime"]}',
              style: Get.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Flexible(child: _hoursPicker()),
                  SizedBox(width: 15),
                  Flexible(child: _minutesPicker()),
                  SizedBox(width: 15),
                  Flexible(child: _ampPmWidget()),
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
              height: 25,
            ),
          ],
        ));
  }

  Container _datePicker() {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<DateTime>(
          decoration: _dropDownDecoration(
            label:
                "${DateFormat.MMMMEEEEd(userLangCode).format(widget.startDate)}",
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
          ),
          value: _controller.pickedDate.value,
          onChanged: (DateTime? newValue) async {
            if (newValue != null) {
              _controller.pickedDate.value = newValue;
              _controller.setTime();
              _controller.setAmPm();
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

  Widget _hoursPicker() {
    return Obx(
      () => Container(
        child: DropdownButtonFormField<int>(
          decoration: _dropDownDecoration(
              label: "${_controller.hours.value ?? "hours"}"),
          value: _controller.hours.value,
          onChanged: (int? newValue) async {
            if (newValue != null) {
              _controller.hours.value = newValue;
              _controller.minutes.value = _controller.getMinutes.first;
              _controller.setAmPm();
            }
          },
          items: _controller.getHours.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
                value: value,
                child: Text(
                    value.convertHoursToAmPm().toString().padLeft(2, "0")));
          }).toList(),
        ),
      ),
    );
  }

  Container _minutesPicker() {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<int>(
          decoration: _dropDownDecoration(
              label: "${_controller.minutes.value ?? "minutes"}"),
          value: _controller.minutes.value,
          onChanged: (int? newValue) async {
            if (newValue != null) {
              _controller.minutes.value = newValue;
            }
          },
          items: _controller.getMinutes.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
                value: value, child: Text(value.toString().padLeft(2, "0")));
          }).toList(),
        ),
      ),
    );
  }

  Container _ampPmWidget() {
    return Container(
      child: Obx(
        () => DropdownButtonFormField<AmPmEnum>(
          decoration: _dropDownDecoration(
              label: "${_controller.amPmValue.value.toNormalString()}"),
          value: _controller.amPmValue.value,
          onChanged: null,
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

  List<DateTime> _constructDateChoices() {
    final List<DateTime> dates = [widget.startDate];
    for (int i = 1; i < widget.numberOfDaysInterval; i++) {
      dates.add(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + i,
      ));
    }

    return dates;
  }
}
