import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'components.dart';

class FormForQuestionAndFeedBack extends StatelessWidget {
  FormForQuestionAndFeedBack({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: 11.sp,
        ),
        (MezCalmosResizer.isMobile(context) ||
                MezCalmosResizer.isSmallMobile(context))
            ? BuildWidgetForMobile(context, txt)
            : BuildWidgetForTabletAndDesktop(context, txt)
      ],
    );
  }

  Widget BuildTextTilte(BuildContext context, TextTheme txt) {
    return Obx(
      () => Text(
        "${langController.strings["WebApp"]["questionText"]}",
        style: txt.headline1!.copyWith(
            fontSize: getSizeForTitle(context),
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat",
            color: Colors.black),
      ),
    );
  }

  Widget BuildTextSecondTitle(BuildContext context, TextTheme txt) {
    return Obx(
      () => Text(
        "${langController.strings["WebApp"]["questionTitle"]}",
        style: txt.headline1!.copyWith(
            fontSize: getSizeForSecondTitle(context),
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
            color: Colors.black),
      ),
    );
  }

  Widget BuildTextSubtitle(BuildContext context, TextTheme txt) {
    return Obx(
      () => Text(
        "${langController.strings["WebApp"]["questionSubtitle"]}",
        style: txt.headline1!.copyWith(
            fontSize: getSizeSubtitleTitle(context),
            fontWeight: FontWeight.w500,
            fontFamily: "Nunito",
            color: Colors.black),
      ),
    );
  }

  Widget BuildWidgetForMobile(BuildContext context, TextTheme txt) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildTextTilte(context, txt),
          SizedBox(
            height: 15.sp,
          ),
          BuildTextSecondTitle(context, txt),
          SizedBox(
            height: 15.sp,
          ),
          BuildTextSubtitle(context, txt),
          SizedBox(
            height: Get.width * 0.05,
          ),
          Container(
            child: FAQFormComponent(),
          )
        ],
      ),
    );
  }

  Widget BuildWidgetForTabletAndDesktop(BuildContext context, TextTheme txt) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildTextTilte(context, txt),
                SizedBox(
                  height: 11.sp,
                ),
                BuildTextSecondTitle(context, txt),
                SizedBox(
                  height: 7.sp,
                ),
                BuildTextSubtitle(context, txt)
              ],
            ),
          )),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Expanded(
              child: Container(
            child: FAQFormComponent(),
          ))
        ],
      ),
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15.sp;
    }
  }

  double getSizeForSecondTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 11.sp;
    }
  }

  double getSizeSubtitleTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }
}

class FAQFormComponent extends StatelessWidget {
  FAQFormComponent({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //full name form;
        Obx(
          () => WebappTextFieldComponent(
            controller: fullName,
            title: "${langController.strings["WebApp"]["fullName"]}",
          ),
        ),
        SizedBox(
          height: getSizeForSpacing(context),
        ),
        Obx(
          () => WebappTextFieldComponent(
            controller: email,
            title: "${langController.strings["WebApp"]["email"]}",
          ),
        ),
        SizedBox(
          height: getSizeForSpacing(context),
        ),
        Obx(
          () => WebappTextFieldComponent(
            controller: message,
            title: "${langController.strings["WebApp"]["messageOrQuestion"]}",
            maxLine: 500,
          ),
        ),
        SizedBox(
          height: getSpaceOnTop(context),
        ),
        InkWell(
          onTap: () {
            sendMessage();
          },
          child: Container(
            width: getSizeForSendBtn(context).width,
            height: getSizeForSendBtn(context).height,
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
              "${langController.strings["WebApp"]["submitBtn"]}",
              style: txt.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: getSizeForSndBtnText(context),
                  fontFamily: "Montserrat"),
            )),
          ),
        ),
        SizedBox(
          height: getSpaceOnTop(context),
        ),
      ],
    );
  }

  double getSpaceOnTop(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 15.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 14.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 25.sp;
    }
  }

  double getSizeForSpacing(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 6.sp;
    } else {
      return 6.sp;
    }
  }

  double getSizeForSndBtnText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }

  Size getSizeForSendBtn(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return Size(50.sp, 11.sp);
    } else if (MezCalmosResizer.isTablet(context)) {
      return Size(55.sp, 12.sp);
    } else if (MezCalmosResizer.isMobile(context)) {
      return Size(75.sp, 20.sp);
    } else {
      return Size(75.sp, 20.sp);
    }
  }

  void sendMessage() async {
    final String serviceId = "service_lmcyttk";
    final String templateID = "template_fozmbe8";
    final String userID = "vhILBmiHW4kZ2zPlp";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http
        .post(url,
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              'service_id': serviceId,
              'template_id': templateID,
              'user_id': userID,
              'template_params': {
                "email_user": email.text.trim(),
                'to_name': fullName.text.trim(),
                "message": message.text.trim()
              }
            }))
        .then((value) {
      if (value != null && value.statusCode == 200) {
        print("you email sent ");
      } else {
        print("something went wrong  ${value.statusCode} ${value.body}");
      }
      return value;
    });
  }
}
