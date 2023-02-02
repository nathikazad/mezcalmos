import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/controllers/DeliverySettingsViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['DeliveryCostSettingView'];

class DeliverySettingCostComponent extends StatefulWidget {
  const DeliverySettingCostComponent({super.key, required this.viewController});
  final DeliverySettingsViewController viewController;

  @override
  State<DeliverySettingCostComponent> createState() =>
      _DeliverySettingCostComponentState();
}

class _DeliverySettingCostComponentState
    extends State<DeliverySettingCostComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: widget.viewController.getFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _costComponent(
                        controller: widget.viewController.freeKmRange,
                        suffixTitle: 'Km',
                        title: "${_i18n()['freeKmRange']}"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${_i18n()['freeKmRangeText']}",
                      style: Get.textTheme.bodyText2,
                    ),
                    Divider(
                      height: 35,
                    ),
                  ],
                ),
                _costComponent(
                    controller: widget.viewController.minCost,
                    suffixTitle: '\$',
                    title: "${_i18n()['minCost']}"),
                const SizedBox(
                  height: 15,
                ),
                _costComponent(
                    controller: widget.viewController.costPerKm,
                    suffixTitle: '\$/Km',
                    title: "${_i18n()['costPerKm']}"),
              ],
            ),
          ),
        ),
        _previewWidget(),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

  Widget _previewWidget() {
    return Container(
      color: secondaryLightBlueColor,
      margin: EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()['preview']}"),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "${_i18n()['custDistance']}",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  flex: 1,
                  child: TextFormField(
                    onChanged: (String v) {
                      if (v.isEmpty) {
                        widget.viewController.previewCost.value = null;
                      } else if (widget.viewController.canCalculate) {
                        widget.viewController.calculatePreview();
                      }
                    },
                    controller: widget.viewController.distancePreview,
                    textAlignVertical: TextAlignVertical.center,
                    style: Get.textTheme.bodyText1,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    decoration: InputDecoration(
                        suffixIconConstraints:
                            BoxConstraints.tightFor(width: 50, height: 20),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            "Km",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText2,
                          ),
                        ),
                        fillColor: Colors.white),
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_i18n()['cost']}",
                style: Get.textTheme.bodyText1,
              ),
              Obx(
                () => Text(
                  widget.viewController.previewCost.value
                          ?.toPriceString(rounded: false) ??
                      "_",
                  style: Get.textTheme.bodyText1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _costComponent(
      {required String title,
      required String suffixTitle,
      required TextEditingController controller}) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            title,
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 1,
            child: TextFormField(
              controller: controller,

              validator: (String? value) {
                if (value == null || double.tryParse(value) == null) {
                  return "${_i18n()['numberError']}";
                }
                return null;
              },
              style: Get.textTheme.bodyText1,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              //  textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  suffixIconConstraints:
                      BoxConstraints.tightFor(width: 50, height: 20),
                  suffixIcon: Text(
                    suffixTitle,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyText2,
                  ),
                  fillColor: secondaryLightBlueColor),
            ))
      ],
    );
  }
}
