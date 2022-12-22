import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOperator.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_operator/hsDeliveryOperator.dart';

class DeliveryOperatorAuthController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();
  final HasuraDb _hasuraDb = Get.find<HasuraDb>();
  StreamController<DeliveryOperator?> _operatorStreamController =
      StreamController<DeliveryOperator?>.broadcast();
  Stream<DeliveryOperator?> get operatorStream =>
      _operatorStreamController.stream;
  DeliveryOperator? deliveryOperator;

  String? deliveryOperatorStreamId;
  StreamSubscription? deliveryOpListener;

  @override
  void onInit() {
    get_delivery_operator(userId: _authController.hasuraUserId!)
        .then((DeliveryOperator? op) {
      if (op == null) {
        _startOperatorAuthListener();
      } else {
        deliveryOperator = op;
      }
    });
    super.onInit();
  }

  void _startOperatorAuthListener() {
    _hasuraDb.createSubscription(start: () {
      deliveryOpListener = listen_on_delivery_operator(
              userId: Get.find<AuthController>().user!.hasuraId)
          .listen((DeliveryOperator? event) {
        _operatorStreamController.add(event);
        deliveryOperator = event;
      });
    }, cancel: () {
      if (deliveryOperatorStreamId != null)
        _hasuraDb.cancelSubscription(deliveryOperatorStreamId!);
      deliveryOpListener?.cancel();
      deliveryOpListener = null;
    });
  }

  @override
  void onClose() {
    _operatorStreamController.close();
    if (deliveryOperatorStreamId != null)
      _hasuraDb.cancelSubscription(deliveryOperatorStreamId!);
    deliveryOpListener?.cancel();
    deliveryOpListener = null;
    super.onClose();
  }
}
