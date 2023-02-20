import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpDriverCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderStatusCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderTimes.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpSetCategoryComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/OrderEstimatedTimeComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/controllers/LaundryOpOrderViewController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderNoteCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['LaundryOpOrderView'];

class LaundryOpOrderView extends StatefulWidget {
  const LaundryOpOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryOpOrderView> createState() => _LaundryOpOrderViewState();
}

class _LaundryOpOrderViewState extends State<LaundryOpOrderView> {
  LaundryOpOrderViewController viewController = LaundryOpOrderViewController();
  int? orderId;

  @override
  void initState() {
    mezDbgPrint("Laundry order route 📥📥📥📥📥");
    if (Get.parameters['orderId'] != null) {
      orderId = int.parse(Get.parameters['orderId']!);
      viewController.init(orderId: orderId!);
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      MezRouter.back<void>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true,
          showNotifications: true,
          ordersRoute: kPastOrdersListView),
      body: Obx(
        () {
          if (viewController.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // order status
                  LaundryOpOrderStatusCard(order: viewController.order),
                  LaundryOpOrderTimes(
                    order: viewController.order,
                  ),
                  if (_setReadyForDeliveryButton() != null)
                    _setReadyForDeliveryButton()!,

                  LaundryOrderEstTime(viewController: viewController),

                  LaundryOpOrderDriverCard(viewController: viewController),
                  _getMapWidget(),
                  MezCard(
                    margin: const EdgeInsets.only(bottom: 20),
                    contentPadding: EdgeInsets.all(12),
                    action: MessageButton(
                        chatId: viewController.order.chatId,
                        onTap: () {
                          MezRouter.toNamed(
                            getMessagesRoute(
                              chatId: viewController.order.chatId,
                              recipientType: ParticipantType.Customer,
                              orderType: OrderType.Laundry,
                              orderId: viewController.order.orderId,
                            ),
                          );
                        }),
                    firstAvatarBgImage: CachedNetworkImageProvider(
                        viewController.order.customer.image),
                    content: Text(
                      viewController.order.customer.name,
                      style: Get.textTheme.bodyLarge,
                    ),
                  ),
                  //  if (viewController.order.afterAtLaundry())
                  LaundyOpSetCategoryComponent(
                    viewController: viewController,
                  ),
                  OrderNoteCard(note: viewController.order.notes),
                  SizedBox(
                    height: 20,
                  ),
                  _totalCostcomponent(context),

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
