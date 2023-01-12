import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpDriverCard.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpEstDeliveryTime.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderCustomer.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderEstTime.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderHandleButton.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderNote.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/components/ROpOrderStatusCard.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/controller/RestaurantOrderViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView'];

class RestaurantOrderView extends StatefulWidget {
  const RestaurantOrderView({Key? key}) : super(key: key);

  @override
  State<RestaurantOrderView> createState() => _RestaurantOrderViewState();
}

class _RestaurantOrderViewState extends State<RestaurantOrderView> {
  RestaurantOrderViewController viewController =
      RestaurantOrderViewController();

  @override
  void initState() {
    final String? orderId = Get.parameters['orderId'];
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
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
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
                ROpOrderEstTime(order: viewController.order.value!),
                if (viewController.order.value?.selfDelivery ?? false)
                  ROpEstDeliveryTime(order: viewController.order.value!),
                ROpDriverCard(order: viewController.order.value!),
                _getMapWidget(),
                ROpOrderCustomer(order: viewController.order.value!),
                _orderItemsList(),
                RestaurantOrderDeliveryTimeCard(
                    order: viewController.order.value!),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: OrderDeliveryLocation(
                        order: viewController.order.value!)),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child:
                        OrderPaymentMethod(order: viewController.order.value!)),
                if (viewController.order.value!.review != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Review : ",
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReviewCard(review: viewController.order.value!.review!),
                    ],
                  ),
                ROpOrderNote(orderNote: viewController.order.value!.notes),
                OrderSummaryCard(
                  order: viewController.order.value!,
                  margin: const EdgeInsets.only(bottom: 20),
                ),

                // ROpRefundButton(
                //   order: viewController.order.value!,
                // ),
                if (viewController.order.value!.inProcess())
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          backgroundColor: offRedColor),
                      onPressed: () {
                        showConfirmationDialog(context, onYesClick: () async {
                          await viewController
                              .cancelOrder()
                              .then((ServerResponse value) => MezRouter.back());
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text('${_i18n()["cancelOrder"]}'),
                      ))
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
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["orderItems"]}',
            style: Get.textTheme.bodyText1,
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
        margin: const EdgeInsets.only(bottom: 20),
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
