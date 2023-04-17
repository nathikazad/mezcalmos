import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustAddReviewButton.dart';
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierOrderView/controllers/CustCourierOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/services/DeliveryOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandableCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderBillImage.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderDeliveryLocation.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderPaymentMethod.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderScheduledTime.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["courrier"]["CustCourierOrderView"];

class CustCourierOrderView extends StatefulWidget {
  static Future<void> navigate({
    required int orderId,
  }) {
    return MezRouter.toPath(constructPath(orderId));
  }

  static String constructPath(int orderId) {
    return CourierRoutes.kCourierOrderView
        .replaceFirst(":orderId", orderId.toString());
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
    if (int.tryParse(MezRouter.urlArguments['orderId'].toString()) != null) {
      viewController.init(
          orderId: int.parse(MezRouter.urlArguments['orderId'].toString()),
          context: context);
    } else {
      MezRouter.back();
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
          showNotifications: true,
          ordersRoute: CustomerRoutes.customerOrdersRoute,
          titleWidget: Obx(() => viewController.hasData
              ? Text(
                  viewController.order.deliveryCompany?.name ?? "",
                  style: context.txt.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              : SizedBox())),
      bottomNavigationBar: _addReviewButton(context),
      body: Obx(
        () {
          if (viewController.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MezCard(
                    contentPadding: const EdgeInsets.all(15),
                    leading: viewController.order.status.widget(
                        packageReady: viewController.order.packageReady),
                    content: Text(
                      viewController.order.status.title.inCaps,
                      style: context.txt.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (viewController.order.estimatedArrivalAtDropoff != null)
                    _estTime(),
                  _driverCard(),
                  SizedBox(
                    height: 15,
                  ),
                  if (viewController.order.inDeliveryPhase &&
                      viewController.order.deliveryOrderId != null)
                    OrderMapWidget(
                        deliveryOrderId: viewController.order.deliveryOrderId!,
                        updateDriver: viewController.order.inDeliveryPhase,
                        polyline:
                            viewController.order.routeInformation?.polyline,
                        from: viewController.order.pickupLocation,
                        to: viewController.order.dropOffLocation),
                  _items(),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      "${_i18n()['deliveryDetails']}",
                      style: context.txt.bodyLarge,
                    ),
                  ),
                  OrderScheduledTimeCard(
                      time: viewController.order.scheduleTime,
                      margin: const EdgeInsets.only(top: 8)),
                  if (viewController.order.pickupLocation != null)
                    OrderDeliveryLocation(
                      title: "${_i18n()['pickupLoc']}",
                      address: viewController.order.pickupLocation!.address,
                      margin: const EdgeInsets.only(top: 8),
                    ),
                  OrderDeliveryLocation(
                    address: viewController.order.dropOffLocation.address,
                    margin: const EdgeInsets.only(top: 15),
                  ),
                  OrderPaymentMethod(
                    margin: EdgeInsets.only(top: 15),
                    stripeOrderPaymentInfo:
                        viewController.order.stripePaymentInfo,
                    paymentType: viewController.order.paymentType,
                  ),
                  if (viewController.order.billImage != null)
                    OrderBillImage(
                      billImage: viewController.order.billImage,
                      margin: const EdgeInsets.only(top: 15),
                    ),
                  OrderNoteCard(
                      margin: const EdgeInsets.only(top: 15),
                      note: viewController.order.notes),
                  OrderSummaryCard(
                    margin: const EdgeInsets.only(top: 15),
                    costs: viewController.order.costs,
                    stripeOrderPaymentInfo:
                        viewController.order.stripePaymentInfo,
                  ),
                  if (viewController.order.review != null)
                    ReviewCard(
                      review: viewController.order.review!,
                      showReviewTitle: true,
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  if (viewController.order.inProcess())
                    MezButton(
                      label: '${_i18n()["cancelOrder"]}',
                      onClick: () async {
                        await showConfirmationDialog(context,
                            onYesClick: () async {
                          final bool resp = await viewController.cancelOrder();
                          if (resp) {
                            await MezRouter.popEverythingTillBeforeHome();
                          }
                        });
                      },
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

  Widget _items() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: List.generate(
            viewController.order.items.length,
            (int index) => MezExpandableCard(
                marging: EdgeInsets.only(bottom: 5),
                title: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.order.items[index].name,
                        maxLines: 2,
                        style: context.txt.bodyLarge?.copyWith(
                            color: viewController.order.items[index].unavailable
                                ? Colors.grey
                                : null,
                            decoration:
                                viewController.order.items[index].unavailable
                                    ? TextDecoration.lineThrough
                                    : null),
                      ),
                      Row(
                        children: [
                          if (viewController.isEstCostNull(index) &&
                              viewController.isActCostNull(index))
                            Text(
                              '-',
                              style: context.txt.bodyLarge?.copyWith(
                                  color: viewController
                                          .order.items[index].unavailable
                                      ? Colors.grey
                                      : null,
                                  decoration: viewController.order.items[index]
                                                  .actualCost !=
                                              null ||
                                          viewController
                                              .order.items[index].unavailable
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),
                          if (!viewController.isEstCostNull(index) &&
                              !viewController.equalEstActCost(index))
                            Text(
                              '${viewController.order.items[index].estCost?.toPriceString()}',
                              style: context.txt.bodyLarge?.copyWith(
                                  color: viewController
                                          .order.items[index].unavailable
                                      ? Colors.grey
                                      : null,
                                  decoration: viewController.order.items[index]
                                                  .actualCost !=
                                              null ||
                                          viewController
                                              .order.items[index].unavailable
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),
                          /*if (viewController.order.items[index].estCost != null &&
                              viewController.order.items[index].actualCost ==
                                  null)
                            Text(
                              "${viewController.order.items[index].estCost?.toPriceString() ?? "-"}",
                              style: context.txt.bodyLarge?.copyWith(
                                  color: viewController
                                          .order.items[index].unavailable
                                      ? Colors.grey
                                      : null,
                                  decoration: viewController.order.items[index]
                                                  .actualCost !=
                                              null ||
                                          viewController
                                              .order.items[index].unavailable
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),*/
                          if (!viewController.isEstCostNull(index) &&
                              !viewController.isActCostNull(index) &&
                              !viewController.equalEstActCost(index))
                            Icon(
                              Icons.arrow_forward_rounded,
                              color:
                                  viewController.order.items[index].unavailable
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          if (viewController.order.items[index].actualCost !=
                              null)
                            Text(
                                "${viewController.order.items[index].actualCost!.toPriceString()}",
                                style: context.txt.bodyLarge?.copyWith(
                                  decoration: viewController
                                          .order.items[index].unavailable
                                      ? TextDecoration.lineThrough
                                      : null,
                                  color: viewController
                                          .order.items[index].unavailable
                                      ? Colors.grey
                                      : null,
                                ))
                        ],
                      ),
                    ],
                  ),
                ),
                imageUrl: viewController.order.items[index].image,
                expandableWidget:
                    (viewController.order.items[index].notes?.isNotEmpty ==
                            true)
                        ? [
                            Text(
                              '${_i18n()["note"]}',
                              style: context.txt.bodyLarge,
                            ),
                            Text(
                              viewController.order.items[index].notes!,
                            )
                          ]
                        : [])),
      ),
    );
  }

  MezCard _estTime() {
    return MezCard(
        margin: const EdgeInsets.only(top: 15),
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
              '${_i18n()["delivery"]}',
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 2,
            ),
            if (viewController.order.inDeliveryPhase)
              Text(viewController.order.estimatedArrivalAtDropoff!
                  .getEstimatedTime()),
          ],
        ));
  }

