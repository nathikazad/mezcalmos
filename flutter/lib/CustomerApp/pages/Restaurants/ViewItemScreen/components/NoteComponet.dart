import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

class NoteComponent extends StatefulWidget {
  NoteComponent({Key? key}) : super(key: key);

  @override
  _NoteComponentState createState() => _NoteComponentState();
}

class _NoteComponentState extends State<NoteComponent> {
  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();

    final txt = Theme.of(context).textTheme;
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              lang.strings['customer']['restaurant']['menu']['notes'],
              style: txt.headline2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(229, 229, 229, 1)),
            height: 2,
            width: Get.width,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(237, 237, 237, 1)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 99,
            child: TextField(
              decoration: InputDecoration(
                hintText: lang.strings['customer']['restaurant']['menu']
                    ['notes'],
                hintStyle: TextStyle(
                    color: const Color(0xffb4b4b4),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
