import 'package:flutter/material.dart';

class NoUserNameSetHint extends StatelessWidget {
  final String hintText;

  NoUserNameSetHint({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            hintText,
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 10,
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
