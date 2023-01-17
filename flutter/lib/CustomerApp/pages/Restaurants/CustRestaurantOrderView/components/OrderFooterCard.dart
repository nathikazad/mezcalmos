import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderFooterCard"];

class OrderFooterCard extends StatefulWidget {
  OrderFooterCard(
      {Key? key,
      required this.order,
      this.isWebVersion,
      required this.cancelOrderFunction,
      this.navigationCallback})
      : super(key: key);

  final RestaurantOrder order;
  final Future<ServerResponse> Function() cancelOrderFunction;

  bool? isWebVersion = false;
  Function? navigationCallback;

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
                        if (widget.isWebVersion == true) {
                          Navigator.of(context).pop();
                          widget.navigationCallback?.call();
                        } else {
                          MezRouter.untill(
                            (Route<dynamic> route) =>
                                route.settings.name == kHomeRoute,
                          );
                        }

                        MezSnackbar(_i18n()["titleSuccess"],
                            _i18n()["orderCancelSuccess"],
                            position: SnackPosition.TOP,
                            context:
                                (widget.isWebVersion == true) ? context : null);
                      } else {
                        MezSnackbar(_i18n()["titleFailed"],
                            _i18n()["orderCancelFailed"],
                            position: SnackPosition.TOP,
                            context:
                                (widget.isWebVersion == true) ? context : null);
                      }
                    }, isWebVersion: widget.isWebVersion);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF9D8D6),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${_i18n()["cancelOrder"]}',
                      style: Get.textTheme.bodyText1?.copyWith(
                          color: Colors.red,
                          fontSize: (widget.isWebVersion == true) ? 15 : null),
                    ),
                  ),
                ),
              )
            : null);
  }
}
