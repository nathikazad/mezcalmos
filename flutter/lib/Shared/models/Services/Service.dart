import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

abstract class Service {
  ServiceInfo info;
  int serviceDetailsId;
  Schedule? schedule;
  String? phoneNumber;
  int? serviceLinkId;
  ServiceProviderType? serviceProviderType;
  ServiceState state;
  Map<LanguageType, bool> languages;

  PaymentInfo? paymentInfo;

  Service(
      {required this.info,
      required this.serviceDetailsId,
      this.schedule,
      this.phoneNumber,
      this.serviceLinkId,
      this.serviceProviderType,
      required this.state,
      required this.languages,
      this.paymentInfo});

  LanguageType get primaryLanguage => languages.entries
      .firstWhere(
          (MapEntry<LanguageType, bool> element) => element.value == true)
      .key;
  LanguageType get secondaryLanguage => primaryLanguage.toOpLang();
}

class ServiceState {
  ServiceStatus status = ServiceStatus.Closed_indefinitely;
  // bool available = false;
  bool approved = false;
  ServiceState(this.status, this.approved);

  factory ServiceState.fromServiceStateData(stateData) {
    final List<String> ops = [];
    final List<String> dvs = [];

    stateData?["operators"]?.forEach((key, val) {
      if (val == true) {
        ops.add(key);
      }
    });
    stateData?["drivers"]?.forEach((key, val) {
      if (val == true) {
        dvs.add(key);
      }
    });
    return ServiceState(
      stateData?["status"]?.toString().toServiceStatus() ??
          ServiceStatus.Closed_temporarily,
      stateData?["approved"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status.toFirebaseFormatString(),
        "approved": approved,
      };

  bool get isAuthorized => approved;
  bool get available => approved && status == ServiceStatus.Open;
  bool get isOpen => status == ServiceStatus.Open;
}

class MainService extends Service {
  MainService({
    required super.info,
    required super.serviceDetailsId,
    required super.state,
    required super.languages,
    required super.paymentInfo,
    required super.schedule,
    required super.phoneNumber,
    required super.serviceLinkId,
    required super.serviceProviderType,
  });
}
