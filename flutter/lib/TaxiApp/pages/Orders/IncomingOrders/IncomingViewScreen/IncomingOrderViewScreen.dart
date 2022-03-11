import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/iOrderViewWidgets.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["TaxiApp"]["pages"]
["Orders"]["IncomingOrders"]["IncomingViewScreen"]["IncomingOrderViewScreen"];


class IncomingOrderViewScreen extends StatefulWidget {
  @override
  _IncomingOrderViewScreenState createState() =>
      _IncomingOrderViewScreenState();
}

class _IncomingOrderViewScreenState extends State<IncomingOrderViewScreen> {
  late final AnimatedSliderController animatedSliderController;
  late final IOrderViewController iOrderViewController;
  late final IOrderViewWidgets iOrderViewWidgets;

  @override
  void initState() {
    initializeLateControllers();
    String orderId = Get.parameters['orderId']!;
    iOrderViewWidgets =
        IOrderViewWidgets(iOrderViewController: iOrderViewController);
    iOrderViewController.initController(
        orderId: orderId,
        onOrderNoMoreAvailable: () {
          Get.back();
          oneButtonDialog(
              title: 'Oops...',
              body: _i18n()['rideUnavailable'],
              bodyTextColor: Colors.black,
              fontSize: 14.sp,
              imagUrl: a404);
        });
    super.initState();
  }

  @override
  void dispose() {
    iOrderViewController.cancelStreamsSubscriptions();
    super.dispose();
  }

  void initializeLateControllers() {
    this.animatedSliderController = AnimatedSliderController();
    this.iOrderViewController = IOrderViewController(
        animatedSliderController: animatedSliderController);
    this.iOrderViewWidgets =
        IOrderViewWidgets(iOrderViewController: iOrderViewController);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => iOrderViewController.counterOffer.value == null,
        child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: iOrderViewController.counterOffer.value == null
                  ? () {
                      iOrderViewController.cancelStreamsSubscriptions();
                      Get.back();
                    }
                  : null),
          body: iOrderViewController.order.value != null
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    MGoogleMap(
                      mGoogleMapController:
                          iOrderViewController.mGoogleMapController,
                      debugString: "IncomingViewScreen",
                      myLocationButtonEnabled: false,
                    ),
                    iOrderViewWidgets.absorbOrIgnoreUserTapWidget(),
                    IncomingPositionedBottomBar(
                      order: this.iOrderViewController.order.value!,
                    ),
                    if (iOrderViewController.counterOffer.value == null)
                      iOrderViewWidgets.acceptAndOfferButtons(),
                    iOrderViewWidgets.counterOfferBottomSheet(),
                    IncomingPositionedFromToTopBar(
                      order: this.iOrderViewController.order.value!,
                    )
                  ],
                )
              : MezLogoAnimation(
                  centered: true,
                ),
        ),
      ),
    );
  }
}
