import 'package:flutter/material.dart';
import 'package:get/get.dart';

savedLocationDailog({required Function function}) async {
  return await Get.defaultDialog(
      radius: 4,
      title: "",
      content: Column(
        children: [
          Container(
            child: Text("Save Location",
                style: const TextStyle(
                    color: const Color(0xff000f1c),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
                "If you give a name, you cansave the location for future use.",
                style: const TextStyle(
                    color: const Color(0xff1d1d1d),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                textAlign: TextAlign.center),
          ),
          Container(
            width: 173,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: const Color(0xffececec), width: 0.5),
                color: const Color(0xfff8f8f8)),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Location Name",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          InkWell(
            child: Container(
              width: 88,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x332362f1),
                        offset: Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment(0.1689453125, 0),
                      end: Alignment(1, 1),
                      colors: [
                        const Color(0xff5582ff),
                        const Color(0xffc54efc)
                      ])),
              child: Text("Ok",
                  style: const TextStyle(
                      color: const Color(0xfffff4f4),
                      fontWeight: FontWeight.w700,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
            ),
            onTap: function(),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ));
}
