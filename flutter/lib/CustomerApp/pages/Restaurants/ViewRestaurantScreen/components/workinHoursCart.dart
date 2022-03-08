import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n = Get.find<LanguageController>().strings["CustomerApp"]["pages"]
["Restaurants"]["ViewRestaurantScreen"]["components"]["workinHoursCart"];

class WorkingHoursCart extends StatelessWidget {
  final String? day;
  final String? openHour;
  final String? closeHour;
  final bool? isOpen;
  const WorkingHoursCart(
      {Key? key, this.day, this.openHour, this.closeHour, this.isOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(day!),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              //  padding: const EdgeInsets.symmetric(horizontal: 8),
              color: isOpen!
                  ? Color.fromRGBO(101, 225, 137, 0.6)
                  : Color.fromRGBO(252, 89, 99, 0.6),
              child: Center(
                  child: Text(isOpen!
                      ? "${_i18n["open"]}"
                      : "${_i18n["closed"]}")),
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: isOpen!
                  ? Column(children: [
                      Text(
                        "$openHour",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$closeHour",
                        textAlign: TextAlign.center,
                      ),
                    ])
                  : Container(
                      height: 40,
                    )),
        ],
      ),
    );
  }
}
