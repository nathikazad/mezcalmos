import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DriverCard extends StatelessWidget {
  final Order order;
  DeliveryDriverUserInfo? driver;
  Function(DeliveryDriver?) callBack;
  bool canChangeDriver;
  DriverCard(
      {Key? key,
      required this.driver,
      required this.canChangeDriver,
      required this.callBack,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Driver',
              style: txt.bodyText1,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 1.5,
                  color: (driver != null && canChangeDriver)
                      ? Theme.of(context).primaryColorLight
                      : (driver != null && !canChangeDriver)
                          ? Colors.green
                          : Colors.redAccent,
                )),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (driver == null)
                  ? () async {
                      DeliveryDriver? newDriver =
                          await Get.toNamed(kDriversListRoute, arguments: order)
                              as DeliveryDriver;
                      callBack(newDriver);
                    }
                  : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (driver != null)
                    ? Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                CachedNetworkImageProvider(driver!.image),
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
                                  driver!.name,
                                  style: txt.bodyText2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_outlined)),
                          IconButton(
                              onPressed: (canChangeDriver)
                                  ? () async {
                                      DeliveryDriver? newDriver =
                                          await Get.toNamed(kDriversListRoute,
                                                  arguments: order)
                                              as DeliveryDriver;
                                      callBack(newDriver);
                                    }
                                  : null,
                              icon: Icon(
                                Icons.edit_rounded,
                                color: (canChangeDriver)
                                    ? Theme.of(context).primaryColorLight
                                    : Colors.grey.shade400,
                              )),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.moped_rounded,
                            color: Theme.of(context).primaryColorLight,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pick a driver',
                            style: txt.bodyText1,
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
