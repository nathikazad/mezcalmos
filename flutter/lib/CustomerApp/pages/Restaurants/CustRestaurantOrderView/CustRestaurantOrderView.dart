import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/CustAddReviewButton.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/controllers/CustRestaurantOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];

class CustRestaurantOrderView extends StatefulWidget {
  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath(constructPath(orderId));
  }

  static String constructPath(int orderId) {
    return RestaurantRoutes.restaurantOrdersRoute
        .replaceAll(":orderId", orderId.toString());
  }

  @override
  _CustRestaurantOrderViewState createState() =>
      _CustRestaurantOrderViewState();
}

class _CustRestaurantOrderViewState extends State<CustRestaurantOrderView> {
  CustRestaurantOrderViewController viewController =
      CustRestaurantOrderViewController();

  @override
  void initState() {
    super.initState();

    final int orderId = int.parse(MezRouter.urlArguments['orderId'].toString());
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
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true,
          ordersRoute: CustomerRoutes.customerOrdersRoute,
          showNotifications: true,
          titleWidget: Obx(() => Text(
                viewController.order.value?.restaurant.name ??
                    "Restaurant name",
                style: context.txt.displaySmall,
              ))),
      bottomNavigationBar: _addReviewButton(context),
      body: Obx(
        () {
          if (viewController.order.value == null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // OrderStatusCard(
                  //   order: viewController.order.value!,
                  //   ordersStates: viewController.order.value!.status,
                  // ),
                  // if (viewController.order.value!.paymentType ==
                  //     cModels.PaymentType.BankTransfer)
                  //   RestaurantBankInfoCard(
                  //       restaurantId:
                  //           viewController.order.value!.restaurantId),
                  // if (viewController.order.value!.inProcess())
                  //   CustomerRestaurantOrderEst(
                  //       order: viewController.order.value!),

                  // RestaurantOrderDriverCard(
                  //   order: viewController.order.value!,
                  // ),
                  // if (viewController.order.value!.inDeliveryPhase() &&
                  //     viewController.order.value!.deliveryOrderId !=
                  //         null)
                  //   OrderMapWidget(
                  //       deliveryOrderId: viewController
                  //           .order.value!.deliveryOrderId!,
                  //       updateDriver: viewController.order.value!
                  //           .inDeliveryPhase(),
                  //       polyline: viewController
                  //           .order.value!.routeInformation?.polyline,
                  //       from: viewController
                  //           .order.value!.restaurant.location,
                  //       to: viewController
                  //           .order.value!.dropOffLocation),
                  // OrderRestaurantCard(
                  //     order: viewController.order.value!),

                  MezCard(
                    label: "Restaurant",
                    margin: const EdgeInsets.only(bottom: 15),
                    radius: 22,
                    firstAvatarIcon: Icons.food_bank_rounded,
                    firstAvatarIconColor: primaryBlueColor,
                    firstAvatarBgColor: secondaryLightBlueColor,
                    content: Text(
                      "Restaurant Name",
                      style: context.textTheme.bodyLarge,
                    ),
                    action: MezIconButton(
                      icon: Ionicons.logo_whatsapp,
                      iconColor: Colors.white,
                      backgroundColor: Colors.green,
                      onTap: () {
                        viewController.openRestaurantWhatsapp();
                      },
                    ),
                  ),
                  MezCard(
                    label: "Driver",
                    margin: const EdgeInsets.only(bottom: 15),
                    radius: 22,
                    firstAvatarIconColor: primaryBlueColor,
                    firstAvatarBgColor: secondaryLightBlueColor,
                    firstAvatarIcon: Icons.delivery_dining_rounded,
                    content: Text(
                      "Driver Name",
                      style: context.textTheme.bodyLarge,
                    ),
                    action: MezIconButton(
                      icon: Ionicons.logo_whatsapp,
                      iconColor: Colors.white,
                      backgroundColor: Colors.green,
                      onTap: () {
                        viewController.openDriverWhatsapp();
                      },
                    ),
                  ),

                  Text(
                      "Rest of the code is commented untill we get the real data")
                  // OrderItemsCard(
                  //   order: viewController.order.value!,
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 15),
                  //   child: Text(
                  //     '${_i18n()["deliveryDet"]}',
                  //     style: context.txt.bodyLarge,
                  //   ),
                  // ),
                  // OrderScheduledTimeCard(
                  //     time: viewController.order.value!.scheduleTime,
                  //     margin: const EdgeInsets.only(top: 8)),
                  // // RestaurantOrderDeliveryTimeCard(
                  // //   order: viewController.order.value!,
                  // //   margin: const EdgeInsets.only(top: 8),
                  // // ),
                  // OrderDeliveryLocation(
                  //   address:
                  //       viewController.order.value!.dropOffLocation.address,
                  //   margin: const EdgeInsets.only(top: 8),
                  // ),
                  // OrderPaymentMethod(
                  //   stripeOrderPaymentInfo:
                  //       viewController.order.value!.stripePaymentInfo,
                  //   paymentType: viewController.order.value!.paymentType,
                  // ),
                  // OrderNoteCard(note: viewController.order.value!.notes),
                  // if (viewController.order.value!.review != null)
                  //   ReviewCard(
                  //       showReviewTitle: true,
                  //       review: viewController.order.value!.review!),
                  // OrderSummaryCard(
                  //   margin: const EdgeInsets.only(top: 15),
                  //   costs: viewController.order.value!.costs,
                  //   stripeOrderPaymentInfo:
                  //       viewController.order.value!.stripePaymentInfo,
                  // ),

                  // //===============================>button cancel===========================
                  // //  Expanded(child: Container()),
                  // SizedBox(
                  //   height: 9,
                  // ),
                  // Flexible(
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: OrderFooterCard(
                  //       order: viewController.order.value!,
                  //       cancelOrderFunction: viewController.cancelOrder,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _addReviewButton(BuildContext context) {
    return Obx(() {
      if (viewController.order.value?.canAddReview == true) {
        return CustAddReviewButton(
          orderId: viewController.order.value!.orderId,
          toEntityId: viewController.order.value!.serviceProvider.hasuraId,
          toEntityType: cModels.ServiceProviderType.Restaurant,
        );
      } else {
        return SizedBox();
      }
    });
  }
}
