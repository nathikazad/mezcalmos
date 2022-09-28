import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

AppBar mezCalmosAdminAppBar(BuildContext context) => AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(81, 132, 255, 1),
            Color.fromRGBO(206, 73, 252, 1)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      title: Container(
        height: Get.height,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(aLogoPath),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                  text: TextSpan(
                style: TextStyle(
                    fontFamily: 'psr',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: "MEZ",
                    style: TextStyle(
                      fontSize: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.fontSize,
                      // fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "ADMIN",
                    style: TextStyle(
                      fontSize: Theme.of(context)
                          .appBarTheme
                          .titleTextStyle
                          ?.fontSize,
                      //fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                      color: Color.fromARGB(255, 103, 122, 253),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
      // actions: [
      //   ActionButtons(Icons.notifications_outlined, true),
      //   ActionButtons(Icons.history_outlined)
      // ],
    );
