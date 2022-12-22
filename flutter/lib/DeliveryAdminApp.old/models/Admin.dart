class Admin {
  bool authorized = true;
  String? appVersion;
  dynamic notificationInfo;
  dynamic data;

  Admin({required this.notificationInfo, this.appVersion});
  Admin.fromSnapshot(dynamic data) {
    this.data = data;
    if (data != null) {
      this.authorized = data["authorized"] ?? false;
      this.notificationInfo = data["notificationInfo"];
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "authorized": this.authorized,
      "notificationInfo": this.notificationInfo
    };
  }
}
