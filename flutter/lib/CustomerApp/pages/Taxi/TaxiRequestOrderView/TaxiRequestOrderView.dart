import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiRequestOrderView/controllers/TaxiRequestOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/taxiOrderRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
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

  int _currentStep = 0;

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
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
                      recenterBtnBottomPadding: 150,
                      locationPickerMapController:
                          viewController.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (MezLocation? location) {
                        if (location != null) {
                          setState(() {
                            viewController.locationPickerController
                                .setLocation(location);
                          });
                        }
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              // margin: EdgeInsets.only(left: 8, right: 8, bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _pickLocComponent(),
                  MezButton(
                    label: "Next",
                    onClick: () async {},
                    borderRadius: 0,
                  )
                ],
              )),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: MezIconButton(
                onTap: () {
                  MezRouter.back();
                },
                iconSize: 27,
                padding: const EdgeInsets.all(5),
                elevation: 1.5,
                iconColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Icons.close),
          )
        ],
      ),
    );
  }

  Card _pickLocComponent() {
    return Card(
      //  margin: const EdgeInsets.all(25),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.radio_button_checked_rounded,
              color: Colors.black,
              size: 14.mezSp,
            ),
            hTinySepartor,
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("From"),
                  tinySepartor,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "From address",
                      isDense: true,
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryBlueColor)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
