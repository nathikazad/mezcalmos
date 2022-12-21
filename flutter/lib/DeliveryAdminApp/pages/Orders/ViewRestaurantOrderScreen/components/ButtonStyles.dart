import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DialogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
        ["Orders"]["ViewRestaurantOrderScreen"]["components"]["ButtonStyles"];

// the styles of status buttons inside the order screen
class ButtonsStyle {
  RxBool isLoading = RxBool(false);

  /// this button for cancel order
  static Widget cancelButtonWidget(int orderId) {
    final RestaurantOrderController controller =
        Get.find<RestaurantOrderController>();

    // OrderController controller = Get.find<OrderController>();
    return MezButton(
      label: "${_i18n()["cancel"].toUpperCase()}",
      backgroundColor: offRedColor,
      textColor: Colors.red,
      onClick: () async {
        final bool res = await dialogComponent(
          _i18n()["cancelAlertTitle"],
          _i18n()["cancelAlertSubTitle"],
          () {
            MezRouter.back(result: true);
          },
          () {
            MezRouter.back(result: false);
          },
          Container(height: 40, width: 40, child: Image.asset(cancelIcon)),
          LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: <Color>[const Color(0xede21132), const Color(0xdbd11835)],
          ),
        );
        if (res) {
          await controller.cancelOrder(orderId);
        }
      },
    );

