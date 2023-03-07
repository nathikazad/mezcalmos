import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/NearByOnlineTaxiDriversWidget.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/components/CounterOfferWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/components/ViewTaxiOrderScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/GradientCircularLoading.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/OrderFromToBar.dart';
import 'package:mezcalmos/Shared/widgets/OrderTimeBar.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

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
    if (Get.parameters['orderId'] == null) {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back<void>();
    }
    viewController
        .init(int.parse(Get.parameters['orderId']!))
        .then((bool initSuccess) {
      if (!initSuccess) {
        MezRouter.back<void>();
        MezSnackbar("Error", "Order does not exist");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();

    super.dispose();
  }

  void initializeLateControllers() {
    mezDbgPrint("Initializing ............!");
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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
      ),
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
          ...OrderPositionedFromToTopBar.buildwithWidgets(
            context: context,
            fromWidget: Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () => MezSnackbar(
                  _i18n()["from"],
                  viewController.order.value!.from.address,
                ),
                child: Text(
                  viewController.order.value!.from.address
                      .replaceAll(' ', '\u00a0'),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            toWidget: Padding(
              padding: EdgeInsets.only(top: 6),
              child: GestureDetector(
                onTap: () => MezSnackbar(
                  _i18n()["from"],
                  viewController.order.value!.to.address,
                ),
                child: Text(
                  viewController.order.value!.to.address
                      .replaceAll(' ', '\u00a0'),
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          // ...OrderPositionedFromToTopBar.build(
          //   context: context,
          //   order: viewController.order.value!,
          // ),
          if (viewController.order.value?.scheduledTime != null)
            Positioned(
              top: 90,
              left: 10,
              right: 10,
              child: OrderTimeTopBar(
                barText: DateFormat('EEEE dd / MM / y').format(
                      viewController.order.value!.scheduledTime!,
                    ) +
                    ' at ' +
                    DateFormat('hh:mm a').format(
                      viewController.order.value!.scheduledTime!,
                    ),
              ),
            ),
          // Positioned(
          //   bottom: 140,
          //   right: 15,
          //   child: NearByOnlineTaxiDrivers(
          //     centerLocation: Rxn(viewController.order.value?.from),
          //   ),
          // ),
          TaxiOrderBottomBar(order: viewController.order),
          viewWidgets.getToolTip(),
          Obx(() => bottomButtons()),
          counterOfferWidgets.counterOffersBottomSheet(context),
        ]);
  }

  /// The map view to show the router and location of the agents
  Container mGoogleMap() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: MGoogleMap(
        recenterBtnBottomPadding:
            viewController.order.value?.isPastOrder() == true ||
                    viewController.order.value?.isForwarded() == true
                ? 100
                : 150,
        mGoogleMapController: viewController.mGoogleMapController,
      ),
    );
  }

  /// Show cancel button by default and show counter offers button when
  /// there are counter offers
  Positioned bottomButtons() {
    return Positioned(
      bottom: 10,
      left: 15,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (viewController.order.value!.status ==
                  TaxiOrdersStatus.LookingForTaxi ||
              viewController.order.value!.status ==
                  TaxiOrdersStatus.LookingForTaxiScheduled)
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GradientProgressIndicator(
                          radius: 11,
                          duration: 3,
                          strokeWidth: 1,
                          gradientStops: const [
                            0.2,
                            0.8,
                          ],
                          gradientColors: const [
                            Colors.white,
                            Colors.grey,
                          ],
                          child: SizedBox(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Looking for taxi',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Color.fromRGBO(126, 126, 126, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Flexible(
            flex: 1,
            child: viewWidgets.cancelButton(
              viewController.order.value!.status,
              context,
            ),
          ),
        ],
      ),
    );
  }
}
