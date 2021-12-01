import 'package:flutter/material.dart';

class MenuTitles extends StatelessWidget {
  final String? title;
  const MenuTitles({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text("$title", style: txt.headline3!, textAlign: TextAlign.center),
    );
  }
}
