import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetWithBackButton extends StatefulWidget {
  WidgetWithBackButton({Key? key, required this.child, required this.hasImage})
      : super(key: key);
  final Widget child;
  final bool hasImage;

  @override
  State<WidgetWithBackButton> createState() => _WidgetWithBackButtonState();
}

class _WidgetWithBackButtonState extends State<WidgetWithBackButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          padding: EdgeInsets.only(
              right: Get.width - 90,
              bottom: widget.hasImage == true
                  ? Get.height - (kToolbarHeight * 4.5)
                  : Get.height - (kToolbarHeight * 4.5)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(103, 121, 254, 1),
                  )),
            ),
          )),
      body: widget.child,
    );
  }
}
