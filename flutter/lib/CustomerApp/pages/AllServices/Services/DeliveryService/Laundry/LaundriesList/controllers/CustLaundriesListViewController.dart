import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;

class CustLaundriesListViewController {
  RxList<Laundry> filteredServices = RxList<Laundry>.empty();

  List<Laundry> _services = List<Laundry>.empty();

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  void init() {
    isLoading.value = true;

    get_laundries(withCache: false).then((List<Laundry>? list) {
      if (list != null) {
        _services = list;

        filter();
      }
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void _getCustomerCurrentLocation() {
    Location()
        .getLocation()
        .then((LocationData value) => customerLocation = value);
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  void filter() {
    List<Laundry> newList = new List<Laundry>.from(_services);

    newList = newList
        .searchByName(searchQuery.value)
        .showOnlyOpen(showOnlyOpen.value) as List<Laundry>;
    newList.sortByOpen();
    filteredServices.value = newList;
  }

  void dispose() {
    isLoading.value = false;
  }
}
