import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/User.dart';

abstract class Service {
  ServiceInfo info;
  Schedule? schedule;
  ServiceState state;
  LanguageType primaryLanguage;
  LanguageType? secondaryLanguage;
  Service(
      {required this.info,
      this.schedule,
      required this.state,
      required this.primaryLanguage,
      this.secondaryLanguage});
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
