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
      {super.key, required this.onDeliveryTypeChanged});
  final ValueChanged<DeliveryType> onDeliveryTypeChanged;

  @override
  State<CustDeliveryTypeSelector> createState() =>
      _CustDeliveryTypeSelectorState();
}

class _CustDeliveryTypeSelectorState extends State<CustDeliveryTypeSelector> {
  Rx<DeliveryType> selectedValue = Rx(DeliveryType.Delivery);

  RxList<DeliveryType> types =
      RxList([DeliveryType.Delivery, DeliveryType.Pickup, DeliveryType.SitIn]);
  @override
  void initState() {
    //  _checkOpenCompanies();
    super.initState();
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
        MezStringDropDown(
          value: selectedValue.value.toFirebaseFormatString(),
          fillColor: Colors.white,
          elementsTextStyle: context.textTheme.bodyLarge,
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
