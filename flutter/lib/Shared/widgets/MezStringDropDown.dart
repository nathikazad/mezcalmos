import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class MezStringDropDown extends StatefulWidget {
  final String labelText;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final Map<String, dynamic> langPath;
  final bool withNoneItem;
  final TextStyle? elementsTextStyle;

  const MezStringDropDown({
    required this.labelText,
    required this.langPath,
    this.withNoneItem = false,
    this.value,
    this.elementsTextStyle,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  _MezStringDropDownState createState() => _MezStringDropDownState();
}

class _MezStringDropDownState extends State<MezStringDropDown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    mezDbgPrint("widget.value =================>>>>>${widget.value}");
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant MezStringDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorMaxLines: 2,
        alignLabelWithHint: false,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        //  border: OutlineInputBorder(),
      ),
      items: (widget.withNoneItem ? widget.items + ["none"] : widget.items)
          .map((String item) => DropdownMenuItem(
                value: item,
                child: Text("${widget.langPath['$item']}",
                    style: widget.elementsTextStyle),
              ))
          .toList(),
      onChanged: (String? value) {
        if (value == "none") {
          _selectedValue = null;
          widget.onChanged(null);
        } else {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged(value);
        }
      },
      validator: widget.validator,
    );
  }
}
