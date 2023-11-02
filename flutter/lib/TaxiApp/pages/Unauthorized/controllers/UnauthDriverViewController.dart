import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpCurrentOrders.dart';
import 'package:mezcalmos/DeliveryApp/deliveryDeepLinkHandler.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/TaxiApp/controllers/TaxiAuthController.dart';

class UnautthDriverViewController {
  // instances
  TaxiAuthController dvAuthController = Get.find<TaxiAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // obs
  Rxn<AgentStatus> _status = Rxn();
  AgentStatus? get status => _status.value;

  // stream sub
  StreamSubscription<AgentStatus?>? statusStream;
  String? subscriptionId;

  Future<void> init() async {
    await dvAuthController.setupDeliveryDriver();
    if (dvAuthController.driverState?.status != AgentStatus.Authorized)
      unawaited(DeliveryDeepLinkHandler.showDialogAndAddDriver('serviamigos'));
    _status.value = dvAuthController.driver?.deliveryDriverState.status;
    _startListeningOnSatus();
  }

  void _startListeningOnSatus() {
    mezDbgPrint(
        "Start listening on stream from unauth view 😡😡😡😡 ${dvAuthController.driver!.driverInfo.hasuraId}");
    subscriptionId = hasuraDb.createSubscription(start: () {
      statusStream = listen_driver_status(
              driverId: dvAuthController.driver!.driverInfo.hasuraId)
          .listen((AgentStatus? event) {
        mezDbgPrint(
            "Stream triggred from unauthorized view controller ✅✅=>$event");
        if (event != null) {
          _status.value = event;
          _handleStatusChange();
        }
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
      //ignore: inference_failure_on_function_invocation, unawaited_futures
      Future.delayed(
          Duration.zero,
          () => MezRouter.popEverythingTillBeforeHome()
              .then((value) => DvOpCurrentOrdersListView()));
    }
  }

  void dispose() {
    mezDbgPrint("Called Dispose 🫡");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _status.close();
  }
}
