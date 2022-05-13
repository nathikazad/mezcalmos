import 'package:flutter/material.dart';

class RidePriceControllHint extends StatelessWidget {
  final String hintText;

  const RidePriceControllHint({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          hintText,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15,
            color: Color.fromRGBO(103, 121, 254, 1),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
          softWrap: true,
          maxLines: 10,
        ),
      ),
    );
  }
}
