import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

void showUserBottomSheet(
    {required BuildContext context, required Function function}) {
  LanguageController lang = Get.find<LanguageController>();
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 80,
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${lang.strings['shared']['userInfo']['saveTxt']}',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                ElevatedButton(
                    child: Text(
                        "${lang.strings['shared']['userInfo']["saveBtn"]}"),
                    onPressed: () => function),
              ],
            ),
          ),
        ),
      );
    },
  );
}
