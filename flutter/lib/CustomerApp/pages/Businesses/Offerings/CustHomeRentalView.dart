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
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessLocation.dart';

class CustHomeRentalView extends StatefulWidget {
  const CustHomeRentalView({super.key});
  static Future<void> navigate({required int rentalId}) async {
    final String route =
        CustBusinessRoutes.custHomeRentalRoute.replaceFirst(":id", "$rentalId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalView> createState() => _CustHomeRentalViewState();
}

class _CustHomeRentalViewState extends State<CustHomeRentalView> {
  CustHomeRentalViewController viewController = CustHomeRentalViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init rental view with id => $rentalId");
    if (rentalId != null) {
      viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Rental ID $rentalId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.homeRental != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.homeRental!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustBusinessTitle(
                        title: viewController
                                .homeRental!.details.name[userLanguage] ??
                            "No Title",
                      ),
                      CustBusinessAdditionalData(
                        additionalValues: viewController
                                .homeRental!.details.additionalParameters ??
                            {},
                      ),

                      CustBusinessDescription(
                        description:
                            viewController.homeRental!.details.description,
                      ),

                      // _BuildSchedule(
                      //   schedule: viewController.homeRental!.schedule,
                      //   scheduleType: viewController.homeRental!.scheduleType,
                      // ),

                      CustBusinessLocation(
                        location: viewController.homeRental!.gpsLocation,
                      ),

                      CustBusinessMessageCard(
                        business: viewController.homeRental!.business,
                      ),
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
        "monday": {
          // in 24hr format
          "from": "10:0",
          "to": "21:0",
          "isOpen": true
        },
        "tuesday": {
          // in 24hr format
          "from": "12:0",
          "to": "20:0",
          "isOpen": true
        },
        "wednesday": {
          // in 24hr format
          "from": "15:0",
          "to": "17:0",
          "isOpen": true
        },
      };
      final String firstKey = fakeSchedule.keys.first;
      final Map<String, dynamic> firstValue = fakeSchedule.values.first;
      switch (scheduleType) {
        case ScheduleType.Scheduled:
          return fakeSchedule;
        case ScheduleType.OnDemand:
          return {...firstValue};
        case ScheduleType.OneTime:
          return {...firstValue};
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
