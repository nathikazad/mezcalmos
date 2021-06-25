import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MezcalmosSwitch extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  @required Color buttonColor;
  @required Color textColor;

  MezcalmosSwitch({
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });
  @override
  _MezcalmosSwitchState createState() => _MezcalmosSwitchState();
}

class _MezcalmosSwitchState extends State<MezcalmosSwitch> {
  bool initialPosition = true;

  // Color offColorUnselected = Colors.red;
  // Color onColorUnselected = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.31,
      height: Get.width * 0.13,
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
                if (initialPosition) widget.buttonColor = Colors.green;
                else widget.buttonColor = Colors.red;
              });
            },
            child: Container(

              width: Get.width * 0.31,
              height: Get.width * 0.13,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
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
                      fontFamily: 'Rubik',
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color:  index == 0 ? Colors.green : Colors.red,
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
              width: Get.width * 0.18,
              height: Get.width * 0.13,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: Get.width * 0.045,
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