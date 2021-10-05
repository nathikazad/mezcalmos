import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbNotifs.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbOrders.dart';
import 'package:mezcalmos/TaxiAdminApp/components/infoCardComponent.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/driverController.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:toggle_switch/toggle_switch.dart';

class DriverPage extends GetView<DriverStatsController> {
  var f = new DateFormat('dd/MM/yyyy');
  var days = 7.obs;
  var switcherIndex = 0.obs;

  var notifsSwitcherIndex = 0.obs;
  final String idOrder;
  LanguageController lng = Get.find<LanguageController>();

  DriverPage(this.idOrder);
  Widget getDriverInfo(String driverId, int nbDays) {
    return getFutureData(getAllDriverInfo(driverId, nbDays), (data) {
      print(data[4]);
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.width * 0.3,
                    width: Get.width * 0.3,
                    color: Colors.white,
                    child: ClipOval(
                      child: (data[0]["photo"] != "")
                          ? Image.network(
                              "${data[0]["photo"]}",
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              aLogoPath,
                              height: 50,
                              width: 50,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: Get.width * 0.5,
                        child: Text(
                          "${data[0]["displayName"]}",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data[0]["taxiNumber"] != null)
                            ? "${data[0]["taxiNumber"]}"
                            : "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      (data[0]["agency"] != null)
                          ? Text(
                              "${data[0]["agency"]}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InfoCardComponent(
              title_0: lng.strings["admin"]["orders"]["orderId"],
              subTitle_0: "$idOrder",
              title_0_1: lng.strings["admin"]["appVersion"],
              subTitle_0_1: (data[1]["appVersionNumber"] == null)
                  ? "Unknown"
                  : "${data[1]["appVersionNumber"]}",
              title_1_0: lng.strings["admin"]["orders"]["totalOrders"],
              subTitle_1_0: "${data[2]["totalOrders"]}",
              title_1_1: lng.strings["admin"]["orders"]["droppedOff"],
              subTitle_1_1: "${data[2]["droppedOff"]}",
              title_2_0: lng.strings["admin"]["orders"]["firstOrder"],
              subTitle_2_0:
                  "${f.format(DateTime.parse("${data[2]["firstOrderTime"]}"))}",
              title_2_1: lng.strings["admin"]["orders"]["lastOrder"],
              subTitle_2_1:
                  "${f.format(DateTime.parse("${data[2]["lastOrderTime"]}"))}",
              title_3_0: lng.strings["admin"]["notifs"]["notifications"],
              subTitle_3_0:
                  "${lng.strings["admin"]["notifs"]["sent"]}:${data[2]["sentNotifications"]}",
              subTitle_3_1: "${lng.strings["admin"]["notifs"]["received"]}:0",
              subTitle_3_2:
                  "${lng.strings["admin"]["notifs"]["read"]}:${data[2]["readNotifications"]}",
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 300,
                    width: Get.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(155, 178, 254, 1),
                              Color.fromRGBO(223, 153, 253, 1),
                              Color.fromRGBO(242, 217, 217, 1)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  lng.strings["admin"]["orders"]["orders"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          )),
                          Spacer(),
                          Container(
                            child: ToggleSwitch(
                              minWidth: 45,
                              minHeight: 35,
                              cornerRadius: 18.0,
                              activeBgColors: [
                                [Color.fromRGBO(103, 121, 254, 1)],
                                [Color.fromRGBO(103, 121, 254, 1)],
                                [Color.fromRGBO(103, 121, 254, 1)]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.transparent,
                              inactiveFgColor: Colors.black,
                              initialLabelIndex: switcherIndex.value,
                              totalSwitches: 3,
                              fontSize: 15,
                              labels: ['7', '15', "30"],
                              radiusStyle: true,
                              onToggle: (index) {
                                switch (index) {
                                  case 0:
                                    days.value = 7;
                                    break;
                                  case 1:
                                    days.value = 15;
                                    break;
                                  case 2:
                                    days.value = 30;
                                    break;
                                  default:
                                }
                                switcherIndex.value = index;
                                Get.snackbar("Loading data ...", "",
                                    snackPosition: SnackPosition.BOTTOM);
                                print('switched to: $index');
                              },
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: Get.width * 0.95,
                          // child: SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          child: Container(
                            width: 500,
                            child: new charts.LineChart(
                                _createOrdersData(data[3]),
                                animate: true,
                                customSeriesRenderers: [
                                  new charts.LineRendererConfig(
                                      // ID used to link series to this renderer.
                                      customRendererId: 'customArea',
                                      includeArea: true,
                                      stacked: true),
                                ]),
                          ),
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                  Container(
                    height: 300,
                    width: Get.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(155, 178, 254, 1),
                              Color.fromRGBO(223, 153, 253, 1),
                              Color.fromRGBO(242, 217, 217, 1)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  lng.strings["admin"]["notifs"]
                                      ["notifications"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          )),
                          Spacer(),
                          Container(
                            child: ToggleSwitch(
                              minWidth: 45,
                              minHeight: 35,
                              cornerRadius: 18.0,
                              activeBgColors: [
                                [Color.fromRGBO(103, 121, 254, 1)],
                                [Color.fromRGBO(103, 121, 254, 1)],
                                [Color.fromRGBO(103, 121, 254, 1)]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.transparent,
                              inactiveFgColor: Colors.black,
                              initialLabelIndex: switcherIndex.value,
                              totalSwitches: 3,
                              fontSize: 15,
                              labels: ['7', '15', "30"],
                              radiusStyle: true,
                              onToggle: (index) {
                                switch (index) {
                                  case 0:
                                    days.value = 7;
                                    break;
                                  case 1:
                                    days.value = 15;
                                    break;
                                  case 2:
                                    days.value = 30;
                                    break;
                                  default:
                                }
                                switcherIndex.value = index;
                                Get.snackbar("Loading data ...", "",
                                    snackPosition: SnackPosition.BOTTOM);
                                print('switched to: $index');
                              },
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: Get.width * 0.9,
                          // child: SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          child: Container(
                            // width: 500,
                            child: new charts.LineChart(
                                _createNotifsData(data[4]),
                                animate: true,
                                customSeriesRenderers: [
                                  new charts.LineRendererConfig(
                                      // ID used to link series to this renderer.
                                      customRendererId: 'customArea',
                                      includeArea: true,
                                      stacked: true),
                                ]),
                          ),
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
    // return <Widget>[
    //   getFutureData(controller.getUserInfo(driverId),
    //       (Map<String, dynamic> data) {
    //     return Container(child: Text('Result: ${data}'));
    //   }),
    //   getFutureData(controller.getDriverFBData(driverId),
    //       (Map<String, dynamic> data) {
    //     return Container(child: Text('Result: ${data}'));
    //   }),
    //   getFutureData(controller.getDriverHasuraData(driverId),
    //       (Map<String, dynamic> data) {
    //     return Container(child: Text('Result: ${data}'));
    //   })
    // ];
  }

  // Widget getDriverOrdersLastNDays(String driverId, int nDays) {
  //   return getFutureData(controller.getDriverOrdersLastNDays(driverId, nDays),
  //       (List<dynamic> data) {
  //     return Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [Text('Result: ${data}')]);
  //   });
  // }

  // Widget getDriverNotificationsLastNDays(String driverId, int nDays) {
  //   return getFutureData(
  //       controller.getDriverNotificationsLastNDays(driverId, nDays),
  //       (List<dynamic> list) {
  //     return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       for (var driver in list)
  //         Text(
  //             'Rank:${driver['rank']}, Name: ${driver['displayName']}, Orders: ${driver['totalOrders']}')
  //     ]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Get.put<DriverStatsController>(DriverStatsController());
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
      body: GetX<DriverStatsController>(
          init: DriverStatsController(),
          builder: (controller) {
            return Container(child: getDriverInfo(idOrder, days.value));
          }
          // <Widget>[
          //   getDriverOrdersLastNDays(
          //       "yKo3XqL3dEd78BVgzjNOvAxru723", 30),
          //   getDriverNotificationsLastNDays(
          //       "yKo3XqL3dEd78BVgzjNOvAxru723", 30)
          // ]
          ),
    );
  }

  Future<List<dynamic>> getAllDriverInfo(String id, int nbDays) async {
    List<dynamic> x = [];

    var userInfo = await controller.getUserInfo(id);
    var driverFbData = await controller.getDriverFBData(id);
    var driverHasuraData = await controller.getDriverHasuraData(id);
    var driverOrdersLastNDays =
        await controller.getDriverOrdersLastNDays(id, nbDays);
    // print(driverOrdersLastNDays.toString());
    var driverNotificationsLastNDays =
        await controller.getDriverNotificationsLastNDays(id, nbDays);
    // print(driverNotificationsLastNDays.toString());
    x = [
      userInfo,
      driverFbData,
      driverHasuraData,
      driverOrdersLastNDays,
      driverNotificationsLastNDays
    ];
    return x;
  }
}

List<charts.Series<NbOrders, int>> _createOrdersData(List<dynamic> data) {
  final acceptedOrders = <NbOrders>[];
  final droppedOffOrders = <NbOrders>[];
  data.forEach((value) {
    if (value["index"].toString() != "0") {
      acceptedOrders.add(NbOrders("${value["index"]}",
          int.parse("${value["accepted_orders"].toString()}")));
      droppedOffOrders.add(NbOrders("${value["index"]}",
          int.parse("${value["droppedOff_orders"].toString()}")));
    }
  });

  return [
    new charts.Series<NbOrders, int>(
      id: 'acceptedOrders',
      colorFn: (_, __) => charts.Color.fromHex(code: '#77727A'),
      domainFn: (NbOrders orders, _) => int.parse(orders.day.toString()),
      measureFn: (NbOrders orders, _) => orders.nbOrders,
      data: acceptedOrders,
    ),
    new charts.Series<NbOrders, int>(
      id: 'droppedOffOrders',
      //#18B037
      colorFn: (_, __) => charts.Color.fromHex(code: '#18B037'),
      domainFn: (NbOrders orders, _) => int.parse(orders.day.toString()),
      measureFn: (NbOrders orders, _) => orders.nbOrders,
      data: droppedOffOrders,
    ),
  ];
}

List<charts.Series<NbNotifs, int>> _createNotifsData(List<dynamic> data) {
  final readNotifications = <NbNotifs>[];
  final sentNotifications = <NbNotifs>[];
  data.forEach((value) {
    if (value["index"].toString() != "0") {
      print("the key is and its values ${value}");
      readNotifications.add(NbNotifs("${value["index"]}",
          int.parse("${value["read_notifications"].toString()}")));
      sentNotifications.add(NbNotifs("${value["index"]}",
          int.parse("${value["sent_notifications"].toString()}")));
    }
  });

  return [
    new charts.Series<NbNotifs, int>(
      id: 'read',
      colorFn: (_, __) => charts.Color.fromHex(code: '#18B037'),
      domainFn: (NbNotifs notifs, _) => int.parse(notifs.day.toString()),
      measureFn: (NbNotifs notifs, _) => notifs.nbNotifs,
      data: readNotifications,
    ),
    new charts.Series<NbNotifs, int>(
      id: 'sent',
      //#18B037
      // ,
      colorFn: (_, __) => charts.Color.fromHex(code: '#77727A'),
      domainFn: (NbNotifs notifs, _) => int.parse(notifs.day.toString()),
      measureFn: (NbNotifs notifs, _) => notifs.nbNotifs,
      data: sentNotifications,
    ),
  ];
}
