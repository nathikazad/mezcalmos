import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    return Row(
      children: [
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: (widget.value > widget.minVal!)
                    ? const Color(0xffac59fc)
                    : Colors.grey.shade400,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 16.sp,
              )),
          onTap: (widget.value > widget.minVal!)
              ? () {
                  _decrement();
                  widget.decrement();
                }
              : null,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColorLight.withOpacity(0.2)),
          child: Flexible(
            child: Text("${widget.value}",
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffac59fc),
              ),
              child: Icon(
                Icons.add,
                size: 16.sp,
                color: Colors.white,
              )),
          onTap: () {
            _increment();
            widget.increment();
          },
        ),
      ],
    );
  }
}
