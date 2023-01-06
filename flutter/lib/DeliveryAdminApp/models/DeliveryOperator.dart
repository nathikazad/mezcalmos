import 'package:location/location.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';

class DeliveryOperator {
  // for testing now
  final int id;
  final int companyId;
  final String appVersion;
  final LocationData currentGps;
  final DeliveryServiceType type;
  final String? notificationToken;
  final bool isOwner;
  final String status;
  final String? companyName;
  final String? companyImg;

  DeliveryOperator({
    this.companyName,
    this.companyImg,
    required this.id,
    required this.companyId,
    required this.appVersion,
    required this.currentGps,
    required this.type,
    required this.notificationToken,
    required this.isOwner,
    required this.status,
  });
}
