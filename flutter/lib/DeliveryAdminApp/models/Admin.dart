class Admin {
  bool authorized = false;
  dynamic notificationInfo;
  dynamic data;
  Admin.fromSnapshot(dynamic data) {
    this.data = data;
    this.authorized = data["authorized"];
    this.notificationInfo = data["notificationInfo"];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "authorized": this.authorized,
      "notificationInfo": this.notificationInfo
    };
  }
}
