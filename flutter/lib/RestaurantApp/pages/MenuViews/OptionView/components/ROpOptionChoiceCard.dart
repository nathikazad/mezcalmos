import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class ROpOptionChoiceCard extends StatelessWidget {
  const ROpOptionChoiceCard(
      {super.key,
      required this.choice,
      required this.viewController,
      required this.optionId,
      required this.restaurantId});
  final Choice choice;
  final int optionId;
  final String restaurantId;
  final ROpOptionViewController viewController;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title and cost
            Container(
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      choice.name[userLanguage] ?? "Choice name error",
                      style: Get.textTheme.bodyLarge,
                    ),
                  ),
                  MezIconButton(
                      onTap: () async {
                        final bool? needToRefetch = await MezRouter.toNamed(
                            RestaurantAppRoutes.getROpChoiceRoute(
                                choiceId: choice.id,
                                optionId: optionId,
                                restaurantId: restaurantId)) as bool?;
                        if (needToRefetch == true) {
                          await viewController.fetchOption();
                        }
                      },
                      backgroundColor: Colors.grey.shade300,
                      iconColor: Colors.grey.shade800,
                      iconSize: 18,
                      icon: Icons.edit_outlined)
                ],
              ),
            ),
            Divider(),
            // choice handles //
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    choice.cost.toPriceString(),
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                Text("Available"),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 25,
                  width: 30,
                  child: Switch(
                    value: choice.available,
                    onChanged: (bool v) {
                      viewController.switchChoiceAvailble(
                        choice: choice,
                        value: v,
                      );
                    },
                    activeColor: primaryBlueColor,
                    activeTrackColor: secondaryLightBlueColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
