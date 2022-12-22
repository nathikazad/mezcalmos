import 'package:location/location.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryService.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';

class DeliveryOperator {
  // for testing now
  final int id;
  final int companyId;
  final String appVersion;
  final LocationData currentGps;
  final String type;
  final String? notificationToken;
  final bool isOwner;
  final String status;

  DeliveryOperator(
    this.id,
    this.companyId,
    this.appVersion,
    this.currentGps,
    this.type,
    this.notificationToken,
    this.isOwner,
    this.status,
  );
}
