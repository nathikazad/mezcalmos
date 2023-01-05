class NotificationInfo {
  int? id;
  int userId;
  String appType;
  String token;
  NotificationInfo({
    this.id,
    required this.userId,
    required this.appType,
    required this.token,
  });
}
