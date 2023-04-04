import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/OrderFromToBar.dart';
import 'package:mezcalmos/TaxiApp/components/taxiDialogs.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/components/IPositionedBottomBar.dart';
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
          MezRouter.back();
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
        onWillPop: () async =>
            iOrderViewController.counterOffer.value == null ||
            !iOrderViewController.submittedCounterOffer.value,
        child: Scaffold(
          appBar: MezcalmosAppBar(
            AppBarLeftButtonType.Back,
            onClick: iOrderViewController.counterOffer.value == null ||
                    iOrderViewController.counterOffer.value?.isValid != true ||
                    iOrderViewController.order.value?.scheduledTime != null
                ? () {
                    iOrderViewController.cancelStreamsSubscriptions();
                    MezRouter.back();
                  }
                : null,
          ),
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
                    if (iOrderViewController.counterOffer.value == null ||
                        iOrderViewController.counterOffer.value?.isValid !=
                            true ||
                        iOrderViewController.order.value?.scheduledTime != null)
                      iOrderViewWidgets.acceptAndOfferButtons(
                        onOfferBtnClick: () {
                          iOrderViewController.submittedCounterOffer.value =
                              true;
                          iOrderViewController.animatedSliderController
                              .slideUp();
                          setState(() {});
                        },
                      ),
                    iOrderViewWidgets.counterOfferBottomSheet(
                      onCounterEnd: () {
                        iOrderViewController.updateCounterOfferStatus(
                          newStatus: CounterOfferStatus.Expired,
                        );
                        setState(() {});
                      },
                      onMakeNewOffer: () {
                        iOrderViewController.submittedCounterOffer.value =
                            false;
                        setState(() {});
                      },
                      onCloseClick: () {
                        mezDbgPrint("Clicked close");
                        iOrderViewController.animatedSliderController
                            .slideDown();
                        setState(() {});
                      },
                      onCancelClick: () async {
                        await iOrderViewController.updateCounterOfferStatus(
                          newStatus: CounterOfferStatus.Cancelled,
                        );
                        setState(() {});
                      },
                    ),
                    ...OrderPositionedFromToTopBar.buildWithOrderTimeBar(
                      context: context,
                      order: iOrderViewController.order.value!,
                    ),
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
