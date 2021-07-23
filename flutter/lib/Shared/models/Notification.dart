class Notification {
  String id;
  String notificationType;
  dynamic variableParams;

  Notification(
      {required this.id,
      required this.notificationType,
      required this.variableParams});

  // Get props as list.
  List<Object> get props => [id, notificationType, variableParams];

  // Empty Order Constructor!
  // Notification.empty({id = "id"});

  Notification.fromJson(dynamic key, dynamic value)
      : id = key,
        notificationType = value['notificationType'],
        variableParams = value;

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "id": id,
        "notificationType": notificationType,
        "variableParams": variableParams,
      };
}
