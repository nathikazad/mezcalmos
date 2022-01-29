import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Driver.dart';

class DriversListScreen extends StatelessWidget {
  const DriversListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Driver'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                    Driver.dummyDrivers.length,
                    (index) => DriverSelectCard(
                          driver: Driver.dummyDrivers[index],
                          function: () {
                            Get.back(result: Driver.dummyDrivers[index]);
                          },
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DriverSelectCard extends StatelessWidget {
  const DriverSelectCard({
    Key? key,
    required this.driver,
    required this.function,
  }) : super(key: key);
  final Driver driver;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
        child: InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(driver.imageUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver.name,
                    style: txt.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  (driver.available)
                      ? Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Available',
                              style: txt.bodyText2,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.redAccent,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Unavailable',
                              style: txt.bodyText2,
                            )
                          ],
                        )
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColorLight,
              size: 35,
            )
          ],
        ),
      ),
    ));
  }
}
