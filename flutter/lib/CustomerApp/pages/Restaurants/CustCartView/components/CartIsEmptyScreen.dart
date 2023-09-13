import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["CartIsEmptyScreen"];
//

class CartIsEmptyScreen extends StatelessWidget {
  const CartIsEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 70.w,
            child: Image.asset(
              "assets/images/customer/restaurants/cartEmpty.png",
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              "${_i18n()["title"]}",
              style: context.txt.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
