import 'package:flutter/material.dart';
import 'package:mezcalmos/AdminApp/controller/DriverController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/MezAdminOrdersComponents.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:intl/intl.dart';

const mypadding = const EdgeInsets.symmetric(horizontal: 10);

class NotifCountOnDayPage extends GetView<DriverStatsController> {
  final f = new DateFormat('dd/MM/yy');
  var selectedtime = DateTime.now().obs;
  final TextEditingController srearchC = new TextEditingController();
  FutureBuilder<List<dynamic>> getNotificationCountOnDay() {
    return FutureBuilder<List<dynamic>>(
        future: controller.getNotificationCountOnDay(
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
                      child: Text(
                        "Notifications",
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
                              print("hello");
                              var x = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2018),
                                lastDate: DateTime(2030),
                              );
                              selectedtime.value =
                                  (x == null) ? DateTime.now() : x;
                              print(selectedtime.value);
                              // controller.searchQuery.value = srearchC.text;
                              // controller.getNotificationsResults(
                              //     controller.searchQuery.value,
                              //     selectedtime.value);
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
                    color: Color.fromRGBO(13, 12, 12, 0.34509803921568627)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 27,
                      //color: Color.fromRGBO(152, 147, 147, 1),
                      color: Color.fromRGBO(152, 147, 147, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      controller: srearchC,
                      onChanged: (val) {
                        controller.searchQuery.value = val.trim();
                        print(val.trim());
                        // controller.getNotificationsResults(
                        //     val.trim(), selectedtime.value);
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                    ))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(112, 54, 234, 1),
                          Color.fromRGBO(123, 78, 216, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Driver",
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
              Obx(
                () => (controller.searchQuery == "")
                    ? Container(
                        child: Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      //displayName
                                      //photo,
                                      //totalOrders
                                      //sent
                                      //received
                                      //read
                                      return MezAdminOrdersComponents.buildNotificationTable(
                                          index,
                                          "${snapshot.data![index]["photo"]}",
                                          "${snapshot.data![index]["displayName"]}",
                                          "${snapshot.data![index]["totalOrders"]}",
                                          "${snapshot.data![index]["sent"]}",
                                          "${snapshot.data![index]["received"]}",
                                          "${snapshot.data![index]["read"]}");
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: controller.searchedList.value
                                .where((x) => x["displayName"]
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(controller.searchQuery.value
                                        .trim()
                                        .toLowerCase()))
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              return MezAdminOrdersComponents.buildNotificationTable(
                                  index,
                                  "${controller.searchedList.value[index]["photo"]}",
                                  "${controller.searchedList.value[index]["displayName"]}",
                                  "${controller.searchedList.value[index]["totalOrders"]}",
                                  "${controller.searchedList.value[index]["sent"]}",
                                  "${controller.searchedList.value[index]["received"]}",
                                  "${controller.searchedList.value[index]["read"]}");
                              //Text(
                              //"${controller.searchedList.value[index]["displayName"]}");
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
    Get.put<DriverStatsController>(DriverStatsController());
    return Scaffold(
        appBar: MezcalmosSharedWidgets.mezCalmosAdminAppBar(context),
        body: GetX<DriverStatsController>(
            init: DriverStatsController(),
            builder: (controller) {
              return Container(child: getNotificationCountOnDay());
            }));
  }
}
