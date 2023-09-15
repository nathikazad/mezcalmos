import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["CustDeliveryTypeSelector"];

class CustDeliveryTypeSelector extends StatefulWidget {
  const CustDeliveryTypeSelector(
      {super.key, required this.onDeliveryTypeChanged, required this.types});
  final ValueChanged<DeliveryType> onDeliveryTypeChanged;
  final List<DeliveryType> types;

  @override
  State<CustDeliveryTypeSelector> createState() =>
      _CustDeliveryTypeSelectorState();
}

class _CustDeliveryTypeSelectorState extends State<CustDeliveryTypeSelector> {
  Rx<DeliveryType> selectedValue = Rx(DeliveryType.Delivery);

  @override
  void initState() {
    selectedValue.value = widget.types.first;
    //  _checkOpenCompanies();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustDeliveryTypeSelector oldWidget) {
    selectedValue.value = widget.types.first;
    super.didUpdateWidget(oldWidget);
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
        (widget.types.length > 1)
            ? MezStringDropDown(
                value: selectedValue.value.toFirebaseFormatString(),
                fillColor: Colors.white,
                elementsTextStyle: context.textTheme.bodyLarge,
                items: widget.types
                    .map((DeliveryType element) =>
                        element.toFirebaseFormatString())
                    .toList(),
                onChanged: (String? v) {
                  mezDbgPrint("Changed value =>$v");
                  final DeliveryType dvType = v.toString().toDeliveryType();
                  widget.onDeliveryTypeChanged.call(dvType);
                },
                labelText: "${_i18n()['dvType']}",
                langPath: _i18n(),
              )
            : Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text(
                    "${_i18n()[selectedValue.value.toFirebaseFormatString()]}",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
        meduimSeperator
      ],
    );
  }
}
