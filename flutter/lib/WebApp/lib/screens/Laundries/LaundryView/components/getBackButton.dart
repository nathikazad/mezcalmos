import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

Widget BackButtonAppBar({double? scale = 0.6, double? padding = 0}) {
  return Transform.scale(
    scale: scale,
    child: InkWell(
      onTap: () {
        QR.back();
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 216, 225, 249),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 97, 127, 255),
            Color.fromARGB(255, 198, 90, 252),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Container(
          padding: EdgeInsets.all(padding!),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
