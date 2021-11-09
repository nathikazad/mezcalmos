import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCellComponent extends StatelessWidget {
  final String url;
  final String title;
  final Widget? traillingIcon;
  const BasicCellComponent(
      {required this.url, required this.title, this.traillingIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 43,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
              child: Image.network(
                "$url",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Expanded(
              child: Container(
            child: Text("$title",
                style: const TextStyle(
                    color: const Color(0xff000f1c),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
          )),
          //Checks if the trailling icon have a null value
          (traillingIcon == null) ? Container() : traillingIcon!
        ],
      ),
    );
  }
}
