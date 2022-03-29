import 'package:flutter/material.dart';

class RidePriceControllHint extends StatelessWidget {
  final String hintText;

  const RidePriceControllHint({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Center(
          child: Text(
            hintText,
            // style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 10,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
