import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WebServicesCard extends StatelessWidget {
  const WebServicesCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.url,
    required this.imageSize,
    required this.titleSize,
    required this.subtitleSize,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String url;
  final double titleSize;
  final double subtitleSize;
  final double imageSize;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final dynamic i18n = Get.find<LanguageController>().strings["CustomerApp"]
    //     ["components"]["ServicesCard"];
    return Card(
      margin: EdgeInsets.all(5),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //================= title=============
                    Container(
                      padding: const EdgeInsets.all(3),
                      alignment: Alignment.centerLeft,
                      child: Text("$title",
                          style: textTheme.headline3!.copyWith(
                              fontSize: titleSize,
                              color: Colors.black,
                              fontFamily: "Poppins")),
                    ),
                    //================ subtitle============
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      alignment: Alignment.centerLeft,
                      // padding:
                      //     subtitle == null ? EdgeInsets.only(left: 10) : null,
                      child: subtitle != null
                          ? Text("$subtitle",
                              style: textTheme.subtitle1!.copyWith(
                                  fontSize: subtitleSize,
                                  color: Colors.black45,
                                  fontFamily: "Nunito"))
                          : Text("Coming Soon",
                              style: textTheme.subtitle1!.copyWith(
                                  fontSize: subtitleSize,
                                  color: Colors.black45,
                                  fontFamily: "Nunito")),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: imageSize,
                height: imageSize,
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
