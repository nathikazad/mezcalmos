import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezcalmosSharedWidgets {

  static Image logo({double size = 20}) => Image.asset(aLogoPath , height: size, width: size, fit:  BoxFit.contain,);

  static RichText mezcalmos({double textSize = nDefaultMezcalmosTextSize}) =>  RichText
  (
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: textSize,
        fontWeight: FontWeight.w400
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


  static PreferredSizeWidget mezcalmosAppBar()
  {

    return AppBar(

      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 100,
      // leadingWidth: 55,
      // toolbarHeight: 65,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(size:40),
          Container(
            padding: const EdgeInsets.only(left:15), child: mezcalmos()
          )        
        ],
      ),
      
      // actions: [
      //   Transform.scale(
      //     scale: 0.85, 
      //     child: GestureDetector(
      //       onTap: () => print("Clicked back btn!"),
      //       child: Container(
      //       width: 45,
      //       height: 45,
      //       margin: EdgeInsets.only(top: 5, right: 10, bottom: 5),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //           // bottom-right : #f7eafb
      //           // top left : #edeffc
      //         gradient: LinearGradient(
      //           colors: [
      //             Color.fromARGB(255, 237, 239, 252),
      //             Color.fromARGB(255, 247, 234, 251),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight
      //           ),
      //         ),
      //         child: Icon(Icons.restore , color: Color.fromARGB(255, 117, 146, 254) , size: 20,),
      //       ),
      //     ),
      //   ),
      // ],

      leading: Transform.scale(
          scale: 0.8,
          child: GestureDetector(
            onTap: () => print("Clicked menu !"),
            child: Container(
              margin: EdgeInsets.only(top: 25, left: 10, bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
                gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 97, 127, 255),
                  Color.fromARGB(255, 198, 90, 252),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                ),
              ),
              child: Icon(Icons.menu , color: Colors.white , size: 20,),
            ),
          ),
        ) ,
    );

  } 
  
}