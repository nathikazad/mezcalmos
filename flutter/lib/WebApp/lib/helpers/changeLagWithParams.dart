import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:qlevar_router/qlevar_router.dart';

///this function [changeLangWithParams] changes language using params ['es'.'en']
///passed on url
void changeLangWithParams() {
  final LanguageController Lcontroller = Get.find<LanguageController>();

  var xLang = QR.params["lang"].toString().contains("es")
      ? LanguageType.ES
      : LanguageType.EN;
  print("xLang is now ${xLang}");

  Future.delayed(Duration(seconds: 1)).then((value) {
    Lcontroller.changeLangForWeb(xLang);
  });
}
