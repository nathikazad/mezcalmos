import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DateTitleComponent extends StatelessWidget {
  final String date;
  final Widget? dateIcon;
  const DateTitleComponent({required this.date, this.dateIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              (dateIcon == null) ? Container() : dateIcon!,
              Container(
                alignment: Alignment.centerLeft,
                padding: (dateIcon != null)
                    ? const EdgeInsets.symmetric(horizontal: 5)
                    : const EdgeInsets.all(0),
                child: Text("$date",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w700,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
