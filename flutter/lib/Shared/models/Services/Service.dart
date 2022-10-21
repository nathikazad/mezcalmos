import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

abstract class Service {
  ServiceInfo info;
  Schedule? schedule;
  ServiceState state;
  LanguageType primaryLanguage;
  LanguageType? secondaryLanguage;
  PaymentInfo paymentInfo;
  Service(
      {required this.info,
      this.schedule,
      required this.state,
      required this.primaryLanguage,
      this.secondaryLanguage,
      required this.paymentInfo});
}

class ServiceState {
  AuthorizationStatus authorizationStatus = AuthorizationStatus.Unauthorized;
  bool available = false;
  bool open = true;
  List<String> drivers = [];
  List<String> operators = [];
  ServiceState(this.authorizationStatus, this.available, this.open,
      this.operators, this.drivers);

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
        stateData?["authorizationStatus"]?.toString().toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        stateData?["available"] ?? false,
        stateData?["open"] ?? true,
        ops,
        dvs);
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
