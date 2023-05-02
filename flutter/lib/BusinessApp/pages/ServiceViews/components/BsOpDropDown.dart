import 'package:flutter/material.dart';

class BsOpDropdown extends StatefulWidget {
  final String labelText;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  const BsOpDropdown({
    required this.labelText,
    this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  _BsOpDropdownState createState() => _BsOpDropdownState();
}

class _BsOpDropdownState extends State<BsOpDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        //  border: OutlineInputBorder(),
      ),
      items: widget.items
          .map((String item) => DropdownMenuItem(
                value: item,
                child: Text("item"),
              ))
          .toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged(value);
      },
      validator: widget.validator,
    );
  }
}
