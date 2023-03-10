import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/RestaurantApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpEstDeliveryTime.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderCustomer.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderEstTime.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderHandleButton.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderNote.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/ROpOrderStatusCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/components/RestaurantOrderDriverCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/controller/RestaurantOrderViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView'];

class RestaurantOrderView extends StatefulWidget {
  const RestaurantOrderView({Key? key}) : super(key: key);

  static Future<void> navigate({required String orderId}) {
    return MezRouter.toPath(
        RestaurantRouter.restaurantOrderRoute.replaceAll(":orderId", orderId));
  }

  @override
  State<RestaurantOrderView> createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
  RestaurantOrderViewController viewController =
      RestaurantOrderViewController();

  @override
  void initState() {
    final String? orderId = MezRouter.urlArguments['orderId'].toString();
    mezDbgPrint("Restaurant Order View 🥥🥥🥥 ORDER ID $orderId");
    if (orderId != null && int.tryParse(orderId) != null) {
      viewController.init(orderId: int.parse(orderId));
    }
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("widget.order.dropoffDriver =======");

    mezDbgPrint(viewController.order.value?.dropoffDriver);
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() =>
              Text("${viewController.order.value?.customer.name ?? ""}"))),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // order status
                ROpOrderStatusCard(order: viewController.order.value!),

                ROpOrderHandleButton(viewController: viewController),
                if (viewController.order.value!.scheduledTime != null)
                  _getScheduleTime(),
                RestaurantOrderEstTime(order: viewController.order.value!),
                if (viewController.order.value?.selfDelivery ?? false)
                  ROpEstDeliveryTime(order: viewController.order.value!),
                ROpDriverCard(order: viewController.order.value!),
                if (viewController.order.value!.inDeliveryPhase())
                  OrderMapWidget(
                      deliveryOrderId:
                          viewController.order.value!.deliveryOrderId!,
                      updateDriver:
                          viewController.order.value!.inDeliveryPhase(),
                      polyline: viewController
                          .order.value!.routeInformation?.polyline,
                      from: viewController.order.value!.restaurant.location,
                      to: viewController.order.value!.to),
                ROpOrderCustomer(order: viewController.order.value!),
                _orderItemsList(),
                RestaurantOrderDeliveryTimeCard(
                    order: viewController.order.value!),
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: OrderDeliveryLocation(
                        address: viewController.order.value!.to.address)),
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: OrderPaymentMethod(
                      stripeOrderPaymentInfo:
                          viewController.order.value!.stripePaymentInfo,
                      paymentType: viewController.order.value!.paymentType,
                    )),
                if (viewController.order.value!.review != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Review : ",
                        style: context.txt.bodyLarge,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReviewCard(review: viewController.order.value!.review!),
                    ],
                  ),
                ROpOrderNote(orderNote: viewController.order.value!.notes),
                OrderSummaryCard(
                  margin: const EdgeInsets.only(top: 15),
                  orderCost: viewController.order.value!.itemsCost,
                  refundAmmount: viewController.order.value!.refundAmount,
                  shippingCost: viewController.order.value!.shippingCost,
                  stripeOrderPaymentInfo:
                      viewController.order.value!.stripePaymentInfo,
                  totalCost: viewController.order.value!.totalCost,
                ),

                // ROpRefundButton(
                //   order: viewController.order.value!,
                // ),
                if (viewController.order.value!.inProcess())
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: offRedColor),
                        onPressed: () {
                          showConfirmationDialog(context, onYesClick: () async {
                            await viewController.cancelOrder().then(
                                (ServerResponse value) => MezRouter.back());
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Text('${_i18n()["cancelOrder"]}'),
                        )),
                  )
              ],
            ),
          );
        } else
          return Container(
            alignment: Alignment.center,
            child: MezLogoAnimation(centered: true),
          );
      }),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["orderItems"]}',
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                viewController.order.value!.items.length,
                (int index) => ROpOrderItems(
                      item: viewController.order.value!.items[index],
                      order: viewController.order.value!,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _getMapWidget() {
    if (viewController.order.value!.inDeliveryPhase())
      return Container(
        height: 350,
        margin: const EdgeInsets.only(bottom: 25),
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

  Widget _getScheduleTime() {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.schedule_send,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_i18n()["schTitle"]}',
                    style: Get.theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (viewController.order.value?.scheduledTime != null)
                    Text(
                      "${DateFormat("dd MMMM, hh:mm a ").format(viewController.order.value!.scheduledTime!.toLocal())}",
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
