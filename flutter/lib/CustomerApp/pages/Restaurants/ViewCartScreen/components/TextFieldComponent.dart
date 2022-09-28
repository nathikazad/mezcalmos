import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController textController;
  final String? hint;
  final Function? onChangeCallback;

  const TextFieldComponent({
    required this.textController,
    this.hint,
    this.onChangeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 343,
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: const Color(0xffececec), width: 0.5),
        color: const Color(0xd0ffffff),
      ),
      child: TextField(
        style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
        controller: textController,
        onChanged: (String value) {
          if (onChangeCallback != null) onChangeCallback?.call(value);
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: const Color(0xffb4b4b4),
              fontWeight: FontWeight.w400,
              fontFamily: "ProductSans",
              fontStyle: FontStyle.normal,
              fontSize: 16.0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
