import 'package:flutter/material.dart';

class OrderTimeTopBar extends StatelessWidget {
  String barText;
  final bool withArrowIcon;
  OrderTimeTopBar({Key? key, required this.barText, this.withArrowIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xAFAFAF).withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(3, 3),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.watch_later,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            barText,
            softWrap: false,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          if (withArrowIcon) ...[
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 18,
            )
          ]
        ],
      ),
    );
  }
}
