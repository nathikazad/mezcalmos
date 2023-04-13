import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class DeliveryCompany extends Service {
  int? deliveryDetailsId;

  DeliveryCompany(
      {this.deliveryDetailsId,
      super.rate,
      super.reviews,
      super.phoneNumber,
      super.numberOfReviews,
      required super.info,
      required super.state,
      required super.serviceDetailsId,
      required super.languages,
      required super.schedule,
      required super.deliveryCost,

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
      deliveryCost: deliveryCost,
      state: state ?? this.state,
      serviceDetailsId: serviceDetailsId,
      // deliveryRaidus: deliveryRaidus,
      creationTime: creationTime,
      languages: languages ?? this.languages,
    );
  }


}
