import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/components/LaundryOrderDriverCard.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/components/LaundryOrderTimes.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/components/LaundrySetCategoryComponent.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/components/OrderEstimatedTimeComponent.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/controllers/LaundryOrderViewController.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['LaundryOpOrderView'];

class LaundryOrderView extends StatefulWidget {
  const LaundryOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(LaundryAppRoutes.kOrderViewRoute
        .replaceAll(":orderId", orderId.toString()));
  }

  @override
  State<LaundryOrderView> createState() => _LaundryOrderViewState();
}

class _LaundryOrderViewState extends State<LaundryOrderView> {
  LaundryOrderViewController viewController = LaundryOrderViewController();
  int? orderId;

  @override
  void initState() {
    mezDbgPrint("Laundry order router 📥📥📥📥📥");
    if (MezRouter.urlArguments['orderId'] != null) {
      orderId = int.parse(MezRouter.urlArguments['orderId'].toString());
      viewController.init(orderId: orderId!);
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        showNotifications: true,
      ),
      body: Obx(
        () {
          if (viewController.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // order status
                  LaundryOrderStatusCard(order: viewController.order),
                  LaundryOrderTimes(
                    order: viewController.order,
                  ),
                  if (_setReadyForDeliveryButton() != null)
                    _setReadyForDeliveryButton()!,

                  LaundryOrderEstTime(viewController: viewController),

                  LaundryOrderDriverCard(viewController: viewController),
                  if (viewController.order.inDeliveryPhase())
                    OrderMapWidget(
                        deliveryOrderId: viewController.order.deliveryOrderId,
                        updateDriver: viewController.order.inDeliveryPhase(),
                        polyline:
                            viewController.order.routeInformation?.polyline,
                        from: (viewController.order.inPickup)
                            ? viewController.order.customerLocation
                            : viewController.order.laundryLocation,
                        to: viewController.order.to),
                  MezCard(
                    margin: const EdgeInsets.only(bottom: 20),
                    contentPadding: EdgeInsets.all(12),
                    action: MessageButton(
                        chatId: viewController.order.chatId,
                        onTap: () {
                          BaseMessagingScreen.navigate(
                              chatId: viewController.order.chatId);
                        }),
                    firstAvatarBgImage: CachedNetworkImageProvider(
                        viewController.order.customer.image),
                    content: Text(
                      viewController.order.customer.name,
                      style: Get.textTheme.bodyLarge,
                    ),
                  ),
                  //  if (viewController.order.afterAtLaundry())
                  LaundrySetCategoryComponent(
                    viewController: viewController,
                  ),
                  OrderNoteCard(note: viewController.order.notes),

                  OrderSummaryCard(
                    margin: const EdgeInsets.only(top: 15),
                    orderCost: viewController.order.costsByType?.weighedCost,
                    refundAmmount: viewController.order.refundAmount,
                    shippingCost: viewController.order.shippingCost,
                    stripeOrderPaymentInfo:
                        viewController.order!.stripePaymentInfo,
                    totalCost: viewController.order!.totalCost,
                  ),

                  SizedBox(
                    height: 35,
                  ),
                  if (viewController.order.inProcess())
                    MezButton(
                      label: "Cancel order",
                      backgroundColor: offRedColor,
                      textColor: Colors.red,
                      onClick: () async {
                        await viewController.cancelOrder();
                      },
                    )
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _totalCostcomponent(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_i18n()["total"]}:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            (viewController.order.costsByType?.totalPrice != null)
                ? Text(
                    '\$${viewController.order.costsByType?.totalPrice}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : Text(
                    '${_i18n()["toBeCalculated"]}',
                    style: Get.textTheme.bodyMedium
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
          ],
        ),
      ),
    );
  }

  Widget? _setReadyForDeliveryButton() {
    if (viewController.order.isAtLaundry()) {
      return Obx(
        () => Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: MezButton(
            label: "${_i18n()["orderReady"]}",
            onClick: (viewController.order.costsByType != null &&
                    viewController.order.costsByType!.lineItems.isNotEmpty)
                ? () async {
                    await viewController.sertOrderReady();
                  }
                : null,
          ),
        ),
      );
    }
    return null;
  }

  Widget _getMapWidget() {
    if (viewController.order.inDeliveryPhase())
      return Container(
        // color: Colors.black,
        margin: const EdgeInsets.only(bottom: 20),

        height: 350,
        child: MGoogleMap(
          mGoogleMapController: viewController.mGoogleMapController,
          padding: EdgeInsets.all(20),
          rerenderDuration: Duration(seconds: 30),
          recenterBtnBottomPadding: 20,
        ),
      );
    else
      return SizedBox();
  }
}
