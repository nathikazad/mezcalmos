import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiRequest {
  MezLocation from;
  MezLocation to;
  Route? routeInformation;
  num estimatedPrice;
  PaymentType paymentType;
  DateTime? scheduledTime;
  List<int>? selectedCompanies;
  DateTime? time;
  int numbOfSeats;
  TaxiCarType carType;
  TaxiRequest({
    required this.from,
    required this.to,
    required this.routeInformation,
    this.numbOfSeats = 1,
    this.selectedCompanies,
    this.estimatedPrice = 40,
    this.paymentType = PaymentType.Cash,
    this.carType = TaxiCarType.Mini,
    this.time,
  });

  void setEstimatedPrice(int price) {
    estimatedPrice = price;
  }

  // void incrementPrice() {
  //   estimatedPrice += 5;
  // }

  // void decrementPrice() {
  //   if (estimatedPrice > 35) {
  //     estimatedPrice -= 5;
  //   }
  // }

  void setFromLocation(MezLocation loc) {
    from = loc;
  }

  void setToLocation(MezLocation loc) {
    to = loc;
  }

  void setScheduledTime(DateTime scheduledTime) {
    this.scheduledTime = scheduledTime;
  }

  void setRouteInformation(Route routeInformation) {
    this.routeInformation = routeInformation;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return <String, dynamic>{
      "from": from.toFirebaseFormattedJson(),
      "to": to.toFirebaseFormattedJson(),
      "estimatedPrice": estimatedPrice,
      "paymentType": paymentType.toFirebaseFormatString(),
      "scheduledTime": scheduledTime?.toUtc().toString()
    };
  }
}
