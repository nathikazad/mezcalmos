import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlevar_router/qlevar_router.dart';

class UnfoundPageScreen extends StatefulWidget {
  UnfoundPageScreen({Key? key}) : super(key: key);

  @override
  State<UnfoundPageScreen> createState() => _UnfoundPageScreenState();
}

class _UnfoundPageScreenState extends State<UnfoundPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "this page not found 404",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  QR.to("/restaurants");
                },
                child:
                    Text("Go To Restaurants", style: TextStyle(fontSize: 15))),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  QR.to("/laundries");
                },
                child: Text("Go To Laundries", style: TextStyle(fontSize: 15))),
          ],
        ),
      ),
    );
  }
}
