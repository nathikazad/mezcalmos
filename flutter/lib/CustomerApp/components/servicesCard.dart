import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:get/get.dart';

class ServicesCard extends StatelessWidget {
  ServicesCard(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.url,
      this.ontap})
      : super(key: key);
  final String title;
  final String? subtitle;
  final String url;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    LanguageController lang = Get.find<LanguageController>();
    return Card(
      margin: EdgeInsets.all(5),
      color: subtitle != null ? Colors.white : Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //================= title=============
                    Container(
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.centerLeft,
                      child: Text("${title}",
                          style: txt.headline1!.copyWith(fontSize: 20.sp)),
                    ),
                    //================ subtitle============
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      alignment: Alignment.centerLeft,
                      // padding:
                      //     subtitle == null ? EdgeInsets.only(left: 10) : null,
                      child: subtitle != null
                          ? Text(
                              "${subtitle}",
                              style: txt.subtitle1!.copyWith(fontSize: 13.7.sp),
                            )
                          : Text(
                              "${lang.strings['customer']['home']['laundry']["subtitle"]}",
                              style: txt.subtitle1!.copyWith(
                                  fontSize: 13.7.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 80.h,
                height: 80.h,
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