    // return Expanded(
    //   child: ButtonComponent(
    //     function: () async {
    //       final bool res = await dialogComponent(
    //         _i18n()["cancelAlertTitle"],
    //         _i18n()["cancelAlertSubTitle"],
    //         () {
    //           MezRouter.back(result: true);
    //         },
    //         () {
    //           MezRouter.back(result: false);
    //         },
    //         Container(height: 40, width: 40, child: Image.asset(cancelIcon)),
    //         LinearGradient(
    //           begin: Alignment(-0.10374055057764053, 0),
    //           end: Alignment(1.1447703838348389, 1.1694844961166382),
    //           colors: <Color>[const Color(0xede21132), const Color(0xdbd11835)],
    //         ),
    //       );
    //       if (res) {
    //         await controller.cancelOrder(orderId);
    //       }
    //     },
    //     widget: Text(_i18n()["cancel"].toUpperCase(),
    //         style: TextStyle(
    //             color: const Color(0xffffffff),
    //             fontFamily: "psb",
    //             fontStyle: FontStyle.normal,
    //             fontSize: 16.0.sp),
    //         textAlign: TextAlign.center),
    //     gradient: const LinearGradient(
    //       begin: Alignment(-0.10374055057764053, 0),
    //       end: Alignment(1.1447703838348389, 1.1694844961166382),
    //       colors: <Color>[Color(0xede21132), Color(0xdbd11835)],
    //     ),
    //   ),
    // );
  }

  // this button for PreparingOrder
  static Widget preparingOrderButtonWidget(RestaurantOrder order) {
    /// RestaurantOrderController
    final RestaurantOrderController controller =
        Get.find<RestaurantOrderController>();
    return MezButton(
      label: "${_i18n()["readyForPickUp"]}",
      withGradient: true,
      onClick: (order.dropoffDriver == null)
          ? () async {
              Get.snackbar(
                  "${_i18n()["Error"]}", "${_i18n()["driverErrorAlert"]}");
            }
          : () async {
              final bool res = await dialogComponent(
                _i18n()["readyAlertTitle"],
                _i18n()["readyAlertSubTitle"],
                () {
                  MezRouter.back(result: true);
                },
                () {
                  MezRouter.back(result: false);
                },
                Container(height: 70, width: 70, child: Image.asset(box)),
                LinearGradient(
                  begin: Alignment(-0.10374055057764053, 0),
                  end: Alignment(1.1447703838348389, 1.1694844961166382),
                  colors: [
                    // const Color(0xede29211),
                    const Color(0xffd3bc0b),
                    const Color(0xdbd17c18)
                  ],
                ),
              );
              if (res) {
                Get.snackbar("Loading", "");
                await controller.readyForPickupOrder(order.orderId);
              }
            },
    );

    // return ButtonComponent(
    //   widget: Text(_i18n()["readyForPickUp"],
    //       style: TextStyle(
    //           color: const Color(0xffffffff),
    //           fontFamily: "psb",
    //           fontSize: 16.0.sp),
    //       textAlign: TextAlign.center),
    //   gradient: LinearGradient(
    //     begin: Alignment(-0.10374055057764053, 0),
    //     end: Alignment(1.1447703838348389, 1.1694844961166382),
    //     colors: <Color>[
    //       // const Color(0xede29211),
    //       const Color(0xffd3bc0b),
    //       const Color(0xdbd17c18)
    //     ],
    //   ),
    //   function: (order.dropoffDriver == null)
    //       ? () {
    //           Get.snackbar(
    //               "${_i18n()["Error"]}", "${_i18n()["driverErrorAlert"]}");
    //         }
    //       : () async {
    //           final bool res = await dialogComponent(
    //             _i18n()["readyAlertTitle"],
    //             _i18n()["readyAlertSubTitle"],
    //             () {
    //               MezRouter.back(result: true);
    //             },
    //             () {
    //               MezRouter.back(result: false);
    //             },
    //             Container(height: 70, width: 70, child: Image.asset(box)),
    //             LinearGradient(
    //               begin: Alignment(-0.10374055057764053, 0),
    //               end: Alignment(1.1447703838348389, 1.1694844961166382),
    //               colors: [
    //                 // const Color(0xede29211),
    //                 const Color(0xffd3bc0b),
    //                 const Color(0xdbd17c18)
    //               ],
    //             ),
    //           );
    //           if (res) {
    //             Get.snackbar("Loading", "");
    //             await controller.readyForPickupOrder(order.orderId);
    //           }
    //         },
    // );
  }

  // this button for ReadyForPickup
  static Widget readyForPickupButtonWidget(int orderId) {
    final RestaurantOrderController controller =
        Get.find<RestaurantOrderController>();

    return MezButton(
      label: "${_i18n()["deliver"]}",
      withGradient: true,
      onClick: () async {
        final bool res = await dialogComponent(
          _i18n()["onTheWayAlertTitle"],
          _i18n()["onTheWayAlertSubTitle"],
          () {
            MezRouter.back(result: true);
          },
          () {
            MezRouter.back(result: false);
          },
          Container(height: 70, width: 70, child: Image.asset(truck)),
          LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: <Color>[const Color(0xff5572ea), const Color(0xdb1f18d1)],
          ),
        );
        if (res) {
          Get.snackbar("Loading", "");
          await controller.deliverOrder(orderId);
        }
      },
    );
    // return ButtonComponent(
    //   widget: Text(_i18n()["deliver"],
    //       style: TextStyle(
    //           color: const Color(0xffffffff),
    //           fontFamily: "psb",
    //           fontSize: 16.0.sp),
    //       textAlign: TextAlign.center),
    //   gradient: LinearGradient(
    //     begin: Alignment(-0.10374055057764053, 0),
    //     end: Alignment(1.1447703838348389, 1.1694844961166382),
    //     colors: <Color>[const Color(0xff5572ea), const Color(0xdb1f18d1)],
    //   ),
    //   function: () async {
    //     final bool res = await dialogComponent(
    //       _i18n()["onTheWayAlertTitle"],
    //       _i18n()["onTheWayAlertSubTitle"],
    //       () {
    //         MezRouter.back(result: true);
    //       },
    //       () {
    //         MezRouter.back(result: false);
    //       },
    //       Container(height: 70, width: 70, child: Image.asset(truck)),
    //       LinearGradient(
    //         begin: Alignment(-0.10374055057764053, 0),
    //         end: Alignment(1.1447703838348389, 1.1694844961166382),
    //         colors: <Color>[const Color(0xff5572ea), const Color(0xdb1f18d1)],
    //       ),
    //     );
    //     if (res) {
    //       Get.snackbar("Loading", "");
    //       await controller.deliverOrder(orderId);
    //     }
    //   },
    // );
  }

  // this button for OrderReceived
  static Widget OrderReceivedButtonWidget(int orderId) {
    final RestaurantOrderController controller =
        Get.find<RestaurantOrderController>();
    return MezButton(
      label: "${_i18n()["preparing"]}",
      withGradient: true,
      onClick: () async {
        final bool res = await dialogComponent(
          _i18n()["prepareAlertTitle"],
          _i18n()["prepareAlertSubTitle"],
          () {
            MezRouter.back(result: true);
          },
          () {
            MezRouter.back(result: false);
          },
          Container(height: 70, width: 70, child: Image.asset(stoveIcon)),
          LinearGradient(
            begin: Alignment(-0.10374055057764053, 0),
            end: Alignment(1.1447703838348389, 1.1694844961166382),
            colors: <Color>[const Color(0xffff9300), const Color(0xdbd15f18)],
          ),
        );

        if (res) {
          Get.snackbar("Loading", "");
          await controller.prepareOrder(orderId);
        }
      },
    );

    // return ButtonComponent(
    //   widget: Text(_i18n()["preparing"],
    //       style: TextStyle(
    //           color: const Color(0xffffffff),
    //           fontFamily: "psb",
    //           fontStyle: FontStyle.normal,
    //           fontSize: 16.0.sp),
    //       textAlign: TextAlign.center),
    //   gradient: LinearGradient(
    //     begin: Alignment(-0.10374055057764053, 0),
    //     end: Alignment(1.1447703838348389, 1.1694844961166382),
    //     colors: <Color>[const Color(0xffff9300), const Color(0xdbd15f18)],
    //   ),
    //   function: () async {
    //     final bool res = await dialogComponent(
    //       _i18n()["prepareAlertTitle"],
    //       _i18n()["prepareAlertSubTitle"],
    //       () {
    //         MezRouter.back(result: true);
    //       },
    //       () {
    //         MezRouter.back(result: false);
    //       },
    //       Container(height: 70, width: 70, child: Image.asset(stoveIcon)),
    //       LinearGradient(
    //         begin: Alignment(-0.10374055057764053, 0),
    //         end: Alignment(1.1447703838348389, 1.1694844961166382),
    //         colors: <Color>[const Color(0xffff9300), const Color(0xdbd15f18)],
    //       ),
    //     );

    //     if (res) {
    //       Get.snackbar("Loading", "");
    //       await controller.prepareOrder(orderId);
    //   }
    // },
    // );
  }
}
