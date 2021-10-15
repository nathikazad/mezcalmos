import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

Widget restaurantAppBarComponent(String type, Function? func) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    // height: 48,
    decoration: BoxDecoration(
      color: const Color(0xa3fbfbfb),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(81, 132, 255, 1),
                Color.fromRGBO(206, 73, 252, 1)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: (type == "back")
                ? Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.white,
                  )
                : Container(),
          ),
          onTap: (type == "back")
              ? () {
                  Get.back();
                }
              : func!(),
        ),
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 29,
                  width: 29,
                  child: Image.asset(aLogoPath),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'psr',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: "MEZ",
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "CALMOS",
                        style: TextStyle(
                          fontSize: 20,
                          //fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                          color: Color.fromARGB(255, 103, 122, 253),
                        ),
                      ),
                    ],
                  )),
                ),
                Spacer()
              ],
            ),
          ),
        ),
        Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.10000000149011612,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment(0.1689453125, 0),
                      end: Alignment(1, 1),
                      colors: [
                        const Color(0xff5582ff),
                        const Color(0xffc54efc)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                child: Icon(
                  Icons.mail_outline,
                  size: 18,
                  color: Color(0xff5582ff),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment(0.1689453125, 0),
                end: Alignment(1, 1),
                colors: [
                  const Color(0xff5582ff).withOpacity(0.10000000149011612),
                  const Color(0xffc54efc).withOpacity(0.10000000149011612)
                ],
              ),
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 18,
              color: Color(0xff5582ff),
            ),
          ),
          onTap: () {
            print("hey");
            Get.toNamed(kCartRoute);
            // Get.to(ViewCartScreen(),
            //);
          },
        ),
        SizedBox(
          width: 10,
        )
      ],
    ),
  );
}
