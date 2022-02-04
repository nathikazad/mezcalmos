import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Driver.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DriverCard extends StatelessWidget {
  final Order order;
  Driver? driver;
  Function(Driver?) callBack;
  DriverCard(
      {Key? key,
      required this.driver,
      required this.callBack,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1.5,
            color: (driver != null)
                ? Theme.of(context).primaryColorLight
                : Colors.redAccent,
          )),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: (driver == null)
            ? () async {
                Driver? newDriver =
                    await Get.toNamed(kDriversListRoute, arguments: order)
                        as Driver;
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
                          CachedNetworkImageProvider(driver!.imageUrl),
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
                            style: txt.bodyText1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          (driver!.available)
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
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.message_outlined)),
                    IconButton(
                        onPressed: () async {
                          Driver? newDriver = await Get.toNamed(
                              kDriversListRoute,
                              arguments: order) as Driver;
                          callBack(newDriver);
                        },
                        icon: Icon(Icons.edit_rounded)),
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
    );
  }
}
