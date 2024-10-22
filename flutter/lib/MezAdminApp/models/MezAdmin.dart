// import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
// import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class MezAdmin {
  bool authorized = true;
  String? name;
  String? img;
  String? appVersion;
  NotificationInfo? notificationInfo;
  dynamic data;

  MezAdmin({required this.notificationInfo, this.appVersion});
  MezAdmin.fromSnapshot(dynamic data) {
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
