import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustClassCard extends StatelessWidget {
  const CustClassCard({
    super.key,
    required this.cardType,
    required this.title,
    required this.imageUrl,
    required this.agencyName,
    required this.price,
    required this.priceUnit,
    required this.needAgencyName,
    this.schedule = null,
  });

  final ScheduleType cardType;
  final String title;
  final String imageUrl;
  final String agencyName;
  final double price;
  final String? priceUnit;
  final bool needAgencyName;
  final Map<String, Map<String, String>>? schedule;

  @override
  Widget build(BuildContext context) {
    return _DefaultClassCard(
      title: title,
      imageUrl: imageUrl,
      needAgencyName: true,
      agencyName: agencyName,
      price: price,
      priceUnit: priceUnit,
      schedule: _getSchedule(),
    );
  }

  Map<String, Map<String, String>>? _getSchedule() {
    return cardType == ScheduleType.Scheduled ||
            cardType == ScheduleType.OneTime
        ? schedule
        : null;
  }
}

class _DefaultClassCard extends StatelessWidget {
  const _DefaultClassCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.priceUnit,
    required this.needAgencyName,
    this.schedule = null,
    this.agencyName = "",
  });

  final String imageUrl;
  final String title;
  final double price;
  final String? priceUnit;
  final bool needAgencyName;
  final String agencyName;
  final Map<String, Map<String, String>>? schedule;

  @override
  Widget build(BuildContext context) {
    // todo @ChiragKr04 refactor : DONT Create variables in build method
    final List<String> days = schedule?.keys.toList() ?? [];
    final List<Map<String, String>> time = schedule?.values.toList() ?? [];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MezCard(
        onClick: () {
          // AssetServiceView.navigate();
        },
        contentPadding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 6,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(title),
                      ),
                    ],
                  ),
                ),
                Text(
                  "\$$price${priceUnit != null ? "/" : ""}${priceUnit ?? ""}",
                ),
              ],
            ),
            schedule != null ? Divider() : const Offstage(),
            schedule != null
                ? Column(
                    children: [
                      for (int index = 0; index < days.length; index++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(days[index]),
                            Text("${time[index]["from"]}-${time[index]["to"]}"),
                          ],
                        ),
                    ],
                  )
                : const Offstage(),
            needAgencyName ? Divider() : const Offstage(),
            needAgencyName ? Text(agencyName) : const Offstage(),
          ],
        ),
      ),
    );
  }
}
