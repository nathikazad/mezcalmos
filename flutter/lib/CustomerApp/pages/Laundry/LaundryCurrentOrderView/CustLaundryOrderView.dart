import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/CustomerLaundryEstTimes.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderLaundryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/controllers/CustLaundryOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/LaundryOrderPricingCompenent.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryCurrentOrderView']['LaundryCurrentOrderView'];

class CustLaundryOrderView extends StatefulWidget {
  const CustLaundryOrderView({Key? key}) : super(key: key);

  @override
  State<CustLaundryOrderView> createState() => _CustLaundryOrderViewState();
}

class _CustLaundryOrderViewState extends State<CustLaundryOrderView> {
  CustLaundryOrderViewController viewController =
      CustLaundryOrderViewController();
  late int orderId;
  LaundryOrderPhase? _phaseSnapshot;

  // Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  StreamSubscription<Order?>? _orderListener;
  //final OrderController controller = Get.find<OrderController>();
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  @override
  void initState() {
    // Handle Order id from the rooting
    if (Get.parameters['orderId'] != null) {
      orderId = int.parse(Get.parameters['orderId']!);
      viewController.init(orderId: orderId);
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back<void>();
    }

    super.initState();
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (viewController.order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () {
          if (viewController.order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => LaundryOrderStatusCard(
                                order: viewController.order.value!,
                              ),
                            ),
                            CustomerLaundryOrderEst(
                              order: viewController.order.value!,
                            ),
                            LaundryOrderDriverCard(
                                order: viewController.order.value!),
                            if (viewController.order.value!.inDeliveryPhase())
                              OrderMapWidget(
                                  deliveryOrderId: viewController
                                      .order.value!.deliveryOrderId,
                                  updateDriver: viewController.order.value!
                                      .inDeliveryPhase(),
                                  polyline: viewController
                                      .order.value!.routeInformation?.polyline,
                                  from: viewController
                                      .order.value!.laundry!.location,
                                  to: viewController.order.value!.to),

                            if (viewController.order.value!.laundry != null)
                              OrderLaundryCard(
                                  order: viewController.order.value!),

                            LaundryOrderPricingComponent(
                                order: viewController.order.value!),

                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: Text(
                                '${_i18n()["deliveryDeatils"]}',
                                style: Get.textTheme.bodyLarge,
                              ),
                            ),
                            OrderDeliveryLocation(
                              address: viewController.order.value!.to.address,
                              margin: const EdgeInsets.only(top: 8),
                            ),
                            OrderNoteCard(
                                margin: const EdgeInsets.only(top: 15),
                                note: viewController.order.value!.notes),
                            OrderSummaryCard(
                              margin: const EdgeInsets.only(top: 15),
                              orderCost: viewController
                                  .order.value!.costsByType?.weighedCost,
                              refundAmmount:
                                  viewController.order.value!.refundAmount,
                              shippingCost:
                                  viewController.order.value!.shippingCost,
                              stripeOrderPaymentInfo:
                                  viewController.order.value!.stripePaymentInfo,
                              totalCost: viewController.order.value!.totalCost,
                            ),

                            //Spacer(),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: LaundryOrderFooterCard(
                                viewController: viewController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  AppBar _appBar() {
    return MezcalmosAppBar(
      AppBarLeftButtonType.Back,
      autoBack: true,
      titleWidget: Obx(
        () => Text(
          '${viewController.order.value?.laundry?.name ?? ""}',
          style: Get.textTheme.displaySmall,
        ),
      ),
      showNotifications: true,
      ordersRoute: kOrdersRoute,
    );
  }

  List<Widget> get _mapWidget => <Widget>[
        Container(
          height: 350,
          child: MGoogleMap(
            padding: EdgeInsets.zero,
            mGoogleMapController: mapController,
            recenterBtnBottomPadding: 20,
            // rerenderDuration: Duration(seconds: 10),
          ),
        ),
      ];
}
