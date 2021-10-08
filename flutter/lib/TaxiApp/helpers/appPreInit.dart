import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class AppPreInit {
  static bitmapLoading() async {
    mezDbgPrint("[+] L O A D I N G .... BITMAP_DESCRIPTORS !");
    await GetStorage()
        // .write(getxGmapBottomPaddingKey, Platform.isAndroid ? 38.0 : 63.0);
        .write(getxGmapBottomPaddingKey,
            Platform.isAndroid ? 38.0 : Get.height / 20);

    // first original user marker loading
    await GetStorage().write('user_descriptor_placeholder',
        await BitmapDescriptorLoader(logo_asset, 60, 60));

    await GetStorage().write('taxi_descriptor',
        await BitmapDescriptorLoader(taxi_driver_marker_asset, 60, 60));

    await GetStorage().write('destination_descriptor',
        await BitmapDescriptorLoader(purple_destination_marker_asset, 60, 60));

    // Loading map asset !
    await rootBundle.loadString(map_style_asset).then(
        (jsonString) => GetStorage().write(getxMapStyleJsonKey, jsonString));
    mezDbgPrint("[+] L O A D I N G .... DONE !");
  }
}
