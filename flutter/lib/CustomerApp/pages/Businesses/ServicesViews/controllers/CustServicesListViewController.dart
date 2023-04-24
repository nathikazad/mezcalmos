import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustServiceListViewController {
  // variables //
  RxList<Service> _services = <Service>[].obs;
  RxBool _isLoading = false.obs;
  Location? _fromLocation;

  // getters //
  bool get isLoading => _isLoading.value;
  List<Service> get services => _services.value;

  Future<void> init() async {
    // await for getting customer location then call fetch events function
    _isLoading.value = true;
    // combine thiz two future çn one line of code

    await _getFromLocation();
    await _fetchServices();

    _isLoading.value = false;
  }

  Future<void> _fetchServices() async {
    mezDbgPrint("Getting events  =====>$_fromLocation");
    if (_fromLocation == null) {
      showErrorSnackBar(errorText: "Error location is null");
    } else {
      _services.value = await get_service_by_category(
          offset: 0,
          limit: 15,
          categories1: [ServiceCategory1.Cleaning],
          distance: 1000000000000,
          fromLocation: _fromLocation!,
          tags: [],
          withCache: false);
    }
  }

  Future<void> _getFromLocation() async {
    await locPkg.Location().getLocation().then((locPkg.LocationData value) {
      if (value.latitude != null && value.longitude != null) {
        _fromLocation = Location(
          lat: value.latitude!,
          lng: value.longitude!,
          address: "",
        );
      }
    }).onError((Object? error, StackTrace stackTrace) {
      showErrorSnackBar(errorText: "Error getting your location");
    });
  }
}
