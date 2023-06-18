import 'dart:async';

import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/SingleLaundry/SingleLaundryScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustomerDeepLinkHandler {
  static Future<void> handleDeepLink(Uri deepLink) async {
    final String serviceProviderUniqueId = deepLink.path.replaceAll("/", "");
    mezDbgPrint("🌭🌭🌭🌭🌭🌭🌭🌭 $serviceProviderUniqueId");
    final ServicProviderInfo? servicProviderInfo =
        await get_service_link(uniqueId: serviceProviderUniqueId);
    if (servicProviderInfo != null)
      switch (servicProviderInfo.serviceProviderType) {
        case ServiceProviderType.Restaurant:
          unawaited(CustomerRestaurantView.navigate(
              restaurantId: servicProviderInfo.serviceProviderId));
          break;
        case ServiceProviderType.Laundry:
          unawaited(SingleLaundryScreen.navigate(
              laundryId: servicProviderInfo.serviceProviderId));
          break;
        case ServiceProviderType.Business:
          unawaited(CustBusinessView.navigate(
              businessId: servicProviderInfo.serviceProviderId));
          // @chirag: TODO fix this
          break;
        default:
      }
  }
}

class ServicProviderInfo {
  ServiceProviderType serviceProviderType;
  int serviceProviderId;
  ServicProviderInfo(this.serviceProviderType, this.serviceProviderId);
}
