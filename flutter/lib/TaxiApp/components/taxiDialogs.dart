import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

Future<void> mezcalmosDialogWithTaxi({required String message}) =>
    oneButtonDialog(body: message, imagUrl: taxiImageAsset);

Future<void>
    mezcalmosDialogOrderNoMoreAvailable() async {
  LanguageController lang = Get.find<LanguageController>();
  return mezcalmosDialogWithTaxi(
      message: i18n.strings['taxi']['cancelOrder']
            ['rideUnavailble']);
}

// THIS BELONGS TO TAXI
Future<void> mezcalmosDialogOrderCancelled() {
  LanguageController lang = Get.find<LanguageController>();
  return mezcalmosDialogWithTaxi(
      message: i18n.strings['taxi']['cancelOrder']
        ['customerCancelled']);
}


