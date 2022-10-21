import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';

class ROpDriverSelectCard extends StatelessWidget {
  const ROpDriverSelectCard(
      {super.key, required this.driver, required this.assingCallback});
  final DeliveryDriver driver;
  final Function()? assingCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: assingCallback,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        CachedNetworkImageProvider(driver.driverInfo.image)),
                Positioned(
                  right: -35,
                  child: CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 45,
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    driver.driverInfo.name,
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  (driver.deliveryDriverState.isOnline)
                      ? Row(
                          children: <Widget>[
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'available',
                              style: Get.textTheme.bodyText2,
                            )
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Icon(
                              Icons.circle,
                              color: Colors.redAccent,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Unavailable',
                              style: Get.textTheme.bodyText2,
                            )
                          ],
                        )
                ],
              ),
            ),
            Text(
              "Assign",
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
