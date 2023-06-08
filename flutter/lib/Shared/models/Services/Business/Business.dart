import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BusinessCard {
  int id;
  int detailsId;
  String name;
  String image;
  Map<PaymentType, bool> acceptedPayments;
  Currency currency;
  double? avgRating;
  int? reviewCount;
  DateTime? lastActive;
  Location? location;

  BusinessCard(
      {required this.id,
      required this.detailsId,
      required this.name,
      required this.image,
      required this.acceptedPayments,
      required this.currency,
      this.avgRating,
      this.lastActive,
      this.reviewCount,
      this.location});
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
  final Currency currency;
  RentalCard({
    required Rental rental,
    required this.businessName,
    required this.currency,
  }) : super(
          category1: rental.category1,
          details: rental.details,
          bathrooms: rental.bathrooms,
          bedrooms: rental.bedrooms,
          homeType: rental.homeType,
          gpsLocation: rental.gpsLocation,
          id: rental.id,
        );
}

class EventCard extends Event {
  final String businessName;
  final Currency currency;
  EventCard({
    required Event event,
    required this.businessName,
    required this.currency,
  }) : super(
          scheduleType: event.scheduleType,
          schedule: event.schedule,
          category1: event.category1,
          details: event.details,
          startsAt: event.startsAt,
          endsAt: event.endsAt,
          tags: event.tags,
          category2: event.category2,
          gpsLocation: event.gpsLocation,
          id: event.id,
        );

  bool get isClass {
    if (tags != null) {
      return tags!.contains(EventTag.Class);
    }
    return false;
  }
}

class ProductCard extends Product {
  final String businessName;
  final Currency currency;
  ProductCard({
    required Product product,
    required this.businessName,
    required this.currency,
  }) : super(
          category1: product.category1,
          details: product.details,
          id: product.id,
        );
}

class ServiceCard extends Service {
  final String businessName;
  final Currency currency;
  ServiceCard({
    required Service service,
    required this.businessName,
    required this.currency,
  }) : super(
          category1: service.category1,
          details: service.details,
          id: service.id,
          schedule: service.schedule,
        );
}

class RentalWithBusinessCard extends Rental {
  final BusinessCard business;
  RentalWithBusinessCard({
    required Rental rental,
    required this.business,
  }) : super(
          category1: rental.category1,
          category2: rental.category2,
          category3: rental.category3,
          details: rental.details,
          bathrooms: rental.bathrooms,
          bedrooms: rental.bedrooms,
          homeType: rental.homeType,
          gpsLocation: rental.gpsLocation,
          id: rental.id,
        );
}

class EventWithBusinessCard extends Event {
  final BusinessCard business;
  EventWithBusinessCard({
    required Event event,
    required this.business,
  }) : super(
          scheduleType: event.scheduleType,
          category1: event.category1,
          details: event.details,
          schedule: event.schedule,
          tags: event.tags,
          gpsLocation: event.gpsLocation,
          category2: event.category2,
          startsAt: event.startsAt,
          endsAt: event.endsAt,
          id: event.id,
        );
}

class ProductWithBusinessCard extends Product {
  final BusinessCard business;
  ProductWithBusinessCard({
    required Product product,
    required this.business,
  }) : super(
          category1: product.category1,
          details: product.details,
          id: product.id,
        );
}

class ServiceWithBusinessCard extends Service {
  final BusinessCard business;
  ServiceWithBusinessCard({
    required Service service,
    required this.business,
  }) : super(
          category1: service.category1,
          details: service.details,
          schedule: service.schedule,
          id: service.id,
        );
}
