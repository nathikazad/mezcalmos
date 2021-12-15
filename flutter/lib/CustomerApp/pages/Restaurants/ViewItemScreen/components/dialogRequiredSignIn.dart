import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

void dialogRequiredSignIn() {
  Get.dialog(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 100,
      width: Get.width,
      child: Material(
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                  child: Container(
                child: Image.asset("assets/images/loginImg.jpg"),
              )),
              Container(
                width: Get.width,
                child: Text(
                  "Please before you go any further try to sign in and save this item in your cart.",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    Get.offNamedUntil(
                        kSignInRouteOptional, ModalRoute.withName("/wrapper"));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                    height: 45,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign me in ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    child:
                        Text("Not now ?", style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
