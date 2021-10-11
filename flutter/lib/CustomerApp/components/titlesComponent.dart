import 'package:flutter/material.dart';

class MenuTitles extends StatelessWidget {
  final String? title;
  const MenuTitles({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text("$title",
          style: const TextStyle(
              color: const Color(0x93000000),
              fontWeight: FontWeight.w700,
              fontFamily: "ProductSans",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.center),
    );
  }
}
