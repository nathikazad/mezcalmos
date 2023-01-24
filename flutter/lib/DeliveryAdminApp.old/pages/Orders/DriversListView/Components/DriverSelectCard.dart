import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
        ["pages"]["Orders"]["driversListView"]["driversListScreen"]
    ["components"]["driverSelectCard"];

class DriverSelectCard extends StatelessWidget {
  const DriverSelectCard({
    Key? key,
    required this.driver,
    required this.function,
  }) : super(key: key);
  final DeliveryDriver driver;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
        child: InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  CachedNetworkImageProvider(driver.driverInfo.image),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    driver.driverInfo.name,
                    style: txt.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  (driver.deliveryDriverState.online)
                      ? Row(
                          children: <Widget>[
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${_i18n()["available"]}',
                              style: txt.bodyText2,
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
                              '${_i18n()["unavailable"]}',
                              style: txt.bodyText2,
                            )
                          ],
                        )
                ],
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColorLight,
              size: 35,
            ),
          ],
        ),
      ),
    ));
  }
}
