import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView/controllers/CustRentalViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDurationPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessInquryBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustOrderCostCard.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustRentalView extends StatefulWidget {
  const CustRentalView({super.key});

  static String constructRoute(int rentalId) {
    return CustBusinessRoutes.custRentalRoute.replaceFirst(":id", "$rentalId");
  }

  static Future<void> navigate({
    required int rentalId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
  }) async {
    final String route = cartId != null
        ? CustBusinessRoutes.custRentalRoute.replaceFirst(":id", "$rentalId")
        : constructRoute(rentalId);
    return MezRouter.toPath(route, arguments: {
      "startDate": startDate,
      "timeCost": timeCost,
      "duration": duration,
      "cartId": cartId,
    });
  }

  @override
  State<CustRentalView> createState() => _CustRentalViewState();
}

class _CustRentalViewState extends State<CustRentalView> {
  CustRentalViewController viewController = CustRentalViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init rental view with id => $rentalId");
    final DateTime? startDate =
        MezRouter.bodyArguments!["startDate"] as DateTime?;
    final Map<TimeUnit, num>? timeCost =
        MezRouter.bodyArguments!["timeCost"] as Map<TimeUnit, num>?;
    final int? duration = MezRouter.bodyArguments!["duration"] as int?;
    final int? cartId = MezRouter.bodyArguments!["cartId"] as int?;
    if (rentalId != null) {
      viewController.init(
        rentalId: rentalId!,
        startDate: startDate,
        timeCost: timeCost,
        duration: duration,
        cartId: cartId,
      );
      // viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Rental ID $rentalId not found");
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
                onClick: () async {
                  await viewController.bookOffering();
                },
              )
            : SizedBox.shrink(),
      ),
      body: Obx(() {
        if (viewController.rental != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.rental!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.rental!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      _CustBusinessAdditionalData(
                        rental: viewController.rental!,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _i18n()['price'],
                        style: context.textTheme.bodyLarge,
                      ),
                      CustBusinessRentalCost(
                        cost: viewController.rental!.details.cost,
                      ),
                      _description(context),
                      viewController.rental!.business.location == null
                          ? const SizedBox.shrink()
                          : ServiceLocationCard(
                              height: 20.h,
                              location: MezLocation(
                                viewController
                                        .rental!.business.location?.address ??
                                    "",
                                MezLocation.buildLocationData(
                                  viewController.rental!.business.location!.lat
                                      .toDouble(),
                                  viewController.rental!.business.location!.lng
                                      .toDouble(),
                                ),
                              ),
                            ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
                        business: viewController.rental!.business,
                        offering: viewController.rental!.details,
                      ),
                      if (!viewController.isOnlineOrdering.value!)
                        CustBusinessNoOrderBanner(),
                      if (viewController.isOnlineOrdering.value!)
                        CustBusinessInquryBanner(),

                      /// Bookings
                      if (viewController.isOnlineOrdering.value!)
                        Form(
                          key: viewController.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bigSeperator,
                              BsOpDateTimePicker(
                                fillColor: Colors.white,
                                onNewPeriodSelected: (DateTime v) {
                                  viewController.startDate.value = v;
                                },
                                label: "Start Date",
                                validator: (DateTime? p0) {
                                  if (p0 == null) return "Please select a time";

                                  return null;
                                },
                                time: viewController.startDate.value,
                              ),
                              bigSeperator,
                              CustBusinessDurationPicker(
                                costUnits: viewController.rental!.details.cost,
                                unitValue:
                                    viewController.timeCost.value?.keys.first,
                                label: "Duration",
                                value: viewController.duration.value,
                                validator: (TimeUnit? p0) {
                                  if (p0 == null) return "Please select a time";
                                  return null;
                                },
                                onNewCostUnitSelected: (Map<TimeUnit, num> v) {
                                  viewController.setTimeCost(v);
                                },
                                onNewDurationSelected: (int v) {
                                  viewController.setDuration(v);
                                },
                              ),
                              bigSeperator,
                              Text(
                                "Notes",
                                style: context.textTheme.bodyLarge,
                              ),
                              smallSepartor,
                              TextFormField(
                                maxLines: 7,
                                minLines: 5,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Write your notes here.",
                                ),
                              ),
                              bigSeperator,
                              CustOrderCostCard(
                                orderCostString:
                                    viewController.orderString.value,
                              ),
                            ],
                          ),
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

  IconData _getIcon() {
    switch (viewController.rental!.category2) {
      case RentalCategory2.Motorcycle:
        return Icons.two_wheeler;
      case RentalCategory2.Car:
        return Icons.directions_car;
      case RentalCategory2.ATB:
        return Icons.two_wheeler;
      case RentalCategory2.Bicycle:
        return Icons.pedal_bike;
      default:
        return Icons.two_wheeler;
    }
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
          viewController.rental!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.rental,
  });

  final RentalWithBusinessCard? rental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final String circle = "•";

      final Map<String, String> additionalValues = rental
              ?.details.additionalParameters
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};

      final StringBuffer wholeString = StringBuffer();

      if (additionalValues['minLength'] != null &&
          additionalValues['maxLength'] != null) {
        wholeString.write(
            '${additionalValues['minLength']} ${_i18n()['to']} ${additionalValues['maxLength']} inch');
        additionalValues.remove('minLength');
        additionalValues.remove('maxLength');
      }

      additionalValues.map(
        (key, value) {
          // if (additionalValues.keys.toList().indexOf(key) == 0) {
          //   wholeString.write("$value ");
          // } else {
          wholeString.write("$circle $value ");
          // }

          // if (key == "minLength") {
          //   wholeString.write("inch ");
          // } else if (key == "maxLength") {
          //   wholeString.write("inch ");
          // }

          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    final String addtionalData = wholeAdditionalParamString();
    return addtionalData.isEmpty
        ? const SizedBox.shrink()
        : Text(
            addtionalData,
            style: context.textTheme.bodyLarge!.copyWith(
              color: primaryBlueColor,
              fontWeight: FontWeight.w600,
            ),
          );
  }
}
