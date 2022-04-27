import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/components/taxiDialogs.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/iOrderViewWidgets.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';

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
    final String orderId = Get.parameters['orderId']!;
    iOrderViewController.initController(
        orderId: orderId,
        onOrderNoMoreAvailable: () {
          Get.back<void>();
          mezcalmosDialogOrderNoMoreAvailable(context);
        });
    super.initState();
  }

  @override
  void dispose() {
    iOrderViewController.cancelStreamsSubscriptions();
    super.dispose();
  }

  void initializeLateControllers() {
    animatedSliderController = AnimatedSliderController();
    iOrderViewController = IOrderViewController(
        animatedSliderController: animatedSliderController);
    iOrderViewWidgets =
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
                      Get.back<void>();
                    }
                  : null),
          body: iOrderViewController.order.value != null
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    MGoogleMap(
                      recenterBtnBottomPadding: 130,
                      mGoogleMapController:
                          iOrderViewController.mGoogleMapController,
                      debugString: "IncomingViewScreen",
                    ),
                    iOrderViewWidgets.absorbOrIgnoreUserTapWidget(),
                    IncomingPositionedBottomBar(
                      order: iOrderViewController.order.value!,
                    ),
                    if (iOrderViewController.counterOffer.value == null)
                      iOrderViewWidgets.acceptAndOfferButtons(),
                    iOrderViewWidgets.counterOfferBottomSheet(),
                    IncomingPositionedFromToTopBar(
                      order: iOrderViewController.order.value!,
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
