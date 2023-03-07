import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/components/DvOrderItems.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/controllers/DvOrderDetailsViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/Order/OrderSummaryCard.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["OrderDetailsScreen"];

//
class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  DvOrderDetailsViewController viewController = DvOrderDetailsViewController();
  @override
  void initState() {
    final String? orderId = Get.parameters['orderId'];
    mezDbgPrint("Get.parameters ===> $orderId");
    if (int.tryParse(orderId ?? "") != null) {
      viewController.init(orderId: int.parse(orderId!));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
      ),
      body: Obx(() {
        if (viewController.order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _orderDetailsHeader(),
                SizedBox(
                  height: 20,
                ),

                Text(
                  "${_i18n()["from"]}",
                  style: Get.textTheme.bodyLarge,
                ),

                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                        viewController.order.value?.pickupLocation?.address ??
                            "")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()["deliveredTo"]}",
                  style: Get.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${viewController.order.value!.dropoffLocation.address}"),
                SizedBox(
                  height: 20,
                ),
                //     OrderPaymentMethod(order: viewController.order.value!),

                _serviceProviderCard(),
                SizedBox(
                  height: 10,
                ),
                _customerCard(),
                SizedBox(
                  height: 20,
                ),
                DvOrderItems(
                  viewController: viewController,
                ),
                SizedBox(
                  height: 20,
                ),
                MezCard(
                  content: Text(
                    "Bill",
                    style: Get.textTheme.bodyLarge,
                  ),
                  action: Container(
                    child: (viewController.billLoading.isTrue)
                        ? CircularProgressIndicator()
                        : (viewController.newBillUrl.value == null)
                            ? Flexible(
                                child: MezButton(
                                  label: "Upload bill",
                                  onClick: () async {
                                    await viewController.editImage(context);
                                  },
                                  height: 30,
                                  borderRadius: 5,
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: viewController.newBillUrl.value!,
                                width: 70,
                                height: 40,
                              ),
                  ),
                ),

                OrderSummaryCard(
                  shippingCost: viewController.order.value!.deliveryCost,
                  orderCost: viewController.order.value!.packageCost,
                  totalCost: viewController.order.value!.totalCost,
                  refundAmmount: viewController
                      .order.value!.stripeOrderPaymentInfo?.amountRefunded,
                  stripeOrderPaymentInfo:
                      viewController.order.value!.stripeOrderPaymentInfo,
                  newRow: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Tax',
                            style: Get.textTheme.bodyMedium,
                          ),
                        ),
                        MezIconButton(
                          icon:
                              viewController.taxSetted ? Icons.edit : Icons.add,
                          iconSize: 17,
                          padding: const EdgeInsets.all(3),
                          onTap: () {
                            viewController.taxText.text =
                                viewController.tax.value?.toString() ?? "";
                            _showTaxSheet(context);
                          },
                        ),
                        if (viewController.taxSetted)
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: Text(
                                "${viewController.tax.value?.toPriceString() ?? "_"}"),
                          )
                      ],
                    ),
                  ),
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "${_i18n()["deliveryCost"]}",
                //       style: Get.textTheme.bodyLarge,
                //     ),
                //     Text(
                //       viewController.order.value!.deliveryCost.toPriceString(),
                //       style: Get.textTheme.bodyLarge,
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Container _orderDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("dd MMMM, hh:mm a")
                .format(viewController.order.value!.orderTime.toLocal()),
            style: Get.textTheme.bodyLarge,
          ),
          Text(
              viewController.order.value!.isCanceled()
                  ? "${_i18n()["cancelled"]}"
                  : "${_i18n()["approved"]}",
              style: Get.textTheme.bodyLarge?.copyWith(
                  color: viewController.order.value!.isCanceled()
                      ? Colors.red
                      : primaryBlueColor))
        ],
      ),
    );
  }

  Card _customerCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  viewController.order.value!.customerInfo.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${viewController.order.value!.customerInfo.name}",
              style: Get.textTheme.bodyLarge,
            ),
            Spacer(),
            MessageButton(
                chatId: viewController.order.value!.chatWithCustomerId,
                onTap: () {
                  MezRouter.toNamed(
                    getMessagesRoute(
                        orderType: viewController.order.value!.orderType,
                        chatId: viewController.order.value!.chatWithCustomerId,
                        orderId: viewController.order.value!.id,
                        recipientType: ParticipantType.Customer),
                  );
                })
          ],
        ),
      ),
    );
  }

  Card _serviceProviderCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  viewController.order.value!.serviceInfo.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${viewController.order.value!.serviceInfo.name}",
              style: Get.textTheme.bodyLarge,
            ),
            Spacer(),
            Text(_getOrderType())
          ],
        ),
      ),
    );
  }

  String _getOrderType() {
    switch (viewController.order.value!.serviceProviderType) {
      case ServiceProviderType.Restaurant:
        return "${_i18n()["restaurant"]}";
      case ServiceProviderType.Laundry:
        return "${_i18n()["laundry"]}";

      default:
        return "";
    }
  }

  Future<dynamic> _showTaxSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Add tax cost",
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      controller: viewController.taxText,
                      style: Get.textTheme.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money_rounded),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MezButton(
                      label: "Save",
                      onClick: () async {
                        await viewController.editTax();
                        MezRouter.popDialog();
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MezButton(
                      label: "Cancel",
                      backgroundColor: offRedColor,
                      textColor: Colors.red,
                      onClick: () async {
                        MezRouter.popDialog();
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          );
        });
  }
}
