import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

enum TaxiOrdersStatus {
  DroppedOff,
  CancelledByCustomer,
  CancelledByTaxi,
  Expired,
  OnTheWay,
  InTransit,
  LookingForTaxi
}

extension ParseOrderStatusToString on TaxiOrdersStatus {
  String toFirebaseFormatString() {
    return this.toString().split('.').last;
  }
}

extension ParseStringToOrderStatus on String {
  TaxiOrdersStatus toTaxiOrderStatus() {
    return TaxiOrdersStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this.toLowerCase());
  }
}

class RouteInformation {
  String polyline;
  RideDistance distance;
  RideDuration duration;
  RouteInformation(
      {required this.polyline, required this.distance, required this.duration});

  Map<String, dynamic> toJson() {
    return {...distance.toJson(), ...duration.toJson(), "polyline": polyline};
  }
}

class TaxiNotificationStatus {
  bool sent = true;
  num sentCount = 1;
  bool read = false;
  bool received = false;
  String uid;
  TaxiNotificationStatus(
      {required this.sent,
      required this.sentCount,
      required this.read,
      required this.received,
      required this.uid});
}

class TaxiOrder extends Order {
  Location from;
  RouteInformation routeInformation;
  String? acceptRideTime;
  String? rideFinishTime;
  String? rideStartTime;
  TaxiOrdersStatus status;
  double distanceToClient = 0;
  TaxiUserInfo? get driver => this.serviceProvider as TaxiUserInfo?;
  List<TaxiNotificationStatus> notificationStatuses = [];
  TaxiOrder(
      {required String orderId,
      required num cost,
      required this.from,
      required Location to,
      required DateTime orderTime,
      required PaymentType paymentType,
      required this.routeInformation,
      TaxiUserInfo? driver,
      required this.acceptRideTime,
      required this.rideFinishTime,
      required this.rideStartTime,
      required this.status,
      required UserInfo customer,
      dynamic cancelledBy})
      : super(
            orderTime: orderTime,
            orderId: orderId,
            paymentType: paymentType,
            orderType: OrderType.Taxi,
            cost: cost,
            customer: customer,
            serviceProvider: driver,
            to: to);
  // Get props as list.
  List<Object> get props =>
      [orderId, from, to, orderTime, paymentType, routeInformation];

  /// Convert [TaxiOrder] object to [TaxiRequest] object.
  TaxiRequest toTaxiRequest() {
    return TaxiRequest(
        from: this.from,
        to: this.to,
        routeInformation: this.routeInformation,
        estimatedPrice: this.cost.round(),
        paymentType: this.paymentType);
  }

  factory TaxiOrder.fromData(dynamic id, dynamic data) {
    TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        driver: (data["driver"] != null)
            ? TaxiUserInfo.fromData(data["driver"])
            : null,
        customer: UserInfo.fromData(data["customer"]),
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: data['status'].toString().toTaxiOrderStatus(),
        acceptRideTime: data['acceptRideTime'],
        cost: data['cost'],
        // from: Location("", LocationData.fromMap({"lat":})),
        from: Location.fromFirebaseData(data['from']),
        to: Location.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        routeInformation: RouteInformation(
            polyline: data['routeInformation']['polyline'],
            distance:
                RideDistance.fromJson(data['routeInformation']['distance']),
            duration:
                RideDuration.fromJson(data['routeInformation']['duration'])));

    // mezDbgPrint(itemData.toString());

    data["notificationStatus"]
        ?.forEach((dynamic uid, dynamic notificationStatus) {
      dynamic recievedIsBool =
          notificationStatus["received"].runtimeType == bool;
      bool isRecieved =
          recievedIsBool && notificationStatus["received"] == true;

      try {
        taxiOrder.notificationStatuses.add(TaxiNotificationStatus(
            sent: notificationStatus["sent"] ?? false,
            sentCount: notificationStatus["sentCount"] ?? 0,
            read: notificationStatus["read"] ?? false,
            received: isRecieved,
            uid: uid));
      } on NoSuchMethodError catch (_) {
        // DO NOTHING
      }
    });

    return taxiOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": cost,
        "from": from,
        "status": status,
        "to": to,
        "orderTime": orderTime,
        "paymentType": paymentType,
        "routeInformation": routeInformation,
        "distanceToClient": distanceToClient
      };

  @override
  bool isCanceled() {
    // all of them are in /past node
    return status == TaxiOrdersStatus.CancelledByCustomer ||
        status == TaxiOrdersStatus.CancelledByTaxi ||
        status == TaxiOrdersStatus.Expired;
  }

  @override
  bool inProcess() {
    return status == TaxiOrdersStatus.InTransit ||
        status == TaxiOrdersStatus.LookingForTaxi ||
        status == TaxiOrdersStatus.DroppedOff ||
        status == TaxiOrdersStatus.OnTheWay;
  }

  num numberOfTaxiSentNotificationTo() {
    return this.notificationStatuses.length;
  }

  int numberOfTaxiReadNotification() {
    return this.notificationStatuses.fold<int>(0, (previousValue, element) {
      return (element.read ? 1 : 0) + previousValue;
    });
  }
}

class TaxiUserInfo extends UserInfo {
  String taxiNumber;
  String? sitio;
  LatLng? location;

  TaxiUserInfo(
      {required String id,
      required String name,
      required String image,
      required this.taxiNumber,
      this.sitio,
      required this.location})
      : super(id, name, image);

  factory TaxiUserInfo.fromData(dynamic data) {
    // mezDbgPrint(" TaxiUserInfo.fromData ====> $data");
    LatLng? location = data["location"] != null
        ? LatLng(data["location"]["position"]["lat"],
            data["location"]["position"]["lng"])
        : null;
    return TaxiUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        taxiNumber: data["taxiNumber"].toString(),
        sitio: data["sitio"],
        location: location);
  }
}
