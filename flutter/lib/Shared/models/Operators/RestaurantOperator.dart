import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

class RestaurantOperatorState {
  final int? restaurantId;
  final AgentStatus operatorState;
  final bool owner;
  const RestaurantOperatorState(
      {required this.restaurantId,
      required this.operatorState,
      required this.owner});

  factory RestaurantOperatorState.fromSnapshot(data) {
    final int restaurantId = data['restaurantId'] ?? null;
    return RestaurantOperatorState(
        restaurantId: restaurantId,
        owner: false,
        operatorState: AgentStatus.Awaiting_approval);
  }

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "operatorStat": operatorState.toFirebaseFormatString(),
      };
}

// used by delivery admin app
class RestaurantOperator {
  final RestaurantOperatorState state;
  final UserInfo info;
  final String operatorId;

  const RestaurantOperator({
    required this.state,
    required this.info,
    required this.operatorId,
  });

  factory RestaurantOperator.fromData(
      String restaurantOperatorId, restaurantOperatorData) {
    final RestaurantOperatorState restaurantOperatorState =
        RestaurantOperatorState.fromSnapshot(restaurantOperatorData['state']);

    // TODO:544D-HASURA

    final UserInfo restaurantOperatorInfo =
        UserInfo(hasuraId: 1, firebaseId: "IDTEST", image: null, name: null);

    // final UserInfo restaurantOperatorInfo =
    // UserInfo.fromData(restaurantOperatorData['info']);

    return RestaurantOperator(
      operatorId: restaurantOperatorId,
      state: restaurantOperatorState,
      info: restaurantOperatorInfo,
    );
  }

  Map<String, dynamic> toJson() => {
        "operatorId": operatorId,
        "state": state.toJson(),
        "info": info.toFirebaseFormatJson(),
      };
  bool get isAuthorized {
    return state.operatorState == AgentStatus.Authorized &&
        state.restaurantId != null;
  }

  bool get isWaiting {
    return state.operatorState == AgentStatus.Awaiting_approval &&
        state.restaurantId != null;
  }
}
