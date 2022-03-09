import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/components/CounterOfferWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/components/ViewTaxiOrderScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TopBar.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen> {
  late final AnimatedSliderController animatedSliderController;
  late final ViewTaxiOrderController viewController;
  late final ViewTaxiOrderScreenWidgets viewWidgets;
  late final CounterOfferWidgets counterOfferWidgets;
  final LanguageController lang = Get.find<LanguageController>();
  /******************************  Init and build function ************************************/

  @override
  void initState() {
    initializeLateControllers();
    // Order handling
    String orderId = Get.parameters['orderId']!;
    viewController.init(orderId, orderCancelledCallback: (TaxiOrder order) {
      Get.back();
      oneButtonDialog(
          body: lang.strings['shared']['snackbars']['orderCancelSuccess'],
          imagUrl: order.customer.image);
    });
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  void initializeLateControllers() {
    // We do not realy need to make AnimatedSliderController late here , but it's good for Future refrences.
    // To show that You can set it up before using it.
    this.animatedSliderController = AnimatedSliderController();
    this.viewController = ViewTaxiOrderController(
        animatedSliderController: animatedSliderController);
    this.viewWidgets =
        ViewTaxiOrderScreenWidgets(viewController: viewController);
    this.counterOfferWidgets =
        CounterOfferWidgets(viewController: viewController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: () => Get.back()),
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Obx(
          () => viewController.order.value != null
              ? getViewStack(context)
              : MezLogoAnimation(
                  centered: true,
                ),
        ));
  }

  Stack getViewStack(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Map(),
          viewWidgets.absorbOrIgnoreUserTapWidget(),
          TopBar(order: viewController.order.value!),
          BottomButtons(),
          TaxiOrderBottomBar(order: viewController.order),
          viewWidgets.getToolTip(),
          counterOfferWidgets.counterOffersBottomSheet(context),
        ]);
  }

  /// The map view to show the route and location of the agents
  Container Map() {
    return Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: MGoogleMap(
          mGoogleMapController: this.viewController.mGoogleMapController,
          periodicRerendering: true,
        ));
  }

  /// Show cancel button by default and show counter offers button when
  /// there are counter offers
  Positioned BottomButtons() {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (viewController.counterOffers.isNotEmpty &&
              viewController.order.value!.status ==
                  TaxiOrdersStatus.LookingForTaxi)
            Flexible(child: counterOfferWidgets.offersButton()),
          if (viewController.counterOffers.isNotEmpty)
            SizedBox(
              width: 10,
            ),
          Flexible(
              child:
                  viewWidgets.cancelButton(viewController.order.value!.status)),
        ],
      ),
    );
  }
}
