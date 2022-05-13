import 'package:flutter/material.dart';

class ToolTipTrianglePainter extends CustomPainter {
  Color backGroundColor;

  ToolTipTrianglePainter({required this.backGroundColor});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backGroundColor;

    var path = Path();
    path.lineTo(-15, 0);
    path.lineTo(0, 18);
    path.lineTo(15, 0);
    path.close();

    // var _path = Path();
    // _path.lineTo(-20, 0);
    // _path.lineTo(1, 40);
    // _path.lineTo(20, 1);
    // _path.close();

    canvas.drawPath(path, paint);
    // canvas.drawShadow(_path, Colors.black, 4.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
