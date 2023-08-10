import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['NoPostsFound'];

class NoPostsFound extends StatelessWidget {
  const NoPostsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            aNoPosts,
            height: 125.mezSp,
            width: 125.mezSp,
          ),
          SizedBox(
            height: 20,
          ),
          Text('${_i18n()['noPostsFound']}',
              style: context.textTheme.bodyLarge, textAlign: TextAlign.center),
          Text('${_i18n()['bodyMessage']}', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
