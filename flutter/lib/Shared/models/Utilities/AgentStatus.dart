enum AgentStatus { Awaiting_approval, Authorized, Banned }

extension ParseAgentStatusToString on AgentStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAgentStatus on String {
  AgentStatus toAgentStatus() {
    return AgentStatus.values.firstWhere(
        (AgentStatus e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}
