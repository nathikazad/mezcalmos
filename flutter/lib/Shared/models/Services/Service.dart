import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

abstract class Service {
  ServiceInfo info;
  Schedule? schedule;
  ServiceState state;
  ServiceStatus? status;
  LanguageType primaryLanguage;
  LanguageType? secondaryLanguage;
  PaymentInfo paymentInfo;
  Service(
      {required this.info,
      this.schedule,
      this.status,
      required this.state,
      required this.primaryLanguage,
      this.secondaryLanguage,
      required this.paymentInfo});
}

class ServiceState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool available = false;
  bool open = true;
  ServiceState(this.authorizationStatus, this.available, this.open);

  factory ServiceState.fromServiceStateData(stateData) {
    return ServiceState(
        stateData?["authorizationStatus"]?.toString().toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        stateData?["available"] ?? false,
        stateData?["open"] ?? true);
  }

  Map<String, dynamic> toJson() => {
        "authorizationStatus": authorizationStatus.toFirebaseFormatString(),
        "available": available,
        "open": open
      };

  bool get isAuthorized =>
      authorizationStatus == AuthorizationStatus.Authorized;
  bool get isOpen => open;
}

enum ServiceStatus {
  Awaiting_verification,
  Open,
  Closed_temporarily,
  Closed_indefinitely
}

extension ServiceStatusHelper on ServiceStatus {
  String toHasuraFormat() {
    final String str = toString().split('.').last;
    mezDbgPrint("Hasura format ====>${str.toLowerCase()}");
    return str.toLowerCase();
  }

  ServiceState toServiceState() {
    ServiceState state =
        ServiceState(AuthorizationStatus.Authorized, false, false);
    if (this == ServiceStatus.Awaiting_verification) {
      state = ServiceState(AuthorizationStatus.InReview, false, false);
    } else if (this == ServiceStatus.Open) {
      state = ServiceState(AuthorizationStatus.Authorized, true, true);
    } else if (this == ServiceStatus.Closed_temporarily) {
      state = ServiceState(AuthorizationStatus.Authorized, true, false);
    }
    return state;
  }
}

extension ServiceStatusStringHelper on String {
  ServiceStatus toServiceStatus() {
    return ServiceStatus.values
        .firstWhere((ServiceStatus e) => e.toHasuraFormat() == this);
  }
}
