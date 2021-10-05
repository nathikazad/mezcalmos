import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbNotifs.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/notificationsController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:charts_flutter/flutter.dart' as charts;

const mypadding = const EdgeInsets.symmetric(horizontal: 10);

class NotificationsOnMonthPage extends GetView<NotificationsController> {
  final f = new DateFormat('MMMM');
  var selectedtime = DateTime.now().obs;
  var dayValue = 0.obs;
  Widget getNotificationForMonth(BuildContext context) {
    return getFutureData(
        controller.getNotificationForMonth(selectedtime.value.month),
        (Map<String, dynamic> data) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: Get.width * 0.8,
                padding: mypadding,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Notifs",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        primaryColor: Color.fromRGBO(
                            79, 38, 162, 1), //color of the main banner
                        accentColor: Color.fromRGBO(79, 38, 162,
                            1), //color of circle indicating the selected date
                        primaryColorBrightness: Brightness.light,
                        colorScheme: ColorScheme.light().copyWith(
                          primary: Color.fromRGBO(79, 38, 162, 1),
                          primaryVariant: Color.fromRGBO(79, 38, 162, 1),
                        ),
                        buttonTheme: ButtonThemeData(
                            textTheme: ButtonTextTheme
                                .accent //color of the text in the button "OK/CANCEL"
                            ),
                      ),
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        "${f.format(selectedtime.value)}",
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.purple,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              await showMonthPicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 1, 5),
                                lastDate: DateTime(
                                    DateTime.now().year, DateTime.now().month),
                                initialDate: selectedtime.value,
                              ).then((x) {
                                selectedtime.value =
                                    (x == null) ? DateTime.now() : x;
                              });

                              Get.snackbar("Loading data ...", "",
                                  snackPosition: SnackPosition.BOTTOM);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(0.9568901658058167, 0.5),
                            end: Alignment(0.11593939363956451, 0.5),
                            colors: [
                              const Color(0xff4f26a2),
                              const Color(0xff7643e0)
                            ]),
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "${data["cumulative"]["sent"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(0.09354447573423386, 0.5),
                            end: Alignment(
                                0.9385244250297546, 0.6013823747634888),
                            colors: [
                              const Color(0xff19a535),
                              const Color(0xff0d531b)
                            ]),
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "${data["cumulative"]["read"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: charts.BarChart(
                  _createSampleData(data["byDay"]),
                  domainAxis: new charts.OrdinalAxisSpec(
                    renderSpec: new charts.SmallTickRendererSpec(
                      labelJustification: charts.TickLabelJustification.outside,
                      // Tick and Label styling here.
                      labelStyle: new charts.TextStyleSpec(
                          fontSize: 12, // size in Pts.
                          color: charts.Color.fromHex(code: '#6779FE')),

                      // Change the line colors to match text color.
                      lineStyle: new charts.LineStyleSpec(
                        color: charts.Color.fromHex(code: '#6779FE'),
                      ),
                    ),
                    viewport: charts.OrdinalViewport("${5}", 12),
                  ),
                  selectionModels: [
                    new charts.SelectionModelConfig(changedListener: (model) {
                      //print(model.selectedSeries[0].measureFn(3));
                      dayValue.value = int.parse(
                          model.selectedDatum.first.datum.day.toString());
                      // print(model.selectedSeries[0].measureFn(
                      print("${data["byDay"][dayValue.value]["sent"]}");
                      //     model.selectedDatum[1].index));
                    })
                  ],
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                      renderSpec: new charts.GridlineRendererSpec(

                          // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: 12, // size in Pts.
                              color: charts.Color.fromHex(code: '#6779FE')),

                          // Change the line colors to match text color.
                          lineStyle: new charts.LineStyleSpec(
                              color: charts.Color.fromHex(code: '#6779FE')))),
                  animate: true,
                  // layoutConfig: charts.LayoutConfig(
                  //     leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                  //     topMarginSpec: charts.MarginSpec.fixedPixel(75),
                  //     rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                  //     bottomMarginSpec: charts.MarginSpec.fixedPixel(175)),
                  defaultRenderer: charts.BarRendererConfig(
                      groupingType: charts.BarGroupingType.stacked,
                      strokeWidthPx: 0.5,
                      maxBarWidthPx: 15,
                      layoutPaintOrder: 10),
                  barGroupingType: charts.BarGroupingType.stacked,
                  behaviors: [
                    // Add the sliding viewport behavior to have the viewport center on the
                    // domain that is currently selected.
                    new charts.SlidingViewport(),
                    // A pan and zoom behavior helps demonstrate the sliding viewport
                    // behavior by allowing the data visible in the viewport to be adjusted
                    // dynamically.
                    new charts.PanAndZoomBehavior(),
                  ],

                  // Set an initial viewport to demonstrate the sliding viewport behavior on
                  // initial chart load.
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(0.9568901658058167, 0.5),
                            end: Alignment(0.11593939363956451, 0.5),
                            colors: [
                              const Color(0xff4f26a2),
                              const Color(0xff7643e0)
                            ]),
                        borderRadius: BorderRadius.circular(18)),
                    child: Obx(
                      () => Text(
                        (dayValue.value != 0)
                            ? "${data["byDay"][dayValue.value]["sent"]}"
                            : "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(0.09354447573423386, 0.5),
                            end: Alignment(
                                0.9385244250297546, 0.6013823747634888),
                            colors: [
                              const Color(0xff19a535),
                              const Color(0xff0d531b)
                            ]),
                        borderRadius: BorderRadius.circular(18)),
                    child: Obx(
                      () => Text(
                        (dayValue.value != 0)
                            ? "${data["byDay"][dayValue.value]["read"]}"
                            : "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<NotificationsController>(NotificationsController());
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
      body: GetX<NotificationsController>(
          init: NotificationsController(),
          builder: (controller) {
            return Container(child: getNotificationForMonth(context));
          }),
    );
  }
}

List<charts.Series<NbNotifs, String>> _createSampleData(
    Map<dynamic, dynamic> data) {
  var sentData = <NbNotifs>[];
  var readData = <NbNotifs>[];
  data.forEach((key, value) {
    //print(data[key][]);
    sentData
        .add(new NbNotifs(key.toString(), int.parse(value["sent"].toString())));
    readData
        .add(new NbNotifs(key.toString(), int.parse(value["read"].toString())));
  });

  return [
    new charts.Series<NbNotifs, String>(
      fillColorFn: (orders, _) {
        return charts.Color.fromHex(code: '#9a9da1');
      },
      colorFn: (_, index) => (index == 5 - 1)
          ? charts.Color.fromHex(code: '#6779FE')
          : charts.MaterialPalette.transparent,
      id: 'Expered',
      domainFn: (NbNotifs notif, _) => notif.day.toString(),
      measureFn: (NbNotifs notif, _) => notif.nbNotifs,
      data: sentData,
    ),
    new charts.Series<NbNotifs, String>(
      fillColorFn: (orders, _) {
        return charts.Color.fromHex(code: '#75e6ad');
      },
      colorFn: (_, index) => (index == 5 - 1)
          ? charts.Color.fromHex(code: '#6779FE')
          : charts.MaterialPalette.transparent,
      id: 'Expered',
      domainFn: (NbNotifs notif, _) => notif.day.toString(),
      measureFn: (NbNotifs notif, _) => notif.nbNotifs,
      data: readData,
    ),
  ];
}
