import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

typedef void OnValueChanged(int newValue);

class IncrementalComponent extends StatefulWidget {
  final OnValueChanged increment;
  final OnValueChanged decrement;
  final int incrementBy;
  final int decrementBy;
  final Color btnColors;
  final bool center;
  final int value;
  final int? maxVal;
  final int? minVal;
  final ValueChanged<bool>? onChangedToZero;
  const IncrementalComponent(
      {Key? key,
      required this.increment,
      required this.value,
      required this.decrement,
      this.incrementBy = 1,
      this.decrementBy = 1,
      this.center = false,
      this.btnColors = const Color(0xffac59fc),
      this.onChangedToZero,
      this.maxVal = 100,
      this.minVal = 0})
      : super(key: key);

  @override
  _IncrementalComponentState createState() => _IncrementalComponentState(value);
}

class _IncrementalComponentState extends State<IncrementalComponent> {
  int _value;
  _IncrementalComponentState(this._value);
  void _increment() {
    if (_value < widget.maxVal!)
      setState(() {
        _value += widget.incrementBy;
      });
    else
      return;
  }

  void _decrement() {
    if (_value != widget.minVal) {
      setState(() {
        _value -= widget.decrementBy;
      });
      if (_value == 0) {
        widget.onChangedToZero?.call(true);
      } else
        widget.onChangedToZero?.call(false);
    } else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: (_value > widget.minVal!)
                    ? const Color(0xffac59fc)
                    : Colors.grey.shade400,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 16.sp,
              )),
          onTap: (_value > widget.minVal!)
              ? () {
                  _decrement();
                  widget.decrement(_value);
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
          child: Text("$_value", style: Theme.of(context).textTheme.headline3),
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
            widget.increment(_value);
          },
        ),
      ],
    );
  }
}
