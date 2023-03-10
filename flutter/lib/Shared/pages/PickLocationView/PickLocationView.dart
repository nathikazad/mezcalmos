// Example of the View
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/controllers/PickLocationViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["PickLocationScreen"]["PickLocationView"];

class PickLocationView extends StatefulWidget {
  static Future<MezLocation?> navigate({
    LatLng? initialLocation,
    Future<void> Function({MezLocation location, String name})? onSaveLocation,
  }) async {
    await MezRouter.toPath(SharedRoutes.kPickLocation, arguments: {
      "initialLocation": initialLocation,
    });
    mezDbgPrint("After await =====");
    return MezRouter.backResult;
  }

  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  PickLocationViewController viewController = PickLocationViewController();

  @override
  void initState() {
    viewController.init(
      defaultLocation: MezRouter.bodyArguments?["initialLocation"],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MezButton(
        height: 75,
        borderRadius: 0,
        label: "${_i18n()["pickLocation"]}",
        onClick: () async {
          await viewController.pickLocationClickAction(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: "${_i18n()["pickLocation"]}",
      ),
      body: mezPickLocationViewBody(),
    );
  }

  // ------------------------------------------- Functions -------------------------------------------

  // ------------------------------------------- WIDGETS -------------------------------------------
  // Widget pickButton() {
  //   return showScreenLoading == false && locationPickerController.isMapReady
  //       ? Container(
  //           height: 50,
  //           child: TextButton(
  //             style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
  //             onPressed: () async => onPickButtonClick(context),
  //             child: Center(
  //                 child: Text(_i18n()["pickLocation"],
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .displayMedium!
  //                         .copyWith(color: Colors.white, fontSize: 12.sp))),
  //           ),
  //         )
  //       : Container(
  //           height: 50,
  //           child: TextButton(
  //             style:
  //                 TextButton.styleFrom(backgroundColor: Colors.grey.shade400),
  //             onPressed: null,
  //             child: Center(
  //               child: Center(
  //                 child: CircularProgressIndicator(
  //                     strokeWidth: 1, color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         );
  // }

  Container mezPickLocationViewBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(_i18n()["pickLabele"]),
          ),

          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: LocationSearchComponent(
                  hintPadding: EdgeInsets.only(left: 10),
                  suffixPadding: EdgeInsets.only(right: 10),
                  showSearchIcon: true,
                  text: viewController
                      .locationPickerController.location.value?.address,
                  onClear: () {},
                  notifyParent: (MezLocation? location) {
                    setState(() {
                      viewController.locationPickerController
                          .setLocation(location!);
                      viewController.locationPickerController.moveToNewLatLng(
                          location.latitude, location.longitude);
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // stack
          Obx(
            () => Expanded(
                child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200),
              child: viewController.locationPickerController.location.value !=
                      null
                  ? LocationPicker(
                      showBottomButton: false,
                      locationPickerMapController:
                          viewController.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (MezLocation location) {
                        setState(() {
                          viewController.locationPickerController
                              .setLocation(location);
                        });
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 1,
                      ),
                    ),
            )),
          ),
        ],
      ),
    );
  }
}
