import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentPositionedBottomBar extends StatelessWidget {
  RxBool showLoadingMapOnClick = false.obs;
  RxBool clickedLaunchOnMap = false.obs;
  bool clickedYesCancelPopUp = false;
  CurrentOrderController controller;

  CurrentPositionedBottomBar(this.controller);
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  LanguageController lang = Get.find<LanguageController>();
  FBTaxiNotificationsController fbNotificationsController =
      Get.find<FBTaxiNotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: GetStorage().read(getxGmapBottomPaddingKey),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: getSizeRelativeToScreen(25, Get.height, Get.width),
          width: Get.width / 1.05,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(255, 216, 225, 249),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 7)),
              ]),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  child: Obx(() => TextButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                              getSizeRelativeToScreen(
                                  115, Get.height, Get.width),
                              getSizeRelativeToScreen(
                                  12, Get.height, Get.width))),
                          backgroundColor: controller.currentOrderStreamRx.value
                                      ?.order.status !=
                                  "inTransit"
                              ? MaterialStateProperty.all(
                                  Color.fromARGB(255, 79, 168, 35))
                              : MaterialStateProperty.all(
                                  Color.fromARGB(255, 234, 51, 38)),
                        ),
                        onPressed: !this.showLoadingMapOnClick()
                            ? () async {
                                this.showLoadingMapOnClick.value = true;

                                controller.currentOrderStreamRx.value?.order.status ==
                                        "inTransit"
                                    // ignore: unnecessary_statements
                                    ? (MapHelper.calculateDistance(
                                                taxiAuthController
                                                    .currentLocation,
                                                controller.currentOrderStreamRx
                                                    .value?.order.to.position) >
                                            0.5
                                        ? MezcalmosSharedWidgets.yesNoDefaultConfirmationDialog(
                                                () async {
                                            Get.back();
                                            await controller.finishRide();
                                          },
                                                lang.strings['taxi']['taxiView']
                                                    ["tooFarFromfinishRide"])
                                            .then((_) {
                                            if (!_) {
                                              this.showLoadingMapOnClick.value =
                                                  false;
                                              Get.back();
                                            }
                                            Get.back(closeOverlays: true);
                                          })
                                        : await controller.finishRide())
                                    // ignore: unnecessary_statements
                                    : (MapHelper.calculateDistance(
                                                taxiAuthController
                                                    .currentLocation,
                                                controller
                                                    .currentOrderStreamRx
                                                    .value
                                                    ?.order
                                                    .from
                                                    .position) >
                                            0.5
                                        ? MezcalmosSharedWidgets.yesNoDefaultConfirmationDialog(
                                                () async {
                                            Get.back();
                                            await controller.startRide();
                                          }, lang.strings['taxi']['taxiView']["tooFarFromstartRide"])
                                            .then((_) {
                                            this.showLoadingMapOnClick.value =
                                                false;
                                          }).whenComplete(() {
                                            Get.back(closeOverlays: true);
                                          })
                                        : controller.startRide().then((_) {
                                            this.showLoadingMapOnClick.value =
                                                false;
                                          }).whenComplete(() => Get.back(closeOverlays: true)));
                              }
                            : () => null,
                        child: Center(
                            child: !this.showLoadingMapOnClick()
                                ? Text(
                                    controller.currentOrderStreamRx.value?.order
                                                .status !=
                                            "inTransit"
                                        ? lang.strings['taxi']['taxiView']
                                            ["startRide"]
                                        : lang.strings['taxi']['taxiView']
                                            ["finishRide"],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'psr'),
                                  )
                                : SizedBox(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    height: 20,
                                    width: 20,
                                  )),
                      )),
                ),
              ),
              Flexible(
                  child: SizedBox(
                height: getSizeRelativeToScreen(15, Get.height, Get.width),
                child: VerticalDivider(
                    // width: Get.width / 20,
                    ),
              )),
              Flexible(
                  flex: 2,
                  child: Obx(
                    () => Text(
                        '\$' +
                            (controller.currentOrderStreamRx.value?.order
                                    .estimatedPrice
                                    ?.toString() ??
                                "00"),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  )),
              Flexible(
                  child: SizedBox(
                height: getSizeRelativeToScreen(15, Get.height, Get.width),
                child: VerticalDivider(
                    // width: Get.width / 20,
                    ),
              )),
              Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Row(
                    // direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      GestureDetector(
                        onTap: clickedLaunchOnMap.value
                            ? null
                            : () async {
                                clickedLaunchOnMap.value = true;
                                controller.currentOrderStreamRx.value?.order.status ==
                                        "onTheWay"
                                    ? await mapLauncher(
                                        controller.currentOrderStreamRx.value
                                            ?.order.from.latitude,
                                        controller.currentOrderStreamRx.value
                                            ?.order.from.longitude)
                                    : await mapLauncher(
                                        controller.currentOrderStreamRx.value
                                            ?.order.to.latitude,
                                        controller.currentOrderStreamRx.value
                                            ?.order.to.longitude);
                                clickedLaunchOnMap.value = false;
                              },
                        child: Container(
                          height: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          width: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 239, 254),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromARGB(255, 216, 225, 249),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 2))
                            ],
                          ),
                          child: Center(
                            child: Obx(
                              () => clickedLaunchOnMap.value
                                  ? SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        color: Colors.purple.shade400,
                                      ))
                                  : Icon(
                                      MezcalmosIcons.location_arrow,
                                      color: Color.fromARGB(255, 103, 121, 254),
                                      size: 16,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                      GestureDetector(
                        onTap: () async {
                          await fbNotificationsController
                              .setAllMessagesAsReadInDb();

                          Get.toNamed(kMessagesRoute,
                              arguments: <String, dynamic>{
                                "oId": controller
                                    .currentOrderStreamRx.value?.order.id,
                                "rImg": controller.currentOrderStreamRx.value
                                    ?.order.customer['image'],
                                "rName": controller.currentOrderStreamRx.value
                                    ?.order.customer['name']
                              })?.then((_) => fbNotificationsController
                              .clearAllMessageNotification());
                        },
                        child: Container(
                          height: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          width: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 239, 254),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromARGB(255, 216, 225, 249),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 2))
                            ],
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                Obx(
                                  () => fbNotificationsController
                                          .hasNewNotification
                                      ? Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle),
                                          ))
                                      : SizedBox(),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.mail,
                                    color: Color.fromARGB(255, 103, 121, 254),
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),

                      Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                      GestureDetector(
                        onTap: () async => await showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: Text(lang.strings?['taxi']
                                            ?['cancelOrder']
                                        ?['confirmation_header'] ??
                                    "Por favor confirmar"),
                                content: Text(lang.strings?['taxi']
                                            ?['cancelOrder']
                                        ?['confirmation_text'] ??
                                    "¿Cancelar el viaje actual?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        if (!clickedYesCancelPopUp) {
                                          this.showLoadingMapOnClick.value =
                                              true;
                                          controller
                                              .cancelTaxi(null)
                                              .then((_) => this
                                                  .showLoadingMapOnClick
                                                  .value = false)
                                              .catchError((onError) {
                                            clickedYesCancelPopUp = false;
                                          }).whenComplete(() => Get.back(
                                                  closeOverlays: true));
                                        }
                                      },
                                      // Navigator.of(context)
                                      //     .pop()),
                                      child: Text(lang.strings?['taxi']
                                              ?['taxiView']?['yes'] ??
                                          'Si')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(lang.strings?['taxi']
                                              ?['taxiView']?['no'] ??
                                          'No'))
                                ],
                              );
                            }),
                        child: Container(
                          height: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          width: getSizeRelativeToScreen(
                              16, Get.height, Get.width),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 177, 179),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Icon(
                              MezcalmosIcons.times_circle,
                              color: Color.fromARGB(255, 255, 0, 8),
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
