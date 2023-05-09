import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['cusShowBusinessFilerSheet'];

typedef FilterInput = Map<String, List<String>>;
Future<FilterInput?> cusShowBusinessFilerSheet({
  required BuildContext context,
  required FilterInput filterInput,
  required FilterInput defaultFilterInput,
}) async {
  RxMap<String, List<String>> selectedFilters = RxMap<String, List<String>>({});
  filterInput.forEach((String key, List<String> value) {
    selectedFilters[key] = List.from(value);
  });

  return showModalBottomSheet<Map<String, List<String>>?>(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '${_i18n()['filter']}',
                  style: context.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(defaultFilterInput.entries.length,
                      (int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultFilterInput.values.elementAt(index).length == 1
                            ? SizedBox.shrink()
                            : Text(
                                '${_i18n()[defaultFilterInput.keys.elementAt(index)]}',
                                style: context.textTheme.bodyLarge,
                              ),
                        defaultFilterInput.values.elementAt(index).length == 1
                            ? SizedBox.shrink()
                            : SizedBox(
                                height: 15,
                              ),
                        defaultFilterInput.values.elementAt(index).length == 1
                            ? SizedBox.shrink()
                            : Column(
                                children: List.generate(
                                    defaultFilterInput.values
                                        .elementAt(index)
                                        .length, (int subIndex) {
                                  String actualSubItem = defaultFilterInput
                                      .values
                                      .elementAt(index)[subIndex];

                                  return CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    //    checkColor: primaryBlueColor,
                                    activeColor: primaryBlueColor,
                                    title: Text('${_i18n()[actualSubItem]}'),

                                    value: selectedFilters[defaultFilterInput
                                                .keys
                                                .elementAt(index)]
                                            ?.contains(actualSubItem) ??
                                        false,
                                    onChanged: (bool? v) {
                                      mezDbgPrint(
                                          "selected ==> $selectedFilters");
                                      mezDbgPrint("main one ===>$filterInput");
                                      if (v == true) {
                                        selectedFilters.update(
                                            defaultFilterInput.keys
                                                .elementAt(index),
                                            (List<String> value) {
                                          value.add(actualSubItem);
                                          return value;
                                        });
                                      } else {
                                        mezDbgPrint("false");
                                        selectedFilters.update(
                                            defaultFilterInput.keys
                                                .elementAt(index),
                                            (List<String> value) {
                                          value.remove(actualSubItem);
                                          return value;
                                        });
                                        // selectedFilters.values
                                        //     .elementAt(index)
                                        //     .remove(actualSubItem);
                                      }
                                      mezDbgPrint(
                                          "selected ==> $selectedFilters");
                                      mezDbgPrint("main one ===>$filterInput");
                                      mezDbgPrint(selectedFilters[
                                              defaultFilterInput.keys
                                                  .elementAt(index)]
                                          ?.contains(actualSubItem));
                                      selectedFilters.refresh();
                                    },
                                  );
                                }),
                              ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      child: MezButton(
                          height: 45,
                          borderColor: redAccentColor,
                          textStyle: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: redAccentColor),
                          label: '${_i18n()['cancel']}',
                          backgroundColor: Colors.transparent,
                          textColor: redAccentColor,
                          onClick: () async {
                            //   viewController.resetFilter();
                            Navigator.pop(
                              context,
                            );
                          })),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: MezButton(
                          height: 45,
                          withGradient: true,
                          label: '${_i18n()['confirm']}',
                          onClick: () async {
                            Navigator.pop(
                              context,
                              selectedFilters.value,
                            );
                          })),
                ],
              )
            ],
          ),
        );
      });
}
