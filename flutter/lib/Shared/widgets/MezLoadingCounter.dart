import 'package:flutter/material.dart';

typedef void OnCounterChange(int);

class MezLoadingCounter extends StatefulWidget {
  final Function() onCounterEnd;
  final OnCounterChange? onCounterChange;
  final int counterDurationInSeconds;
  final double circleSize;
  final Widget? childInsideCounter;
  final double loadingLineHeight;
  final double? manualCounterValue;
  final bool reversed;
  MezLoadingCounter(
      {required this.onCounterEnd,
      this.counterDurationInSeconds = 30,
      required this.circleSize,
      this.childInsideCounter,
      this.onCounterChange,
      this.manualCounterValue,
      this.reversed = false,
      this.loadingLineHeight = 20});

  @override
  _MezLoadingCounterState createState() => _MezLoadingCounterState();
}

class _MezLoadingCounterState extends State<MezLoadingCounter> {
  int _lastCount = 0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: widget.reversed
            ? Tween(begin: 1.0, end: 0.0)
            : Tween(begin: 0.0, end: 1.0),
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
                      startAngle: widget.reversed ? 1.0 : 0.0,
                      endAngle: 3.14 * 2,
                      stops: [widget.manualCounterValue ?? value, 0.0],
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
                    width: widget.circleSize - widget.loadingLineHeight,
                    height: widget.circleSize - widget.loadingLineHeight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 236, 236, 236)),
                    child: widget.childInsideCounter ??
                        Center(
                          child: Text(_currentCount.toInt().toString()),
                        ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
