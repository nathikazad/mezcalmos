import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/controller/BsOtherServiceViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['services']['otherService'];

class BsOpOtherServiceSelector extends StatefulWidget {
  final OtherServiceItems? value;
  final String label;
  final List<OtherServiceItems> items;
  final void Function(OtherServiceItems?) onChanged;
  final String? Function(OtherServiceItems?)? validator;

  const BsOpOtherServiceSelector({
    this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.validator,
  });

  @override
  _BsOpOtherServiceSelectorState createState() =>
      _BsOpOtherServiceSelectorState();
}

class _BsOpOtherServiceSelectorState extends State<BsOpOtherServiceSelector> {
  OtherServiceItems? _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant BsOpOtherServiceSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("build BsOpOtherServiceSelector ========>$_selectedValue");
    return DropdownButtonFormField<OtherServiceItems>(
      value: _selectedValue,
      selectedItemBuilder: (BuildContext context) {
        return widget.items.map<Widget>((OtherServiceItems item) {
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
          .map((OtherServiceItems item) => DropdownMenuItem(
                value: item,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${_i18n()[item.title]}",
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      "${_i18n()[item.subTitle]}",
                    ),
                    Divider(),
                  ],
                ),
              ))
          .toList(),
      onChanged: (OtherServiceItems? value) {
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
