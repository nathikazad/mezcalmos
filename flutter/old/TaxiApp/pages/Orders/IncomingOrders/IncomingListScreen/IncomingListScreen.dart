import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/Components/IncomingOrderCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
    ["Orders"]["IncomingOrders"]["IncomingListScreen"]["IncomingListScreen"];

class IncomingOrdersScreen extends StatefulWidget {
  @override
  _IncomingOrdersScreenState createState() => _IncomingOrdersScreenState();
}

class _IncomingOrdersScreenState extends State<IncomingOrdersScreen> {
  IncomingOrdersController _controller = Get.find<IncomingOrdersController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  late AnimationController controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  RxBool notifyOnNewScheduledOrders = false.obs;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21),
          child: Obx(
            () => SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Scheduled orders first
                  SizedBox(height: 14),
                  ...getScheduledOrders(),
                  // incoming orders
                  SizedBox(height: 14),
                  ...getIncomingOrders(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScheduledOrders() {
    List<Widget> _ret = [];
    List<TaxiOrder> _scheduledOrders = Get.find<OrderController>()
        .currentOrders
        .where((o) => o.status == TaxiOrdersStatus.Scheduled)
        .toList();

    mezDbgPrint("_ls Scheduled ======> ${_scheduledOrders.length}");

    if (_scheduledOrders.isNotEmpty) {
      // header
      _ret.addAll(
        [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Scheduled Orders",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 15)
        ],
      );

      // body
      _ret.addAll(_scheduledOrders.map(
        (TaxiOrder order) => IncomingOrderCard(order: order),
      ));
    }

    mezDbgPrint("Scheduled ==> ${_ret.length}");
    return _ret;
  }

  List<Widget> getIncomingOrders() {
    final List<Widget> _ret = [];

    // looking for taxi order
    final List<TaxiOrder> _lftOrders = _controller
        .orders()
        .where(
          (TaxiOrder element) =>
              element.status == TaxiOrdersStatus.LookingForTaxi &&
              element.scheduledTime == null,
        )
        .toList();

    // lookingForTaxiScheduled order
    final List<TaxiOrder> _lftScheduled = _controller
        .orders()
        .where(
          (TaxiOrder element) =>
              element.status == TaxiOrdersStatus.LookingForTaxiScheduled ||
              element.scheduledTime != null,
        )
        .toList();

// Scheduled orders.
    final List<TaxiOrder> _scheduledOrders = Get.find<OrderController>()
        .currentOrders
        .where((o) => o.status == TaxiOrdersStatus.Scheduled)
        .toList();

    _ret.add(
      TitleWithOnOffSwitcher(
        title: "Incoming Orders",
        initialSwitcherValue: _taxiAuthController.taxiState?.isLooking ?? false,
        onTurnedOff: _taxiAuthController.turnOff,
        onTurnedOn: _taxiAuthController.turnOn,
      ),
    );
    if (_taxiAuthController.taxiState?.isLooking != true) {
      // add the notify me on new LookingForTaxiScheduled orders
      _ret.addAll(
        [
          if (_lftScheduled.isNotEmpty || _scheduledOrders.isNotEmpty)
            Container(
              height: 190,
              child: _statusError(
                iconData: Icons.sentiment_dissatisfied_outlined,
                errorText: 'Turn on to see incoming orders',
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: _statusError(
                childData: Padding(
                  padding: const EdgeInsets.only(bottom: 17.0),
                  child: Image.asset(
                    turnOn_asset,
                    fit: BoxFit.contain,
                    width: 40.w,
                    height: 25.h,
                  ),
                ),
                errorText: 'Turn on to see incoming orders',
              ),
            ),
        ],
      );
    } else if (_taxiAuthController.taxiState?.isLooking == true &&
        _lftOrders.isEmpty) {
      mezDbgPrint("else if!!!!!");

      _ret.addAll(
        [
          if (_lftScheduled.isNotEmpty || _scheduledOrders.isNotEmpty)
            Container(
              height: 190,
              child: _statusError(
                iconData: Icons.sentiment_dissatisfied_outlined,
                errorText: 'No incoming orders found.',
                secondLine: 'Try again later',
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: _statusError(
                childData: Padding(
                  padding: const EdgeInsets.only(bottom: 17.0),
                  child: Image.asset(
                    noOrdersFound_asset,
                    fit: BoxFit.contain,
                    width: 40.w,
                    height: 25.h,
                  ),
                ),
                errorText: 'No incoming orders found',
                secondLine: 'Try again later',
              ),
            ),
        ],
      );
    } else {
      mezDbgPrint("else!!!!!");
      _ret.addAll(
        [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Now",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 9),
          ..._lftOrders.map(
            (TaxiOrder order) => IncomingOrderCard(order: order),
          )
        ],
      );
    }

    // now lfts orders
    if (_lftScheduled.isNotEmpty)
      _ret.addAll([
        SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Available for later",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 14),
        ..._lftScheduled.map(
          (TaxiOrder order) => IncomingOrderCard(order: order),
        )
      ]);

    return _ret;
  }

  Widget _statusError({
    IconData? iconData,
    Widget? childData,
    required String errorText,
    String? secondLine,
  }) {
    return IncomingOrdersStatus(
      iconData: iconData,
      childData: childData,
      errorText: errorText,
      secondLine: secondLine,
    );
  }
}
