import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiRequestOrderView/controllers/TaxiRequestOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/taxiOrderRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezIconButton.dart';

class TaxiRequestOrderView extends StatefulWidget {
  const TaxiRequestOrderView({super.key});

  static Future<void> navigate() async {
    await MezRouter.toPath(TaxiOrderRoutes.taxiOrderRequestRoute);
  }

  @override
  State<TaxiRequestOrderView> createState() => _TaxiRequestOrderViewState();
}

class _TaxiRequestOrderViewState extends State<TaxiRequestOrderView> {
  TaxiRequestOrderViewController viewController =
      TaxiRequestOrderViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
      //     onClick: MezRouter.back, title: "Taxi"),
      body: Stack(
        children: [
          Obx(
            () => Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200),
              child: viewController.locationPickerController.location.value !=
                      null
                  ? LocationPicker(
                      showBottomButton: false,
                      recenterBtnBottomPadding: 80,
                      locationPickerMapController:
                          viewController.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (MezLocation? location) {
                        // if (location != null) {
                        //   mezDbgPrint("Shouldnt be called =====");
                        //   setState(() {
                        //     viewController.locationPickerController
                        //         .setLocation(location);
                        //   });
                        // }
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   // margin: EdgeInsets.only(left: 8, right: 8, bottom: 0),
          //   child: Obx(
          //     () => Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          //       child: LocationSearchComponent(
          //           showSearchIcon: true,
          //           initialTextValue: viewController
          //               .locationPickerController.location.value?.address,
          //           onClear: () {},
          //           notifyParent: (MezLocation? location) {
          //             if (location != null) {
          //               setState(() {
          //                 viewController.locationPickerController
          //                     .setLocation(location);
          //                 viewController.locationPickerController
          //                     .moveToNewLatLng(
          //                         location.latitude, location.longitude);
          //               });
          //             }
          //           }),
          //     ),
          //   ),
          // ),

          Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 20, right: 12, left: 12),
              // margin: EdgeInsets.only(left: 8, right: 8, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => _pickLocComponent(
                      title: "From",
                      onClear: viewController.clearFromLoc,
                      controller: viewController.fromLocText,
                      isFocused: viewController.isSettingFromLocation.value,
                      onTap: viewController.startEditingFromLoc,
                      focusNode: viewController.fromLocFocusNode,
                      suggestions: viewController.fromSuggestions,
                      isLoading: viewController.fromLocLoading.value,
                      isFilled: viewController.isFromSetted,
                      onSelect: viewController.selectFromLocation,
                      onTyping: (String v) {
                        if (v.length.isEven) {
                          viewController.getSuggestions(
                              search: v, isFromLocation: true);
                        }
                      },
                    ),
                  ),
                  smallSepartor,
                  Obx(
                    () => _pickLocComponent(
                      title: "To",
                      onClear: viewController.clearToLoc,
                      isFocused: viewController.isSettingToLocation.value,
                      onTap: viewController.startEditingToLoc,
                      controller: viewController.toLocText,
                      focusNode: viewController.toLocFocusNode,
                      suggestions: viewController.toSuggestions,
                      isLoading: viewController.toLocLoading.value,
                      isFilled: viewController.isToSetted,
                      onSelect: viewController.selectToLocation,
                      onTyping: (String v) {
                        if (v.length.isEven) {
                          viewController.getSuggestions(
                              search: v, isFromLocation: false);
                        }
                      },
                    ),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  if (viewController.showRouteInfo)
                    return _routeInfoCard(context);
                  else
                    return SizedBox();
                }),
                Obx(
                  () => MezButton(
                    label: viewController.isSettingFromLocation.value ||
                            viewController.isSettingToLocation.value
                        ? "Pick"
                        : "Next",
                    borderRadius: 0,
                    onClick: () async {
                      await viewController.handleNext();
                    },
                  ),
                ),
              ],
            ),
          )
          // Container(
          //   alignment: Alignment.topRight,
          //   margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          //   child: MezIconButton(
          //       onTap: () {
          //         MezRouter.back();
          //       },
          //       iconSize: 27,
          //       padding: const EdgeInsets.all(5),
          //       elevation: 1.5,
          //       iconColor: Colors.black,
          //       backgroundColor: Colors.white,
          //       icon: Icons.close),
          // )
        ],
      ),
    );
  }

  Card _routeInfoCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: primaryBlueColor, width: 1.5)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Flexible(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MezIconButton(
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        onTap: () {
                          viewController.removeSeat();
                        },
                        icon: Icons.remove_circle_outline),
                    Obx(
                      () => Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.airline_seat_recline_normal)),
                        WidgetSpan(child: hSmallSepartor),
                        TextSpan(
                            text: "${viewController.numbOfSeats}",
                            style: context.textTheme.bodyLarge)
                      ])),
                    ),
                    MezIconButton(
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        onTap: () {
                          viewController.addSeat();
                        },
                        icon: Icons.add_circle_outline),
                  ],
                ),
              )),
              VerticalDivider(),
              Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.route,
                      size: 15.mezSp,
                    )),
                    WidgetSpan(child: hTinySepartor),
                    TextSpan(
                        text: viewController.route!.distance.distanceStringInKm,
                        style: context.textTheme.bodyMedium)
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.watch_later_outlined,
                      size: 15.mezSp,
                    )),
                    WidgetSpan(child: hTinySepartor),
                    TextSpan(
                        text: viewController.route!.duration.shortTextVersion,
                        style: context.textTheme.bodyMedium)
                  ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _pickLocComponent({
    required String title,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isLoading,
    required bool isFilled,
    required bool isFocused,
    required VoidCallback onTap,
    required VoidCallback onClear,
    required void Function(String)? onTyping,
    required void Function({required String description, String? placeId})
        onSelect,
    required List<AutoCompleteResult> suggestions,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: isFocused ? primaryBlueColor : Colors.white,
              width: isFocused ? 1.5 : 0.5)),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleSmall,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: onTyping,
                      decoration: InputDecoration(
                        hintText: "Search locations...",
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          customBorder: CircleBorder(),
                          onTap: isFilled ? onClear : null,
                          child: isFilled
                              ? Ink(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: offRedColor),
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                )
                              : Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                        ),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryBlueColor)),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: isLoading ? Colors.grey.shade200 : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(suggestions.length, (int index) {
                        final AutoCompleteResult suggestion =
                            suggestions[index];
                        return InkWell(
                          onTap: isLoading
                              ? null
                              : () {
                                  onSelect(
                                      placeId: suggestion.placeId,
                                      description: suggestion.description);
                                },
                          child: ListTile(
                            title: Text(suggestion.description),
                          ),
                        );
                      }),
                    ),
                  ),
                  if (isLoading)
                    CircularProgressIndicator(), // Show loading indicator if loading is true
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
