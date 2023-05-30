import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class BusinessOpUnauthViewController {
  // instances
  BusinessOpAuthController businessOpAuthController =
      Get.find<BusinessOpAuthController>();

  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // obs
  Rxn<AuthorizationStatus> _status = Rxn();
  bool get hasStatus => _status.value != null;

  // stream sub
  StreamSubscription<AgentStatus>? statusStream;
  String? subscriptionId;

  Future<void> init() async {
    await businessOpAuthController.setupBusinessOperator();
    _status.value = businessOpAuthController.operator.value?.status;
    if (_status.value != null &&
        _status.value! == AgentStatus.AwaitingApproval) {
      _startListeningOnSatus();
    }
  }

  void _startListeningOnSatus() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      statusStream = listen_operator_status(
              operatorId: businessOpAuthController.operatorUserId)
          .listen((AgentStatus event) {
        mezDbgPrint(
            "Stream triggred from unauthorized view controller ✅✅=>$event");
        _status.value = event.toAuthorizationStatus();
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
      await businessOpAuthController.setupBusinessOperator();
      // ignore: inference_failure_on_function_invocation, unawaited_futures
      // MezRouter.offAndToNamed(kLaundryTabsView);
      // ignore: unawaited_futures
      MezRouter.popEverythingTillBeforeHome()
          .then((_) => MezRouter.toNamed(BusinessOpRoutes.kBusniessOpTabsView));
    }
  }

  void dispose() {
    mezDbgPrint("Called Dispose 🫡");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _status.close();
  }
}
