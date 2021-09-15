import 'package:flutter/material.dart';
import 'package:mezcalmos/AdminApp/controller/OrderStatsController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/Shared/widgets/MezAdminOrdersComponents.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class OrdersCumOnDayPage extends GetView<OrderStatsController> {
  var f = new DateFormat('dd/MM/yy');
  var selectedtime = DateTime.now().obs;
  LanguageController lang = Get.find<LanguageController>();
  FutureBuilder<Map<String, dynamic>> getOrdersCumulativeOnDay() {
    return FutureBuilder<Map<String, dynamic>>(
        future: controller.getOrdersCumulativeOnDay(
            new DateTime.now()), // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        lang.strings["admin"]["orders"]["cumulative"],
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.bold),
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
                              padding: EdgeInsets.only(left: 15, right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Obx(() =>
                                      Text("${f.format(selectedtime.value)}")),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromRGBO(132, 139, 230, 1),
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              print("${snapshot.data!.keys}");
                              var x = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2018),
                                lastDate: DateTime(2030),
                              );
                              selectedtime.value =
                                  (x == null) ? DateTime.now() : x;
                              print(selectedtime.value);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  elevation: 5,
                  child: Container(
                    width: Get.width,
                    //padding: mypadding,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(118, 67, 224, 0.9),
                            Color.fromRGBO(80, 38, 163, 0.9)
                          ],
                          begin: Alignment(0.0, 0.8),
                          end: Alignment(0.8, 0.2),
                        ),
                      ),
                      child: Container(
                        padding: mypadding,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, right: 8, left: 10),
                                child: Text(
                                  lang.strings["admin"]["orders"]
                                      ["totalOrders"],
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.9568627450980393),
                                      fontSize: 31,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(
                                    right: 20, top: 10, bottom: 10),
                                child: Text(
                                  "${snapshot.data!["total"]}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.9568627450980393),
                                      fontSize: 27,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              MezAdminOrdersComponents.ordersCumOnDayComponent(
                  OrdersStates.Finished,
                  lang.strings["admin"]["orders"]["finished"],
                  "${snapshot.data!['finished']}"),
              SizedBox(
                height: 12,
              ),
              MezAdminOrdersComponents.ordersCumOnDayComponent(
                  OrdersStates.Cancelled,
                  lang.strings["admin"]["orders"]["cancelled"],
                  "${snapshot.data!['cancelled']}"),
              SizedBox(
                height: 12,
              ),
              MezAdminOrdersComponents.ordersCumOnDayComponent(
                  OrdersStates.Expired,
                  lang.strings["admin"]["orders"]["expired"],
                  "${snapshot.data!['expired']}"),
              SizedBox(
                height: 12,
              ),
              MezAdminOrdersComponents.ordersCumOnDayComponent(
                  OrdersStates.InProccess,
                  lang.strings["admin"]["orders"]["inProcess"],
                  "${snapshot.data!['inProcess']}"),
              SizedBox(
                height: 12,
              ),
              MezAdminOrdersComponents.ordersCumOnDayComponent(
                  OrdersStates.IsLooking,
                  lang.strings["admin"]["orders"]["isLooking"],
                  "${snapshot.data!['isLooking']}"),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Container(
                  height: Get.height * 0.9,
                  width: Get.width,
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
              Container(
                  height: Get.height * 0.9,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ],
                  )),
            ];
          }
          return Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
      body: Container(child: getOrdersCumulativeOnDay()),
    );
  }
}
