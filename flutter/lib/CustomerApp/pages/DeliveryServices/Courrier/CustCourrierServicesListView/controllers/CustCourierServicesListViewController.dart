import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;

class CustCourierServicesListViewController {
  RxList<DeliveryCompany> filteredServices = RxList<DeliveryCompany>.empty();

  List<DeliveryCompany> _services = List<DeliveryCompany>.empty();

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  late FilterInput _filterInput;

  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"],
    };
  }

  void init() {
    _filterInput = defaultFilters();
    isLoading.value = true;

    _getDvCompanies();
  }

  Future<void> _getDvCompanies() async {
    isLoading.value = true;
    await get_dv_companies(isOpen: true).then((List<DeliveryCompany>? list) {
      if (list != null) {
        _services = list;
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

  Future<void> filter(Map<String, List<String>> newData) async {
    // _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });
    await _getDvCompanies();
    List<DeliveryCompany> newList = new List<DeliveryCompany>.from(_services);

    newList = newList
        .searchByName(searchQuery.value)
        .showOnlyOpen(showOnlyOpen.value) as List<DeliveryCompany>;
    newList.sortByOpen();
    filteredServices.value = newList;
  }

  void dispose() {
    isLoading.value = false;
  }
}
