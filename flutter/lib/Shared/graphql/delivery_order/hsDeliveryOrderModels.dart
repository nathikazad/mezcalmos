import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class CustDeliveryOffersListVariables {
  Map<int, CounterOffer>? offers;
  Map<int, bool>? notifiedDrivers;
  double? customerOffer;

  CustDeliveryOffersListVariables({
    required this.offers,
    required this.notifiedDrivers,
    required this.customerOffer,
  });
}
