import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

enum AgentStatus { AwaitingApproval, Authorized, Banned }

extension ParseAgentStatusToString on AgentStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  AuthorizationStatus toAuthorizationStatus() {
    switch (this) {
      case AgentStatus.AwaitingApproval:
        return AuthorizationStatus.AwaitingApproval;
      case AgentStatus.Authorized:
        return AuthorizationStatus.Authorized;
      case AgentStatus.Banned:
        return AuthorizationStatus.Unauthorized;
      default:
        return AuthorizationStatus.Unauthorized;
    }
  }
}

extension ParseStringToAgentStatus on String {
  AgentStatus toAgentStatus() {
    return AgentStatus.values
        .firstWhere((AgentStatus e) => e.toFirebaseFormatString() == this);
  }
}
