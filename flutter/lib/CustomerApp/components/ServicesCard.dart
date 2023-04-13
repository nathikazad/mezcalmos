import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.url,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String url;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final dynamic i18n = Get.find<LanguageController>().strings["CustomerApp"]
        ["components"]["ServicesCard"];
    return Card(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      color: onTap != null ? Colors.white : Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //================= title=============
                    Text("$title", style: textTheme.displaySmall),
                    //================ subtitle============
                    subtitle != null
                        ? Text("$subtitle", style: textTheme.titleMedium)
                        : Text(
                            "${i18n["comingSoon"]}",
                            style: textTheme.titleMedium,
                          )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 25.w,
                height: 20.w,
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
