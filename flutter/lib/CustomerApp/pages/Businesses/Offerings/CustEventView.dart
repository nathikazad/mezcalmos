import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessAdditionalData.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessLocation.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.event != null) {
          mezDbgPrint(
              "EVENT ${viewController.event?.toFirebaseFormattedJson()}");
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
                      Text(
                        viewController.event!.details.name[userLanguage] ??
                            "No Title",
                        style: context.textTheme.displayMedium,
                      ),
                      CustBusinessAdditionalData(
                        additionalValues: viewController
                                .event!.details.additionalParameters ??
                            {},
                      ),
                      // Price
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          generateCost(),
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: primaryBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Text(
                        "Description",
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        viewController
                                .event!.details.description?[userLanguage] ??
                            "No Desription",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),

                      // todo @ChiragKr04 complete the view with the needed data

                      CustBusinessScheduleBuilder(
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
