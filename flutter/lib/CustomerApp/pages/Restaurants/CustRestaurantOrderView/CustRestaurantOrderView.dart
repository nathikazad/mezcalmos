import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/CustAddReviewButton.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrdersItemsCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/controllers/CustRestaurantOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderScheduledTime.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

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
          onClick: MezRouter.back,
          ordersRoute: CustomerRoutes.customerOrdersRoute,
          showNotifications: true,
          titleWidget: Obx(() => Text(
                viewController.order.value?.restaurant.name ?? "",
                style: context.txt.displaySmall,
              ))),
      bottomNavigationBar: _addReviewButton(context),
      body: Obx(
        () {
          if (viewController.order.value != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OrderMapWidget(
                      deliveryOrderId:
                          viewController.order.value!.deliveryOrderId!,
                      height: 70.mezW,
                      updateDriver: false,
                      polyline: viewController
                          .order.value!.routeInformation?.polyline,
                      from: viewController.order.value!.restaurant.location,
                      to: viewController.order.value!.dropOffLocation),
                  MezCard(
                    label: "${_i18n()['restaurant']}",
                    margin: const EdgeInsets.only(top: 15),
                    radius: 22,
                    firstAvatarBgImage: CachedNetworkImageProvider(
                        viewController.order.value!.restaurant.image),
                    content: Text(
                      viewController.order.value!.restaurant.name,
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
                  if (viewController.order.value!.driverInfo != null)
                    MezCard(
                      label: "${_i18n()['driver']}",
                      margin: const EdgeInsets.only(top: 15),
                      radius: 22,
                      secondAvatarIconColor: primaryBlueColor,
                      secondAvatarBgColor: secondaryLightBlueColor,
                      secondAvatarIcon: Icons.delivery_dining_rounded,
                      content: Text(
                        viewController.order.value!.driverInfo!.name,
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
                  OrderItemsCard(
                    order: viewController.order.value!,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      '${_i18n()["deliveryDet"]}',
                      style: context.txt.bodyLarge,
                    ),
                  ),
                  OrderScheduledTimeCard(
                      time: viewController.order.value!.scheduleTime,
                      margin: const EdgeInsets.only(top: 8)),
                  OrderDeliveryLocation(
                    address:
                        viewController.order.value!.dropOffLocation.address,
                    margin: const EdgeInsets.only(top: 8),
                  ),
                  OrderPaymentMethod(
                    stripeOrderPaymentInfo:
                        viewController.order.value!.stripePaymentInfo,
                    paymentType: viewController.order.value!.paymentType,
                  ),
                  OrderNoteCard(note: viewController.order.value!.notes),
                  if (viewController.order.value!.review != null)
                    ReviewCard(
                        showReviewTitle: true,
                        review: viewController.order.value!.review!),
                  meduimSeperator,
                  // Text(
                  //   "${_i18n()['orderSummary']}",
                  //   style: context.textTheme.bodyLarge,
                  // ),
                  // MezCard(
                  //     margin: EdgeInsets.only(top: 8),
                  //     contentPadding: const EdgeInsets.all(12),
                  //     content: Column(
                  //       children: <Widget>[
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: <Widget>[
                  //             Text("${_i18n()['orderCost']}"),
                  //             Text(
                  //               viewController
                  //                   .order.value!.costs.orderItemsCost!
                  //                   .toPriceString(),
                  //               style: context.textTheme.bodyLarge,
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     )),

                  OrderSummaryCard(
                    //  margin: const EdgeInsets.only(top: 15),
                    costs: viewController.order.value!.costs,
                    stripeOrderPaymentInfo:
                        viewController.order.value!.stripePaymentInfo,
                  ),
                  bigSeperator,
                  Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: "${_i18n()['noResponse']}"),
                        WidgetSpan(child: hSmallSepartor),
                        WidgetSpan(
                          child: MezInkwell(
                            backgroundColor: secondaryLightBlueColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            textColor: primaryBlueColor,
                            textStyle: context.textTheme.bodyMedium
                                ?.copyWith(color: primaryBlueColor),
                            label: "${_i18n()['contactAdmin']}",
                            onClick: () async {
                              await viewController.contactAdmin();
                            },
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  bigSeperator,

                  SizedBox(
                    height: 9,
                  ),
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
