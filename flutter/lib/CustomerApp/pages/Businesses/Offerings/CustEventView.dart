import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessAdditionalData.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustGuestPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustOrderCostCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustEventView extends StatefulWidget {
  const CustEventView({super.key});
  static String constructRoute(int eventId) {
    return CustBusinessRoutes.custEventRoute.replaceFirst(":id", "$eventId");
  }

  static Future<void> navigate({
    required int eventId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
  }) async {
    final String route = cartId != null
        ? CustBusinessRoutes.custEventRouteEdit.replaceFirst(":id", "$eventId")
        : constructRoute(eventId);
    return MezRouter.toPath(route, arguments: {
      "startDate": startDate,
      "timeCost": timeCost,
      "duration": duration,
      "cartId": cartId,
    });
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
    final DateTime? startDate =
        MezRouter.bodyArguments!["startDate"] as DateTime?;
    final Map<TimeUnit, num>? timeCost =
        MezRouter.bodyArguments!["timeCost"] as Map<TimeUnit, num>?;
    final int? duration = MezRouter.bodyArguments!["duration"] as int?;
    final int? cartId = MezRouter.bodyArguments!["cartId"] as int?;
    if (eventId != null) {
      viewController.init(
        eventId: eventId!,
        startDate: startDate,
        timeCost: timeCost,
        duration: duration,
        cartId: cartId,
      );
      // viewController.fetchData(eventId: eventId!);
    } else {
      showErrorSnackBar(errorText: "Error: Event ID $eventId not found");
    }
    super.initState();
  }

  String generateCost() {
    String removePerFromTime(TimeUnit timeUnit) {
      if (timeUnit == TimeUnit.PerPerson) {
        return '/${_i18n()['person']}';
      }
      if (timeUnit == TimeUnit.Unit) {
        return "";
      }
      return '/${_i18n()[timeUnit.name.toString().toLowerCase().replaceFirst('per', '')]}';
    }

    if (viewController.event!.details.cost.entries.first.value == 0) {
      return '${_i18n()['free']}';
    }

    final Map<TimeUnit, num> singleCost = viewController.event!.details.cost;
    switch (viewController.event!.scheduleType) {
      case ScheduleType.Scheduled:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";

      case ScheduleType.OnDemand:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";

      case ScheduleType.OneTime:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => viewController.isOnlineOrdering.value!
            ? MezButton(
                label: viewController.isEditingMode.value
                    ? '${_i18n()['updateItme']}'
                    : '${_i18n()['addToCart']}',
                withGradient: true,
                borderRadius: 0,
                onClick: viewController.isValidated.value
                    ? () async {
                        await viewController.bookOffering();
                      }
                    : null,
              )
            : SizedBox.shrink(),
      ),
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
                        viewController.event!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      CustBusinessAdditionalData(
                        additionalValues: viewController
                                .event!.details.additionalParameters ??
                            {},
                      ),
                      // Price
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        generateCost(),
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: primaryBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      _description(context),
                      _schedule(),

                      if (viewController.event?.gpsLocation != null)
                        ServiceLocationCard(
                          height: 20.h,
                          location: MezLocation(
                            viewController.event!.gpsLocation?.address ?? "",
                            MezLocation.buildLocationData(
                              viewController.event!.gpsLocation!.lat.toDouble(),
                              viewController.event!.gpsLocation!.lng.toDouble(),
                            ),
                          ),
                        ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        business: viewController.event!.business,
                        offering: viewController.event!.details,
                      ),
                      if (!viewController.isOnlineOrdering.value!)
                        CustBusinessNoOrderBanner(),

                      /// Booking
                      if (viewController.isOnlineOrdering.value!)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (viewController.event!.scheduleType !=
                                ScheduleType.OneTime)
                              BsOpDateTimePicker(
                                fillColor: Colors.white,
                                onNewPeriodSelected: (DateTime v) {
                                  viewController.startDate.value = v;
                                },
                                label: '${_i18n()['startDate']}',
                                validator: (DateTime? p0) {
                                  if (p0 == null)
                                    return '${_i18n()['selectATime']}';

                                  return null;
                                },
                                time: viewController.startDate.value,
                              ),
                            if (viewController.event!.scheduleType ==
                                ScheduleType.OnDemand)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustGuestPicker(
                                    label: '${_i18n()['hours']}',
                                    icon: Icons.hourglass_bottom,
                                    onNewGuestSelected: (int v) {
                                      viewController.setTotalHours(v);
                                    },
                                    value: viewController.totalHours.value,
                                    lowestValue: 1,
                                  ),
                                  bigSeperator,
                                ],
                              ),
                            if (viewController.event!.scheduleType ==
                                ScheduleType.OnDemand)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_i18n()['notes']}',
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  smallSepartor,
                                  TextFormField(
                                    maxLines: 5,
                                    minLines: 3,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: '${_i18n()['writeNotesHere']}',
                                    ),
                                  ),
                                ],
                              ),
                            bigSeperator,
                            CustOrderCostCard(
                              orderCostString: viewController.orderString.value,
                            ),
                          ],
                        )
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

  Column _schedule() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        CustBusinessScheduleBuilder(
          period: viewController.event!.period,
          icon: Icons.calendar_today,
          schedule: viewController.event!.schedule,
          scheduleType: viewController.event!.scheduleType,
        )
      ],
    );
  }

  Column _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          _i18n()['description'],
          style: context.textTheme.bodyLarge,
        ),
        Text(
          viewController.event!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
