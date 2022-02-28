import 'package:flutter/material.dart';

typedef void OnCounterChange(int);

class MezLoadingCounter extends StatefulWidget {
  final Function() onCounterEnd;
  final OnCounterChange? onCounterChange;
  final int counterDurationInSeconds;
  final double circleSize;
  final Widget? childInsideCounter;

  MezLoadingCounter(
      {required this.onCounterEnd,
      required this.counterDurationInSeconds,
      required this.circleSize,
      this.childInsideCounter,
      this.onCounterChange});

  @override
  _MezLoadingCounterState createState() => _MezLoadingCounterState();
}

class _MezLoadingCounterState extends State<MezLoadingCounter> {
  int _lastCount = 0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: widget.counterDurationInSeconds),
        onEnd: widget.onCounterEnd,
        builder: (ctx, double value, child) {
          // for our onCounterChange callback
          int _currentCount = (value * widget.counterDurationInSeconds).toInt();
          if (_currentCount != _lastCount) {
            widget.onCounterChange?.call(_currentCount);
            _lastCount = _currentCount;
          }
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 3.14 * 2,
                      stops: [value, 0.0],
                      center: Alignment.center,
                      colors: [
                        Color.fromARGB(255, 172, 89, 252),
                        Colors.transparent
                      ],
                    ).createShader(rect);
                  },
                  child: Container(
                      width: widget.circleSize,
                      height: widget.circleSize,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white)),
                ),
                Center(
                  child: Container(
                    width: widget.circleSize - 20,
                    height: widget.circleSize - 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 236, 236, 236)),
                    child: widget.childInsideCounter ??
                        Center(
                          child: Text((value * widget.counterDurationInSeconds)
                              .toInt()
                              .toString()),
                        ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
