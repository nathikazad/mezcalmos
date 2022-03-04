import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/workinHoursCart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

final f = new DateFormat('hh:mma');

class RestaurantInfoTab extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInfoTab({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                '${lang.strings["customer"]["restaurant"]["menu"]["description"]} :',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15),
              child: Text(restaurant.description[lang.userLanguageKey]!),
            ),
            (restaurant.location != null)
                ? Column(
                    children: [
                      Container(
                        child: Text(
                          '${lang.strings["customer"]["restaurant"]["menu"]["location"]} :',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 250,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
    LanguageController lang = Get.find<LanguageController>();
    var xDate = DateTime.now();
    List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${lang.strings["customer"]["restaurant"]["menu"]["workingHours"]["workingHours"]}",
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
            day:
                "${lang.strings["customer"]["restaurant"]["menu"]["workingHours"]["weekDays"]["${key.toFirebaseFormatString()}"]}",
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
