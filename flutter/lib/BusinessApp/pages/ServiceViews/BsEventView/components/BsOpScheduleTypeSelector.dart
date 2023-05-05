import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/controllers/BsEventViewController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsOpScheduleTypeSelector extends StatefulWidget {
  final ScheduleTypeInput? value;
  final String label;
  final List<ScheduleTypeInput> items;
  final void Function(ScheduleTypeInput?) onChanged;
  final String? Function(ScheduleTypeInput?)? validator;

  const BsOpScheduleTypeSelector({
    this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.validator,
  });

  @override
  _BsOpScheduleTypeSelectorState createState() =>
      _BsOpScheduleTypeSelectorState();
}

class _BsOpScheduleTypeSelectorState extends State<BsOpScheduleTypeSelector> {
  ScheduleTypeInput? _selectedValue;

  @override
  void initState() {
    super.initState();
  
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant BsOpScheduleTypeSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ScheduleTypeInput>(
      value: _selectedValue,
      selectedItemBuilder: (BuildContext context) {
        return widget.items.map<Widget>((ScheduleTypeInput schedule) {
          return Text(
            schedule.title,
            style: context.textTheme.bodyLarge,
          );
        }).toList();
      },
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      isExpanded: true,
      items: widget.items
          .map((ScheduleTypeInput item) => DropdownMenuItem(
                value: item,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      item.subtitle,
                    ),
                  ],
                ),
              ))
          .toList(),
      onChanged: (ScheduleTypeInput? value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged(value);
      },
      validator: widget.validator,
    );
  }
}
