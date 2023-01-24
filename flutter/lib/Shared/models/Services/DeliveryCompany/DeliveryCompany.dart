import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class DeliveryCompany extends Service {
  DeliveryCompany({
    required super.info,
    required super.state,
    required super.primaryLanguage,
  });

  DeliveryCompany copyWith({
    ServiceInfo? userInfo,
    ServiceState? state,
    LanguageType? primaryLanguage,
  }) {
    return DeliveryCompany(
        info: userInfo ?? info,
        state: state ?? this.state,
        primaryLanguage: primaryLanguage ?? this.primaryLanguage);
  }
}
