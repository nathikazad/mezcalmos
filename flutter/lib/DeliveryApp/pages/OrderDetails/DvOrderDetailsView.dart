import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/controllers/DvOrderDetailsViewController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter/services.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/components/DvOrderItems.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
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

  static Future<void> navigate({required int orderId}) {
    return MezRouter.toPath<void>(DeliveryAppRoutes.kOrderDetailsViewRoute
        .replaceAll(":orderId", orderId.toString()));
  }

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late String orderId;
  Rxn<DeliveryOrder> order = Rxn();
  DvOrderDetailsViewController viewController = DvOrderDetailsViewController();
  @override
  void initState() {
    final String orderId = MezRouter.urlArguments['orderId'].toString();
    mezDbgPrint("Get.parameters ===> $orderId");
    if (int.tryParse(orderId) != null) {
      viewController.init(orderId: int.parse(orderId));
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
                  "${_i18n()['orderDetails']}",
                  style: Get.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (viewController.order.value!.scheduleTime != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_i18n()["schTime"]}",
                                style: Get.textTheme.bodyLarge,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(viewController
                                      .order.value!.scheduleTime!
                                      .getOrderTime())),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        if (viewController.order.value!.pickupLocation != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_i18n()["from"]}",
                                style: Get.textTheme.bodyLarge,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(viewController.order.value
                                          ?.pickupLocation?.address ??
                                      "")),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        Text(
                          "${_i18n()["deliveredTo"]}",
                          style: Get.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "${viewController.order.value!.dropoffLocation.address}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${_i18n()["paymentMethod"]}",
                          style: Get.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "${_i18n()[viewController.order.value!.paymentType.toNormalString().toLowerCase()]}"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${_i18n()['customer']}",
                  style: Get.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                _customerCard(),
                DvOrderItems(
                  viewController: viewController,
                ),
                _billCard(context),
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
                            "${_i18n()['tax']}",
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

  MezCard _billCard(BuildContext context) {
    return MezCard(
      content: Text(
        "${_i18n()['bill']}",
        style: Get.textTheme.bodyLarge,
      ),
      action: Container(
        child: (viewController.billLoading.isTrue)
            ? CircularProgressIndicator()
            : (viewController.newBillUrl.value == null)
                ? Flexible(
                    child: MezButton(
                      label: "${_i18n()['upload']}",
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
                  MezRouter.toNamed(SharedRoutes.getMessagesRoute(
                    chatId: viewController.order.value!.chatWithCustomerId,
                  ));
                })
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
                        "${_i18n()['addTax']}",
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    Divider(
                      height: 25,
                    ),
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
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['cancel']}",
                            backgroundColor: offRedColor,
                            textColor: Colors.red,
                            onClick: () async {
                              MezRouter.popDialog();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: MezButton(
                            height: 45,
                            label: "${_i18n()['save']}",
                            onClick: () async {
                              await viewController.editTax();
                              MezRouter.popDialog();
                            },
                          ),
                        ),
                      ],
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
