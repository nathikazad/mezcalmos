import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessAdditionalData.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessTitle.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDescription.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessBlueText.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessLocation.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class CustEventView extends StatefulWidget {
  const CustEventView({super.key});
  static Future<void> navigate({required int eventId}) async {
    final String route =
        CustBusinessRoutes.custEventRoute.replaceFirst(":id", "$eventId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustEventView> createState() => _CustEventViewState();
}

class _CustEventViewState extends State<CustEventView> {
  CustEventViewController viewController = CustEventViewController();
  int? eventId;
  @override
  void initState() {
    eventId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init event view with id => $eventId");
    if (eventId != null) {
      viewController.fetchData(eventId: eventId!);
    } else {
      showErrorSnackBar(errorText: "Error: Event ID $eventId not found");
    }
    super.initState();
  }

  String generateCost() {
    String removePerFromTime(TimeUnit timeUnit) {
      if (timeUnit == TimeUnit.Total) {
        return "";
      }
      return "/${timeUnit.name.toString().toLowerCase().replaceFirst("per", "")}";
    }

    final Map<TimeUnit, num> singleCost = viewController.event!.details.cost;
    switch (viewController.event!.scheduleType) {
      case ScheduleType.Scheduled:
        return "\$${singleCost.entries.first.value}";

      case ScheduleType.OnDemand:
        return "\$${singleCost.entries.first.value}${removePerFromTime(singleCost.entries.first.key)}";

      case ScheduleType.OneTime:
        return "\$${singleCost.entries.first.value}${removePerFromTime(singleCost.entries.first.key)}";
    }
  }

  String scheduleTypeHeading() {
    switch (viewController.event!.scheduleType) {
      case ScheduleType.Scheduled:
        return "Schedule";

      case ScheduleType.OnDemand:
        return "Availability";

      case ScheduleType.OneTime:
        return "Time";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.event != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.event!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustBusinessTitle(
                        title:
                            viewController.event!.details.name[userLanguage] ??
                                "No Title",
                      ),
                      CustBusinessAdditionalData(
                        additionalValues: viewController
                                .event!.details.additionalParameters ??
                            {},
                      ),
                      // Price
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CustBusinessBlueText(
                          text: generateCost(),
                        ),
                      ),
                      CustBusinessDescription(
                        description: viewController.event!.details.description,
                      ),
                      // todo @ChiragKr04 complete the view with the needed data

                      CustBusinessHeading(
                        text: scheduleTypeHeading(),
                      ),

                      _BuildSchedule(
                        schedule: viewController.event!.schedule,
                        scheduleType: viewController.event!.scheduleType,
                      ),

                      CustBusinessLocation(
                        location: viewController.event!.gpsLocation,
                      ),

                      CustBusinessMessageCard(
                        business: viewController.event!.business,
                      ),

                      CustBusinessNoOrderBanner(),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }
}

class _BuildSchedule extends StatelessWidget {
  const _BuildSchedule({
    required this.schedule,
    required this.scheduleType,
  });

  /// Schedule will look like this
  ///
  /// (showing this for reference coz schedule is dynamic)
  ///
  /// ```
  /// {
  ///   "monday": {
  ///     // in 24hr format
  ///     "from": "10:0",
  ///     "to": "21:0",
  ///     "isOpen": true
  ///   },
  ///   "tuesday": {
  ///     // in 24hr format
  ///     "from": "12:0",
  ///     "to": "20:0",
  ///     "isOpen": true
  ///   },
  /// }
  /// ```
  final dynamic schedule;
  final ScheduleType scheduleType;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("_BuildSchedule: $schedule $scheduleType");

    String formatTime(String timeString) {
      final List<String> parts = timeString.split(':');
      final int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);
      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        throw ArgumentError('Invalid time value: $timeString');
      }
      if (hour == 0) {
        return '12:${minute.toString().padLeft(2, '0')} AM';
      } else if (hour < 12) {
        return '${hour.toString()}:${minute.toString().padLeft(2, '0')} AM';
      } else if (hour == 12) {
        return '12:${minute.toString().padLeft(2, '0')} PM';
      } else if (hour > 12 && hour <= 23) {
        return '${(hour - 12).toString()}:${minute.toString().padLeft(2, '0')} PM';
      }
      throw ArgumentError('Invalid time value: $timeString');
    }

    Map<String, Map<String, dynamic>> changeScheduleOnTime() {
      var fakeSchedule = {
        "monday": {"from": "10:0", "to": "21:0", "isOpen": true},
        "tuesday": {"from": "12:0", "to": "20:0", "isOpen": true},
        "wednesday": {"from": "15:0", "to": "17:0", "isOpen": true},
      };
      final String firstKey = fakeSchedule.keys.first;
      final Map<String, dynamic> firstValue =
          fakeSchedule.values.first.cast<String, dynamic>();
      switch (scheduleType) {
        case ScheduleType.Scheduled:
          return fakeSchedule;
        case ScheduleType.OnDemand:
          return {"$firstKey": firstValue};
        case ScheduleType.OneTime:
          return {"$firstKey": firstValue};
      }
    }

    final Map<String, Map<String, dynamic>> tempSchedule =
        changeScheduleOnTime();

    // if (schedule == null || schedule.isEmpty()) {
    //   return Text("No Schedule Available");
    // }
    return Column(
      children: [
        for (int index = 0; index < tempSchedule.length; index++)
          Builder(
            builder: (context) {
              final String day = tempSchedule.keys.elementAt(index);
              final Map<String, dynamic> data = tempSchedule[day] ?? {};
              final String from = data['from'];
              final String to = data['to'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(tempSchedule.keys.elementAt(index)),
                        ),
                      ],
                    ),
                  ),
                  Text("${formatTime(from)}-${formatTime(to)}"),
                ],
              );
            },
          ),
      ],
    );
  }
}
