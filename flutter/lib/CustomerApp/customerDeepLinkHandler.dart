import 'dart:async';

import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';

class CustomerDeepLinkHandler {
  static Future<void> handleDeepLink(Uri deepLink) async {
    final String serviceProviderUniqueId = deepLink.path.replaceAll("/", "");

    String? linkUrl = await get_service_link(uniqueId: serviceProviderUniqueId);
    if (linkUrl != null) MezRouter.toNamed(linkUrl);
  }
}
