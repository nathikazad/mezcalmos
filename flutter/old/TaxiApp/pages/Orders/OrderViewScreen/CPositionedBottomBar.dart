import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
    ["Orders"]["CurrentOrderScreen"]["CPositionedBottomBar"];

class CurrentPositionedBottomBar extends StatelessWidget {
  RxBool showLoadingCircleInButton = false.obs;
  RxBool waitingForMapToOpen = false.obs;
  bool clickedYesCancelPopUp = false;
  OrderController controller = Get.find<OrderController>();
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  ForegroundNotificationsController fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  TaxiOrder order;

  CurrentPositionedBottomBar(this.order);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: GetStorage().read(getxGmapBottomPaddingKey),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
        child: (order.status == TaxiOrdersStatus.CancelledByCustomer)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: CircleAvatar(
                    radius: 18.sp,
                    backgroundImage:
                        CachedNetworkImageProvider(order.customer.image),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${order.customer.name} Ride ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12.sp),
                        ),
                        Text(
                          _i18n()["orderCancelled"],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: Container(
                        child: TextButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(Size(
                                  getSizeRelativeToScreen(
                                      115, Get.height, Get.width),
                                  getSizeRelativeToScreen(
                                      12, Get.height, Get.width))),
                              backgroundColor:
                                  order.status != TaxiOrdersStatus.InTransit
                                      ? MaterialStateProperty.all(
                                          Color.fromARGB(255, 79, 168, 35))
                                      : MaterialStateProperty.all(
                                          Color.fromARGB(255, 234, 51, 38)),
                            ),
                            onPressed: !showLoadingCircleInButton.value
                                ? () async {
                                    showLoadingAnimation();
                                    await clickButton();
                                    removeLoadingAnimation();
                                  }
                                : () => null,
                            child: Obx(
                              () => Center(
                                  child: !showLoadingCircleInButton.value
                                      ? Text(
                                          order.status !=
                                                  TaxiOrdersStatus.InTransit
                                              ? _i18n()["startRide"]
                                              : _i18n()["finishRide"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'psr',
                                              fontSize: 10.sp),
                                        )
                                      : SizedBox(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                          height: 20,
                                          width: 20,
                                        )),
                            )),
                      )),
                  Flexible(
                      child: SizedBox(
                    height: getSizeRelativeToScreen(15, Get.height, Get.width),
                    child: VerticalDivider(
                        // width: Get.width / 20,
                        ),
                  )),
                  Flexible(
                    flex: 2,
                    child: Text('\$' + (order.cost.toString()),
                        style: TextStyle(fontFamily: "psb", fontSize: 14.sp)),
                  ),
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
                            onTap: waitingForMapToOpen.value
                                ? null
                                : () async {
                                    waitingForMapToOpen.value = true;
                                    order.status == TaxiOrdersStatus.OnTheWay
                                        ? await mapLauncher(order.from.latitude,
                                            order.from.longitude)
                                        : await mapLauncher(
                                            order.dropOffLocation.latitude,
                                            order.dropOffLocation.longitude);
                                    waitingForMapToOpen.value = false;
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
                                child: Icon(
                                  MezcalmosIcons.location_arrow,
                                  color: Color.fromARGB(255, 103, 121, 254),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          // Spacer(),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Obx(
                            () => MessageButton(
                              onTap: () {
                                MezRouter.toNamed(
                                  getMessagesRoute(
                                    orderType: OrderType.Taxi,
                                    chatId: order.orderId,
                                    orderId: order.orderId,
                                    recipientType: ParticipantType.Customer,
                                  ),
                                );
                              },
                              showRedDot:
                                  controller.hasNewMessageNotification(),
                            ),
                          ),

                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          GestureDetector(
                            onTap: () async => await showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: Text(
                                        _i18n()?['confirmation_header'] ??
                                            "Por favor confirmar"),
                                    content: Text(
                                        _i18n()?['confirmation_text'] ??
                                            "¿Cancelar el viaje actual?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            if (!clickedYesCancelPopUp) {
                                              showLoadingAnimation();
                                              controller
                                                  .cancelTaxi(null)
                                                  .then((_) {
                                                removeLoadingAnimation();
                                                MezRouter.offNamedUntil(
                                                    kIncomingOrdersListRoute,
                                                    ModalRoute.withName(
                                                        kHomeRoute));
                                              });
                                            }
                                          },
                                          child: Text(_i18n()?['yes'] ?? 'Si')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(_i18n()?['no'] ?? 'No'))
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
      ),
    );
  }

  void showLoadingAnimation() {
    showLoadingCircleInButton.value = true;
  }

  void removeLoadingAnimation() {
    showLoadingCircleInButton.value = false;
  }

  Future<void> _showConfirmDialog(
      Future<void> Function() callback, String dialogBody) async {
    final YesNoDialogButton clickedYes = await yesNoDialog(
      text: 'Oops!',
      icon: Container(
        child: Icon(
          Icons.highlight_off,
          size: 65,
          color: Color(0xffdb2846),
        ),
      ),
      body: dialogBody,
    ); //finishRide);

    if (clickedYes == YesNoDialogButton.Yes) {
      await callback();
    }
  }

  Future<void> clickButton() async {
    if (order.status == TaxiOrdersStatus.InTransit) {
      mezDbgPrint("CurrentPositionedBottomBar InTransit!");

      if (taxiAuthController.currentLocation == null)
        await _showConfirmDialog(finishRide, _i18n()["tooFarFromfinishRide"]);
      else if ((MapHelper.calculateDistance(taxiAuthController.currentLocation!,
              order.dropOffLocation.position) >
          0.5)) {
        await _showConfirmDialog(finishRide, _i18n()["tooFarFromfinishRide"]);
      } else {
        await finishRide();
      }
    } else {
      if (taxiAuthController.currentLocation == null) {
        await _showConfirmDialog(startRide, _i18n()["tooFarFromstartRide"]);
      } else if (MapHelper.calculateDistance(
              taxiAuthController.currentLocation!, order.from.position) >
          0.5) {
        await _showConfirmDialog(startRide, _i18n()["tooFarFromstartRide"]);
      } else {
        await startRide();
      }
    }
  }

  Future<void> finishRide() async {
    mezDbgPrint("CurrentPositionedBottomBar finishRide");
    final ServerResponse serverResponse = await controller.finishRide();
    if (serverResponse.success) {
      mezDbgPrint("CurrentPositionedBottomBar finishRide success");
      await MezRouter.offNamedUntil(
          kIncomingOrdersListRoute, ModalRoute.withName(kHomeRoute));
    } else {
      // todo: SHOW ERROR MESSAGE
    }
  }

  Future<void> startRide() async {
    mezDbgPrint("CurrentPositionedBottomBar startRide");
    final ServerResponse serverResponse = await controller.startRide();
    if (serverResponse.success) {
      mezDbgPrint("CurrentPositionedBottomBar startRide success");
    } else {
      // todo: SHOW ERROR MESSAGE
    }
  }

  Future<void> mapLauncher(lat, lng) async {
    final String url =
        "https://www.google.com/maps/dir/?api=1&destination=$lat,$lng";

    try {
      await launch(url);
    } catch (e) {
      mezDbgPrint("Oops ==> ${_i18n()['failedMapLaunch']}");
      await launch(url);
    }
  }
}
