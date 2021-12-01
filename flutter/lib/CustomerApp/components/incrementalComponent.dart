import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class IncrementalComponent extends StatefulWidget {
  final GestureTapCallback increment;
  final GestureTapCallback decrement;
  int value;
  final int? maxVal;
  final int? minVal;
  final ValueChanged<bool>? onChangedToZero;
  IncrementalComponent(
      {Key? key,
      required this.increment,
      required this.value,
      required this.decrement,
      this.onChangedToZero,
      this.maxVal = 100,
      this.minVal = 0})
      : super(key: key);

  @override
  _IncrementalComponentState createState() => _IncrementalComponentState();
}

class _IncrementalComponentState extends State<IncrementalComponent> {
  @override
  Widget build(BuildContext context) {
    void _increment() {
      print("the max value is ${widget.maxVal}");
      if (widget.value < widget.maxVal!)
        setState(() {
          widget.value++;
        });
      else
        return;
    }

    void _decrement() {
      print("the max value is ${widget.minVal}");
      if (widget.value != 1) {
        mezDbgPrint("the component value ${widget.value}");
        setState(() {
          widget.value--;
        });
        if (widget.value == 0) {
          print("the value ${widget.value}");
          widget.onChangedToZero?.call(true);
        } else
          widget.onChangedToZero?.call(false);
        mezDbgPrint("the component value ${widget.value}");
      } else
        return;
    }

    return Container(
      child: Container(
        //padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(4)),
            // border: Border.all(
            //     color: const Color(0x4d5c7fff), width: 0.20000000298023224),
            // color: Color.fromRGBO(239, 238, 253, 1)
            // gradient: LinearGradient(
            //     begin: Alignment(0.1689453125, 0),
            //     end: Alignment(1, 1),
            //     colors: [const Color(0x1a5582ff), const Color(0x1ac54efc)]),
            ),
        child: Row(
          children: [
            InkWell(
              child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: (widget.value > widget.minVal!)
                        ? const Color(0xffac59fc)
                        : Colors.black,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              onTap: (widget.value > widget.minVal!)
                  ? () {
                      _decrement();
                      widget.decrement();
                    }
                  : null,
            ),
            SizedBox(
              width: 7,
            ),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: const Color.fromRGBO(237, 237, 237, 1),
              ),
              child: Center(
                child: Text("${widget.value}",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w400,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                    textAlign: TextAlign.left),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            InkWell(
              child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: const Color(0xffac59fc),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              onTap: () {
                _increment();
                widget.increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
