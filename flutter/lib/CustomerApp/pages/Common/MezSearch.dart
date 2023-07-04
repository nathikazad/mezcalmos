import 'package:flutter/material.dart';

class MezSearch extends StatelessWidget {
  const MezSearch(
      {super.key,
      required this.onChanged,
      this.margin = const EdgeInsets.all(8)});
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: onChanged),
    );
  }
}
