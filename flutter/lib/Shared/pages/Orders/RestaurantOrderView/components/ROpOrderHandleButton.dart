import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/controller/RestaurantOrderViewController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView']["components"]["ROpOrderHandleButton"];

class ROpOrderHandleButton extends StatefulWidget {
  const ROpOrderHandleButton({Key? key, required this.viewController})
      : super(key: key);
  final RestaurantOrderViewController viewController;

  @override
  State<ROpOrderHandleButton> createState() => _ROpOrderHandleButtonState();
}

class _ROpOrderHandleButtonState extends State<ROpOrderHandleButton> {
  @override
  Widget build(BuildContext context) {
    if (_showBtn) {
      return Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: MezButton(
          onClick: handleClick,
          label: getBtnTitle!,
        ),
      );
    } else
      return Container();
  }

  Future<void> handleClick() async {
    if (widget.viewController.order.value!.status ==
        RestaurantOrderStatus.OrderReceived) {
      await widget.viewController.prepareOrder();
    } else if (widget.viewController.orderStatus ==
        RestaurantOrderStatus.Preparing) {
      await widget.viewController.setReadyForDelivery();
    }
  }

  String? get getBtnTitle {
    if (widget.viewController.orderStatus ==
        RestaurantOrderStatus.OrderReceived) {
      return '${_i18n()["prepareOrder"]}';
    } else if (widget.viewController.orderStatus ==
        RestaurantOrderStatus.Preparing) {
      return '${_i18n()["orderReady"]}';
    }
    return null;
  }

  bool get _showBtn {
    return widget.viewController.orderStatus ==
            RestaurantOrderStatus.OrderReceived ||
        widget.viewController.orderStatus == RestaurantOrderStatus.Preparing;
  }
}
