import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

Future<void> mezcalmosDialogWithTaxi({required String message}) =>
    oneButtonDialog(body: message, imagUrl: taxiImageAsset);

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]
["components"]["taxiDialogs"];

Future<void>
    mezcalmosDialogOrderNoMoreAvailable() async {
  return mezcalmosDialogWithTaxi(
      message: _i18n()['rideUnavailable']);
}

// THIS BELONGS TO TAXI
Future<void> mezcalmosDialogOrderCancelled() {
  return mezcalmosDialogWithTaxi(
      message: _i18n()['customerCancelled']);
}


