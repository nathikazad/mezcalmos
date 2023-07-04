import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';

extension DeliveryOrderParser on String {
  // DeliveryOrderStatus toDeliveryOrderStatus() {
  //   return DeliveryOrderStatus.values.firstWhere(
  //     (DeliveryOrderStatus element) =>
  //         element.toString().split('.').last.toLowerCase() == toLowerCase(),
  //   );
  // }

  DeliveryServiceType toDeliveryProviderType() {
    return DeliveryServiceType.values.firstWhere(
      (DeliveryServiceType element) =>
          element.toString().split('.').last.toLowerCase() == toLowerCase(),
    );
  }

  DeliveryDriverType toDeliveryDriverType() {
    return DeliveryDriverType.values.firstWhere(
      (DeliveryDriverType element) =>
          element.toString().split('.').last.toLowerCase() == toLowerCase(),
    );
  }
}

extension DeliveryServiceTypeParser on DeliveryServiceType {
  String toHasuraString() {
    return toString().split('.').last.toLowerCase();
  }
}

enum DeliveryServiceType { restaurant, delivery_company, delivery_operator }
