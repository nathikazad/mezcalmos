import 'package:flutter/material.dart';

class RidePriceControllHint extends StatelessWidget {
  final String hintText;

  RidePriceControllHint({required this.hintText});

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
            // style: Theme.of(context).textTheme.subtitle2,
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
