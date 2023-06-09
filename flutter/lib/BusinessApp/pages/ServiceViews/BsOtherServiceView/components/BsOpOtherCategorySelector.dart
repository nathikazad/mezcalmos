import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/controller/BsOtherServiceViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['services']['otherService'];

class BsOpOtherCategorySelector extends StatefulWidget {
  final OtherCategoryItems? value;
  final String label;
  final List<OtherCategoryItems> items;
  final void Function(OtherCategoryItems?) onChanged;
  final String? Function(OtherCategoryItems?)? validator;

  const BsOpOtherCategorySelector({
    this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.validator,
  });

  @override
  _BsOpOtherCategorySelectorState createState() =>
      _BsOpOtherCategorySelectorState();
}

class _BsOpOtherCategorySelectorState extends State<BsOpOtherCategorySelector> {
  OtherCategoryItems? _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant BsOpOtherCategorySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("build BsOpOtherServiceSelector ========>$_selectedValue");
    return DropdownButtonFormField<OtherCategoryItems>(
      value: _selectedValue,
      selectedItemBuilder: (BuildContext context) {
        return widget.items.map<Widget>((OtherCategoryItems item) {
          return Text(
            "${_i18n()[item.title]}",
            style: context.textTheme.bodyLarge,
          );
        }).toList();
      },
      decoration: InputDecoration(
        labelText: "${_i18n()[widget.label]}",
      ),
      isExpanded: true,
      items: widget.items
          .map((OtherCategoryItems item) => DropdownMenuItem(
                value: item,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${_i18n()[item.title]}",
                      style: context.textTheme.bodyLarge,
                    ),
                    Divider(),
                  ],
                ),
              ))
          .toList(),
      onChanged: (OtherCategoryItems? value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged(value);
        mezDbgPrint("DROPDOWN: ${value?.title} ${_selectedValue?.title}");
      },
      validator: widget.validator,
    );
  }
}
