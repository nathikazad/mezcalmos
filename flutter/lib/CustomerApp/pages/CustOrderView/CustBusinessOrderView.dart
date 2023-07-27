import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/EventCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/HomeCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ProductCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/RentalCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/components/ServiceCartItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderView/controllers/CustBusinessOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustOrderView']['CustOrderView'];

class CustBusinessOrderView extends StatefulWidget {
  const CustBusinessOrderView({super.key});

  @override
  State<CustBusinessOrderView> createState() => _CustBusinessOrderViewState();

  static Future<void> navigate({required int orderId, EntityType? entityType}) {
    return MezRouter.toPath(constructPath(orderId),
        arguments: {"entityType": entityType});
  }

  static String constructPath(int orderId) {
    return CustBusinessRoutes.custOrderViewRoute
        .replaceFirst(":orderId", orderId.toString());
  }
}

class _CustBusinessOrderViewState extends State<CustBusinessOrderView> {
  late CustBusinessOrderViewController custBusinessOrderController;
  final CustBusinessCartController cartController =
      Get.find<CustBusinessCartController>();

  late int orderId;
  late EntityType? entityType;

  @override
  void initState() {
    orderId = int.parse(MezRouter.urlArguments['orderId'].toString());
    entityType = MezRouter.bodyArguments?["entityType"] as EntityType?;
    MezRouter.registerReturnToViewCallback(
        CustBusinessOrderView.constructPath(orderId), () {
      clearNotifications(orderId);
    });

    if (entityType == EntityType.Admin) {
      custBusinessOrderController = AdminOrderViewController();
      custBusinessOrderController.setCurrentOrderInView(orderId);
    } else {
      custBusinessOrderController = CustBusinessOrderViewController();
      custBusinessOrderController.setCurrentOrderInView(orderId);
    }
    super.initState();
  }

