import 'dart:math';
import 'package:flutter/material.dart';

typedef void OnCounterChange(int counterValue);

class MezLoadingCounter extends StatefulWidget {
  final void Function() onCounterEnd;
  final OnCounterChange? onCounterChange;
  final int counterDurationInSeconds;
  final double circleSize;
  final Widget? childInsideCounter;
  final double loadingLineHeight;
  final bool reversed;
  const MezLoadingCounter(
      {required this.onCounterEnd,
      this.counterDurationInSeconds = 30,
      required this.circleSize,
      this.childInsideCounter,
      this.onCounterChange,
      this.reversed = false,
      this.loadingLineHeight = 20});

  @override
  _MezLoadingCounterState createState() => _MezLoadingCounterState();
}

class _MezLoadingCounterState extends State<MezLoadingCounter> {
  int _lastCount = 0;

  // PS : Keep this here i will need it in Future.
  double dp(double val, int places) {
    final num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: widget.reversed
            ? Tween<double>(begin: 1.0, end: 0.0)
            : Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(seconds: widget.counterDurationInSeconds),
        onEnd: widget.onCounterEnd,
        builder: (BuildContext ctx, double value, Widget? child) {
          // for our onCounterChange callback
          final int _currentCount =
              (value * widget.counterDurationInSeconds).toInt();
          // double _precisedValue = (dp(value, 3) * 10) - (value * 10).toInt();
          if (_currentCount != _lastCount) {
            widget.onCounterChange?.call(_currentCount);
            _lastCount = _currentCount;
          }
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ShaderMask(
                  shaderCallback: (Rect rect) {
                    return SweepGradient(
                      startAngle: widget.reversed ? 1.0 : 0.0,
                      endAngle: pi * 2,
                      stops: <double>[value, 0],
                      center: Alignment.center,
                      colors: <Color>[
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
