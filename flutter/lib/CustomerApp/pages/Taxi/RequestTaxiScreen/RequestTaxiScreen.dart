import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/NearByOnlineTaxiDriversWidget.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/components/RequestTaxiScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiReqBottomBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

enum FieldType { Date, Time, Neither }

class RequestTaxiScreen extends StatefulWidget {
  const RequestTaxiScreen({Key? key}) : super(key: key);

  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  /// RequestTaxiController
  final RequestTaxiController viewController = RequestTaxiController();

  /// RequestTaxiScreenWidgets
  late final RequestTaxiScreenWidgets viewWidgets;
  bool lockOnTaxiRequest = false;
  Rx<FieldType> type = FieldType.Neither.obs;

  @override
  void initState() {
    customMapLock();
    viewWidgets =
        RequestTaxiScreenWidgets(requestTaxiController: viewController);

    // If from or to not picked :
    //    - User is free to Wonder and move around the map.
    // If from and to are picked:
    //    - We Fit All everything.
    if (Get.arguments != null) {
      // we re-create the TaxiRequest passed along args
      viewController.initiateTaxiOrderReCreation(Get.arguments as TaxiRequest);
    } else {
      // when no args passed we simply initialte the view and map with current user's loc.
      viewController.initMapAndStartFetchingOnlineDrivers();
    }
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: () => Get.back<void>(),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => Container(
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: LocationPicker(

                    /// [onSuccessSignIn] THIS WILL GETS EXECUTED IF USER GOT SIGNED IN SUCCESSFULY
                    // AFTER HE CREATED HIS TAXI REQUESTED WHILE HE WAS SIGNEDOUT
                    onSuccessSignIn:
                        viewController.onSuccessSignInUpdateUserMarker,
                    locationPickerMapController:
                        viewController.locationPickerController,
                    notifyParentOfLocationFinalized:
                        viewController.updateModelAndMaybeCalculateRoute,
                    notifyParentOfConfirm: (Location? _) async {
                      if (getAppLaunchMode() == AppLaunchMode.prod &&
                          Get.find<AuthController>().fireAuthUser?.uid ==
                              testUserIdInProd) {
                        MezSnackbar("Oops",
                            "This prod version is live and running , we can't let you do that :( !");
                      } else if (!lockOnTaxiRequest) {
                        // lock to avoid the user Fast button taps aka fast-taps .
                        lockOnTaxiRequest = true;
                        final bool res = await viewController.requestTaxi();
                        if (!res) {
                          lockOnTaxiRequest = false;
                        }
                      }
                    }),
              ),
              // --- <>
              LocationSearchBar(
                request: viewController.taxiRequest.value,
                locationSearchBarController:
                    viewController.locationSearchBarController,
                onClear: () {
                  // we set that back to false
                  viewController.locationPickerController.periodicRerendering
                      .value = false;
                },
                newLocationChosenEvent:
                    viewController.updateModelAndHandoffToLocationPicker,
              ),
              if (viewController.taxiRequest.value.isFromToSet())
                viewWidgets.topTimeBar(onTap: () {
                  viewController.scheduleClick();
                  setState(() {});
                }),

              if (viewController.taxiRequest.value.isFromToSet())
                Positioned(
                  bottom: 140,
                  right: 15,
                  child: NearByOnlineTaxiDrivers(
                    centerLocation:
                        viewController.locationPickerController.location,
                  ),
                ),
              // from , to
              viewController.pickedFromTo.value
                  ? TaxiReqBottomBar(
                      taxiRequest: viewController.taxiRequest,
                      viewController: viewController)
                  : SizedBox(),
              if (viewController.pickedFromTo.value) viewWidgets.getToolTip(),
              if (viewController.pickedFromTo.value)
                AnimatedSlider(
                  isPositionedCoordinates:
                      AnimatedSliderCoordinates(left: 0, right: 0, bottom: 0),
                  animatedSliderController: viewController.sliderController,
                  child: viewWidgets.getScheduleTimeBottomSheet(context,
                      onConfirmTap: () {
                    viewController.sliderController.slideDown();
                    viewController.taxiRequest.value
                        .setScheduledTime(viewController.scheduleTime());

                    setState(() {});
                  }, onCancelTap: () {
                    viewController.sliderController.slideDown();
                    setState(() {});
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void customMapLock() {
    viewController.locationPickerController.myLocationButtonEnabled.value =
        false;
    viewController.locationPickerController.recenterButtonEnabled.value = false;
  }
}
