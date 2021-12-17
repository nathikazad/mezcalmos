import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Card(
      margin: EdgeInsets.all(5),
      color: subtitle != null ? Colors.white : Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                // width: Get.width * 0.7 - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //================= title=============
                    Container(
                      padding: const EdgeInsets.all(7),
                      alignment: Alignment.centerLeft,
                      child: Text("${title}",
                          style: txt.headline1!.copyWith(fontSize: 20.sp)),
                    ),
                    //================ subtitle============
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          subtitle == null ? EdgeInsets.only(left: 10) : null,
                      child: subtitle != null
                          ? Text(
                              "${subtitle}",
                              style: txt.subtitle1!.copyWith(fontSize: 13.7.sp),
                            )
                          : Text(
                              "Comming soon ...",
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
                width: 100.w,
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
