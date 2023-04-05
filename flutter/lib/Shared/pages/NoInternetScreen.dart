import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mezcalmos/Shared/themes/AppColors.dart';
import 'package:mezcalmos/Shared/themes/styles.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/widgets/CustomFlatButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
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
          MezButton(
              withGradient: true,
              height: 10.h,
              width: 50.w,
              borderRadius: 20.0,
              onClick: () async {
                await ConnectivityHelper.instance.checkForInternet(null);
              },
              label: _i18n()['tryAgain']),
        ],
      ),
    );
  }
}
