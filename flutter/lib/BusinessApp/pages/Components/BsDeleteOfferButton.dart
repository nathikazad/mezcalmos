import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class BsDeleteOfferButton extends StatelessWidget {
  const BsDeleteOfferButton({super.key, required this.onDelete});
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: MezButton(
        label: "Delete",
        backgroundColor: offRedColor,
        textColor: redAccentColor,
        onClick: () async {
          await showConfirmationDialog(context,
              title: "Delete Offer",
              helperText: "Are you sure you want to delete this offer?",
              onYesClick: () async {
            await onDelete();
            Navigator.pop(context);
            unawaited(MezRouter.back(backResult: true));
          });
        },
      ),
    );
  }
}
