class OnlineTaxiDriver {
  String taxiId;

  /// [name] is only for debug-staging.
  String? name;
  dynamic position;
  bool online;
  bool inOrder;
  DateTime lastUpdateTime;

  OnlineTaxiDriver(
      {required this.taxiId,
      this.name,
      required this.position,
      required this.online,
      required this.inOrder,
      required this.lastUpdateTime});

  factory OnlineTaxiDriver.fromData(
      {required String taxiId, required dynamic data}) {
    return OnlineTaxiDriver(
        taxiId: taxiId,
        name: data['name'],
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
        "name": name,
        "position": position,
        "isOnline": online,
        "isInOrder": inOrder,
        "lastUpdateTime": lastUpdateTime
      };
}
