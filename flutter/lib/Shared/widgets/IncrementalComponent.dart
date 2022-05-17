import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:sizer/sizer.dart';

class IncrementalComponent extends StatefulWidget {
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  final Color btnColors;
  final bool center;
  final Color? onMinValueBtnColor;
  int value;
  final int maxVal;
  final int minVal;
  final Function? onChangedToZero;
  final MainAxisAlignment alignment;
  IncrementalComponent(
      {Key? key,
      required this.incrementCallback,
      required this.value,
      required this.decrementCallback,
      this.onMinValueBtnColor,
      this.alignment = MainAxisAlignment.start,
      this.center = false,
      this.btnColors = const Color(0xffac59fc),
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
    return Row(
      mainAxisAlignment: widget.alignment,
      children: <Widget>[
        InkWell(
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: (widget.value > widget.minVal)
                        ? lightCustomerAppColor
                        : widget.onMinValueBtnColor ?? Colors.grey),
                child: Icon(
                  Icons.remove,
                  color: customerAppColor,
                  size: 16.sp,
                )),
            onTap: () {
              if (widget.value > widget.minVal) {
                widget.decrementCallback();
              } else if (widget.value == widget.minVal) {
                widget.onChangedToZero?.call();
              }
            }),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(),
          child: Text("${widget.value}",
              style: Theme.of(context).textTheme.headline3),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.btnColors,
              ),
              child: Icon(
                Icons.add,
                size: 16.sp,
                color: customerAppColor,
              )),
          onTap: () {
            if (widget.value < widget.maxVal) {
              widget.incrementCallback();
            }
          },
        ),
      ],
    );
  }
}
