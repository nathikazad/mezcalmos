import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderFooterCard"];

class OrderFooterCard extends StatefulWidget {
  const OrderFooterCard(
      {Key? key, required this.order, required this.cancelOrderFunction})
      : super(key: key);

  final RestaurantOrder order;
  final Future<ServerResponse> Function() cancelOrderFunction;

  @override
  State<OrderFooterCard> createState() => _OrderFooterCardState();
}

class _OrderFooterCardState extends State<OrderFooterCard> {
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
        height: 65,
        margin: const EdgeInsets.only(bottom: 8),
        child: (widget.order.inProcess())
            ? Container(
                margin: EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    showConfirmationDialog(context, onYesClick: () async {
                      final ServerResponse resp =
                          await widget.cancelOrderFunction.call();
                      if (resp.success) {
                        MezRouter.untill(
                          (Route<dynamic> route) =>
                              route.settings.name == kHomeRoute,
                        );
                        MezSnackbar(
                          _i18n()["titleSuccess"],
                          _i18n()["orderCancelSuccess"],
                          position: SnackPosition.TOP,
                        );
                      } else {
                        MezSnackbar(
                          _i18n()["titleFailed"],
                          _i18n()["orderCancelFailed"],
                          position: SnackPosition.TOP,
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
                      style:
                          Get.textTheme.bodyText1?.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              )
            : null);
  }
}
