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

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]['Taxi']['ViewTaxiOrder']['ViewTaxiOrderScreen'];

class ViewTaxiOrderScreen extends StatefulWidget {
  const ViewTaxiOrderScreen({Key? key}) : super(key: key);

  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen> {
  late final AnimatedSliderController animatedSliderController;
  late final ViewTaxiOrderController viewController;
  late final ViewTaxiOrderScreenWidgets viewWidgets;
  late final CounterOfferWidgets counterOfferWidgets;

  /******************************  Init and build function ************************************/

  @override
  void initState() {
    super.initState();
    dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]['Taxi']['ViewTaxiOrder']['ViewTaxiOrderScreen'];
    initializeLateControllers();
    // Order handling
    String orderId = Get.parameters['orderId']!;
    viewController.init(
      orderId,
      orderCancelledCallback: (TaxiOrder order) {
        Get.back();
        oneButtonDialog(
            body: _i18n()['orderCancelSuccess'], imagUrl: order.customer.image);
      },
    );
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  void initializeLateControllers() {
    // We do not realy need to make AnimatedSliderController late here , but it's good for Future refrences.
    // To show that You can set it up before using it.
    animatedSliderController = AnimatedSliderController();
    viewController = ViewTaxiOrderController(
      animatedSliderController: animatedSliderController,
    );
    viewWidgets = ViewTaxiOrderScreenWidgets(viewController: viewController);
    counterOfferWidgets = CounterOfferWidgets(viewController: viewController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Obx(
        () => viewController.order.value != null
            ? getViewStack(context)
            : MezLogoAnimation(centered: true),
      ),
    );
  }

  Stack getViewStack(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          mGoogleMap(),
          viewWidgets.absorbOrIgnoreUserTapWidget(),
          TopBar(order: viewController.order.value!),
          Obx(() => bottomButtons()),
          TaxiOrderBottomBar(order: viewController.order),
          viewWidgets.getToolTip(),
          counterOfferWidgets.counterOffersBottomSheet(context),
        ]);
  }

  /// The map view to show the route and location of the agents
  Container mGoogleMap() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: MGoogleMap(
        mGoogleMapController: viewController.mGoogleMapController,
        periodicRerendering: true,
      ),
    );
  }

  /// Show cancel button by default and show counter offers button when
  /// there are counter offers
  Positioned bottomButtons() {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (viewController.counterOffers.isNotEmpty &&
              viewController.order.value!.status ==
                  TaxiOrdersStatus.LookingForTaxi)
            Flexible(
              child: counterOfferWidgets.offersButton(),
            ),
          if (viewController.counterOffers.isNotEmpty)
            const SizedBox(width: 10),
          Flexible(
            child: viewWidgets.cancelButton(viewController.order.value!.status),
          ),
        ],
      ),
    );
  }
}