  void clearNotifications(int orderId) {
    Get.find<ForegroundNotificationsController>().clearAllOrderNotifications(
        orderType: OrderType.Business, orderId: orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: (custBusinessOrderController.currentOrderInView.value == null)
            ? '${_i18n()['order']}'
            : "${custBusinessOrderController.currentOrderInView.value!.getBusinessName()}",
      ),
      bottomNavigationBar: entityType == EntityType.Admin
          ? null
          : Obx(() {
              if (custBusinessOrderController.currentOrderInView.value ==
                  null) {
                return SizedBox.shrink();
              }
              // else if (custBusinessOrderController
              //     .currentOrderInView.value!.showReviewButton) {
              //   return CustAddReviewButton(
              //     orderId:
              //         custBusinessOrderController.currentOrderInView.value!.id!,
              //     toEntityId: custBusinessOrderController
              //         .currentOrderInView.value!.businessId!
              //         .toInt(),
              //     toEntityType: ServiceProviderType.Business,
              //   );
              // }
              else {
                return SizedBox.shrink();
              }
            }),
      bottomSheet: entityType == EntityType.Admin
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => bottomButtons(context)),
            ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: (custBusinessOrderController.currentOrderInView.value == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderStatusCard(),
                            smallSepartor,
                            MezCard(
                                content: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(getBusinessImage()),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      getBusinessName(),
                                      style: context.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                if (getBusinessPhone() != null)
                                  MezIconButton(
                                    onTap: () {
                                      callWhatsappNumber(getBusinessPhone()!);
                                    },
                                    icon: Ionicons.logo_whatsapp,
                                    iconColor: Colors.green,
                                    backgroundColor: Colors.white,
                                  ),
                                MessageButton(
                                  chatId: custBusinessOrderController
                                      .currentOrderInView.value!.chatId!
                                      .toInt(),
                                  onTap: () async {
                                    await BaseMessagingScreen.navigate(
                                        chatId: custBusinessOrderController
                                            .currentOrderInView.value!.chatId!
                                            .toInt());
                                  },
                                ),
                              ],
                            )),
                            if (custBusinessOrderController
                                .currentOrderInView.value!.items.isNotEmpty)
                              smallSepartor,
                            if (custBusinessOrderController
                                .currentOrderInView.value!.items.isNotEmpty)
                              ...custBusinessOrderController
                                  .currentOrderInView.value!.items
                                  .asMap()
                                  .entries
                                  .map(
                                (MapEntry<int, BusinessCartItem> data) {
                                  final int index = data.key;
                                  final BusinessCartItem item = data.value;
                                  switch (item.offeringType) {
                                    case OfferingType.Home:
                                      return HomeCartItemCard(
                                        index: index,
                                        item: item,
                                        controller: cartController,
                                        isEditable: false,
                                      );
                                    case OfferingType.Rental:
                                      return RentalCartItemCard(
                                        index: index,
                                        item: item,
                                        controller: cartController,
                                        isEditable: false,
                                      );
                                    case OfferingType.Event:
                                      return EventCartItemCard(
                                        index: index,
                                        item: item,
                                        controller: cartController,
                                        isEditable: false,
                                      );
                                    case OfferingType.Service:
                                      return ServiceCartItemCard(
                                        index: index,
                                        item: item,
                                        controller: cartController,
                                        isEditable: false,
                                      );
                                    case OfferingType.Product:
                                      return ProductCartItemCard(
                                        index: index,
                                        item: item,
                                        controller: cartController,
                                        isEditable: false,
                                      );
                                  }
                                },
                              ).toList(),
                            smallSepartor,
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '${_i18n()['notes']}',
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                            smallSepartor,
                            TextFormField(
                              maxLines: 5,
                              minLines: 3,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: '${_i18n()['writeNotesHere']}',
                              ),
                            ),
                            smallSepartor,
                            MezCard(
                              elevation: 1,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_i18n()['summary']}',
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  smallSepartor,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${_i18n()['orderCost']}',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                      Text(
                                        "\$${custBusinessOrderController.currentOrderInView.value?.cost.toDouble().toStringAsFixed(0)}",
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // smallSepartor,
                            // bottomButtons(context),
                          ],
                        ),
                      ),
                    ),
                    bottomButtons(context)
                  ],
                ),
        ),
      ),
    );
  }

  String getBusinessImage() {
    switch (custBusinessOrderController
        .currentOrderInView.value!.items.first.offeringType) {
      case OfferingType.Rental:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.rental!.business.image;
      case OfferingType.Event:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.event!.business.image;
      case OfferingType.Service:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.service!.business.image;
      case OfferingType.Product:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.product!.business.image;
      case OfferingType.Home:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.home!.business.image;
    }
  }

  String getBusinessName() {
    switch (custBusinessOrderController
        .currentOrderInView.value!.items.first.offeringType) {
      case OfferingType.Rental:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.rental!.business.name;
      case OfferingType.Event:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.event!.business.name;
      case OfferingType.Service:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.service!.business.name;
      case OfferingType.Product:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.product!.business.name;
      case OfferingType.Home:
        return custBusinessOrderController
            .currentOrderInView.value!.items.first.home!.business.name;
    }
  }

  String? getBusinessPhone() {
    switch (cartController.currentOrderInView.value!.items.first.offeringType) {
      case OfferingType.Rental:
        return cartController
            .currentOrderInView.value!.items.first.rental!.business.phoneNo;
      case OfferingType.Event:
        return cartController
            .currentOrderInView.value!.items.first.event!.business.phoneNo;
      case OfferingType.Service:
        return cartController
            .currentOrderInView.value!.items.first.service!.business.phoneNo;
      case OfferingType.Product:
        return cartController
            .currentOrderInView.value!.items.first.product!.business.phoneNo;
      case OfferingType.Home:
        return cartController
            .currentOrderInView.value!.items.first.home!.business.phoneNo;
    }
  }

  Widget bottomButtons(BuildContext context) {
    if (custBusinessOrderController.currentOrderInView.value == null) {
      return SizedBox.shrink();
    }
    if (custBusinessOrderController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.CancelledByCustomer ||
        custBusinessOrderController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.CancelledByBusiness) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (custBusinessOrderController.currentOrderInView.value!.status !=
            BusinessOrderRequestStatus.Confirmed)
          MezCard(
            content: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: primaryBlueColor,
                  ),
                ),
                if (custBusinessOrderController
                        .currentOrderInView.value!.status ==
                    BusinessOrderRequestStatus.RequestReceived)
                  Expanded(
                    child: Text(
                      '${_i18n()['notComfirmed']}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: primaryBlueColor,
                      ),
                    ),
                  ),
                if (custBusinessOrderController
                        .currentOrderInView.value!.status ==
                    BusinessOrderRequestStatus.ModificationRequestByBusiness)
                  Expanded(
                    child: Text(
                      '${_i18n()['businessModifications']}',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: primaryBlueColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (custBusinessOrderController.currentOrderInView.value!.status ==
            BusinessOrderRequestStatus.ModificationRequestByBusiness)
          MezButton(
            label: '${_i18n()['acceptChange']}',
            onClick: () async {
              await custBusinessOrderController.acceptOrderRequest();
            },
          ),
        smallSepartor,
        if (custBusinessOrderController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.RequestReceived ||
            custBusinessOrderController.currentOrderInView.value!.status ==
                BusinessOrderRequestStatus.ModificationRequestByBusiness)
          MezButton(
            label: '${_i18n()['cancelRequest']}',
            textColor: Colors.red,
            backgroundColor: Colors.red.shade100,
            onClick: () async {
              await custBusinessOrderController.cancelOrderRequest();
            },
          ),
      ],
    );
  }

  Widget orderStatusCard() {
    return MezCard(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              custBusinessOrderController.currentOrderInView.value!.status!
                  .getIcon(),
              color: custBusinessOrderController.isCanceled
                  ? redAccentColor
                  : primaryBlueColor,
            ),
            Expanded(
              child: Text(
                "${_i18n()[custBusinessOrderController.currentOrderInView.value!.status!.toReadableString()]}",
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
