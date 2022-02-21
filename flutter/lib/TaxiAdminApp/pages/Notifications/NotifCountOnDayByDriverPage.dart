import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/constants/styles.dart';
import 'package:mezcalmos/TaxiAdminApp/components/MezAdminOrdersComponents.dart';
import 'package:mezcalmos/TaxiAdminApp/components/appBar.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/notificationsController.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnDayPage.dart';

const mypadding = const EdgeInsets.symmetric(horizontal: 10);

dynamic _i18n = Get.find<LanguageController>().strings["TaxiAdminApp"]["pages"]
["Notifications"]["NotifCountOnDayByDriverPage"];

class NotifCountOnDayPage extends GetView<NotificationsController> {
 
  final f = new DateFormat('dd/MM/yy');
  var selectedtime = DateTime.now().obs;
  final TextEditingController srearchC = new TextEditingController();
  var searchQuery = "".obs;
  FutureBuilder<List<dynamic>> getNotificationCountOnDayByDrivers() {
    return FutureBuilder<List<dynamic>>(
        future: controller.getNotificationCountOnDayByDrivers(
            selectedtime.value), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                padding: mypadding,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Text(
                          _i18n["notifications"],
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.off(() => OrdersCumOnDayPage(),
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
                                  Obx(() =>
                                      Text("${f.format(selectedtime.value)}")),
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
                              var x = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2018),
                                lastDate: DateTime(2030),
                              );
                              selectedtime.value =
                                  (x == null) ? DateTime.now() : x;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: mypadding,
                height: 50,
                width: Get.width,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          const Color(0xff0d0c0c).withOpacity(0.2),
                          const Color(0xff6f6d6d).withOpacity(0.2)
                        ])),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 27,
                      color: Color.fromRGBO(152, 147, 147, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      controller: srearchC,
                      onChanged: (val) {
                        searchQuery.value = val.trim();
                        print(val.trim());
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                    ))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff707070),
                      width: 1,
                    ),
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
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          _i18n["driver"],
                          style: adminAppTextStyle1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "T",
                          style: adminAppTextStyle1,
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
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Obx(() => snapshot.data![index]
                                          ["displayName"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase())
                                  ? MezAdminOrdersComponents.buildNotificationTable(
                                      "${snapshot.data![index]["uid"]}",
                                      index,
                                      "${snapshot.data![index]["photo"]}",
                                      "${snapshot.data![index]["displayName"]}",
                                      "${snapshot.data![index]["totalOrders"]}",
                                      "${snapshot.data![index]["sent"]}",
                                      "${snapshot.data![index]["received"]}",
                                      "${snapshot.data![index]["read"]}")
                                  : Container());
                            }),
                      )
                    ],
                  ),
                ),
              )
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: children,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<NotificationsController>(NotificationsController());
    return Scaffold(
        appBar: mezCalmosAdminAppBar(context),
        body: GetX<NotificationsController>(
            init: NotificationsController(),
            builder: (controller) {
              return Container(child: getNotificationCountOnDayByDrivers());
            }));
  }
}
