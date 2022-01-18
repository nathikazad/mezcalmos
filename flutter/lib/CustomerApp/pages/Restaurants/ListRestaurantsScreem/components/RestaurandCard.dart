import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:intl/intl.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  final GestureTapCallback? onClick;

  const RestaurantCard({
    Key? key,
    @required this.onClick,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: txt.headline3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        restaurant.description[lang.userLanguageKey]!,
                        style: txt.subtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              restaurant.items.length.toStringAsFixed(0) +
                                  ' ${lang.strings["customer"]["restaurant"]["menu"]["items"]}',
                              style: txt.bodyText2,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              mezRestuarntCardImage(lang)
            ],
          ),
        ),
      ),
    );
  }

  Container mezRestuarntCardImage(LanguageController lang) {
    ///responsible for the image of restaurant
    return Container(
      width: 150.w,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              height: 125,
              width: 150.w,
              child: CachedNetworkImage(
                imageUrl: restaurant.photo,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 15,
                  height: 15,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Container(
              height: 125,
              width: 150.w,
              color: checkRestaurantAvailability(schedule: restaurant.schedule)
                  ? null
                  : Colors.black.withOpacity(0.5),
              child: checkRestaurantAvailability(schedule: restaurant.schedule)
                  ? null
                  : Center(
                      child: Text(
                        "${lang.strings["customer"]["restaurant"]["menu"]["workingHours"]["closed"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

bool checkRestaurantAvailability({Schedule? schedule}) {
  var dayNane = DateFormat('EEEE').format(DateTime.now());

  var x = DateTime.now();

  if (schedule != null) {
    bool isOpen = false;
    schedule.openHours.forEach((key, value) {
      if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
        if (value.isOpen == true) {
          var dateOfStart =
              DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
          var dateOfClose =
              DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);
          mezDbgPrint(dateOfStart.toString());
          mezDbgPrint(dateOfClose.toString());
          if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
            mezDbgPrint("Today is $dayNane");
            isOpen = true;
          }
        } else {
          isOpen = false;
        }
      }
    });
    return isOpen;
  } else {
    return true;
  }
}
