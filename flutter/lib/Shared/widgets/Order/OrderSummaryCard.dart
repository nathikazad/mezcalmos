import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/ChangePriceRequest.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard(
      {Key? key,
      this.margin,
      this.newRow,
      this.changePriceRequest,
      required this.costs,
      this.divideDeliveryCost = false,
      this.setTaxCallBack,
      this.setDeliveryCallBack,
      this.showNullValues = true,
      required this.stripeOrderPaymentInfo})
      : super(key: key);
  // final Order order;
  final OrderCosts costs;
  final Widget? newRow;
  final bool showNullValues;
  final bool divideDeliveryCost;
  final StripeOrderPaymentInfo? stripeOrderPaymentInfo;
  final ChangePriceRequest? changePriceRequest;

  final Function()? setTaxCallBack;
  final Function()? setDeliveryCallBack;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: margin,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 8),
            //  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: context.txt.bodyLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (showNullValues || costs.orderItemsCost != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["orderCost"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(
                            (costs.orderItemsCost == 0)
                                ? "-"
                                : costs.orderItemsCost?.toPriceString() ?? "-",
                            style: txt.bodyMedium),
                      ],
                    ),
                  ),
                if (stripeOrderPaymentInfo != null &&
                    stripeOrderPaymentInfo!.chargeFeesOnCustomer == true)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["stripeFees"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(stripeOrderPaymentInfo!.stripeFees.toPriceString(),
                            style: txt.bodyMedium),
                      ],
                    ),
                  ),
                if (showNullValues || costs.deliveryCost != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["deliveryCost"]}',
                          style: txt.bodyMedium,
                        ),
                        Row(
                          children: [
                            if (setDeliveryCallBack != null)
                              Container(
                                child: (costs.requested)
                                    ? Text(
                                        "${_i18n()['waitingForCustomer']}",
                                        style: context.txt.bodyLarge?.copyWith(
                                            color: redAccentColor,
                                            fontSize: 10.sp),
                                      )
                                    : (costs.changePriceRequest == null)
                                        ? MezIconButton(
                                            backgroundColor:
                                                backgroundShadeColor,
                                            iconColor: offShadeGreyColor,
                                            elevation: 0,
                                            icon: costs.deliveryCost != null
                                                ? Icons.edit_outlined
                                                : Icons.add,
                                            iconSize: 17,
                                            padding: const EdgeInsets.all(3),
                                            onTap: setDeliveryCallBack,
                                          )
                                        : SizedBox(),
                              ),
                            if (costs.requested == false)
                              Container(
                                margin: const EdgeInsets.only(left: 3),
                                child: Text(
                                    "${(divideDeliveryCost) ? "${((costs.deliveryCost ?? 0) / 2).toPriceString()} x 2 " : "${(costs.deliveryCost?.toPriceString() ?? "-")}"}"),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (costs.refundAmmount != null && costs.refundAmmount! > 0)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["refundAmount"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(
                          "-" + costs.refundAmmount!.toPriceString(),
                          style: txt.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                if ((costs.tax != null && costs.tax != 0) ||
                    setTaxCallBack != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "${_i18n()['tax']}",
                            style: context.txt.bodyMedium,
                          ),
                        ),
                        if (setTaxCallBack != null)
                          costs.tax == null || costs.tax! == 0
                              ? InkWell(
                                  onTap: setTaxCallBack,
                                  child: Text("${_i18n()['add']}",
                                      style: txt.bodyMedium
                                          ?.copyWith(color: primaryBlueColor)),
                                )
                              : MezIconButton(
                                  elevation: 0,
                                  icon: Icons.edit_outlined,
                                  backgroundColor: backgroundShadeColor,
                                  iconColor: offShadeGreyColor,
                                  iconSize: 17,
                                  padding: const EdgeInsets.all(3),
                                  onTap: setTaxCallBack,
                                ),
                        if (costs.tax != null && costs.tax! > 0)
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: Text("${costs.tax?.toPriceString() ?? "-"}"),
                          )
                      ],
                    ),
                  ),
                if (showNullValues || costs.totalCost != null)
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["totalCost"]}',
                          style: txt.bodyLarge,
                        ),
                        Text(
                          (costs.orderItemsCost != 0)
                              ? costs.totalCost?.toPriceString() ?? "-"
                              : "-",
                          style: txt.bodyLarge,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
