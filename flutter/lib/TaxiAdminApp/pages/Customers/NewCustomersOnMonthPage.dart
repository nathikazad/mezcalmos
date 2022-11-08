// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:mezcalmos/TaxiAdminApp/components/appBar.dart';
// import 'package:mezcalmos/TaxiAdminApp/Models/NbCustomers.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:mezcalmos/TaxiAdminApp/controller/customersController.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';
// import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

// const mypadding = const EdgeInsets.symmetric(horizontal: 10);

// class NewCustomersOnMonthPage extends GetView<CustomersController> {
//   final f = new DateFormat('MMMM');
//   var selectedtime = DateTime.now().obs;
//   var dayValue = DateTime.now().day.obs;
//   Widget getFulfillmentRatioOnMonth(BuildContext context) {
//     return getFutureData(
//         controller.getNewCustomersForMonth(selectedtime.value.month),
//         (Map<String, dynamic> data) {
//       print(data);
//       return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         SizedBox(
//           height: 30,
//         ),
//         Container(
//           child: Text(
//             "New Customers",
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           padding: mypadding,
//           child: Theme(
//             data: Theme.of(context).copyWith(
//               primaryColor:
//                   Color.fromRGBO(79, 38, 162, 1), //color of the main banner
//               accentColor: Color.fromRGBO(79, 38, 162,
//                   1), //color of circle indicating the selected date
//               primaryColorBrightness: Brightness.light,
//               colorScheme: ColorScheme.light().copyWith(
//                 primary: Color.fromRGBO(79, 38, 162, 1),
//                 primaryVariant: Color.fromRGBO(79, 38, 162, 1),
//               ),
//               buttonTheme: ButtonThemeData(
//                   textTheme: ButtonTextTheme
//                       .accent //color of the text in the button "OK/CANCEL"
//                   ),
//             ),
//             child: Builder(
//               builder: (context) {
//                 return InkWell(
//                   child: Container(
//                     padding: EdgeInsets.only(left: 10, right: 5),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 1,
//                         color: Color.fromRGBO(112, 112, 112, 1),
//                       ),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Obx(() => Text(
//                               "${f.format(selectedtime.value)}",
//                               overflow: TextOverflow.ellipsis,
//                             )),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.purple,
//                         ),
//                       ],
//                     ),
//                     // child: ListTile(
//                     //   title: Text("9/3/21"),
//                     // trailing:
//                     // ),
//                   ),
//                   onTap: () async {
//                     print("hello");
//                     await showMonthPicker(
//                       context: context,
//                       firstDate: DateTime(DateTime.now().year - 1, 5),
//                       lastDate:
//                           DateTime(DateTime.now().year, DateTime.now().month),
//                       initialDate: selectedtime.value,
//                     ).then((x) {
//                       selectedtime.value = (x == null) ? DateTime.now() : x;
//                     });

