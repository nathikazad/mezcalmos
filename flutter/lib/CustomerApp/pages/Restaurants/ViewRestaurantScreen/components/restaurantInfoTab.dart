import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/workinHoursCart.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('hh:mm a');

class RestaurantInfoTab extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInfoTab({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Description :',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15.h),
              child: Text(restaurant.description),
            ),
            (restaurant.location != null)
                ? Column(
                    children: [
                      Container(
                        child: Text(
                          'Location :',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 250.h,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  )
                : Container(),
            (restaurant.schedule != null)
                ? getWorkingHoursWidget(restaurant.schedule, context)
                : Container()
          ],
        ),
      ),
    );
  }

  Widget getWorkingHoursWidget(Schedule? schedule, BuildContext context) {
    var xDate = DateTime.now();
    List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Working Hours :",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];
    int pos = 0;
    for (var i = 0; i < schedule!.openHours.length; i++) {
      schedule.openHours.forEach((key, value) {
        if (key.index == i) {
          widgets.add(WorkingHoursCart(
            day: key.toFirebaseFormatString().inCaps,
            isOpen: value.isOpen,
            openHour:
                "${f.format(DateTime(xDate.year, xDate.month, xDate.day, value.from[0], value.from[1]))}",
            closeHour:
                "${f.format(DateTime(xDate.year, xDate.month, xDate.day, value.to[0], value.to[1]))}",
          ));
          ;
        }
      });
    }
    return Column(
      children: widgets,
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.toUpperCase()).join(" ");
}
