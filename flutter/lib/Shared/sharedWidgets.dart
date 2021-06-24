import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezcalmosSharedWidgets {

  static Image logo = Image.asset(aLogoPath);

  static RichText mezcalmos({double textSize = nDefaultMezcalmosTextSize}) =>  RichText
  (
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: textSize,
        fontWeight: FontWeight.bold
    ),

    children: <TextSpan>[
      const TextSpan(text: tMez),
      const TextSpan(
        text: tCalmos,
        style: TextStyle(
          color: Color.fromARGB(255, 103, 122, 253),
        ),
      ),
    ],
  ));



  
  
}