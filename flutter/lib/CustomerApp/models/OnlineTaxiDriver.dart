class OnlineTaxiDriver {
  String taxiId;
  dynamic position;
  bool isOnline;
  bool isInOrder;
  dynamic lastUpdateTime;

  OnlineTaxiDriver(
      {required this.taxiId,
      required this.position,
      required this.isOnline,
      required this.isInOrder,
      required this.lastUpdateTime});

  factory OnlineTaxiDriver.fromData(
      {required String taxiId, required dynamic data}) {
    return OnlineTaxiDriver(
        taxiId: taxiId,
        position: data['position'],
        isOnline: data['isOnline'] ?? false,
        isInOrder: data['isInOrder'] ?? false,
        lastUpdateTime: data['lastUpdateTime']);
  }

  Map toJson() => {
        "taxiId": taxiId,
        "position": position,
        "isOnline": isOnline,
        "isInOrder": isInOrder,
        "lastUpdateTime": lastUpdateTime
      };
}