  Widget _driverCard() {
    return Obx(
      () => MezCard(
        margin: const EdgeInsets.only(top: 15),
        contentPadding: const EdgeInsets.all(8),
        secondAvatarIcon: Icons.delivery_dining,
        secondAvatarIconColor: Colors.white,
        secondAvatarBgColor: primaryBlueColor,
        firstAvatarBgColor: secondaryLightBlueColor,
        firstAvatarBgImage: (viewController.order.driverInfo == null)
            ? null
            : CachedNetworkImageProvider(
                viewController.order.driverInfo!.image),
        content: Text(
          viewController.order.driverInfo?.name ??
              '${_i18n()["noDriverAssignedYet"]}',
          style: context.txt.bodyLarge,
        ),
        action: Row(
          children: [
            if (viewController.order.customerDriverChatId != null &&
                viewController.order.inProcess() &&
                viewController.order.isDriverAssigned)
              MessageButton(
                  chatId: viewController.order.customerDriverChatId!,
                  onTap: () {
                    BaseMessagingScreen.navigate(
                        chatId: viewController.order.customerDriverChatId!);
                  })
          ],
        ),
      ),
    );
  }

  Widget _addReviewButton(BuildContext context) {
    return Obx(() {
      if (viewController.hasData &&
          viewController.order.canAddReview == true &&
          viewController.order.deliveryOrderId != null) {
        return CustAddReviewButton(
          orderId: viewController.order.deliveryOrderId!,
          toEntityId: viewController.order.serviceProvider.hasuraId,
          toEntityType: ServiceProviderType.DeliveryCompany,
        );
      } else {
        return SizedBox();
      }
    });
  }
}
