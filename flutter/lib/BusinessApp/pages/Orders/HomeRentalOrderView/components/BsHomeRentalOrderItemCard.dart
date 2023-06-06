import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/controllers/BsHomeRentalOrderViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["BusinessApp"]["pages"]["Orders"]
        ["HomeRentalOrderView"]["components"]["BsHomeRentalOrderItemCard"];

class BsHomeRentalOrderItemCard extends StatelessWidget {
  const BsHomeRentalOrderItemCard(
      {super.key, required this.item, required this.viewController});
  final BusinessOrderItem item;
  final BsHomeRentalOrderViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        item.item?.firstImage ?? "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.item?.name.getTranslation(userLanguage) ??
                            "${_i18n()['error']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 9),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (item.parameters.guests != null) ...[
                            Icon(Icons.people),
                            SizedBox(width: 5),
                            Text(
                                item.parameters.guests?.toString() ??
                                    "${_i18n()['error']}",
                                style: context.textTheme.bodyLarge),
                            SizedBox(width: 10),
                          ],
                          if (item.parameters.numberOfUnits != null &&
                              item.parameters.numberOfUnits != null) ...[
                            Icon(Icons.calendar_today),
                            Text(
                                "${item.parameters.numberOfUnits} ${item.parameters.timeUnit?.toReadableString()}",
                                style: context.textTheme.bodyLarge),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.parameters.previousCost != null) ...[
                        Icon(
                          Icons.price_check,
                          color: offLightShadeGreyColor,
                        ),
                        SizedBox(width: 3),
                        Text(
                          item.parameters.previousCost!.toPriceString(),
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: offLightShadeGreyColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                      Icon(Icons.price_check),
                      SizedBox(width: 3),
                      Text(
                        item.cost.toPriceString(),
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                MezIconButton(
                  onTap: () async {
                    await _showPriceSheet(
                        context: context, initPrice: item.cost.toDouble());
                  },
                  icon: Icons.edit_outlined,
                  elevation: 0,
                  backgroundColor: Colors.grey.shade300,
                  iconColor: Colors.black,
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.start,
                    runSpacing: 5,
                    children: [
                      if (item.parameters.previoustime != null)
                        Row(
                          children: [
                            Icon(
                              Icons.event_busy,
                              color: offLightShadeGreyColor,
                            ),
                            SizedBox(width: 3),
                            Text(
                              DateTime.tryParse(item.parameters.previoustime!)
                                      ?.getOrderTime() ??
                                  "${_i18n()['error']}",
                              style: context.textTheme.bodyLarge?.copyWith(
                                  color: offLightShadeGreyColor,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          if (item.parameters.previoustime != null)
                            Icon(Icons.arrow_forward),
                          Icon(Icons.event_available_rounded),
                          SizedBox(width: 3),
                          Text(
                            DateTime.tryParse(item.time ?? "")
                                    ?.getOrderTime() ??
                                "${_i18n()['error']}",
                            style: context.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MezIconButton(
                  onTap: () async {
                    await _showTimeSheet(
                        context: context,
                        initDate: DateTime.tryParse(item.time ?? "") ??
                            DateTime.now());
                  },
                  icon: Icons.edit_outlined,
                  backgroundColor: Colors.grey.shade300,
                  iconColor: Colors.black,
                  elevation: 0,
                )
              ],
            ),
            Divider(),
            if (item.available == true)
              MezInkwell(
                icon: Icons.remove_circle_outlined,
                label: "${_i18n()['markAsUnavailable']}",
                onClick: () async {
                  await viewController.updateItemAvailability(
                      itemId: item.itemId, newAvailability: false);
                },
              )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showPriceSheet(
      {required BuildContext context, required num initPrice}) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController priceText = TextEditingController();
    priceText.text = initPrice.toString();
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_i18n()['updatePrice']}",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: priceText,
                        style: context.textTheme.bodyLarge,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.black,
                          ),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "${_i18n()['required']}";
                          } else if (double.tryParse(v) == null) {
                            return "${_i18n()['notValid']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['save']}",
                              onClick: () async {
                                if (formKey.currentState?.validate() == true) {
                                  await viewController.updateItemPrice(
                                      itemId: item.itemId,
                                      newPrice: double.parse(priceText.text));
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['cancel']}",
                              backgroundColor: offRedColor,
                              textColor: Colors.red,
                              onClick: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  Future<dynamic> _showTimeSheet(
      {required BuildContext context, required DateTime initDate}) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController dateText = TextEditingController();
    dateText.text = initDate.getOrderTime();
    DateTime newDate = DateTime(initDate.year, initDate.month, initDate.day,
        initDate.hour, initDate.minute);
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_i18n()['updateTimeTitle']}",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("${_i18n()['startFrom']}",
                          style: context.textTheme.bodyLarge),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: dateText,
                        onTap: () {
                          getDatePicker(
                            context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 30)),
                          ).then((DateTime? dateValue) {
                            if (dateValue != null) {
                              getTimePicker(context,
                                      initialTime: TimeOfDay.now())
                                  .then((TimeOfDay? timeValue) {
                                if (timeValue != null) {
                                  newDate = DateTime(
                                      dateValue.year,
                                      dateValue.month,
                                      dateValue.day,
                                      timeValue.hour,
                                      timeValue.minute);
                                  dateText.text = newDate.getOrderTime();
                                }
                              });
                            }
                          });
                        },
                        style: context.textTheme.bodyLarge,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.black,
                          ),
                        ),
                        readOnly: true,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return "${_i18n()['required']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['save']}",
                              onClick: () async {
                                if (formKey.currentState?.validate() == true) {
                                  await viewController.updateItemTime(
                                      itemId: item.itemId.toInt(),
                                      newTime: newDate);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MezButton(
                              height: 45,
                              label: "${_i18n()['cancel']}",
                              backgroundColor: offRedColor,
                              textColor: Colors.red,
                              onClick: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
