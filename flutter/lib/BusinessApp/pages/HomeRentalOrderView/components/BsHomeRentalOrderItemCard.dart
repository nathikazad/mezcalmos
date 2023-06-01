import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';

class BsHomeRentalOrderItemCard extends StatelessWidget {
  const BsHomeRentalOrderItemCard({super.key, required this.item});
  final BusinessOrderItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        item.item?.firstImage ?? "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.item?.name[userLangCode] ?? "error",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 9),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.people),
                          SizedBox(width: 5),
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.calendar_today),
                          SizedBox(width: 5),
                          Text(
                            "2 days",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 5),
                          Icon(Icons.price_check_outlined),
                          Text(
                            "\$306",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Edit",
                            textAlign: TextAlign.right,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(color: primaryBlueColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(height: 11),
            Divider(),
            // SizedBox(height: 7),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.watch_later),
                      SizedBox(width: 8),
                      Text(
                        item.time ?? "timeError",
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Edit",
                  textAlign: TextAlign.right,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: primaryBlueColor),
                ),
              ],
            ),
            // SizedBox(height: 6),
            Divider(),
            MezInkwell(
              label: "Mark as unavailable",
              onClick: () async {},
            )
          ],
        ),
      ),
    );
  }
}
