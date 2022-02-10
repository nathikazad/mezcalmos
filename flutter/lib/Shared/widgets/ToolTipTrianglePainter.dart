import 'package:flutter/material.dart';

class ToolTipTrianglePainter extends CustomPainter {
  Color backGroundColor;

  ToolTipTrianglePainter({required this.backGroundColor});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backGroundColor;

    var path = Path();
    path.lineTo(-10, 0);
    path.lineTo(0, 25);
    path.lineTo(25, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
