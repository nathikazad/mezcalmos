import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDurationPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessInquryBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustGuestPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustOrderCostCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustServiceView extends StatefulWidget {
  const CustServiceView({super.key});
  static Future<void> navigate({
    required int serviceId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
  }) async {
    final String route = cartId != null
        ? CustBusinessRoutes.custServiceRouteEdit
            .replaceFirst(":id", "$serviceId")
        : CustBusinessRoutes.custServiceRoute.replaceFirst(":id", "$serviceId");
    return MezRouter.toPath(route, arguments: {
      "startDate": startDate,
      "timeCost": timeCost,
      "duration": duration,
      "cartId": cartId,
    });
  }

  @override
  State<CustServiceView> createState() => _CustServiceViewState();
}

class _CustServiceViewState extends State<CustServiceView> {
  CustServiceViewController viewController = CustServiceViewController();
  int? serviceId;
  @override
  void initState() {
    serviceId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init service view with id => $serviceId");
    final DateTime? startDate =
        MezRouter.bodyArguments!["startDate"] as DateTime?;
    final Map<TimeUnit, num>? timeCost =
        MezRouter.bodyArguments!["timeCost"] as Map<TimeUnit, num>?;
    final int? duration = MezRouter.bodyArguments!["duration"] as int?;
    final int? cartId = MezRouter.bodyArguments!["cartId"] as int?;
    if (serviceId != null) {
      viewController.init(
        serviceId: serviceId!,
        startDate: startDate,
        timeCost: timeCost,
        duration: duration,
        cartId: cartId,
      );
      viewController.fetchData(serviceId: serviceId!);
    } else {
      showErrorSnackBar(errorText: "Error: Service ID $serviceId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => viewController.isOnlineOrdering.value!
            ? MezButton(
                label: viewController.isEditingMode.value
                    ? "Update Item"
                    : "Add to cart",
                withGradient: true,
                borderRadius: 0,
                onClick: viewController.startDate.value == null
                    ? null
                    : () async {
                        await viewController.bookOffering();
                      },
              )
            : SizedBox.shrink(),
      ),
      body: Obx(() {
        if (viewController.service != null) {
          final Map<TimeUnit, num> costData =
              viewController.service!.details.cost;
          mezDbgPrint("costData: $costData");
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.service!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.service!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 18.mezSp),
                      ),
                      SizedBox(height: 10),
                      viewController.service!.details.cost.length == 1
                          ? Text(
                              "${costData.entries.first.value.toPriceString()}/${costData.entries.first.key.name.toString().toLowerCase().replaceAll("per", "")}",
                              style: context.textTheme.bodyLarge!.copyWith(
                                color: primaryBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : CustBusinessRentalCost(
                              cost: viewController.service!.details.cost,
                            ),
                      _description(context),
                      CustBusinessScheduleBuilder(
                        period: null,
                        isService: true,
                        schedule: viewController.service!.schedule,
                        scheduleType: ScheduleType.Scheduled,
                      ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        business: viewController.service!.business,
                        offering: viewController.service!.details,
                      ),
                      if (!viewController.isOnlineOrdering.value!)
                        CustBusinessNoOrderBanner(),
                      if (viewController.isOnlineOrdering.value!)
                        CustBusinessInquryBanner(),

                      /// Booking
                      if (viewController.isOnlineOrdering.value!)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            bigSeperator,
                            BsOpDateTimePicker(
                              fillColor: Colors.white,
                              onNewPeriodSelected: (DateTime v) {
                                viewController.startDate.value = v;
                              },
                              label: _i18n()["choostTime"],
                              validator: (DateTime? p0) {
                                if (p0 == null) return "Please select a time";

                                return null;
                              },
                              time: viewController.startDate.value,
                            ),
                            bigSeperator,
                            if (viewController.service!.category1 ==
                                ServiceCategory1.Cleaning)
                              Column(
                                children: [
                                  CustGuestPicker(
                                    label: "Hours",
                                    onNewGuestSelected: (int v) {
                                      viewController.setTotalHours(v);
                                    },
                                    value: viewController.totalHours.value,
                                    lowestValue: 1,
                                  ),
                                  bigSeperator,
                                ],
                              ),
                            if (viewController.service!.category1 ==
                                ServiceCategory1.PetSitting)
                              Column(
                                children: [
                                  CustBusinessDurationPicker(
                                    costUnits:
                                        viewController.service!.details.cost,
                                    label: "Duration",
                                    unitValue: viewController
                                        .timeCost.value?.keys.first,
                                    value: viewController.totalHours.value,
                                    validator: (TimeUnit? p0) {
                                      if (p0 == null)
                                        return "Please select a time";
                                      return null;
                                    },
                                    onNewCostUnitSelected:
                                        (Map<TimeUnit, num> v) {
                                      viewController.setTimeCost(v);
                                    },
                                    onNewDurationSelected: (int v) {
                                      viewController.setTotalHours(v);
                                    },
                                  ),
                                  bigSeperator,
                                ],
                              ),
                            CustOrderCostCard(
                              orderCostString: viewController.orderString.value,
                            ),
                          ],
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
          viewController.service!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
