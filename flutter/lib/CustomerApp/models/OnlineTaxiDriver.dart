class OnlineTaxiDriver {
  String taxiId;
  dynamic latLng;
  bool isOnline;
  bool isInOrder;
  dynamic lastUpdateTime;

  OnlineTaxiDriver(
      {required this.taxiId,
      required this.latLng,
      required this.isOnline,
      required this.isInOrder,
      required this.lastUpdateTime});

  factory OnlineTaxiDriver.fromData(
      {required String taxiId, required dynamic data}) {
    return OnlineTaxiDriver(
        taxiId: taxiId,
        latLng: data['location'],
        isOnline: data['isOnline'],
        isInOrder: data['isInOrder'],
        lastUpdateTime: data['lastUpdateTime']);
  }
}
