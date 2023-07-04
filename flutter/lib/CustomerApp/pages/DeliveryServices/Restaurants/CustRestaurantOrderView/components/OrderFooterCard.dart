import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderFooterCard"];

class OrderFooterCard extends StatefulWidget {
  const OrderFooterCard(
      {Key? key, required this.order, required this.cancelOrderFunction})
      : super(key: key);

  final RestaurantOrder order;
  final Future<bool> Function() cancelOrderFunction;

  @override
  State<OrderFooterCard> createState() => _OrderFooterCardState();
}

class _OrderFooterCardState extends State<OrderFooterCard> {
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
        height: 65,
        margin: const EdgeInsets.only(bottom: 9),
        child: (widget.order.inProcess())
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextButton(
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      final bool resp = await widget.cancelOrderFunction.call();
                      if (resp) {
                        await MezRouter.popEverythingTillBeforeHome();
                        MezSnackbar(
                          _i18n()["titleSuccess"],
                          _i18n()["orderCancelSuccess"],
                          position: Alignment.topCenter,
                        );
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF9D8D6),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${_i18n()["cancelOrder"]}',
                      style: context.txt.bodyLarge
                          ?.copyWith(color: Color(0XFFE21132)),
                    ),
                  ),
                ),
              )
            : SizedBox());
  }
}
