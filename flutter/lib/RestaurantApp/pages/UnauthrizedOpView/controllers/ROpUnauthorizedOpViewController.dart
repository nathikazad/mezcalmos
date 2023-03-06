import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

class ROpUnauthorizedOpViewController {
  // instances
  RestaurantOpAuthController restaurantOpAuthController =
      Get.find<RestaurantOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // obs
  Rxn<AgentStatus> _status = Rxn();

  // stream sub
  StreamSubscription<AgentStatus>? statusStream;
  String? subscriptionId;

  Future<void> init() async {
    await restaurantOpAuthController.setupRestaurantOperator();
    _status.value =
        restaurantOpAuthController.operator.value!.state.operatorState;
    if (_status.value! == AgentStatus.AwaitingApproval) {
      _startListeningOnSatus();
    }
  }

  void _startListeningOnSatus() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      statusStream = listen_operator_status(
              operatorId: restaurantOpAuthController.operatorUserId)
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
      await restaurantOpAuthController.setupRestaurantOperator();
      // ignore: inference_failure_on_function_invocation, unawaited_futures
      MezRouter.offAndToNamed(kTabsView);
    }
  }

  void dispose() {
    mezDbgPrint("Called Dispose 🫡");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _status.close();
  }
}
