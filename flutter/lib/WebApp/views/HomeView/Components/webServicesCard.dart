import 'package:flutter/material.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class WebServicesCard extends StatelessWidget {
  const WebServicesCard(
      {Key? key,
      required this.firstUrlImage,
      required this.secondUrlImage,
      required this.thirdUrlImage,
      required this.title,
      required this.subtitle,
      required this.btnText,
      required this.func})
      : super(key: key);

  final String firstUrlImage;
  final String secondUrlImage;
  final String thirdUrlImage;

  final String title;
  final String subtitle;
  final Function func;
  final String btnText;
  // final String url;
  // final double titleSize;
  // final double subtitleSize;
  // final double imageSize;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return Card(
      color: Colors.white,
      child: Container(
        width: MezCalmosResizer.isMobile(context) ||
                MezCalmosResizer.isSmallMobile(context)
            ? Get.width
            : null,
        child: Column(
          children: [
            SizedBox(
              height: getSizeForSpaceBetweenItems(context) * 2,
            ),
            Container(
              width: getSizeForImages(context),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: getSizeForImage(context),
                      width: getSizeForImage(context),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(firstUrlImage)),
                    ),
                  ),
                  Positioned(
                    left: (getSizeForImage(context) * 3) * 0.25,
                    child: Container(
                      height: getSizeForImage(context),
                      width: getSizeForImage(context),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(secondUrlImage)),
                    ),
                  ),
                  Positioned(
                    left: (getSizeForImage(context) * 3) * 0.5,
                    child: Container(
                      height: getSizeForImage(context),
                      width: getSizeForImage(context),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(thirdUrlImage)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getSizeForSpaceBetweenItems(context),
            ),
            //title
            Container(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: getSizeForTitle(context)),
              ),
            ),
            SizedBox(
              height: getSizeForSpaceBetweenItems(context),
            ),
            Container(
              width: getSizeForImages(context),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(73, 73, 73, 1),
                    fontFamily: "Nunito",
                    fontSize: getSizeForSubtitle(context)),
              ),
            ),
            SizedBox(
              height: getSizeForSpaceBetweenItems(context),
            ),

            Container(
              child: InkWell(
                onTap: () {
                  func();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: getSizeForBtnText(context) * 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(279),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment(1, 0.5),
                        end: Alignment(-0.75, 0.75),
                        colors: [
                          Color.fromRGBO(172, 89, 252, 1),
                          Color.fromRGBO(103, 121, 254, 1)
                        ]),
                  ),
                  child: Center(
                      child: Text(
                    "View current restaurants",
                    style: txt.bodyText1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: getSizeForBtnText(context),
                        fontFamily: "Montserrat"),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: getSizeForSpaceBetweenItems(context) * 2,
            )
          ],
        ),
      ),
    );
    // final dynamic i18n = Get.find<LanguageController>().strings["CustomerApp"]
    //     ["components"]["ServicesCard"];
    // return Card(
    //   margin: EdgeInsets.all(5),
    //   color: Colors.white,
    //   child: Container(
    //     padding: EdgeInsets.all(8),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         const SizedBox(width: 5),
    //         Flexible(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: <Widget>[
    //               //================= title=============
    //               Container(
    //                 padding: const EdgeInsets.all(3),
    //                 alignment: Alignment.centerLeft,
    //                 child: Text("$title",
    //                     style: textTheme.headline3!.copyWith(
    //                         fontSize: titleSize,
    //                         color: Colors.black,
    //                         fontFamily: "Poppins")),
    //               ),
    //               //================ subtitle============
    //               Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 7,
    //                   vertical: 3,
    //                 ),
    //                 alignment: Alignment.centerLeft,
    //                 // padding:
    //                 //     subtitle == null ? EdgeInsets.only(left: 10) : null,
    //                 child: subtitle != null
    //                     ? Text("$subtitle",
    //                         style: textTheme.subtitle1!.copyWith(
    //                             fontSize: subtitleSize,
    //                             color: Colors.black45,
    //                             fontFamily: "Nunito"))
    //                     : Text("Coming Soon",
    //                         style: textTheme.subtitle1!.copyWith(
    //                             fontSize: subtitleSize,
    //                             color: Colors.black45,
    //                             fontFamily: "Nunito")),
    //               )
    //             ],
    //           ),
    //         ),
    //         const SizedBox(width: 15),
    //         Container(
    //           width: imageSize,
    //           height: imageSize,
    //           child: Image.asset(
    //             url,
    //             fit: BoxFit.fill,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  double getSizeForImages(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return (25.sp * 3) - (25.sp * 3) * 0.16;
    } else if (MezCalmosResizer.isTablet(context)) {
      return (23.sp * 3) - (23.sp * 3) * 0.16;
    } else if (MezCalmosResizer.isMobile(context)) {
      return (55.sp * 3) - (55.sp * 3) * 0.16;
    } else {
      return (50.sp * 3) - (50.sp * 3) * 0.16;
    }
  }

  double getSizeForImage(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 25.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 23.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 55.sp;
    } else {
      return 50.sp;
    }
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 8.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 20.sp;
    }
  }

  double getSizeForSubtitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 9.sp;
    } else {
      return 8.5.sp;
    }
  }

  double getSizeForSpaceBetweenItems(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.5.sp;
    } else {
      return 8.sp;
    }
  }

  double getSizeForBtnText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }
}
