import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["CustDeliveryTypeSelector"];

class CustDeliveryTypeSelector extends StatefulWidget {
  const CustDeliveryTypeSelector(
      {super.key, required this.onDeliveryTypeChanged});
  final ValueChanged<DeliveryType> onDeliveryTypeChanged;

  @override
  State<CustDeliveryTypeSelector> createState() =>
      _CustDeliveryTypeSelectorState();
}

class _CustDeliveryTypeSelectorState extends State<CustDeliveryTypeSelector> {
  Rx<DeliveryType> selectedValue = Rx(DeliveryType.Delivery);
  RxBool hasOpenCompanies = RxBool(true);

  RxList<DeliveryType> types =
      RxList([DeliveryType.Delivery, DeliveryType.Pickup]);
  @override
  void initState() {
    _checkOpenCompanies();
    super.initState();
  }

  Future<void> _checkOpenCompanies() async {
    hasOpenCompanies.value = await get_open_dv_companies();
    if (!hasOpenCompanies.value) {
      selectedValue.value = DeliveryType.Pickup;
      types.remove(DeliveryType.Delivery);
    }
    widget.onDeliveryTypeChanged.call(selectedValue.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        meduimSeperator,
        Text(
          "${_i18n()['dvType']}",
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        Obx(() {
          if (hasOpenCompanies.isFalse) {
            return Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.help_outline_outlined,
                      size: 14.mezSp,
                    ),
                  )),
                  TextSpan(
                      text:
                          "No open delivery companies or no drivers are online currently so only in-store pickup available",
                      style: context.textTheme.bodyMedium)
                ])),
                smallSepartor
              ],
            );
          } else
            return SizedBox();
        }),
        MezStringDropDown(
          value: selectedValue.value.toFirebaseFormatString(),
          items: types
              .map((DeliveryType element) => element.toFirebaseFormatString())
              .toList(),
          onChanged: (String? v) {
            mezDbgPrint("Changed value =>$v");
            final DeliveryType dvType = v.toString().toDeliveryType();
            widget.onDeliveryTypeChanged.call(dvType);
          },
          labelText: "${_i18n()['dvType']}",
          langPath: _i18n(),
        ),
        meduimSeperator
      ],
    );
  }
}
