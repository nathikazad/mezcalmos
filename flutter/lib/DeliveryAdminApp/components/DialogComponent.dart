import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<bool> dialogComponent(
  String title,
  String subTitle,
  Function onConfirm,
  Function onCancel,
  Widget? icon,
  LinearGradient onConformBGColor,
) async {
  return await Get.defaultDialog(
    radius: 10,
    title: "",
    content: Container(
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (icon == null)
              ? Container(
                  child: Icon(
                    Icons.highlight_off,
                    size: 65,
                    color: Color(0xffdb2846),
                  ),
                )
              : icon,
          SizedBox(
            height: 10,
          ),
          Text("$title",
              style: const TextStyle(
                  color: const Color(0xff000f1c),
                  fontWeight: FontWeight.w700,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 8,
          ),
          Text("$subTitle",
              style: const TextStyle(
                  color: const Color(0xff1d1d1d),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x2eff0000),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      gradient: onConformBGColor,
                    ),
                    child: Center(
                      child: Text("Yes",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    onConfirm();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x334c504a),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xfffdfdfd),
                    ),
                    child: Center(
                      child: Text("No",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    // Get.back();
                    onCancel();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}

Future<num> orderWeightDialog(
  String title,
  String subTitle,
  Function onConfirm,
  Function onCancel,
  Widget? icon,
  LinearGradient onConformBGColor,
) async {
  num orderWeight = 0;
  return await Get.defaultDialog(
    radius: 10,
    title: "",
    content: Container(
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (icon == null)
              ? Container(
                  child: Icon(
                    Icons.highlight_off,
                    size: 65,
                    color: Color(0xffdb2846),
                  ),
                )
              : icon,
          SizedBox(
            height: 15,
          ),
          Text("$title",
              style: const TextStyle(
                  color: const Color(0xff000f1c),
                  fontWeight: FontWeight.w700,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 8,
          ),
          Text("$subTitle",
              style: const TextStyle(
                  color: const Color(0xff1d1d1d),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ],
            onChanged: (value) {
              orderWeight = num.parse(value);
            },
            decoration: InputDecoration(
                label: Text('Order weight'),
                filled: true,
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x2eff0000),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      gradient: onConformBGColor,
                    ),
                    child: Center(
                      child: Text("Yes",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    if (orderWeight != 0) {
                      Get.back(result: orderWeight);
                    } else {
                      Get.snackbar('Error', 'Please Provide a valid weight ');
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x334c504a),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xfffdfdfd),
                    ),
                    child: Center(
                      child: Text("No",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    // Get.back();
                    Get.back(result: 0);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}
