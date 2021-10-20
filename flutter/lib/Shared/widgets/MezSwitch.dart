import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MezSwitch extends StatefulWidget {
  final initialPosition;
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  @required
  Color buttonColor;
  @required
  Color textColor;

  MezSwitch({
    required this.initialPosition,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });
  @override
  _MezSwitchState createState() => _MezSwitchState();
}

class _MezSwitchState extends State<MezSwitch> {
  bool initialPosition = false;

  @override
  void initState() {
    super.initState();
    initialPosition = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: 125,
      height: 65,
      // margin: EdgeInsets.all(0),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              // I missed the old setState hhhh
              setState(() {
                if (initialPosition)
                  widget.buttonColor = Colors.green;
                else
                  widget.buttonColor = Colors.red;
              });
            },
            child: Container(
              // width: 130,
              height: 80,
              decoration: ShapeDecoration(
                // color: widget.backgroundColor,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: <Color>[
                      Color.fromARGB(10, 81, 133, 255),
                      Color.fromARGB(10, 207, 73, 252)
                    ]),
                // color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  widget.values.length,
                  (index) => Text(
                    widget.values[index],
                    style: TextStyle(
                      fontFamily: 'psb',
                      fontSize: Get.width * 0.040,
                      // fontWeight: FontWeight.bold,
                      color: index == 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              transformAlignment: Alignment.topLeft,
              // width: Get.width * 0.16,
              // height: Get.width * 0.13,
              height: 80,
              width: 72,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: Get.width * 0.040,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
