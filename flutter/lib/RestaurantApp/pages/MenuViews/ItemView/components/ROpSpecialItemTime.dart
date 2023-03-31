import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/widgets/MezPeriodPicker/MezPeriodPicker.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpSpecialItemTime"];

//
class ROpSpecialItemTime extends StatefulWidget {
  const ROpSpecialItemTime({Key? key, required this.viewController})
      : super(key: key);
  final ROpItemViewController viewController;

  @override
  State<ROpSpecialItemTime> createState() => _ROpSpecialItemTimeState();
}

class _ROpSpecialItemTimeState extends State<ROpSpecialItemTime> {
  Rxn<PeriodOfTime> periodTime = Rxn();
  @override
  void initState() {
    if (widget.viewController.editMode.isTrue) {
      mezDbgPrint(
          "Edit mode ========>${widget.viewController.periodOfTime.value}");

      periodTime.value = widget.viewController.periodOfTime.value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_i18n()["itemAv"]}',
          style: context.txt.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        FormField(validator: (Object? v) {
          if (widget.viewController.periodOfTime.value == null) {
            return '${_i18n()["required"]}';
          }
          return null;
        }, builder: (FormFieldState<Object?> state) {
          return Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0,
                  color: Colors.grey.shade200,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.watch_later,
                              size: 16.sp,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                _getFormattedString(),
                                style: context.txt.bodyMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                            Icon(Icons.chevron_right)
                          ],
                        )),
                    onTap: () {
                      // Todo hasura @m66are
                      if (widget.viewController.schedule.value != null) {
                        showModalBottomSheet<PeriodOfTime>(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext ctx) {
                              return MezPeriodPicker(
                                startDate: DateTime.now(),
                                numberOfDaysInterval: 7,
                                periodOfTime: periodTime.value,
                                serviceSchedule:
                                    widget.viewController.schedule.value!,
                              );
                            }).then((PeriodOfTime? value) {
                          if (value != null) {
                            periodTime.value = value;
                            widget.viewController.periodOfTime.value = value;
                            widget.viewController.startDay.value = value.start;
                            widget.viewController.endDate.value = value.end;
                          }
                        });
                      }
                    },
                  ),
                ),
                if (!state.isValid)
                  Container(
                      margin: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        state.errorText?.toString().inCaps ?? "",
                        style:
                            context.txt.subtitle1?.copyWith(color: Colors.red),
                      )),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  String _getFormattedString() {
    String data = '${_i18n()["selectTime"]}';
    if (widget.viewController.periodOfTime.value != null) {
      data = widget.viewController.periodOfTime.value!.toString();
    }
    return data;
  }
}
