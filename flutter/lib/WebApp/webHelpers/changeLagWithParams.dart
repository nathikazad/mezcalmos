import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

import 'package:qlevar_router/qlevar_router.dart';

///this function [changeLangWithParams] changes language using params ['es'.'en']
///passed on url
void changeLangWithParams() {
  final LanguageController controller = Get.find<LanguageController>();

  var xLang = QR.params["lang"].toString().contains("es")
      ? LanguageType.ES
      : LanguageType.EN;
  print("xLang is now ${xLang}");

  Future.delayed(Duration(seconds: 1)).then((value) {
    controller.changeLangForWeb(xLang);
  });
}
