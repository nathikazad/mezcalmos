// ignore_for_file: constant_identifier_names

import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/TaxiDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

enum TaxiOrdersStatus {
  LookingForTaxiScheduled,
  Scheduled,
  LookingForTaxi,
  InTransit,
  OnTheWay,
  DroppedOff,
  CancelledByCustomer,
  CancelledByTaxi,
  Expired,
  ForwardingToLocalCompany,
  ForwardingSuccessful,
  ForwardingUnsuccessful
}

extension ParseOrderStatusToString on TaxiOrdersStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }

  String getPastOrdersFormattedStatus() {
    switch (this) {
      case TaxiOrdersStatus.CancelledByCustomer:
        return "Cancelled by customer";
      case TaxiOrdersStatus.CancelledByTaxi:
        return "Cancelled by you";
      case TaxiOrdersStatus.DroppedOff:
        return "Dropped off";
      default:
        return "unknown";
    }
  }
}

extension ParseStringToOrderStatus on String {
  TaxiOrdersStatus toTaxiOrderStatus() {
    return TaxiOrdersStatus.values.firstWhere((TaxiOrdersStatus e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class TaxiNotificationStatus {
  bool sent = true;
  num sentCount = 1;
  bool read = false;
  bool received = false;
  String uid;
  TaxiNotificationStatus({
    required this.sent,
    required this.sentCount,
    required this.read,
    required this.received,
    required this.uid,
  });
}

class TaxiOrder extends Order {
  MezLocation from;
  String? acceptRideTime;
  String? rideFinishTime;
  String? rideStartTime;
  DateTime? scheduledTime;
  TaxiOrdersStatus status;
  double distanceToClient = 0;
  TaxiUserInfo? get driver => serviceProvider as TaxiUserInfo?;
  List<TaxiNotificationStatus> notificationStatuses = [];
  List<CounterOffer> _counterOffers = [];

  List<CounterOffer> getValidCounterOfferts() {
    List<CounterOffer> s = _counterOffers.where((CounterOffer offer) {
      mezDbgPrint(
          "getValidCounterOfferts ==> validityTimeDifference:${offer.validityTimeDifference()} - valid:${offer.isValid}");
      return offer.validityTimeDifference() < 0 && offer.isValid;
    }).toList();

    mezDbgPrint("Ls ==> ${s.length}");
    return s;
  }

  TaxiOrder({
    required int orderId,
    required this.from,
    required MezLocation to,
    required DateTime orderTime,
    required cModels.PaymentType paymentType,
    required RouteInformation routeInformation,
    TaxiUserInfo? driver,
    required this.acceptRideTime,
    required this.rideFinishTime,
    required this.rideStartTime,
    required OrderCosts costs,
    this.scheduledTime,
    required this.status,
    required UserInfo customer,
    required super.chatId,
  }) : super(
            orderTime: orderTime,
            deliveryProviderType: cModels.ServiceProviderType.DeliveryCompany,
            orderId: orderId,
            paymentType: paymentType,
            orderType: cModels.OrderType.Taxi,
            costs: costs,
            customer: customer,
            serviceProvider: driver as UserInfo,
            dropOffLocation: to,
            routeInformation: routeInformation);
  // Get props as list.
  List<Object> get props => [
        orderId,
        from,
        dropOffLocation,
        orderTime,
        paymentType,
        routeInformation!
      ];

  /// Convert [TaxiOrder] object to [TaxiRequest] object.
  TaxiRequest toTaxiRequest() {
    return TaxiRequest(
        from: from,
        to: dropOffLocation,
        routeInformation: routeInformation,
        estimatedPrice: costs.orderItemsCost!.round(),
        paymentType: paymentType);
  }

  factory TaxiOrder.fromData(id, data) {
    // mezDbgPrint("TAXI ORDER ------>>>>>>>>>>>>>>>>>>>> $data");
    // mezDbgPrint("TAXI ID ------>>>>>>>>>>>>>>>>>>>> $id");
    final TaxiOrder taxiOrder = TaxiOrder(
        orderId: id,
        chatId: 1,
        driver: (data["driver"] != null)
            ? TaxiUserInfo.fromData(data["driver"])
            : null,
        // customer: UserInfo.fromData(data["customer"]),
        // TODO:544D-HASURA

        customer: UserInfo(
            hasuraId: 1, firebaseId: "firebaseId", name: null, image: null),
        rideFinishTime: data['rideFinishTime'],
        rideStartTime: data['rideStartTime'],
        status: data['status'].toString().toTaxiOrderStatus(),
        acceptRideTime: data['acceptRideTime'],
        scheduledTime: data['scheduledTime'] == null
            ? null
            : DateTime.parse(data['scheduledTime']).toLocal(),
        costs: data['costs'] ?? 35,
        // from: Location("", LocationData.fromMap({"lat":})),
        from: MezLocation.fromFirebaseData(data['from']),
        to: MezLocation.fromFirebaseData(data['to']),
        orderTime: DateTime.parse(data["orderTime"]),
        paymentType: data["paymentType"].toString().toPaymentType(),
        routeInformation: RouteInformation(
            polyline: data['routeInformation']['polyline'],
            distance:
                RideDistance.fromJson(data['routeInformation']['distance']),
            duration:
                RideDuration.fromJson(data['routeInformation']['duration'])));

    // mezDbgPrint(itemData.toString());

    data["notificationStatus"]?.forEach((uid, notificationStatus) {
      final dynamic recievedIsBool =
          notificationStatus["received"].runtimeType == bool;
      final bool isRecieved =
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

    data["counterOffers"]?.forEach((driverId, counterOfferData) {
      try {
        final CounterOffer _tmpCountOffer = CounterOffer.fromData(
          counterOfferData,
          taxiUserInfo:
              // TODO:544D-HASURA

              UserInfo(
                  hasuraId: 1,
                  firebaseId: "firebaseId",
                  name: null,
                  image: null),
          // UserInfo.fromData(counterOfferData["driverInfo"]),
        );

        if (_tmpCountOffer.validityTimeDifference() < 0 &&
            _tmpCountOffer.isValid) {
          mezDbgPrint("Valid CounterOffer ===> $counterOfferData");

          taxiOrder._counterOffers.add(_tmpCountOffer);
        }
      } on NoSuchMethodError catch (_) {
        // DO NOTHING
        mezDbgPrint(
            "#s#a#a#d --[data['counterOffers']]--  exception ==> \n $_!!");
      }
    });

    return taxiOrder;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "estimatedPrice": costs,
        "from": from,
        "status": status,
        "to": dropOffLocation,
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
        status == TaxiOrdersStatus.ForwardingUnsuccessful ||
        status == TaxiOrdersStatus.Expired;
  }

  bool isPastOrder() {
    return isCanceled() || status == TaxiOrdersStatus.DroppedOff;
  }

  @override
  bool inProcess() {
    return status == TaxiOrdersStatus.InTransit ||
        status == TaxiOrdersStatus.LookingForTaxi ||
        status == TaxiOrdersStatus.ForwardingToLocalCompany ||
        status == TaxiOrdersStatus.DroppedOff ||
        status == TaxiOrdersStatus.OnTheWay;
  }

  bool isOpenOrder() {
    switch (status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return true;

      default:
        return false;
    }
  }

  bool isForwarded() {
    switch (status) {
      case TaxiOrdersStatus.ForwardingSuccessful:
      case TaxiOrdersStatus.ForwardingToLocalCompany:
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        return true;

      default:
        return false;
    }
  }

  num numberOfTaxiSentNotificationTo() {
    return notificationStatuses.length;
  }

  int numberOfTaxiReadNotification() {
    return notificationStatuses.fold<int>(0,
        (int previousValue, TaxiNotificationStatus element) {
      return (element.read ? 1 : 0) + previousValue;
    });
  }

  // List<CounterOffer> getValidCounterOffers() {
  //   return this
  //       ._counterOffers
  //       .where((counterOffer) =>
  //           counterOffer.counterOfferStatus == CounterOfferStatus.Submitted)
  //       .toList();
  // }

  CounterOffer? findCounterOfferByDriverId(String driverId) {
    try {
      return _counterOffers.firstWhere((CounterOffer counterOffer) =>
          counterOffer.driverInfo.hasuraId.toString() == driverId);
    } catch (e) {
      return null;
    }
  }
}
