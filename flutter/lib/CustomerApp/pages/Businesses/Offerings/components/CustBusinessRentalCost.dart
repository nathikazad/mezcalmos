import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper']['rental'];

class CustBusinessRentalCost extends StatelessWidget {
  const CustBusinessRentalCost({super.key, required this.cost});
  final Map<TimeUnit, num>? cost;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> generateCosetData() {
      String removePerFromUnit(TimeUnit unit) {
        return unit.name.toLowerCase().replaceAll("per", "");
      }

      final List<Map<String, dynamic>> data = [];
      var allCost = cost ?? {};
      allCost.map((key, value) {
        switch (key) {
          case TimeUnit.PerHour:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.hourglass_top,
            });
            break;
          case TimeUnit.PerDay:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.event,
            });
            break;
          case TimeUnit.PerWeek:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.date_range,
            });
            break;
          case TimeUnit.PerMonth:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.calendar_month,
            });
            break;
          case TimeUnit.Total:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.equalizer,
            });
            break;
          case TimeUnit.PerPerson:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.person,
            });
            break;
        }
        return MapEntry(key, value);
      });
      return data;
    }

    final List<Map<String, dynamic>> costData = generateCosetData();

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          direction: costData.length > 2 ? Axis.horizontal : Axis.vertical,
          children: [
            for (int index = 0; index < costData.length; index++)
              costData.length <= 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          costData[index]["icon"],
                        ),
                        Text(
                            '\$${(costData[index]['cost'] as double).toStringAsFixed(0)}/${_i18n()['shared'][costData[index]['unit']]}')
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          costData[index]["icon"],
                        ),
                        Text(
                            '\$${(costData[index]['cost'] as double).toStringAsFixed(0)}/${_i18n()['shared'][costData[index]['unit']]}')
                      ],
                    ),
          ],
        ));
  }
}
