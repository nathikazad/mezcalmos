import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MezSwitch extends StatefulWidget {
  // this was the problem.
  bool initialPosition;
  final List<String> values;
  final ValueChanged<int> onToggleCallback;
  final Color backgroundColor;
  final Size buttonSize;
  @required
  Color buttonColor;
  @required
  Color textColor;

  MezSwitch({
    required this.initialPosition,
    required this.values,
    required this.onToggleCallback,
    required this.buttonSize,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });
  @override
  _MezSwitchState createState() => _MezSwitchState();
}

class _MezSwitchState extends State<MezSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: widget.buttonSize.height,
      height: widget.buttonSize.width,
      // margin: EdgeInsets.all(0),
      child: Stack(
        // fit: StackFit.loose,
        alignment: Alignment.center,
        fit: StackFit.passthrough,

        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                widget.initialPosition = !widget.initialPosition;
                int index = 0;
                if (!widget.initialPosition) {
                  index = 1;
                }
                widget.onToggleCallback(index);
                if (widget.initialPosition)
                  widget.buttonColor = Colors.green;
                else
                  widget.buttonColor = Colors.red;
              });
            },
            child: Container(
              height: 80,
              decoration: ShapeDecoration(
                // color: Colors.black,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: <Color>[
                      Color.fromARGB(10, 81, 133, 255),
                      Color.fromARGB(10, 207, 73, 252)
                    ]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(widget.values.length, (int index) {
                  return Text(
                    widget.values[index],
                    style: TextStyle(
                      fontFamily: 'psb',
                      fontSize: Get.width * 0.040,
                      // fontWeight: FontWeight.bold,
                      color: index == 0 ? Colors.green : Colors.red,
                    ),
                  );
                }),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment: widget.initialPosition
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              transformAlignment: Alignment.topLeft,
              height: widget.buttonSize.height,
              width: widget.buttonSize.width,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                widget.initialPosition ? widget.values[0] : widget.values[1],
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
