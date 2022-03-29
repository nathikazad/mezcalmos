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
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  final RequestTaxiController viewController = RequestTaxiController();
  late final RequestTaxiScreenWidgets viewWidgets;
  bool lockOnTaxiRequest = false;
  @override
  void initState() {
    viewWidgets =
        RequestTaxiScreenWidgets(requestTaxiController: viewController);
    //TODO:FIX
    // fetch first without waiting 10seconds.
    // viewController.startFetchingOnlineDrivers();
    // // then keep it periodic each 10s
    // viewController.timer = Timer.periodic(
    //   Duration(seconds: 10),
    //   (Timer timer) {
    //     viewController.startFetchingOnlineDrivers();
    //   },
    // );

    if (Get.arguments != null) {
      // we re-create the TaxiRequest passed along args
      viewController.initiateTaxiOrderReCreation(Get.arguments as TaxiRequest);
    } else {
      // when no args passed we simply initialte the view and map with current user's loc.
      viewController.initiateViewAndMapWithCurrentLocation();
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
          children: <Widget>[
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: LocationPicker(
                /// [onSuccessSignIn] THIS WILL GETS EXECUTED IF USER GOT SIGNED IN SUCCESSFULY
                // AFTER HE CREATED HIS TAXI REQUESTED WHILE HE WAS SIGNEDOUT
                onSuccessSignIn: viewController.onSuccessSignInUpdateUserMarker,
                locationPickerMapController:
                    viewController.locationPickerController,
                notifyParentOfLocationFinalized:
                    viewController.updateModelAndMaybeCalculateRoute,
                notifyParentOfConfirm: (_) async {
                  if (GetStorage().read<String>(getxLmodeKey) == "prod" &&
                      Get.find<AuthController>().fireAuthUser?.uid ==
                          testUserIdInProd) {
                    MezSnackbar(
                      "Oops",
                      "This prod version is live and running , we can't let you do that :( !",
                    );
                  } else if (!lockOnTaxiRequest) {
                    // lock to avoid the user Fast button taps aka fast-taps .
                    lockOnTaxiRequest = true;
                    bool res = await viewController.requestTaxi();
                    if (!res) {
                      lockOnTaxiRequest = false;
                    }
                  }
                },
              ),),
              // --- <>
              Obx(
                () => LocationSearchBar(
                    request: viewController.taxiRequest.value,
                    locationSearchBarController:
                        viewController.locationSearchBarController,
                    newLocationChosenEvent:
                        viewController.updateModelAndHandoffToLocationPicker),
              ),
              viewController.pickedFromTo.value
                  // from , to
                  ? TaxiReqBottomBar(
                      taxiRequest: viewController.taxiRequest.value,
                    )
                  : SizedBox(),
              if (viewController.pickedFromTo.value) viewWidgets.getToolTip(),
            ]),
      ),
    );
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }
}
