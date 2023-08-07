import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Components']['BsDeleteOfferButton'];

class BsDeleteOfferButton extends StatelessWidget {
  const BsDeleteOfferButton({super.key, required this.onDelete});
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: MezButton(
        label: "${_i18n()['title']}",
        backgroundColor: offRedColor,
        textColor: redAccentColor,
        onClick: () async {
          await showConfirmationDialog(context,
              title: "${_i18n()['title']}",
              helperText: "${_i18n()['helperText']}",
              primaryButtonText: "${_i18n()['buttonText']}",
              onYesClick: () async {
            await onDelete();
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}
