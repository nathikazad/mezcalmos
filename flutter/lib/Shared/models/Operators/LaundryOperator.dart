import 'package:mezcalmos/Shared/models/User.dart';

class LaundryOperatorState {
  final String? laundryId;
  const LaundryOperatorState({
    required this.laundryId,
  });

  factory LaundryOperatorState.fromSnapshot(data) {
    final String laundryId = data['laundryId'] ?? null;
    return LaundryOperatorState(laundryId: laundryId);
  }

  Map<String, dynamic> toJson() =>
      {
        "laundryId": laundryId,
      };
}

// used by delivery admin app
class LaundryOperator {
  final LaundryOperatorState state;
  final UserInfo info;
  final String operatorId;

  const LaundryOperator({
    required this.state,
    required this.info,
    required this.operatorId,
  });

  factory LaundryOperator.fromData(
      String laundryOperatorId, laundryOperatorData) {
    final LaundryOperatorState laundryOperatorState =
        LaundryOperatorState.fromSnapshot(laundryOperatorData['state']);
    final UserInfo laundryOperatorInfo =
        UserInfo.fromData(laundryOperatorData['info']);
    
    return LaundryOperator(
      operatorId: laundryOperatorId,
      state: laundryOperatorState,
      info: laundryOperatorInfo,
    );
  }

  Map<String, dynamic> toJson() => {
        "operatorId": operatorId,
        "state": state,
        "info": info,
      };
}
