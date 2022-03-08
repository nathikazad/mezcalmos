import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/components/RequestTaxiScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiReqBottomBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  final RequestTaxiController requestTaxiController = RequestTaxiController();
  late final HintsWidgets hintsWidgets;

  @override
  void initState() {
    hintsWidgets = HintsWidgets(requestTaxiController: requestTaxiController);
    // fetch first without waiting 10seconds.
    requestTaxiController.startFetchingOnlineDrivers();
    // then keep it periodic each 10s
    requestTaxiController.timer =
        Timer.periodic(Duration(seconds: 10), (Timer timer) {
      requestTaxiController.startFetchingOnlineDrivers();
    });

    if (Get.arguments != null) {
      // we re-create the TaxiRequest passed along args
      requestTaxiController
          .initiateTaxiOrderReCreation(Get.arguments as TaxiRequest);
    } else {
      // when no args passed we simply initialte the view and map with current user's loc.
      requestTaxiController.initiateViewAndMapWithCurrentLocation();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () => Get.back()),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: LocationPicker(

                    /// [onSuccessSignIn] THIS WILL GETS EXECUTED IF USER GOT SIGNED IN SUCCESSFULY
                    // AFTER HE CREATED HIS TAXI REQUESTED WHILE HE WAS SIGNEDOUT
                    onSuccessSignIn:
                        requestTaxiController.onSuccessSignInUpdateUserMarker,
                    locationPickerMapController:
                        requestTaxiController.locationPickerController,
                    notifyParentOfLocationFinalized:
                        requestTaxiController.updateModelAndMaybeCalculateRoute,
                    notifyParentOfConfirm: (Location? _) async {
                      if (GetStorage().read(getxLmodeKey) == "prod" &&
                          Get.find<AuthController>().fireAuthUser?.uid ==
                              testUserIdInProd) {
                        MezSnackbar("Oops",
                            "This prod version is live and running , we can't let you do that :( !");
                      } else
                        await requestTaxiController.requestTaxi();
                    }),
              ),
              LocationSearchBar(
                  request: requestTaxiController.taxiRequest,
                  locationSearchBarController:
                      requestTaxiController.locationSearchBarController,
                  newLocationChosenEvent: requestTaxiController
                      .updateModelAndHandoffToLocationPicker),
              requestTaxiController.pickedFromTo.value
                  // from , to
                  ? TaxiReqBottomBar(
                      taxiRequest: requestTaxiController.taxiRequest.value,
                    )
                  : SizedBox(),
              if (requestTaxiController.pickedFromTo.value)
                hintsWidgets.getToolTip(),
            ]),
      ),
    );
  }

  @override
  void dispose() {
    requestTaxiController.dispose();
    super.dispose();
  }
}
