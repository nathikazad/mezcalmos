import 'dart:async';

// import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
// import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/SingleLaundry/SingleLaundryScreen.dart';
// import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ReferralsHelper.dart';

class CustomerLinkHandler {
  static Future<void> handleLink(Uri link) async {
    final String serviceProviderUniqueId = link.path.replaceAll("/", "");
    mezDbgPrint("🌭🌭🌭🌭🌭🌭🌭🌭 $serviceProviderUniqueId");
    final ServicProviderInfo? servicProviderInfo =
        await get_service_link(uniqueId: serviceProviderUniqueId);
    if (servicProviderInfo != null) {
      switch (servicProviderInfo.serviceProviderType) {
        case ServiceProviderType.Restaurant:
          // unawaited(CustomerRestaurantView.navigate(
          //     restaurantId: servicProviderInfo.serviceProviderId));
          break;
        case ServiceProviderType.Laundry:
          // unawaited(SingleLaundryScreen.navigate(
          //     laundryId: servicProviderInfo.serviceProviderId));
          break;
        case ServiceProviderType.Business:
          // unawaited(CustBusinessView.navigate(
          //     businessId: servicProviderInfo.serviceProviderId));
          // @chirag: TODO fix this
          break;
        default:
          return;
      }
      // ignore: unawaited_futures
      saveReferral(serviceProviderUniqueId);
    }
  }
}

class ServicProviderInfo {
  ServiceProviderType serviceProviderType;
  int serviceProviderId;
  ServicProviderInfo(this.serviceProviderType, this.serviceProviderId);
}
