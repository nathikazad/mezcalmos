import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["TimeUnitHelper"];

extension TimeUnitHelper on TimeUnit {
  String toReadableString() {
    return "${_i18n()[toFirebaseFormatString()]}";
  }

  String toStringDuration() {
    final String duration = toString().split('.').last;
    if (duration.contains('Person')) {
      return 'Person';
    } else {
      return duration.contains('Per')
          ? duration.replaceAll('Per', '')
          : duration;
    }
  }
}
