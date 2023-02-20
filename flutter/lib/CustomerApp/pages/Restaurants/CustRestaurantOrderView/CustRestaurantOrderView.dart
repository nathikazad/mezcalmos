 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/CustomerRestaurantOrderEst.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrdersItemsCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/RestaurantBankInfo.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/RestaurantOrderDriverCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/controllers/CustRestaurantOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/order/mutations/hsRestaurantOrderMutations.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderScheduledTime.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/RestaurantOrderDeliveryTimeCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
  CustRestaurantOrderViewController viewController =
      CustRestaurantOrderViewController();
  @override
  void initState() {
    super.initState();

    final int orderId = int.parse(Get.parameters['orderId']!);
    if (Get.parameters['orderId'] == null) MezRouter.back();
    viewController.init(orderId: orderId);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true,
          ordersRoute: kOrdersRoute,
          showNotifications: true,
          titleWidget: Obx(
              () => Text(viewController.order.value?.restaurant.name ?? ""))),
      bottomNavigationBar: Obx(() {
        if (showReviewBtn() && viewController.order.value != null) {
          return MezButton(
            label: "${_i18n()["writeReview"]}",
            withGradient: true,
            onClick: () async {
              final int? newReviewId = await showReviewDialog(
                context,
                orderId: viewController.order.value!.orderId,
                orderType: OrderType.Restaurant,
                serviceProviderId: viewController.order.value!.restaurantId,
                serviceProviderType: ServiceProviderType.Restaurant,
              );
              mezDbgPrint("Reviwww id =====>$newReviewId");
              if (newReviewId != null) {
                await insertRestaurantOrderReview(
                    orderId: viewController.order.value!.orderId,
                    reviewId: newReviewId);
              }
            },
            borderRadius: 0,
          );
        } else {
          return SizedBox();
        }
      }),
      body: Obx(
        () {
          if (viewController.order.value != null) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            OrderStatusCard(
                              order: viewController.order.value!,
                              ordersStates: viewController.order.value!.status,
                            ),
                            if (viewController.order.value!.paymentType ==
                                PaymentType.BankTransfer)
                              RestaurantBankInfoCard(
                                  restaurantId:
                                      viewController.order.value!.restaurantId),
                            if (viewController.order.value!.inProcess())
                              CustomerRestaurantOrderEst(
                                  order: viewController.order.value!),

                            RestaurantOrderDriverCard(
                              order: viewController.order.value!,
                            ),
                            if (viewController.order.value!.inDeliveryPhase())
                              ..._mapWidget,

                            OrderRestaurantCard(
                                order: viewController.order.value!),
                            OrderItemsCard(
                              order: viewController.order.value!,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Text(
                                '${_i18n()["deliveryDet"]}',
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                            OrderScheduledTimeCard(
                                time: viewController.order.value!.scheduledTime,
                                margin: const EdgeInsets.only(top: 4)),
                            RestaurantOrderDeliveryTimeCard(
                              order: viewController.order.value!,
                              margin: EdgeInsets.zero,
                            ),
                            OrderDeliveryLocation(
                              address: viewController.order.value!.to.address,
                              margin: const EdgeInsets.only(top: 4),
                            ),
                            OrderPaymentMethod(
                              stripeOrderPaymentInfo:
                                  viewController.order.value!.stripePaymentInfo,
                              paymentType:
                                  viewController.order.value!.paymentType,
                            ),
                            if (viewController.order.value!.review != null)
                              ReviewCard(
                                  review: viewController.order.value!.review!),
                            OrderNoteCard(
                                note: viewController.order.value!.notes),
                            OrderSummaryCard(
                              order: viewController.order.value!,
                            ),

                            //===============================>button cancel===========================
                            //  Expanded(child: Container()),
                            SizedBox(
                              height: 9,
                            ),
                            Flexible(
                              child: SizedBox(
                                width: double.infinity,
                                child: OrderFooterCard(
                                  order: viewController.order.value!,
                                  cancelOrderFunction:
                                      viewController.cancelOrder,
                                ),
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> get _mapWidget => <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          height: 350,
          width: Get.width - 20,
          child: MGoogleMap(
            padding: EdgeInsets.zero,
            mGoogleMapController: viewController.mGoogleMapController,
            recenterBtnBottomPadding: 20,
          ),
        ),
      ];

  bool showReviewBtn() {
    return viewController.order.value != null &&
        viewController.order.value!.status == RestaurantOrderStatus.Delivered &&
        viewController.order.value!.review == null;
  }
}
