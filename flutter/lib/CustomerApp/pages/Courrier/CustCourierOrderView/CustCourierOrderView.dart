import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierOrderView/controllers/CustCourierOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOrderHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

class CustCourierOrderView extends StatefulWidget {
  static Future<void> navigate(
    int orderId,
  ) {
    return MezRouter.toPath(CourierRoutes.kCourierOrderView
        .replaceFirst(":orderId", orderId.toString()));
  }

  const CustCourierOrderView({super.key});

  @override
  State<CustCourierOrderView> createState() => _CustCourierOrderViewState();
}

class _CustCourierOrderViewState extends State<CustCourierOrderView> {
  CustCourierOrderViewController viewController =
      CustCourierOrderViewController();
  @override
  void initState() {
    if (int.tryParse(Get.parameters['orderId'] ?? "") != null) {
      viewController.init(orderId: int.parse(Get.parameters['orderId']!));
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back<void>();
    }
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
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => viewController.hasData
              ? Text(viewController.order.deliveryCompany.name)
              : SizedBox())),
      body: Obx(
        () {
          if (viewController.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  MezCard(
                    contentPadding: const EdgeInsets.all(12),
                    leading: viewController.order.getOrderStatusWidget(),
                    content: Text(
                      viewController.order.orderStatusTitle().inCaps,
                      style: Get.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (viewController.order.estimatedArrivalAtDropoffTime !=
                      null)
                    _estTime(),

                  _driverCard(),
                  _items(),

                  if (viewController.order.inDeliveryPhase)
                    OrderMapWidget(
                        deliveryOrderId: viewController.order.id,
                        updateDriver: viewController.order.inDeliveryPhase,
                        polyline:
                            viewController.order.routeInformation?.polyline,
                        from: viewController.order.pickupLocation,
                        to: viewController.order.dropoffLocation),
                  // OrderScheduledTimeCard(
                  //     time: viewController.order.t,
                  //     margin: const EdgeInsets.only(top: 8)),
                  OrderPaymentMethod(
                    stripeOrderPaymentInfo:
                        viewController.order.stripeOrderPaymentInfo,
                    paymentType: viewController.order.paymentType,
                  ),
                  OrderDeliveryLocation(
                    address: viewController.order.dropoffLocation.address,
                    margin: const EdgeInsets.only(top: 8),
                  ),
                  // OrderNoteCard(
                  //     margin: const EdgeInsets.only(top: 15),
                  //     note: viewController.order),
                  OrderSummaryCard(
                    margin: const EdgeInsets.only(top: 15),
                    orderCost: viewController.order.packageCost,
                    refundAmmount: null,
                    shippingCost: viewController.order.deliveryCost,
                    stripeOrderPaymentInfo:
                        viewController.order.stripeOrderPaymentInfo,
                    totalCost: viewController.order.totalCost,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  if (viewController.order.inProcess())
                    MezButton(
                      label: "Cancel order",
                      onClick: () async {},
                      backgroundColor: offRedColor,
                      textColor: Colors.redAccent,
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

  Column _items() {
    return Column(
      children: List.generate(
          viewController.order.items.length,
          (int index) => MezExpandableCard(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewController.order.items[index].name,
                    style: Get.textTheme.bodyLarge,
                  ),
                  Text(
                    "${(viewController.order.items[index].actualCost ?? viewController.order.items[index].estCost)!.toPriceString()}",
                    style: Get.textTheme.bodyLarge,
                  ),
                ],
              ),
              imageUrl: viewController.order.items[index].image,
              expandableWidget:
                  (viewController.order.items[index].notes?.isNotEmpty == true)
                      ? [
                          Text(
                            viewController.order.items[index].notes!,
                          )
                        ]
                      : [])),
    );
  }

  MezCard _estTime() {
    return MezCard(
        contentPadding: const EdgeInsets.all(8),
        firstAvatarBgColor: secondaryLightBlueColor,
        secondAvatarBgColor: primaryBlueColor,
        firstAvatarIcon: Icons.watch_later,
        firstAvatarIconColor: primaryBlueColor,
        secondAvatarIcon: Icons.delivery_dining,
        secondAvatarIconColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery :",
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 2,
            ),
            Text(viewController.order.estimatedArrivalAtDropoffTime!
                .getEstimatedTime()),
          ],
        ));
  }

  MezCard _driverCard() {
    return MezCard(
      margin: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(8),
      secondAvatarIcon: Icons.delivery_dining,
      secondAvatarIconColor: Colors.white,
      secondAvatarBgColor: primaryBlueColor,
      firstAvatarBgColor: secondaryLightBlueColor,
      firstAvatarBgImage: (viewController.order.driverInfo == null)
          ? null
          : CachedNetworkImageProvider(viewController.order.driverInfo!.image),
      content: Text(
        viewController.order.driverInfo?.name ?? "No driver assigned yet",
        style: Get.textTheme.bodyLarge,
      ),
      action: Row(
        children: [
          if (viewController.order.driverInfo != null)
            MessageButton(
                chatId: 55,
                onTap: () {
                  MezRouter.toNamed(SharedRoutes.getMessagesRoute(
                      chatId: viewController.order.chatWithCustomerId));
                })
        ],
      ),
    );
  }
}
