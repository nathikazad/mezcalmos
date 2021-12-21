import 'package:flutter/material.dart';

class WorkingHoursCart extends StatelessWidget {
  final String? day;
  final String? openHour;
  final String? closeHour;
  final bool? isOpen;
  const WorkingHoursCart(
      {Key? key, this.day, this.openHour, this.closeHour, this.isOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 80,
              child: Text(day!),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: isOpen!
                      ? Color.fromRGBO(101, 225, 137, 0.6)
                      : Color.fromRGBO(252, 89, 99, 0.6),
                  child: Center(child: Text(isOpen! ? "Open" : "Closed")),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(children: [
                Spacer(),
                isOpen!
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Text("$openHour"),
                            SizedBox(
                              width: 5,
                            ),
                            Text("$closeHour")
                          ],
                        ),
                      )
                    : Container(),
              ])),
        ],
      ),
    );
  }
}
