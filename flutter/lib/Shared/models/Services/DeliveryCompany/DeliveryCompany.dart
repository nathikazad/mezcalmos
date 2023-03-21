import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class DeliveryCompany extends Service {
  int? deliveryDetailsId;
  bool showReviews;
  num? rate;
  List<Review> reviews;
  DeliveryCompany(
      {this.deliveryDetailsId,
      required super.info,
      required super.state,
      required super.serviceDetailsId,
      required super.languages,
      required super.schedule,
      required this.showReviews,
      required this.reviews,
      this.rate,
      // required this.deliveryRaidus,
      required this.creationTime});
  // int deliveryRaidus;
  DateTime creationTime;

  DeliveryCompany copyWith({
    ServiceInfo? userInfo,
    ServiceState? state,
    Map<LanguageType, bool>? languages,
  }) {
    return DeliveryCompany(
        info: userInfo ?? info,
        schedule: schedule,
        state: state ?? this.state,
        serviceDetailsId: serviceDetailsId,
        // deliveryRaidus: deliveryRaidus,
        creationTime: creationTime,
        languages: languages ?? this.languages,
        showReviews: showReviews,
        reviews: reviews);
  }

  bool isOpen() {
    return state.isOpen && (schedule?.isOpen() ?? true);
  }
}
