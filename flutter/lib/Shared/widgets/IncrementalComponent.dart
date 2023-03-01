import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class IncrementalComponent extends StatefulWidget {
  final Future<void> Function() incrementCallback;
  final Future<void> Function() decrementCallback;

  final Color btnColors;
  final Color minusIconColor;
  final bool center;
  final Color? onMinValueBtnColor;
  int value;
  double size;
  final int maxVal;
  final int minVal;
  final Future<void> Function()? onChangedToZero;
  final MainAxisAlignment alignment;
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
      this.minVal = 0})
      : super(key: key);

  @override
  _IncrementalComponentState createState() => _IncrementalComponentState();
}

class _IncrementalComponentState extends State<IncrementalComponent> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.alignment,
      children: <Widget>[
        InkWell(
            child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isLoading) ? Colors.grey.shade300 : widget.btnColors,
                ),
                child: Icon(
                  Icons.remove,
                  color: (isLoading) ? Colors.white : widget.minusIconColor,
                  size: widget.size,
                )),
            onTap: (isLoading)
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (widget.value > widget.minVal) {
                      await widget.decrementCallback().whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    } else if (widget.value == widget.minVal) {
                      await widget.onChangedToZero
                          ?.call()
                          .whenComplete(() => setState(() {
                                isLoading = false;
                              }));
                    }
                  }),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(),
          child: (isLoading)
              ? Transform.scale(scale: 0.5, child: CircularProgressIndicator())
              : Text("${widget.value}",
                  style: Theme.of(context).textTheme.bodyLarge),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isLoading) ? Colors.grey.shade300 : widget.btnColors,
              ),
              child: Icon(
                Icons.add,
                size: widget.size,
                color: (isLoading)
                    ? Colors.white
                    : (widget.btnColors == primaryBlueColor)
                        ? Colors.white
                        : primaryBlueColor,
              )),
          onTap: (isLoading)
              ? null
              : () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (widget.value < widget.maxVal) {
                    await widget
                        .incrementCallback()
                        .whenComplete(() => setState(() {
                              isLoading = false;
                            }));
                  }
                },
        ),
      ],
    );
  }
}
