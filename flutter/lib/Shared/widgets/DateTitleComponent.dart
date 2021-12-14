import 'package:flutter/material.dart';

class DateTitleComponent extends StatelessWidget {
  final String date;
  final Widget? dateIcon;
  const DateTitleComponent({required this.date, this.dateIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
                      style: Theme.of(context).textTheme.bodyText2))
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
