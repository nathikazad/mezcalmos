import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ListRestaurantsScreen"]["components"]
    ["RestaurandCard"];

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
    LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
    final txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 145,
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
                        restaurant.info.name,
                        style: txt.headline3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        restaurant.description[userLanguage]!,
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
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                restaurant.items.length.toStringAsFixed(0) +
                                    ' ${_i18n()["items"]}',
                                style: txt.bodyText2,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              mezRestuarntCardImage()
            ],
          ),
        ),
      ),
    );
  }

  Container mezRestuarntCardImage() {
    ///responsible for the image of restaurant
    return Container(
      width: 35.w,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: 150.w,
              child: CachedNetworkImage(
                imageUrl: restaurant.info.image,
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
              height: double.infinity,
              width: 150.w,
              color: checkRestaurantAvailability(schedule: restaurant.schedule)
                  ? null
                  : Colors.black.withOpacity(0.5),
              child: checkRestaurantAvailability(schedule: restaurant.schedule)
                  ? null
                  : Center(
                      child: Text(
                        "${_i18n()["closed"]}",
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
