import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

class OperatorState {
  final int? serviceProviderId;
  final int? serviceProviderDetailsId;
  final int? deliveryDetailsId;
  final int? serviceLinkId;
  final AgentStatus operatorState;
  final bool owner;
  const OperatorState(
      {required this.serviceProviderId,
      required this.operatorState,
      required this.deliveryDetailsId,
      required this.serviceLinkId,
      required this.serviceProviderDetailsId,
      required this.owner});

  factory OperatorState.fromSnapshot(data) {
    final int restaurantId = data['restaurantId'] ?? null;
    return OperatorState(
        serviceProviderId: restaurantId,
        serviceLinkId: null,
        serviceProviderDetailsId: null,
        deliveryDetailsId: null,
        owner: false,
        operatorState: AgentStatus.AwaitingApproval);
  }

  Map<String, dynamic> toJson() => {
        "restaurantId": serviceProviderId,
        "operatorStat": operatorState.toFirebaseFormatString(),
      };
}

// used by delivery admin app
class Operator {
  final OperatorState state;
  final UserInfo info;
  final int operatorId;

  const Operator({
    required this.state,
    required this.info,
    required this.operatorId,
  });

  factory Operator.fromData(int restaurantOperatorId, restaurantOperatorData) {
    final OperatorState restaurantOperatorState =
        OperatorState.fromSnapshot(restaurantOperatorData['state']);

    // TODO:544D-HASURA

    final UserInfo restaurantOperatorInfo =
        UserInfo(hasuraId: 1, firebaseId: "IDTEST", image: null, name: null);

    // final UserInfo restaurantOperatorInfo =
    // UserInfo.fromData(restaurantOperatorData['info']);

    return Operator(
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
    return state.operatorState == AgentStatus.Authorized;
  }

  bool get isWaitingToBeApprovedByOwner {
    return state.operatorState == AgentStatus.AwaitingApproval &&
        state.owner == false;
  }
}
// ignore_for_file: constant_identifier_names

enum OperatorType { Laundry, Restaurant, Delivery }

extension ParseOrderTypeToString on OperatorType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  OperatorType toOperatorType() {
    return OperatorType.values.firstWhere(
        (OperatorType e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}
