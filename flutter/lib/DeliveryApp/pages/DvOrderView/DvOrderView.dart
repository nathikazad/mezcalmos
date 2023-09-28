import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvOrderView/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/OrderMapWidget.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView'];

class DvOrderView extends StatefulWidget {
  const DvOrderView({super.key});

  static void navigate({required int orderId}) {
    MezRouter.toPath(
        DeliveryAppRoutes.kDvOrderView.replaceFirst(":orderId", "$orderId"));
  }

  @override
  State<DvOrderView> createState() => _DvOrderViewState();
}

class _DvOrderViewState extends State<DvOrderView> {
  DvOrderViewController viewController = DvOrderViewController();
  @override
  void initState() {
    final int? orderId = MezRouter.urlArguments["orderId"]?.asInt;
    if (orderId != null) {
      viewController.init(orderId: orderId);
    } else
      showErrorSnackBar(errorText: "Order Not Found");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
        ),
        bottomNavigationBar: Obx(() {
          if (viewController.showAccept) {
            return _aceptButton();
          } else
            return SizedBox();
        }),
        body: Obx(() {
          if (viewController.hasData)
            return _buidBody(context);
          else
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
        }));
  }

  Widget _buidBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OrderMapWidget(
              deliveryOrderId: viewController.order!.orderId,
              height: 70.mezW,
              updateDriver: false,
              polyline: viewController.order!.routeInformation?.polyline,
              from: viewController.order!.pickupLocation,
              to: viewController.order!.dropOffLocation),
          // here call OrderMapWidget
          MezCard(
            label: "${_i18n()['customer']}",
            margin: const EdgeInsets.only(top: 15),
            radius: 22,
            firstAvatarBgImage: CachedNetworkImageProvider(
              viewController.order!.customer.image,
            ),
            content: Text(
              viewController.order!.customer.name,
              style: context.textTheme.bodyLarge,
            ),
            action: MezIconButton(
              icon: Ionicons.logo_whatsapp,
              iconColor: Colors.white,
              backgroundColor: Colors.green,
              onTap: () {
                viewController.openCustomerWhatsapp();
              },
            ),
          ),
          MezCard(
            label: "${_i18n()['restaurant']}",
            margin: const EdgeInsets.only(top: 15),
            radius: 22,
            firstAvatarBgImage: CachedNetworkImageProvider(
              viewController.order!.serviceProvider.image,
            ),
            content: Text(
              viewController.order!.serviceProvider.name,
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

          _orderItemsList(),
          meduimSeperator,
          Text(
            "${_i18n()['orderSummary']}",
            style: context.textTheme.bodyLarge,
          ),
          OrderSummaryCard(
            margin: const EdgeInsets.only(top: 15),
            costs: viewController.order!.costs,
            stripeOrderPaymentInfo: null,
          ),

          bigSeperator,
        ],
      ),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${_i18n()["orderItems"]}',
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
              viewController.order!.items.length,
              (int index) {
                final DeliveryOrderItem item =
                    viewController.order!.items[index];
                return MezCard(
                    firstAvatarBgImage: item.image != null
                        ? CachedNetworkImageProvider(item.image!)
                        : null,
                    firstAvatarIcon:
                        item.image == null ? Icons.fastfood_rounded : null,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name.getTranslation(userLanguage) ?? "",
                          style: context.textTheme.bodyLarge,
                        ),
                        tinySepartor,
                        Text(
                            "\$${item.costPerOne} x ${item.quantity} = \$${item.totalCost}")
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _aceptButton() {
    return MezButton(
      label: 'Accept Order',
      borderRadius: 0,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      onClick: () async {
        await showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(16),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Delivery Cost",
                      style: context.textTheme.bodyLarge,
                    ),
                    meduimSeperator,
                    TextFormField(
                      controller: viewController.priceTxt,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          hintText: "Price", suffix: Icon(Icons.attach_money)),
                    ),
                    meduimSeperator,
                    MezButton(
                      label: "Accept Order",
                      onClick: () async {
                        final double? cost =
                            double.tryParse(viewController.priceTxt.text);
                        if (cost != null) {
                          await viewController.acceptOrder(deliveryCost: cost);
                          Navigator.pop(context);
                        }
                      },
                    ),
                    meduimSeperator,
                    MezButton(
                      label: "Cancel",
                      backgroundColor: offRedColor,
                      textColor: redAccentColor,
                      onClick: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
