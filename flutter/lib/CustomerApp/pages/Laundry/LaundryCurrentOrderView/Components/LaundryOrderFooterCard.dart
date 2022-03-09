import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

class LaundryOrderFooterCard extends StatefulWidget {
  const LaundryOrderFooterCard({Key? key, required this.order})
      : super(key: key);

  final LaundryOrder order;

  @override
  State<LaundryOrderFooterCard> createState() => _LaundryOrderFooterCardState();
}

class _LaundryOrderFooterCardState extends State<LaundryOrderFooterCard> {
  LaundryController laundryController = Get.find<LaundryController>();
  dynamic _i18n = Get.find<LanguageController>().strings['AppName']['Filename'];
  RxBool _clickedCancel = false.obs;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
        child: (widget.order.inProcess())
            ? Container(
                margin: EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Obx(
                              () => AlertDialog(
                                contentPadding: EdgeInsets.all(20),
                                title: Text(
                                  !_clickedCancel.value
                                      ? '${lang.strings["customer"]["restaurant"]["checkout"]["cancelOrder"]}'
                                      : '${lang.strings["customer"]["restaurant"]["checkout"]["orderCanceled"]}',
                                  textAlign: TextAlign.center,
                                ),
                                content: alertDialogContent(),
                              ),
                            );
                          });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade600),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          '${lang.strings["customer"]["restaurant"]["checkout"]["cancelOrder"]}'),
                    )),
              )
            : (widget.order.status == LaundryOrderStatus.Delivered)
                ? orderDeliverdComponent(txt)
                : (widget.order.status ==
                            LaundryOrderStatus.CancelledByCustomer ||
                        widget.order.status ==
                            LaundryOrderStatus.CancelledByAdmin)
                    ? orderCanceledComponent(txt)
                    : TextButton(
                        onPressed: null,
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.grey),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              '${lang.strings["customer"]["restaurant"]["checkout"]["cancelOrder"]}'),
                        )));
  }

  Card orderCanceledComponent(TextTheme txt) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${lang.strings["customer"]["restaurant"]["orderStatus"]["orderCanceled"]}',
              style: txt.headline3,
            )
          ],
        ),
      ),
    );
  }

  Card orderDeliverdComponent(TextTheme txt) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '${lang.strings["customer"]["restaurant"]["orderStatus"]["orderDeliverd"]}',
              style: txt.headline3,
            )
          ],
        ),
      ),
    );
  }

  Widget alertDialogContent() {
    if (!_clickedCancel.value) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              '${lang.strings["customer"]["restaurant"]["checkout"]["cancelOrderConfirm"]}'),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
              onPressed: () async {
                _clickedCancel.value = true;
                // to get back to the main view.
                ServerResponse resp =
                    await laundryController.cancelOrder(widget.order.orderId);
                mezDbgPrint(resp.data.toString());
                if (resp.success) {
                  Get.until((route) => route.settings.name == kHomeRoute);
                  MezSnackbar(
                      lang.strings["shared"]["snackbars"]["titleSuccess"],
                      lang.strings["shared"]["snackbars"]["orderCancelSuccess"],
                      position: SnackPosition.TOP);
                } else {
                  _clickedCancel.value = false;
                  MezSnackbar(
                      lang.strings["shared"]["snackbars"]["titleFailed"],
                      lang.strings["shared"]["snackbars"]["orderCancelFailed"],
                      position: SnackPosition.TOP);
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.all(12)),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(lang.strings["customer"]["restaurant"]
                      ["cancelOrderDialog"]["yes"]))),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black, padding: EdgeInsets.all(12)),
              child: Container(
                  alignment: Alignment.center,
                  child: Text(lang.strings["customer"]["restaurant"]
                      ["cancelOrderDialog"]["no"]))),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: CircularProgressIndicator(
            strokeWidth: 1.2,
            color: Colors.purpleAccent.shade700,
          ))
        ],
      );
    }
  }
}
