import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/offer/hsOffer.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/hsSavedLocation.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ReferralsHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();
  AuthController authController = Get.find<AuthController>();
  Customer? get customer => _customer.value;
  String? _influencerTag = "mimi";
  String? get influencerTag => _influencerTag;
  int? _influencerId;
  int? get influencerId => _influencerId;

  bool _initialized = false;
  StreamController<bool> _cusAuthControllerInitializedStreamController =
      StreamController<bool>();
  Future<void> onInit() async {
    super.onInit();
    mezDbgPrint("CustomerAuthController onInit ");
    if (authController.fireAuthUser?.uid != null) {
      final User user = fireAuth.FirebaseAuth.instance.currentUser!;
      await ifUserJustSignedUp(user);

      // ignore: unawaited_futures
      final Customer? value =
          await get_customer(user_id: authController.hasuraUserId!);

      await _setCustomerInfos(value);

      _initialized = true;
      _cusAuthControllerInitializedStreamController.add(true);
    }
  }

  void setInfluencerTag(String influencerTag) {
    _influencerTag = influencerTag;
  }

  Future<void> getInfluencerIdForCustomer() async {
    if (_influencerTag != null) {
      _influencerId = await get_inf_id_by_tag(tag: _influencerTag!);
    }
  }

  Future<void> awaitInitialization() {
    if (_initialized) return Future<void>(() => null);
    return _cusAuthControllerInitializedStreamController.stream.first;
  }

  Future<void> _setCustomerInfos(Customer? customer) async {
    final String _appVersion = PlatformOSHelper.getAppVersion;

    if (customer == null) {
      customer = await set_customer_info(
          app_version: _appVersion, user_id: authController.hasuraUserId!);
    }

    await fetchSavedLocations();

    _customer.value = customer;
    _customer.value?.savedLocations =
        customer?.savedLocations ?? <SavedLocation>[];
    _customer.refresh();
    await set_customer_app_version(
        version: _appVersion, customer_id: authController.hasuraUserId!);
  }

  Future<void> fetchSavedLocations() async {
    _customer.value?.savedLocations = await get_customer_locations(
        customer_id: authController.hasuraUserId!, withCache: false);
  }

  Future<SavedLocation?> saveNewLocation(SavedLocation savedLocation) async {
    final SavedLocation? res = await add_saved_location(
        saved_location: savedLocation,
        customer_id: authController.hasuraUserId!);
    await fetchSavedLocations();
    return res;
  }

  Future<SavedLocation?> editLocation(SavedLocation savedLocation) async {
    final SavedLocation? res =
        await update_saved_location(savedLocation: savedLocation);
    await fetchSavedLocations();
    return res;
  }

  Future<void> setAsDefaultLocation(SavedLocation newDefaultLocation) async {
    await set_default_location(
        userId: authController.hasuraUserId!,
        defaultLocationId: newDefaultLocation.id!);
    unawaited(get_customer_locations(customer_id: authController.hasuraUserId!)
        .then((List<SavedLocation> value) =>
            _customer.value?.savedLocations = value));
  }

  void deleteLocation(SavedLocation savedLocation) {
    if (savedLocation.id != null)
      delete_saved_location(saved_location_id: savedLocation.id!);
  }

  MezLocation? getLocationById(int locationId) {
    // we get the user Location by it's id!

    return customer?.savedLocations.firstWhere((SavedLocation savedLocation) {
      return savedLocation.id == locationId;
    }, orElse: null).location;
  }

  Future<int?> setReviewId(
      {required int reviewId,
      required int orderId,
      required ServiceProviderType entityType}) async {
    switch (entityType) {
      case ServiceProviderType.Laundry:
        return addLaundryOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );
      case ServiceProviderType.Restaurant:
        return addRestaurantOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );
      case ServiceProviderType.DeliveryCompany:
        return addDriverOrderReviewId(
          orderId: orderId,
          reviewId: reviewId,
        );

      default:
    }
    return null;
  }

  @override
  Future<void> onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}
