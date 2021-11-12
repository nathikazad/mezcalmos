import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/Models/NbOrders.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/constants/styles.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiAdminApp/components/MezAdminOrdersComponents.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotifCountOnDayByDriverPage.dart';

class OrdersOnDayPage extends GetView<OrderStatsController> {
  var f = new DateFormat('dd/MM/yy');
  var selectedtime = DateTime.now().obs;
  LanguageController lang = Get.find<LanguageController>();
  StreamBuilder<List<dynamic>> getOrdersOnDay() {
    return StreamBuilder<RxList<dynamic>>(
        stream: controller.getOrdersOnDay(
            selectedtime.value), // a previously-obtained Future<String> or null
        builder:
            (BuildContext context, AsyncSnapshot<RxList<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            children = <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Text(
                          lang.strings["admin"]["orders"]["orders"],
                          style: TextStyle(
                              fontSize: 29, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.off(() => NotifCountOnDayPage(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 500));
                        },
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
                              var x = await showDatePicker(
                                context: context,
                                initialDate: selectedtime.value,
                                firstDate: DateTime(2018),
                                lastDate: DateTime.now(),
                              );
                              selectedtime.value =
                                  (x == null) ? DateTime.now() : x;
                              print(selectedtime.value);

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
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff707070), width: 1),
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          const Color(0xff6e31ed),
                          const Color(0xff7d52d6)
                        ])),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          lang.strings["admin"]["orders"]["time"],
                          style: adminAppTextStyle1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          lang.strings["admin"]["orders"]["driver"],
                          style: adminAppTextStyle1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          lang.strings["admin"]["orders"]["cust"],
                          style: adminAppTextStyle1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "S",
                          style: adminAppTextStyle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "R",
                          style: adminAppTextStyle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "O",
                          style: adminAppTextStyle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        print(snapshot.data![index]);
                        var t = snapshot.data![index]['orderTime']
                            .toString()
                            .split("T")[1];
                        String driver = snapshot.data![index]["driver"] == null
                            ? "none"
                            : snapshot.data![index]["driver"]["photo"];
                        return MezAdminOrdersComponents.buildTableWidget(
                            getState(snapshot.data![index]["status"]),
                            "${snapshot.data![index]["orderId"]}",
                            "${t.split(":")[0]}:${t.split(":")[1]}",
                            driver,
                            "${snapshot.data![index]["customer"]["photo"]}",
                            "${snapshot.data![index]["notifications_sent"]}",
                            "${snapshot.data![index]["notifications_received"]}",
                            "${snapshot.data![index]["notifications_read"]}");
                      }),
                ),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Expanded(
                  child: Container(
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
                ),
              )),
            ];
          } else {
            children = <Widget>[
              Expanded(
                child: Container(
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
                  ),
                ),
              ),
            ];
          }
          return Container(
            // child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: children,
            ),
            //),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
        appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
        body: GetX<OrderStatsController>(
            init: OrderStatsController(),
            builder: (controller) {
              return Container(child: getOrdersOnDay());
            }));
  }
}

OrdersStates getState(String str) {
  OrdersStates? x = null;
  switch (str) {
    case "droppedOff":
      x = OrdersStates.Finished;
      break;
    case "cancelled":
      x = OrdersStates.Cancelled;
      break;
    case "expired":
      x = OrdersStates.Expired;
      break;
    case "isLooking":
      x = OrdersStates.IsLooking;
      break;
    case "inTransit":
      x = OrdersStates.InProccess;
      break;
    case "onTheWay":
      x = OrdersStates.InProccess;
      break;

    default:
  }
  return x!;
}
