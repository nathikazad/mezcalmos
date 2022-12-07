import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';

class ROpOperatorCard extends StatelessWidget {
  const ROpOperatorCard({super.key, required this.operator});
  final RestaurantOperator operator;

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
            )

            // actions row //
          ],
        ),
      ),
    );
  }
}
