import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mezcalmos/Shared/Utils/Themes/AppColors.dart';
import 'package:mezcalmos/Shared/Utils/Themes/styles.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/CustomFlatButton.dart';
import 'package:sizer/sizer.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
      ["NoInternetConnectionScreen"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/no_connection.json', height: 30.h),
          SizedBox(
            height: 5.h,
          ),
          Text(_i18n()['noInternetConnection'], style: Styles.tsBold),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _i18n()['noInternetDesc'],
              style: Styles.tsGreySmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomButton(
            buttonColor: <Color>[
              AppColors.colorGradientPrimary,
              AppColors.colorGradientSecondary,
            ],
            height: 10.h,
            width: 50.w,
            borderRadius: 20.0,
            onTap: () {
              if (ConnectivityHelper.instance.hasInternet) {
                Get.back();
              }
            },
            textAlignement: Alignment.center,
            text: Text(
              _i18n()['tryAgain'],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
