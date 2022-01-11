import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/buttonComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/dailogComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/global.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class ChangeStatusButtons extends StatefulWidget {
  final Rxn<RestaurantOrder> order;
  const ChangeStatusButtons({Key? key, required this.order}) : super(key: key);

  @override
  _ChangeStatusButtonsState createState() => _ChangeStatusButtonsState();
}

class _ChangeStatusButtonsState extends State<ChangeStatusButtons> {
  bool _clickedButton = false;

  OrderController controller = Get.find<OrderController>();
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: buttons()),
      Expanded(
        child: ButtonComponent(
          function: () async => await onTapButtonsShowLoading(() async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]["cancelAlert"]["title"],
                lang.strings["deliveryAdminApp"]["cancelAlert"]["subTitle"],
                () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(
                    height: 40, width: 40, child: Image.asset(cancelIcon)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xede21132),
                      const Color(0xdbd11835)
                    ]));
            if (res) {
              controller.cancelOrder(widget.order.value!.orderId);
              Get.back();
            }
          }),
          widget: getWidgetOrShowLoading(Text(
              lang.strings["customer"]["restaurant"]["checkout"]["cancel"]
                  .toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center)),
          gradient: const LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xede21132), const Color(0xdbd11835)]),
        ),
      ),
    ]);
  }

  Widget buttons() {
    switch ((widget.order.value as RestaurantOrder).status) {
      case RestaurantOrderStatus.OrderReceieved:
        return ButtonComponent(
          widget: getWidgetOrShowLoading(Text(
              lang.strings["deliveryAdminApp"]["ordersButton"]["preparing"],
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center)),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xffff9300), const Color(0xdbd15f18)]),
          function: () async => await onTapButtonsShowLoading(() async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]["prepareAlert"]["title"],
                lang.strings["deliveryAdminApp"]["prepareAlert"]["subTitle"],
                () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 70, width: 70, child: Image.asset(stoveIcon)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xffff9300),
                      const Color(0xdbd15f18)
                    ]));

            if (res) {
              Get.snackbar("Loading", "");
              controller.prepareOrder(widget.order.value!.orderId);
            }
          }),
        );

      case RestaurantOrderStatus.PreparingOrder:
        return ButtonComponent(
          widget: getWidgetOrShowLoading(Text(
              lang.strings["deliveryAdminApp"]["ordersButton"]
                  ["readyForPickUp"],
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center)),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [
                // const Color(0xede29211),
                const Color(0xffd3bc0b),
                const Color(0xdbd17c18)
              ]),
          function: () async => await onTapButtonsShowLoading(() async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]["readyAlert"]["title"],
                lang.strings["deliveryAdminApp"]["readyAlert"]["subTitle"], () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 70, width: 70, child: Image.asset(box)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      // const Color(0xede29211),
                      const Color(0xffd3bc0b),
                      const Color(0xdbd17c18)
                    ]));
            if (res) {
              Get.snackbar("Loading", "");
              controller.readyForPickupOrder(widget.order.value!.orderId);
            }
          }),
        );

      case RestaurantOrderStatus.ReadyForPickup:
        return ButtonComponent(
          widget: getWidgetOrShowLoading(Text(
              lang.strings["deliveryAdminApp"]["ordersButton"]["deliver"],
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center)),
          gradient: LinearGradient(
              begin: Alignment(-0.10374055057764053, 0),
              end: Alignment(1.1447703838348389, 1.1694844961166382),
              colors: [const Color(0xff5572ea), const Color(0xdb1f18d1)]),
          function: () async => await onTapButtonsShowLoading(() async {
            var res = await dailogComponent(
                lang.strings["deliveryAdminApp"]["onTheWayAlert"]["title"],
                lang.strings["deliveryAdminApp"]["onTheWayAlert"]["subTitle"],
                () {
              Get.back(result: true);
            }, () {
              Get.back(result: false);
            },
                Container(height: 70, width: 70, child: Image.asset(truck)),
                LinearGradient(
                    begin: Alignment(-0.10374055057764053, 0),
                    end: Alignment(1.1447703838348389, 1.1694844961166382),
                    colors: [
                      const Color(0xff5572ea),
                      const Color(0xdb1f18d1)
                    ]));
            if (res) {
              Get.snackbar("Loading", "");
              controller.deliverOrder(widget.order.value!.orderId);
            }
          }),
        );
      case RestaurantOrderStatus.OnTheWay:
        return ButtonComponent(
            widget: getWidgetOrShowLoading(Text(
                lang.strings["deliveryAdminApp"]["ordersButton"]["received"],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center)),
            gradient: LinearGradient(
                begin: Alignment(-0.10374055057764053, 0),
                end: Alignment(1.1447703838348389, 1.1694844961166382),
                colors: [const Color(0xff13cb29), const Color(0xdb219125)]),
            function: () async => await onTapButtonsShowLoading(() async {
                  var res = await dailogComponent(
                      lang.strings["deliveryAdminApp"]["deliveredAlert"]
                          ["title"],
                      lang.strings["deliveryAdminApp"]["deliveredAlert"]
                          ["subTitle"], () {
                    Get.back(result: true);
                  }, () {
                    Get.back(result: false);
                  },
                      Container(
                          height: 70, width: 70, child: Image.asset(tick)),
                      LinearGradient(
                          begin: Alignment(-0.10374055057764053, 0),
                          end:
                              Alignment(1.1447703838348389, 1.1694844961166382),
                          colors: [
                            const Color(0xff13cb29),
                            const Color(0xdb219125)
                          ]));
                  if (res) {
                    Get.snackbar("Loading", "");
                    controller.dropOrder(widget.order.value!.orderId);
                    Get.back();
                  }
                }));

      default:
        return Container();
    }
  }

  Future<void> onTapButtonsShowLoading(Function function) async {
    if (!_clickedButton) {
      setState(() {
        _clickedButton = true;
      });

      await function();

      setState(() {
        _clickedButton = false;
      });
    }
  }

  Widget getWidgetOrShowLoading(Widget desiredWidget) {
    if (!_clickedButton) {
      return desiredWidget;
    } else {
      return Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      );
    }
  }
}
