import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/components/BsHomeRentalOrderItemCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/components/BsHomeRentalOrderSatusCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/controllers/BsHomeRentalOrderViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';

class BsHomeRentalOrderView extends StatefulWidget {
  const BsHomeRentalOrderView({super.key});
  static Future<void> navigate({required int orderId}) async {
    return await MezRouter.toPath(
        BusinessOpRoutes.kBsOpHomeRentalOrder.replaceFirst(":id", "$orderId"));
  }

  @override
  State<BsHomeRentalOrderView> createState() => _BsHomeRentalOrderViewState();
}

class _BsHomeRentalOrderViewState extends State<BsHomeRentalOrderView> {
  BsHomeRentalOrderViewController viewController =
      BsHomeRentalOrderViewController();
  int? orderId;
  @override
  void initState() {
    orderId = int.tryParse(MezRouter.urlArguments["id"].toString());
    if (orderId == null) {
      showErrorSnackBar(
          errorText: "Invalid order id", duration: const Duration(seconds: 3));
    } else {
      viewController.init(orderId: orderId!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          titleWidget:
              Obx(() => Text((viewController.order?.customer?.name ?? ""))),
          onClick: MezRouter.back),
      bottomNavigationBar: Obx(() => viewController.orderIsRequested
          ? MezButton(
              height: 75,
              borderRadius: 0,
              label: (viewController.hasChanges)
                  ? "Request changes"
                  : "Accept order",
              withGradient: true,
              onClick: () async {
                await viewController.handleRequestedOrder();
              },
            )
          : SizedBox.shrink()),
      body: Obx(() {
        if (!viewController.isLoading && viewController.order != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BsHomeRentalOrderSatusCard(
                  status: viewController.order!.status,
                ),
                meduimSeperator,
                MezCard(
                    firstAvatarBgImage: CachedNetworkImageProvider(
                      viewController.customer!.image!,
                    ),
                    action: (viewController.order?.chatId != null)
                        ? MessageButton(
                            chatId: viewController.order!.chatId!.toInt(),
                            onTap: () {
                              BaseMessagingScreen.navigate(
                                  chatId:
                                      viewController.order!.chatId!.toInt());
                            },
                          )
                        : null,
                    content: Text(
                      viewController.customer!.name!,
                      style: context.textTheme.bodyLarge,
                    )),
                meduimSeperator,
                Column(
                  children: List.generate(
                      viewController.order!.items.length,
                      (int index) => BsHomeRentalOrderItemCard(
                            item: viewController.order!.items[index],
                            viewController: viewController,
                          )),
                ),
                // OrderPaymentMethod(
                //     paymentType: PaymentType.Card,
                //     stripeOrderPaymentInfo: null),
                meduimSeperator,
                OrderNoteCard(
                  note: viewController.order?.notes,
                ),
                meduimSeperator,
                OrderSummaryCard(
                    showNullValues: false,
                    costs: OrderCosts(
                        deliveryCost: null,
                        refundAmmount: null,
                        tax: null,
                        orderItemsCost: viewController.order?.cost,
                        totalCost: viewController.order?.cost),
                    stripeOrderPaymentInfo: null),
                meduimSeperator,
                if (viewController.canCancel)
                  MezButton(
                    label: "Cancel order",
                    onClick: () async {
                      unawaited(
                          showConfirmationDialog(context, onYesClick: () async {
                        await viewController.cancelOrder();
                        Navigator.pop(context);
                      }));
                    },
                    backgroundColor: offRedColor,
                    textColor: redAccentColor,
                  )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}