import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

Future<void> mezcalmosDialogWithTaxi({required String message}) =>
    oneButtonDialog(message: message, imagUrl: taxiImageAsset);

Future<void>
    mezcalmosDialogOrderNoMoreAvailable() async => mezcalmosDialogWithTaxi(
        message: Get.find<LanguageController>().strings['taxi']['cancelOrder']
            ['rideUnavailble']);

// THIS BELONGS TO TAXI
Future<void> mezcalmosDialogOrderCancelled() async => mezcalmosDialogWithTaxi(
    message: Get.find<LanguageController>().strings['taxi']['cancelOrder']
        ['customerCancelled']);


