import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension ParseDeliveryOrderStatusToString on DeliveryOrderStatus {
  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}
