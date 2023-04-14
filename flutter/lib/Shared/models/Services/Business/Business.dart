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
