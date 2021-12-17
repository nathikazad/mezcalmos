import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
      if (widget.value != widget.minVal) {
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
        decoration: BoxDecoration(),
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
                        : Colors.grey.shade400,
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
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColorLight.withOpacity(0.2)),
              child: Center(
                child: Text("${widget.value}",
                    style: Theme.of(context).textTheme.headline2),
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
