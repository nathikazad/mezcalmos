class Admin {
  bool authorized = false;
  dynamic notificationInfo;
  dynamic data;
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
