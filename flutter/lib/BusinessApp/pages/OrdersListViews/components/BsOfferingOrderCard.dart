import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BsOfferingOrderCard extends StatelessWidget {
  const BsOfferingOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FlutterLogo(size: 38),
                      ),
                      SizedBox(width: 14),
                      Flexible(
                        child: Text(
                          "Home for rent in AvJuan Pablo II, Puerto...",
                          maxLines: 2,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 63),
                Text(
                  "\$153/day",
                  textAlign: TextAlign.right,
                  style: context.textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: 14),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Anna Rodrigo",
                    ),
                    SizedBox(width: 118),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "08:00 AM",
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 5.21,
                          height: 5.21,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "2 days",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
