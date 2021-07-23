import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/mezcalmos_icons.dart';
import 'package:mezcalmos/Shared/widgets/MezGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedLaunchOnMap = false.obs;

  Widget build(BuildContext context) {
    Get.put<CurrentOrderMapController>(CurrentOrderMapController());

    controller.dispatchCurrentOrder();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() => controller.waitingResponse ||
                    controller.value?.id == null ||
                    controller.value?.status == null
                ? Center(child: CircularProgressIndicator())
                : new MezGoogleMap(true)),
            Positioned(
                bottom: GetStorage().read(getxGmapBottomPaddingKey),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: getSizeRelativeToScreen(25, Get.height, Get.width),
                  // width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
                        child: Obx(() => TextButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(Size(
                                    getSizeRelativeToScreen(
                                        115, Get.height, Get.width),
                                    getSizeRelativeToScreen(
                                        15, Get.height, Get.width))),
                                backgroundColor:
                                    controller.value?.status != "inTransit"
                                        ? MaterialStateProperty.all(
                                            Color.fromARGB(255, 79, 168, 35))
                                        : MaterialStateProperty.all(
                                            Color.fromARGB(255, 234, 51, 38)),
                              ),
                              onPressed: () async {
                                print(
                                    "%%%%%%%%%%%%\n controller.value!.distanceToClient :: ${controller.distanceToClient}\n%%%%%%%%%%%%");
                                print(
                                    "%%%%%%%%%%%%\n controller.distanceFromFinish :: ${controller.distanceToFinish}\n%%%%%%%%%%%%");
                                controller.value?.status == "inTransit"
                                    ? (controller.distanceToFinish > 0.5
                                        ? MezcalmosSharedWidgets
                                                .yesNoDefaultConfirmationDialog(
                                                    () async {
                                            Get.back();
                                            await controller.finishRide();
                                          },
                                                    lang.strings['taxi']
                                                            ['taxiView'][
                                                        "tooFarFromfinishRide"])
                                            .then((_) {
                                            //Get.offAllNamed(kTaxiWrapperRoute);
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            Get.back(closeOverlays: true);
                                          })
                                        : await controller.finishRide())
                                    : (controller.distanceToClient > 0.5
                                        ? MezcalmosSharedWidgets
                                                .yesNoDefaultConfirmationDialog(
                                                    () async {
                                            Get.back();
                                            await controller.startRide();
                                          },
                                                    lang.strings['taxi']
                                                            ['taxiView']
                                                        ["tooFarFromstartRide"])
                                            .then((_) {
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            //Get.back(closeOverlays: true);
                                          })
                                        : await controller.startRide());
                              },
                              child: Text(
                                controller.value?.status != "inTransit"
                                    ? lang.strings['taxi']['taxiView']
                                        ["startRide"]
                                    : lang.strings['taxi']['taxiView']
                                        ["finishRide"],
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'psr'),
                              ),
                            )),
                      ),
                      Flexible(
                          child: SizedBox(
                        height:
                            getSizeRelativeToScreen(15, Get.height, Get.width),
                        child: VerticalDivider(
                            // width: Get.width / 20,
                            ),
                      )),
                      Flexible(
                          flex: 2,
                          child: Obx(
                            () => Text(
                                '\$' +
                                    (controller.value?.estimatedPrice
                                            ?.toString() ??
                                        "00"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          )),
                      Flexible(
                          child: SizedBox(
                        height:
                            getSizeRelativeToScreen(15, Get.height, Get.width),
                        child: VerticalDivider(
                            // width: Get.width / 20,
                            ),
                      )),
                      Flexible(
                          flex: 4,
                          fit: FlexFit.loose,
                          child: Row(
                            // direction: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            // runAlignment: WrapAlignment.end,
                            // alignment: WrapAlignment.end,
                            // spacing: 10,
                            children: [
                              GestureDetector(
                                onTap: clickedLaunchOnMap.value
                                    ? null
                                    : () async {
                                        clickedLaunchOnMap.value = true;
                                        await mapLauncher(
                                            controller.value!.to.latitude,
                                            controller.value!.to.longitude);
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
                                          color: Color.fromARGB(
                                              255, 216, 225, 249),
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
                                              color: Color.fromARGB(
                                                  255, 103, 121, 254),
                                              size: 16,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              // Spacer(),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              GestureDetector(
                                onTap: () async {
                                  Get.toNamed(kMessagesRoute);
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
                                          color: Color.fromARGB(
                                              255, 216, 225, 249),
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
                                              Icons.message,
                                              color: Color.fromARGB(
                                                  255, 103, 121, 254),
                                              size: 16,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              // Spacer(),

                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              GestureDetector(
                                onTap: () => controller
                                    .cancelTaxi(null)
                                    .then((_) => Get.back()),
                                child: Container(
                                  height: getSizeRelativeToScreen(
                                      16, Get.height, Get.width),
                                  width: getSizeRelativeToScreen(
                                      16, Get.height, Get.width),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 247, 177, 179),
                                    borderRadius: BorderRadius.circular(4),
                                    // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
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
                )),
            Positioned(
              top: 10,
              child: Container(
                height: getSizeRelativeToScreen(30, Get.height, Get.width),
                width: Get.width / 1.05,
                // width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
                  clipBehavior: Clip.hardEdge,

                  // direction: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // alignment: Alignment.center,
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Expanded(
                                child: Text(
                                  lang.strings['shared']['inputLocation']
                                      ["from"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Obx(() => GestureDetector(
                                  onTap: () => mezcalmosSnackBar(
                                      lang.strings['shared']['inputLocation']
                                          ["from"],
                                      controller.value?.from?.address ?? ""),
                                  child: Text(
                                    (controller.value?.from?.address
                                                .toString()
                                                .substring(0, 13) ??
                                            "..........") +
                                        " ..", //13+..
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'psr'),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VerticalDivider(
                            color: Color.fromARGB(255, 236, 236, 236),
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.all(getSizeRelativeToScreen(
                                2, Get.height, Get.width)),
                            height: getSizeRelativeToScreen(
                                20, Get.height, Get.width),
                            width: getSizeRelativeToScreen(
                                20, Get.height, Get.width),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromARGB(255, 216, 225, 249),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(0, 7)),
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 97, 127, 255),
                                    Color.fromARGB(255, 198, 90, 252),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Center(
                              child: Image.asset('assets/images/logoWhite.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Expanded(
                                child: Text(
                                  lang.strings['shared']['inputLocation']["to"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Obx(() => GestureDetector(
                                  onTap: () => mezcalmosSnackBar(
                                      lang.strings['shared']['inputLocation']
                                          ["to"],
                                      controller.value?.to?.address ?? ""),
                                  child: Text(
                                    (controller.value?.to?.address
                                                .toString()
                                                .substring(0, 13) ??
                                            "..........") +
                                        " ..", //13+..
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'psr'),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