//                     print(selectedtime.value.month);
//                     Get.snackbar("Loading data ...", "",
//                         snackPosition: SnackPosition.BOTTOM);
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         Container(
//           width: Get.width * 0.7,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromRGBO(118, 67, 224, 0.9),
//                         Color.fromRGBO(82, 40, 167, 1),
//                       ],
//                       begin: Alignment.center,
//                       end: Alignment.topRight,
//                     ),
//                     borderRadius: BorderRadius.circular(18)),
//                 child: Text(
//                   "${data["cumulative"].toString()}",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 alignment: Alignment.center,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromRGBO(118, 67, 224, 0.9),
//                         Color.fromRGBO(82, 40, 167, 1),
//                       ],
//                       begin: Alignment.center,
//                       end: Alignment.topRight,
//                     ),
//                     borderRadius: BorderRadius.circular(18)),
//                 child: Obx(
//                   () => Text(
//                     "${data["byDay"][dayValue.value].toString()}",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
//             margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   bottomLeft: Radius.circular(30),
//                 ),
//                 border: Border.all(width: 1, color: Colors.grey)),
//             child: charts.BarChart(
//               _createSampleData(data["byDay"]),
//               domainAxis: new charts.OrdinalAxisSpec(
//                 renderSpec: new charts.SmallTickRendererSpec(
//                   labelJustification: charts.TickLabelJustification.outside,
//                   // Tick and Label styling here.
//                   labelStyle: new charts.TextStyleSpec(
//                       fontSize: 12, // size in Pts.
//                       color: charts.Color.fromHex(code: '#6779FE')),

//                   // Change the line colors to match text color.
//                   lineStyle: new charts.LineStyleSpec(
//                     color: charts.Color.fromHex(code: '#6779FE'),
//                   ),
//                 ),
//                 viewport: charts.OrdinalViewport("${5}", 12),
//               ),
//               selectionModels: [
//                 new charts.SelectionModelConfig(changedListener: (model) {
//                   //print(model.selectedSeries[0].measureFn(3));
//                   print("${model.selectedDatum.first.datum.day}");
//                   dayValue.value =
//                       int.parse(model.selectedDatum.first.datum.day.toString());
//                   // print(model.selectedSeries[0].measureFn(
//                   //     model.selectedDatum[1].index));
//                 })
//               ],
//               primaryMeasureAxis: new charts.NumericAxisSpec(
//                   renderSpec: new charts.GridlineRendererSpec(

//                       // Tick and Label styling here.
//                       labelStyle: new charts.TextStyleSpec(
//                           fontSize: 12, // size in Pts.
//                           color: charts.Color.fromHex(code: '#6779FE')),

//                       // Change the line colors to match text color.
//                       lineStyle: new charts.LineStyleSpec(
//                           color: charts.Color.fromHex(code: '#6779FE')))),
//               animate: true,
//               // layoutConfig: charts.LayoutConfig(
//               //     leftMarginSpec: charts.MarginSpec.fixedPixel(0),
//               //     topMarginSpec: charts.MarginSpec.fixedPixel(75),
//               //     rightMarginSpec: charts.MarginSpec.fixedPixel(0),
//               //     bottomMarginSpec: charts.MarginSpec.fixedPixel(175)),
//               defaultRenderer: charts.BarRendererConfig(
//                   groupingType: charts.BarGroupingType.stacked,
//                   strokeWidthPx: 0.5,
//                   maxBarWidthPx: 15,
//                   layoutPaintOrder: 10),
//               barGroupingType: charts.BarGroupingType.stacked,
//               behaviors: [
//                 // Add the sliding viewport behavior to have the viewport center on the
//                 // domain that is currently selected.
//                 new charts.SlidingViewport(),
//                 // A pan and zoom behavior helps demonstrate the sliding viewport
//                 // behavior by allowing the data visible in the viewport to be adjusted
//                 // dynamically.
//                 new charts.PanAndZoomBehavior(),
//               ],

//               // Set an initial viewport to demonstrate the sliding viewport behavior on
//               // initial chart load.
//             ),
//           ),
//         ),
//         SizedBox(
//           height: Get.height * 0.1,
//         ),
//       ]);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Get.put<CustomersController>(CustomersController());
//     return Scaffold(
//         appBar: mezCalmosAdminAppBar(context),
//         body: GetX<CustomersController>(
//             init: CustomersController(),
//             builder: (controller) {
//               return Container(child: getFulfillmentRatioOnMonth(context));
//             }));
//   }
// }

// List<charts.Series<NbCustomers, String>> _createSampleData(
//     Map<dynamic, dynamic> data) {
//   var newCustomersData = <NbCustomers>[];
//   data.forEach((key, value) {
//     newCustomersData.add(new NbCustomers(
//         day: int.parse(key.toString()), nbCust: int.parse(value.toString())));
//   });

//   return [
//     new charts.Series<NbCustomers, String>(
//       fillColorFn: (orders, _) {
//         return charts.Color.fromHex(code: '#2C19D8');
//       },
//       colorFn: (_, index) => (index == 5 - 1)
//           ? charts.Color.fromHex(code: '#6779FE')
//           : charts.MaterialPalette.transparent,
//       id: 'Expered',
//       domainFn: (NbCustomers cust, _) => cust.day.toString(),
//       measureFn: (NbCustomers cust, _) => cust.nbCust,
//       data: newCustomersData,
//     ),
//   ];
// }
