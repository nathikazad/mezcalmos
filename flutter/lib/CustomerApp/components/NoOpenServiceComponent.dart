import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["NoOpenServiceComponent"];

class NoOpenServiceComponent extends StatelessWidget {
  const NoOpenServiceComponent({
    super.key,
    required this.showOnlyOpen,
    required this.onClick,
    // required this.serviceProviderType,
  });
  //final ServiceProviderType serviceProviderType;
  final bool showOnlyOpen;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //give space when its bigger size.
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
              mezLookingAsset,
              height: 30.h,
              width: 65.w,
            ),
          ),
          Text(
            '${_i18n()["title"]}',
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${_i18n()["desc"]}',
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          if (showOnlyOpen)
            MezButton(
                label: "${_i18n()['btn']}",
                onClick: () async {
                  onClick();
                })
        ],
      ),
    );
  }
}
