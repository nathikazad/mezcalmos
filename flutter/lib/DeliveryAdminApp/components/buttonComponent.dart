import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  final Widget? widget;
  final LinearGradient? gradient;
  final GestureTapCallback? function;
  ButtonComponent({this.widget, this.gradient, this.function});

  @override
  _ButtonComponentState createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  bool _clickedButton = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x332362f1),
                      offset: Offset(0, 6),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                gradient: widget.gradient == null
                    ? LinearGradient(colors: [Colors.white])
                    : widget.gradient!),
            child: Center(
                child: widget.widget == null
                    ? null
                    : getWidgetOrShowLoading(widget.widget!))),
        onTap: widget.function == null
            ? () => null
            : () {
                if (!_clickedButton) {
                  // set true to show loading button
                  setState(() {
                    _clickedButton = true;
                  });

                  widget.function!();

                  // after function done set to back to false
                  setState(() {
                    _clickedButton = false;
                  });
                }
              },
      ),
    );
  }

  Widget getWidgetOrShowLoading(Widget desiredWidget) {
    if (!_clickedButton) {
      return desiredWidget;
    } else {
      return Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      );
    }
  }
}
