import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/TaxiRequestOrderView/controllers/TaxiRequestOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

class TaxiRequestOrderView extends StatefulWidget {
  const TaxiRequestOrderView({super.key});

  static Future<void> navigate() async {
    await MezRouter.toPath(XRouter.taxiOrderRequestRoute);
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
      body: Stack(
        children: <Widget>[
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
                      recenterBtnBottomPadding: 150,
                      locationPickerMapController:
                          viewController.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (MezLocation? location) {
                        if (location != null) {
                          viewController.locationPickerController
                              .setLocation(location);
                        }
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          SafeArea(
            child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Obx(
                            () => _pickLocComponent(
                              title: "From",
                              onClear: viewController.clearFromLoc,
                              controller: viewController.fromLocText,
                              isFocused:
                                  viewController.isSettingFromLocation.value,
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
                              isFocused:
                                  viewController.isSettingToLocation.value,
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
                      ),
                    ),
                    hSmallSepartor,
                  ],
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       MezIconButton(
                //         onTap: () {
                //           MezRouter.back();
                //         },
                //         icon: Icons.close,
                //         padding: const EdgeInsets.all(10),
                //         borderRadius: BorderRadius.circular(10),
                //         backgroundColor: Colors.white,
                //         iconColor: Colors.grey.shade900,
                //         shape: BoxShape.rectangle,
                //       ),
                //       smallSepartor,
                //       MezIconButton(
                //         onTap: () async {
                //           await viewController.locationPickerController
                //               .locateMe();
                //         },
                //         icon: Icons.near_me_outlined,
                //         padding: const EdgeInsets.all(10),
                //         borderRadius: BorderRadius.circular(10),
                //         backgroundColor: Colors.white,
                //         iconColor: Colors.grey.shade900,
                //         shape: BoxShape.rectangle,
                //       )
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: MezIconButton(
                        onTap: () async {
                          await viewController.locationPickerController
                              .locateMe();
                        },
                        icon: Icons.near_me_outlined,
                        padding: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.white,
                        iconColor: Colors.grey.shade900,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (viewController.showRouteInfo)
                    return _routeInfoCard(context);
                  else
                    return SizedBox();
                }),

                Obx(
                  () => MezButton(
                    height: 80,
                    label: viewController.isSettingFromLocation.value ||
                            viewController.isSettingToLocation.value
                        ? "Pick"
                        : "Next",
                    borderRadius: 0,
                    onClick: () async {
                      await viewController.handleNext(context);
                    },
                  ),
                ),
              ],
            ),
          )
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
            children: <Widget>[
              Flexible(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MezIconButton(
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        onTap: () {
                          viewController.removeSeat();
                        },
                        icon: Icons.remove_circle_outline),
                    Obx(
                      () => Text.rich(TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                            child: Icon(Icons.airline_seat_recline_normal)),
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
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: <InlineSpan>[
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
                      text: TextSpan(children: <InlineSpan>[
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
              if (viewController.orderCost.value > 0) ...<Widget>[
                VerticalDivider(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Cost"),
                      Text(
                        "₹${viewController.orderCost.value.round()}",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ],
                  ),
                )
              ]
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
              width: isFocused ? 1.5 : 0)),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  hTinySepartor,
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
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isLoading ? Colors.grey.shade200 : null,
                    ),
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
                  if (isLoading) CircularProgressIndicator(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
