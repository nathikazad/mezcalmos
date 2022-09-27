import 'package:mezcalmos/Shared/models/User.dart';

class RestaurantOperatorState {
  final String? restaurantId;
  const RestaurantOperatorState({
    required this.restaurantId,
  });

  factory RestaurantOperatorState.fromSnapshot(data) {
    final String restaurantId = data['restaurantId'] ?? null;
    return RestaurantOperatorState(restaurantId: restaurantId);
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
    final UserInfo restaurantOperatorInfo =
        UserInfo.fromData(restaurantOperatorData['info']);

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
