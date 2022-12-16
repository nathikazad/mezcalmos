import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class IncrementalComponent extends StatefulWidget {
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  final Color btnColors;
  final Color minusIconColor;
  final bool center;
  final Color? onMinValueBtnColor;
  int value;
  double size;
  final int maxVal;
  final int minVal;
  final Function? onChangedToZero;
  final MainAxisAlignment alignment;
  final bool? isWeb;
  IncrementalComponent(
      {Key? key,
      required this.incrementCallback,
      required this.value,
      required this.decrementCallback,
      this.onMinValueBtnColor,
      this.alignment = MainAxisAlignment.start,
      this.center = false,
      this.minusIconColor = Colors.white,
      this.btnColors = primaryBlueColor,
      this.onChangedToZero,
      this.size = 16,
      this.maxVal = 100,
      this.isWeb = false,
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
                        ? widget.btnColors
                        : widget.onMinValueBtnColor ?? Colors.grey),
                child: Icon(
                  Icons.remove,
                  color: (widget.value > widget.minVal)
                      ? Colors.white
                      : widget.minusIconColor,
                  size: widget.size,
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
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(),
          child: Text("${widget.value}",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: widget.isWeb! ? 18 : null)),
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
                size: widget.size,
                color: (widget.btnColors == primaryBlueColor)
                    ? Colors.white
                    : primaryBlueColor,
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
