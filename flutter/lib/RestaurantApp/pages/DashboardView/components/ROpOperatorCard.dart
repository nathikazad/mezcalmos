import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/ROpOperatorsPageController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpOperatorCard extends StatelessWidget {
  const ROpOperatorCard(
      {super.key, required this.operator, required this.viewController});
  final RestaurantOperator operator;
  final ROpOperatorsViewController viewController;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            // info row //
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            CachedNetworkImageProvider(operator.info.image)),
                    Positioned(
                      right: -30,
                      bottom: 3,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: secondaryLightBlueColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.support_agent,
                          size: 32,
                          color: primaryBlueColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      operator.info.name,
                      style: Get.textTheme.bodyText1,
                    )),
                if (operator.state.owner) Text("Owner"),
              ],
            ),

            // actions row //
            if (operator.isWaitingToBeApprovedByOwner)
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: MezButton(
                      label: "Reject",
                      backgroundColor: offRedColor,
                      height: 50,
                      textColor: Colors.red,
                      onClick: () async {
                        await viewController.approveOperator(
                            opId: operator.info.hasuraId, approved: true);
                      },
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: MezButton(
                      label: "Approve",
                      height: 50,
                      backgroundColor: primaryBlueColor,
                      textColor: Colors.white,
                      onClick: () async {
                        await viewController.approveOperator(
                            opId: operator.info.hasuraId, approved: true);
                      },
                    )),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
