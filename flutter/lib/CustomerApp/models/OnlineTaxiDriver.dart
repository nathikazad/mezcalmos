class OnlineTaxiDriver {
  String taxiId;
  dynamic position;
  bool online;
  bool inOrder;
  DateTime lastUpdateTime;

  OnlineTaxiDriver(
      {required this.taxiId,
      required this.position,
      required this.online,
      required this.inOrder,
      required this.lastUpdateTime});

  factory OnlineTaxiDriver.fromData(
      {required String taxiId, required dynamic data}) {
    return OnlineTaxiDriver(
        taxiId: taxiId,
        position: data['position'],
        online: data['online'] ?? false,
        inOrder: data['inOrder'] ?? false,
        lastUpdateTime: DateTime.parse(data['lastUpdateTime']));
  }

  bool isDriverAvailable() {
    return online &&
        !inOrder &&
        lastUpdateTime.difference(DateTime.now()).inMinutes < 5;
  }

  Map toJson() => {
        "taxiId": taxiId,
        "position": position,
        "isOnline": online,
        "isInOrder": inOrder,
        "lastUpdateTime": lastUpdateTime
      };
}
