import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/controllers/DriversViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDriversView']["components"]["ROpListDriverCard"];

class ListDriverCard extends StatefulWidget {
  const ListDriverCard({
    super.key,
    required this.driver,
    required this.viewController,
  });
  final DeliveryDriver driver;
  final DriversViewController viewController;

  @override
  State<ListDriverCard> createState() => _ListDriverCardState();
}

class _ListDriverCardState extends State<ListDriverCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
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
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 22,
                            child: Icon(
                              Icons.delivery_dining,
                              size: 30,
                              color: Colors.white,
                            ),
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
                          style: context.txt.bodyLarge,
                        ),
                        const SizedBox(height: 10),
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
                  if (widget.driver.deliveryDriverState.isAuthorized)
                    MezIconButton(
                      onTap: () async {
                        await showConfirmationDialog(context,
                            title: '${_i18n()["rmTitle"]}',
                            helperText: '${_i18n()["rmText"]}',
                            primaryButtonText: '${_i18n()["rmBtn"]}',
                            onYesClick: () async {
                          // final bool result = await widget.viewController
                          //     .removeDriver(widget.driver.deliveryDriverId);
                          //  if (result) MezRouter.back();
                        });
                      },
                      icon: Icons.delete_outline,
                      iconColor: Colors.red,
                      iconSize: 18,
                      backgroundColor: offRedColor,
                    )
                ]),
                if (!widget.driver.deliveryDriverState.isAuthorized)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: (isLoading)
                        ? LinearProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                  child: MezButton(
                                label: "Approve",
                                height: 50,
                                backgroundColor: primaryBlueColor,
                                textColor: Colors.white,
                                onClick: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await widget.viewController.approveDriver(
                                      approved: true,
                                      driverId: widget.driver.deliveryDriverId);
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              )),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: MezButton(
                                label: "Reject",
                                backgroundColor: offRedColor,
                                height: 50,
                                textColor: Colors.red,
                                onClick: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await widget.viewController.approveDriver(
                                      approved: false,
                                      driverId: widget.driver.deliveryDriverId);
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              )),
                            ],
                          ),
                  )
              ],
            )));
  }
}
