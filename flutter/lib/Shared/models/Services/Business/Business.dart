import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class MinimalBusiness {
  int id;
  int detailsId;
  String name;
  String image;
  Map<PaymentType, bool> acceptedPayments;
  double? avgRating;
  int? reviewCount;

  MinimalBusiness(
      {required this.id,
      required this.detailsId,
      required this.name,
      required this.image,
      required this.acceptedPayments,
      this.avgRating,
      this.reviewCount});
}

Map<TimeUnit, num> constructBusinessServiceCost(cost) {
  mezDbgPrint("log constructBusinessServiceCost $cost");
  final Map<TimeUnit, num> _cost = {};

  cost?.forEach((String key, data) {
    _cost[key.toTimeUnit()] = data;
  });
  return _cost;
}

class RentalCard extends Rental {
  final String businessName;
  RentalCard({
    required Rental rental,
    required this.businessName,
  }) : super(
          category1: rental.category1,
          details: rental.details,
          bathrooms: rental.bathrooms,
          bedrooms: rental.bedrooms,
          homeType: rental.homeType,
          gpsLocation: rental.gpsLocation,
        );
}

class EventCard extends Event {
  final String businessName;
  EventCard({
    required Event event,
    required this.businessName,
  }) : super(
          scheduleType: event.scheduleType,
          category1: event.category1,
          details: event.details,
        );
}

class RentalWithBusinessCard extends Rental {
  final BusinessCardView business;
  RentalWithBusinessCard({
    required Rental rental,
    required this.business,
  }) : super(
          category1: rental.category1,
          details: rental.details,
          bathrooms: rental.bathrooms,
          bedrooms: rental.bedrooms,
          homeType: rental.homeType,
          gpsLocation: rental.gpsLocation,
        );
}

class EventWithBusinessCard extends Event {
  final BusinessCardView business;
  EventWithBusinessCard({
    required Event event,
    required this.business,
  }) : super(
          scheduleType: event.scheduleType,
          category1: event.category1,
          details: event.details,
        );
}
