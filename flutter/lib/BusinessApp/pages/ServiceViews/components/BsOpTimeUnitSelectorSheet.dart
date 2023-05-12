import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['services']["price"];

Future<TimeUnit?> bsOpTimeUnitSelectorSheet({
  required BuildContext context,
  required List<TimeUnit> units,
}) async {
  TimeUnit? timeUnit = await showModalBottomSheet<TimeUnit>(
      context: context,
      builder: (BuildContext context) {
        Rxn<TimeUnit> selected = Rxn();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  _i18n()["priceType"],
                  style: context.textTheme.bodyLarge,
                ),
              ),
              Divider(
                height: 35,
              ),
              Column(
                children: units.map((TimeUnit timeUnit) {
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            _i18n()[timeUnit.toFirebaseFormatString()],
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                        Obx(
                          () => radioCircleButton(
                              onTap: (bool v) {
                                if (!v) {
                                  selected.value = timeUnit;
                                } else {
                                  selected.value = null;
                                }
                              },
                              value: timeUnit == selected.value),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              bigSeperator,
              Row(
                children: [
                  Flexible(
                      child: MezButton(
                    label:  _i18n()["cancel"],
                    backgroundColor: offRedColor,
                    textColor: redAccentColor,
                    onClick: () async {
                      Navigator.pop(context);
                    },
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: MezButton(
                    label:  _i18n()["add"],
                    onClick: () async {
                      if (selected.value != null) {
                        Navigator.pop(context, selected.value);
                      }
                    },
                  ))
                ],
              ),
            ],
          ),
        );
      });
  return timeUnit;
}
