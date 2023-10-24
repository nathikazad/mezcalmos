import 'dart:async';

// import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
// import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/SingleLaundry/SingleLaundryScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustRestaurantView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustomerLinkHandler {
  static Future<void> handleLink(
      {required String path,
      required void Function(String) updateInfluencerUi}) async {
    if (path.startsWith("i/")) {
      final String influencerTag = path.substring(2);
      updateInfluencerUi(influencerTag); // Call the passed function
    } else {
      await handleUniqueLink(path);
    }
  }

  static Future<void> handleUniqueLink(String uniqueId) async {
    mezDbgPrint("🌭🌭🌭🌭🌭🌭🌭🌭 $uniqueId");
    final ServicProviderInfo? servicProviderInfo =
        await get_service_link(uniqueId: uniqueId);
    mezDbgPrint(servicProviderInfo?.serviceProviderId);
    if (servicProviderInfo != null) {
      switch (servicProviderInfo.serviceProviderType) {
        // ignore: unawaited_futures
        case ServiceProviderType.Restaurant:
          unawaited(CustRestaurantView.navigate(
              restaurantId: servicProviderInfo.serviceProviderId));
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
      // saveReferral(serviceProviderUniqueId);
    }
  }
}

class ServicProviderInfo {
  ServiceProviderType serviceProviderType;
  int serviceProviderId;
  ServicProviderInfo(this.serviceProviderType, this.serviceProviderId);
}
