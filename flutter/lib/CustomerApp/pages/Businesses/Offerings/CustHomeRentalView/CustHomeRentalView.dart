import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessInquryBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView/controllers/CustHomeRentalViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDurationPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustGuestPicker.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustOrderCostCard.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustHomeRentalView extends StatefulWidget {
  const CustHomeRentalView({super.key});
  static Future<void> navigate({
    required int rentalId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
    int? guestCount,
    String? roomType,
  }) async {
    final String route = cartId != null
        ? CustBusinessRoutes.custHomeRentalRouteEdit
            .replaceFirst(":id", "$rentalId")
        : CustBusinessRoutes.custHomeRentalRoute
            .replaceFirst(":id", "$rentalId");
    return MezRouter.toPath(route, arguments: {
      "startDate": startDate,
      "timeCost": timeCost,
      "guestCount": guestCount,
      "duration": duration,
      "cartId": cartId,
      "roomType": roomType,
    });
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
    mezDbgPrint("✅ init home rental view with id => $rentalId");
    final DateTime? startDate =
        MezRouter.bodyArguments!["startDate"] as DateTime?;
    final Map<TimeUnit, num>? timeCost =
        MezRouter.bodyArguments!["timeCost"] as Map<TimeUnit, num>?;
    final int? guestCount = MezRouter.bodyArguments!["guestCount"] as int?;
    final int? duration = MezRouter.bodyArguments!["duration"] as int?;
    final int? cartId = MezRouter.bodyArguments!["cartId"] as int?;
    final String? roomType = MezRouter.bodyArguments!["roomType"] as String?;

    if (rentalId != null) {
      viewController.init(
        rentalId: rentalId!,
        startDate: startDate,
        timeCost: timeCost,
        duration: duration,
        guestCount: guestCount,
        cartId: cartId,
        roomType: roomType,
      );
      // viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Home Rental ID $rentalId not found");
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
                      Text(
                        viewController.homeRental!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      if (!viewController.isMultipleRooms.value)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CustBusinessAdditionalData(
                              homeRental: viewController.homeRental!,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              _i18n()['price'],
                              style: context.textTheme.bodyLarge,
                            ),
                            CustBusinessRentalCost(
                              cost: viewController.homeRental!.details.cost,
                            ),
                          ],
                        ),
                      _description(context),

                      if (viewController.isMultipleRooms.value)
                        _multipleRoomSelector(context),
                      if (viewController.homeRental?.location.location != null)
                        ServiceLocationCard(
                          height: 20.h,
                          location: MezLocation(
                            viewController
                                .homeRental!.location.location.address,
                            MezLocation.buildLocationData(
                              viewController.homeRental!.location.location.lat
                                  .toDouble(),
                              viewController.homeRental!.location.location.lng
                                  .toDouble(),
                            ),
                          ),
                        ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        business: viewController.homeRental!.business,
                        offering: viewController.homeRental!.details,
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
                                  if (p0 == null) {
                                    BotToast.showText(
                                        text: "Please select a time",
                                        duration: Duration(seconds: 5));
                                    return "Please select a time";
                                  }

                                  return null;
                                },
                                time: viewController.startDate.value,
                              ),
                              bigSeperator,
                              CustBusinessDurationPicker(
                                costUnits: viewController.isMultipleRooms.value
                                    ? viewController
                                        .selectedRoomCostUnits.value!
                                    : viewController.homeRental!.details.cost,
                                label: "Duration",
                                value: viewController.duration.value,
                                unitValue:
                                    viewController.timeCost.value?.keys.first,
                                validator: (TimeUnit? p0) {
                                  if (p0 == null) {
                                    BotToast.showText(
                                        text: "Please select a time",
                                        duration: Duration(seconds: 5));
                                    return "Please select a time";
                                  }
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
                              CustGuestPicker(
                                label: "Guests",
                                onNewGuestSelected: (int v) {
                                  viewController.setTotalGuests(v);
                                },
                                value: viewController.totalGuests.value,
                                lowestValue: 1,
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

  Widget _multipleRoomSelector(BuildContext context) {
    return Column(
      children: List.generate(
        viewController.additionalRooms.length,
        (index) {
          final String roomType =
              viewController.additionalRooms[index]["roomType"];
          final Map<TimeUnit, num> costs =
              viewController.additionalRooms[index]["cost"];
          final bool isSelected = viewController.selectedRoom.value == index;
          final String circle = "•";
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      Text(
                        "${_i18n()[roomType]}",
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: isSelected ? primaryBlueColor : Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w600,
                        ),
                      ),
                      ...costs.entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            "$circle \$${e.value.toDouble().toStringAsFixed(0)}/${_i18n()[e.key.toFirebaseFormatString()]}",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: primaryBlueColor,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (viewController.isOnlineOrdering.value!)
                  Radio<String>(
                    activeColor: primaryBlueColor,
                    value: roomType,
                    groupValue: viewController.selectedRoom.value,
                    onChanged: (value) {
                      mezDbgPrint("RADIO Value: $value");
                      viewController.changeSelectedRoom(value!);
                    },
                  )
              ],
            ),
          );
        },
      ),
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
          viewController.homeRental!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  String _additionalData() {
    return '';
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.homeRental,
  });

  final HomeWithBusinessCard? homeRental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final Map<String, String> additionalValues = {
        'bedRooms': '${homeRental?.bedrooms ?? 0} ${_i18n()['bedrooms']}',
        'bathRooms': '${homeRental?.bathrooms ?? 0} ${_i18n()['bathrooms']}',
        'houseType':
            '${_i18n()[homeRental?.category1.name.toLowerCase()] ?? ''}',
      };

      String additionalData = '';

      for (String key in additionalValues.keys) {
        additionalData += additionalValues[key]!;

        if (additionalValues.keys.toList().indexOf(key) !=
            additionalValues.length - 1) {
          additionalData += ' • ';
        }
      }
      additionalData += homeRental?.details.additionalParameters?["petFriendly"] != null
              ? ' • ${_i18n()["petFriendly"] ?? ''}'
              : "";
      return additionalData;
    }

    return Text(
      wholeAdditionalParamString(),
      style: context.textTheme.bodyLarge!.copyWith(
        color: primaryBlueColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
