import 'package:mezcalmos/Shared/models/User.dart';

class RestaurantOperatorState {
  final String? restaurantId;
  final OperatorStatus operatorState;
  const RestaurantOperatorState({
    required this.restaurantId,
    required this.operatorState,
  });

  factory RestaurantOperatorState.fromSnapshot(data) {
    final String restaurantId = data['restaurantId'] ?? null;
    return RestaurantOperatorState(
        restaurantId: restaurantId,
        operatorState: OperatorStatus.Awaiting_approval);
  }

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
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
}

enum OperatorStatus { Awaiting_approval, Authorized, Banned }

extension ParseOperatorStateToString on OperatorStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToOperatorState on String {
  OperatorStatus toOperartorStatus() {
    return OperatorStatus.values.firstWhere(
        (OperatorStatus e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}
