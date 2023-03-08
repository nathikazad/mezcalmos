import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

class UnautthDriverViewController {
  // instances
  DeliveryAuthController dvAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // obs
  Rxn<AgentStatus> _status = Rxn();
  AgentStatus? get status => _status.value;

  // stream sub
  StreamSubscription<AgentStatus>? statusStream;
  String? subscriptionId;

  Future<void> init() async {
    await dvAuthController.setupDeliveryDriver();
    _status.value = dvAuthController.driver?.deliveryDriverState.status;
    if (_status.value! == AgentStatus.AwaitingApproval) {
      _startListeningOnSatus();
    }
  }

  void _startListeningOnSatus() {
    mezDbgPrint(
        "Start listening on stream from unauth view 😡😡😡😡 ${dvAuthController.driver!.driverInfo.hasuraId}");
    subscriptionId = hasuraDb.createSubscription(start: () {
      statusStream = listen_driver_status(
              driverId: dvAuthController.driver!.driverInfo.hasuraId)
          .listen((AgentStatus event) {
        mezDbgPrint(
            "Stream triggred from unauthorized view controller ✅✅=>$event");
        _status.value = event;
        _handleStatusChange();
      });
      statusStream?.onError((e, stk) {
        //  MezRouter.offAndToNamed(kHomeRoute);
      });
    }, cancel: () {
      statusStream?.cancel();
      statusStream = null;
    });
  }

  Future<void> _handleStatusChange() async {
    if (_status.value == AgentStatus.Authorized) {
      await dvAuthController.setupDeliveryDriver();
      // ignore: inference_failure_on_function_invocation, unawaited_futures
      MezRouter.offAndToNamed(DeliveryAppRoutes.kCurrentOrdersListRoute);
    }
  }

  void dispose() {
    mezDbgPrint("Called Dispose 🫡");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _status.close();
  }
}
