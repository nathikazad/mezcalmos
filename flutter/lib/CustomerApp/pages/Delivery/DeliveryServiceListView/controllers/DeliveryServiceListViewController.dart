import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class DeliveryServiceListViewController {
  late List<Map<String, String>> _deliveryServiceListData;
  List<Map<String, String>> get deliveryServiceListData =>
      _deliveryServiceListData;

  void init() {
    _deliveryServiceListData = <Map<String, String>>[
      {
        "icon": aDelivery,
        "title": _i18n()["deliveries"],
      },
      {
        "icon": aRentals,
        "title": _i18n()["rentals"],
      },
      {
        "icon": aChakras,
        "title": _i18n()["classes"],
      },
      {
        "icon": aYoga,
        "title": _i18n()["wellness"],
      },
      {
        "icon": aDiscoBall,
        "title": _i18n()["events"],
      },
      {
        "icon": aVolunteering,
        "title": _i18n()["volunteer"],
      },
      {
        "icon": aAdventure,
        "title": _i18n()["adventure"],
      },
    ];
  }

  void dispose() {}
}
