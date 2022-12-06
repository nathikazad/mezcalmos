import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OperatorsView/Controllers/OperatorsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class RestaurantOperatorCard extends StatelessWidget {
  const RestaurantOperatorCard(
      {super.key, required this.op, required this.viewController});
  final RestaurantOperator op;
  final OperatorsViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (op.info.image != null)
              CircleAvatar(
                radius: 25,
                backgroundImage: CachedNetworkImageProvider(op.info.image),
              ),
            SizedBox(
              width: 8,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  op.info.name.capitalizeFirstofEach,
                  style: Get.textTheme.bodyText1,
                )),
            MezIconButton(
              onTap: () async {
                await showConfirmationDialog(context, onYesClick: () async {
                  final bool result = await viewController.removeOp(
                      opId: op.info.hasuraId.toString());
                  if (result) {
                    Get.back();
                  }
                },
                    title: "Remove operator",
                    helperText: "Are you sure you want to remove this operator",
                    primaryButtonText: "Yes, remove operator");
              },
              icon: Icons.delete_outline,
              backgroundColor: offRedColor,
              iconColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
