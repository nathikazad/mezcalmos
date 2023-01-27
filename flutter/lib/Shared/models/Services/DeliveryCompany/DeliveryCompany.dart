import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class DeliveryCompany extends Service {
  int? deliveryDetailsId;
  DeliveryCompany(
      {this.deliveryDetailsId,
      required super.info,
      required super.state,
      required super.primaryLanguage,
      // required this.deliveryRaidus,
      required this.creationTime});
  // int deliveryRaidus;
  DateTime creationTime;

  DeliveryCompany copyWith({
    ServiceInfo? userInfo,
    ServiceState? state,
    LanguageType? primaryLanguage,
  }) {
    return DeliveryCompany(
        info: userInfo ?? info,
        state: state ?? this.state,
        // deliveryRaidus: deliveryRaidus,
        creationTime: creationTime,
        primaryLanguage: primaryLanguage ?? this.primaryLanguage);
  }
}
