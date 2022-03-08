import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/Components/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/Components/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/Components/iOrderViewWidgets.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:sizer/sizer.dart';

class IncomingOrderViewScreen extends StatefulWidget {
  @override
  _IncomingOrderViewScreenState createState() =>
      _IncomingOrderViewScreenState();
}

class _IncomingOrderViewScreenState extends State<IncomingOrderViewScreen> {
  final IOrderViewController iOrderViewController = IOrderViewController();
  late final IOrderViewWidgets iOrderViewWidgets;

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    iOrderViewWidgets =
        IOrderViewWidgets(iOrderViewController: iOrderViewController);
    iOrderViewController.initController(
        orderId: orderId,
        onOrderNoMoreAvailable: () {
          Get.back();
          oneButtonDialog(
              title: 'Oops...',
              body: iOrderViewController.lang.strings['taxi']['cancelOrder']
                  ['rideUnavailble'],
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
