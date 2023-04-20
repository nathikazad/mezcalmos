import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < costData.length; index++)
            Column(
              children: [
                Icon(
                  costData[index]["icon"],
                ),
                Text(
                  "\$${(costData[index]["cost"] as double).toStringAsFixed(0)}/${costData[index]["unit"]}",
                ),
              ],
            )
        ],
      ),
    );
  }
}
