import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class LaundryUnauthViewController {
  // instances
  LaundryOpAuthController laundryOpAuthController =
      Get.find<LaundryOpAuthController>();

  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // obs
  Rxn<AgentStatus> _status = Rxn();
  bool get hasStatus => _status.value != null;

  // stream sub
  StreamSubscription<AgentStatus>? statusStream;
  String? subscriptionId;

  Future<void> init() async {
    await laundryOpAuthController.setupLaundryOperator();
    _status.value = laundryOpAuthController.operator.value?.state.operatorState;
    if (_status.value != null &&
        _status.value! == AgentStatus.AwaitingApproval) {
      _startListeningOnSatus();
    }
  }

  void _startListeningOnSatus() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      statusStream = listen_operator_status(
              operatorId: laundryOpAuthController.operatorUserId)
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
      await laundryOpAuthController.setupLaundryOperator();
      // ignore: inference_failure_on_function_invocation, unawaited_futures
      // MezRouter.offAndToNamed(kLaundryTabsView);
      // ignore: unawaited_futures
      MezRouter.popEverythingTillBeforeHome().then(
          (_) => MezRouter.toNamed(LaundryAppRoutes.kLaundryTabsViewRoute));
    }
  }

  void dispose() {
    mezDbgPrint("Called Dispose 🫡");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _status.close();
  }
}
