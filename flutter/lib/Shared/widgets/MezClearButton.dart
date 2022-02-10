import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

class MezClearButton extends StatelessWidget {
  final GestureTapCallback onTapFunction;
  MezClearButton({required this.onTapFunction, Key? key}) : super(key: key);

  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x33c5c5c5),
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: const Color(
              0xffffffff,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.delete_outline,
                size: 20,
                color: Color(0xffdb2846),
              ),
              Text(
                i18n.strings['customer']['restaurant']['cart']['clear'],
                style: TextStyle(
                    color: const Color(0xffdb2846),
                    fontWeight: FontWeight.w500,
                    fontFamily: "psr",
                    fontSize: 12.0),
              )
            ],
          ),
        ),
        onTap: () {
          onTapFunction();
        });
  }
}
