import 'package:flutter/material.dart';

class IncomingOrdersStatus extends StatelessWidget {
  final Widget? childData;
  final IconData? iconData;
  final String errorText;
  final String? secondLine;

  const IncomingOrdersStatus({
    this.childData,
    this.secondLine,
    this.iconData,
    required this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        childData ??
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(237, 237, 237, 1),
              ),
              child: Center(
                child: Icon(
                  iconData,
                  color: Colors.black,
                  // size: 13,
                ),
              ),
            ),
        SizedBox(height: 7),
        Text(
          errorText,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        if (secondLine != null)
          Text(
            secondLine!,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color.fromRGBO(120, 120, 120, 1),
            ),
          )
      ],
    );
  }
}
