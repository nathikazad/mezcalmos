import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiAdminApp/components/MezAdminOrdersComponents.dart';
import 'package:mezcalmos/TaxiAdminApp/components/appBar.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbOrders.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:charts_flutter/flutter.dart' as charts;

const mypadding = const EdgeInsets.symmetric(horizontal: 10);
var hasSize = true.obs;

class OrdersCumOnMonthPage extends GetView<OrderStatsController> {
  final f = new DateFormat('MMMM');
  var lastDay = DateTime.now().day - 1;
  var selectedtime = DateTime.now().obs;
  var nbday = 0.obs;
  LanguageController lang = Get.find<LanguageController>();
  FutureBuilder<Map<String, dynamic>> getOrderscumulativeOnMonth() {
    return FutureBuilder<Map<String, dynamic>>(
        future: controller.getOrderscumulativeOnMonth(selectedtime
            .value.month), // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
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
                          lang.strings["admin"]["orders"]["orders"],
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
                                  firstDate:
                                      DateTime(DateTime.now().year - 1, 5),
                                  lastDate: DateTime(DateTime.now().year,
                                      DateTime.now().month),
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
              Expanded(
                child: (snapshot.data!["cumulative"]["total"] != null)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          MezAdminOrdersComponents.ordersBoardView(
                              "${snapshot.data!["cumulative"]["total"]}",
                              "${snapshot.data!["cumulative"]["droppedoff"]}",
                              "${snapshot.data!["cumulative"]["cancelled"]}",
                              "${snapshot.data!["cumulative"]["expired"]}"),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, top: 20, bottom: 20),
                            margin: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: Obx(
                              () => charts.BarChart(
                                _createSampleData(snapshot.data!["byDay"]),
                                domainAxis: new charts.OrdinalAxisSpec(
                                  renderSpec: new charts.SmallTickRendererSpec(
                                    labelJustification:
                                        charts.TickLabelJustification.outside,
                                    // Tick and Label styling here.
                                    labelStyle: new charts.TextStyleSpec(
                                        fontSize: 12, // size in Pts.
                                        color: charts.Color.fromHex(
                                            code: '#6779FE')),

                                    // Change the line colors to match text color.
                                    lineStyle: new charts.LineStyleSpec(
                                      color:
                                          charts.Color.fromHex(code: '#6779FE'),
                                    ),
                                  ),
                                  viewport: hasSize.value
                                      ? new charts.OrdinalViewport(
                                          "${lastDay - 1}", 12)
                                      : null,
                                ),
                                selectionModels: [
                                  new charts.SelectionModelConfig(
                                      changedListener: (model) {
                                    //print(model.selectedSeries[0].measureFn(3));
                                    print(
                                        "${model.selectedDatum.first.datum.day}");
                                    nbday.value = int.parse(model
                                        .selectedDatum.first.datum.day
                                        .toString());
                                    // print(model.selectedSeries[0].measureFn(
                                    //     model.selectedDatum[1].index));
                                  })
                                ],
                                primaryMeasureAxis: new charts.NumericAxisSpec(
                                    renderSpec: new charts.GridlineRendererSpec(

                                        // Tick and Label styling here.
                                        labelStyle: new charts.TextStyleSpec(
                                            fontSize: 12, // size in Pts.
                                            color: charts.Color.fromHex(
                                                code: '#6779FE')),

                                        // Change the line colors to match text color.
                                        lineStyle: new charts.LineStyleSpec(
                                            color: charts.Color.fromHex(
                                                code: '#6779FE')))),
                                animate: true,
                                // layoutConfig: charts.LayoutConfig(
                                //     leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                                //     topMarginSpec: charts.MarginSpec.fixedPixel(75),
                                //     rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                                //     bottomMarginSpec: charts.MarginSpec.fixedPixel(175)),
                                defaultRenderer: charts.BarRendererConfig(
                                    groupingType:
                                        charts.BarGroupingType.stacked,
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
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => (nbday.value == 0)
                                ? checkIfTrue(snapshot.data!["byDay"], lastDay)
                                : checkIfTrue(
                                    snapshot.data!["byDay"], nbday.value),
                          )
                        ],
                      )
                    : MezAdminOrdersComponents.noDataImage(),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              )),
            ];
          } else {
            children = <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ],
              )),
            ];
          }
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
      appBar: mezCalmosAdminAppBar(context),
      body: GetX<OrderStatsController>(
        init: OrderStatsController(),
        builder: (controller) {
          return Container(child: getOrderscumulativeOnMonth());
        },
      ),
    );
  }

  List<charts.Series<NbOrders, String>> _createSampleData(
      Map<dynamic, dynamic>? data) {
    hasSize.value = data!.length >= 7 ? true : false;

    var finshedOrdersData = <NbOrders>[];

    var canceledOrdersData = <NbOrders>[];

    var expiredOrdersData = <NbOrders>[];
    data.forEach((key, value) {
      finshedOrdersData.add(NbOrders(key.toString(),
          int.parse(data[int.parse(key.toString())]["droppedoff"].toString())));
      canceledOrdersData.add(NbOrders(key.toString(),
          int.parse(data[int.parse(key.toString())]["cancelled"].toString())));
      expiredOrdersData.add(NbOrders(key.toString(),
          int.parse(data[int.parse(key.toString())]["expired"].toString())));
    });

    return [
      new charts.Series<NbOrders, String>(
        fillColorFn: (orders, _) {
          return charts.Color.fromHex(code: '#9C9E94');
        },
        colorFn: (_, index) => (index == lastDay - 1)
            ? charts.Color.fromHex(code: '#6779FE')
            : charts.MaterialPalette.transparent,
        id: 'Expered',
        domainFn: (NbOrders orders, _) => orders.day ?? "none",
        measureFn: (NbOrders orders, _) => orders.nbOrders,
        data: expiredOrdersData,
      ),
      new charts.Series<NbOrders, String>(
        fillColorFn: (orders, _) {
          return charts.Color.fromHex(code: '#BC7272');
        },
        colorFn: (_, index) => (index == lastDay - 1)
            ? charts.Color.fromHex(code: '#6779FE')
            : charts.MaterialPalette.transparent,
        id: 'Canceled',
        domainFn: (NbOrders orders, _) => orders.day ?? "none",
        measureFn: (NbOrders orders, _) => orders.nbOrders,
        data: canceledOrdersData,
      ),
      new charts.Series<NbOrders, String>(
        fillColorFn: (orders, _) {
          return charts.Color.fromHex(code: '#19A034');
        },
        keyFn: (datum, index) {
          return datum.day ?? "none";
        },
        colorFn: (_, index) => (index == lastDay - 1)
            ? charts.Color.fromHex(code: '#6779FE')
            : charts.MaterialPalette.transparent,
        id: 'Finished',
        domainFn: (NbOrders orders, _) => orders.day ?? "none",
        measureFn: (NbOrders orders, _) => orders.nbOrders,
        data: finshedOrdersData,
      ),
    ];
  }
}

//
Widget checkIfTrue(Map<dynamic, dynamic> data, int day) {
  var widget = null;

  data.forEach((key, value) {
    if (key.toString() == day.toString()) {
      print("hey" + data[day].toString());
      widget = MezAdminOrdersComponents.ordersBoardView(
          "${data[int.parse(key.toString())]["total"]}",
          "${data[int.parse(key.toString())]["droppedoff"]}",
          "${data[int.parse(key.toString())]["cancelled"]}",
          "${data[int.parse(key.toString())]["expired"]}");
    }
  });
  if (widget == null) {
    widget = MezAdminOrdersComponents.ordersBoardView("0", "0", "0", "0");
  }

  return Container(
    child: widget,
  );
}
