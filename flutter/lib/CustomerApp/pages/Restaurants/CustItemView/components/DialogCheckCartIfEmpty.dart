import 'package:flutter/material.dart';
import 'package:get/get.dart';

void dialogCheckCartIfEmpty({
  required Function checkoutFunc,
  required overwriteFunc,
}) {
  Get.defaultDialog<void>(
    title: "Warning",
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.warning_amber,
              color: Colors.yellow,
              size: 70,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "You already have some items in your cart, Would you like to discard to them ?",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        checkoutFunc();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300]),
                        height: 30,
                        child: Text("Checkout"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        overwriteFunc();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[800]),
                        height: 30,
                        child: Text(
                          "Overwrite",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
