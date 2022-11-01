import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpDriversView/controllers/ROpDriversViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView']["components"]["ROpListDriverCard"];

class ROpListDriverCard extends StatefulWidget {
  const ROpListDriverCard(
      {super.key, required this.driver, required this.viewController});
  final DeliveryDriver driver;
  final ROpDriversViewController viewController;
  @override
  State<ROpListDriverCard> createState() => _ROpListDriverCardState();
}

class _ROpListDriverCardState extends State<ROpListDriverCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                      radius: 23,
                      backgroundImage: CachedNetworkImageProvider(
                          widget.driver.driverInfo.image)),
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
              const SizedBox(
                width: 45,
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.driver.driverInfo.name,
                      style: Get.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 11.sp,
                          color: widget.driver.deliveryDriverState.isOnline
                              ? primaryBlueColor
                              : Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            child: Text(
                                widget.driver.deliveryDriverState.isOnline
                                    ? '${_i18n()["available"]}'
                                    : '${_i18n()["unavailable"]}'))
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              MezIconButton(
                onTap: () async {
                  await showConfirmationDialog(context,
                      title: '${_i18n()["rmTitle"]}',
                      helperText: '${_i18n()["rmText"]}',
                      primaryButtonText: '${_i18n()["rmBtn"]}',
                      onYesClick: () async {
                    final bool result = await widget.viewController
                        .removeDriver(widget.driver.deliveryDriverId);
                    if (result) Get.back();
                  });
                },
                icon: Icons.delete_outline,
                iconColor: Colors.red,
                iconSize: 18,
                backgroundColor: offRedColor,
              )
            ])));
  }
}
