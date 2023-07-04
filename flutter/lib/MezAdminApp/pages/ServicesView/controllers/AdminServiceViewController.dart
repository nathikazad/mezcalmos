import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/hsAdminServiceProviders.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';

class AdminServicesViewController {
  late AdminTabsViewController adminTabsViewController;
  ScrollController scrollController = ScrollController();
  // obs //
  RxList<Restaurant> _restaurants = RxList.empty();
  RxList<Laundry> _laundries = RxList.empty();
  RxList<DeliveryCompany> _dvCompanies = RxList.empty();
  RxList<cModels.Business> _businesses = RxList.empty();
  RxBool isFetching = RxBool(false);

  final int businessFetchSize = 10;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  final int laundryFetchSize = 10;
  int _laundryCurrentOffset = 0;
  bool _laundryFetchingData = false;
  bool _laundryReachedEndOfData = false;
  final int restFetchSize = 10;
  int _restCurrentOffset = 0;
  bool _restFetchingData = false;
  bool _restReachedEndOfData = false;
  final int dvFetchSize = 10;
  int _dvCurrentOffset = 0;
  bool _dvFetchingData = false;
  bool _dvReachedEndOfData = false;

// getters //

  cModels.ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;
  List<Restaurant> get restaurants => _restaurants;
  List<DeliveryCompany> get companies => _dvCompanies;
  List<Laundry> get laundries => _laundries;
  List<cModels.Business>? get businesses => _businesses;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;

    await Future.wait([
      fetchRestaurants(),
      fetchLaundries(),
      fetchCompanies(),
      fetchBusiness()
    ]);
    scrollController.onBottomReach(fetchCurrent, sensitivity: 500);
  }

  Future<void> fetchCompanies() async {
    isFetching.value = true;
    if (_dvFetchingData || _dvReachedEndOfData) {
      return;
    }
    _dvFetchingData = true;
    mezDbgPrint("fetching companies from admin controller");
    List<DeliveryCompany> newList = await admin_get_dv_companies(
        withCache: false, limit: dvFetchSize, offset: _dvCurrentOffset);
    _dvCompanies.value += newList;
    _dvCompanies.refresh();
    if (newList.length == 0) {
      _dvReachedEndOfData = true;
    }
    _dvCurrentOffset += dvFetchSize;
    _dvFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchBusiness() async {
    isFetching.value = true;
    if (_businessFetchingData || _businessReachedEndOfData) {
      return;
    }
    _businessFetchingData = true;
    mezDbgPrint("fetching businesses from admin controller");
    List<cModels.Business> newList = await admin_get_businesses(
        withCache: false,
        limit: businessFetchSize,
        offset: _businessCurrentOffset);
    _businesses.value += newList;
    _businesses.refresh();
    if (newList.length == 0) {
      _businessReachedEndOfData = true;
    }

    _businessCurrentOffset += businessFetchSize;
    _businessFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchLaundries() async {
    isFetching.value = true;
    if (_laundryFetchingData || _laundryReachedEndOfData) {
      return;
    }
    _laundryFetchingData = true;
    mezDbgPrint("fetching laundries from admin controller");
    List<Laundry> newList = await admin_get_laundries(
        withCache: false,
        limit: laundryFetchSize,
        offset: _laundryCurrentOffset);
    _laundries.value += newList;
    _laundries.refresh();
    if (newList.length == 0) {
      _laundryReachedEndOfData = true;
    }
    _laundryCurrentOffset += laundryFetchSize;

    _laundryFetchingData = false;
    isFetching.value = false;
  }

  Future<void> fetchRestaurants() async {
    isFetching.value = true;
    if (_restFetchingData || _restReachedEndOfData) {
      return;
    }
    _restFetchingData = true;
    mezDbgPrint("fetching restaurants from admin controller");
    List<Restaurant> newList = await admin_get_restaurants(
        withCache: false, limit: restFetchSize, offset: _restCurrentOffset);
    _restaurants.value += newList;
    _restaurants.refresh();
    if (newList.length == 0) {
      _restReachedEndOfData = true;
    }
    _restCurrentOffset += restFetchSize;

    _restFetchingData = false;
    isFetching.value = false;
    mezDbgPrint("restaurant length =======>${_restaurants.value.length}");
  }

  Future<void> switchServiceStatus(
      {required int serviceDetailsId,
      required cModels.ServiceProviderType providerType,
      required bool value}) async {
    await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedTemporarily,
        detailsId: serviceDetailsId,
        approved: null);
    await _resetData();
    fetchCurrent();
  }

  void fetchCurrent() {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        unawaited(fetchLaundries());
        break;
      case cModels.ServiceProviderType.Restaurant:
        unawaited(fetchRestaurants());
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        unawaited(fetchCompanies());
        break;
      case cModels.ServiceProviderType.Business:
        unawaited(fetchBusiness());
        break;
      default:
    }
  }

  int get currentServiceLength {
    switch (currentService) {
      case cModels.ServiceProviderType.Laundry:
        return _laundries.value.length ?? 0;
      case cModels.ServiceProviderType.Restaurant:
        return _restaurants.value.length ?? 0;
      case cModels.ServiceProviderType.DeliveryCompany:
        return _dvCompanies.value.length ?? 0;
      case cModels.ServiceProviderType.Business:
        return _businesses.value.length ?? 0;
      default:
        throw Exception("Service type not found");
    }
  }

  Future<void> approveService({
    required int detailsId,
  }) async {
    await update_service_state(
        status: null, detailsId: detailsId, approved: true);

    await _resetData();
    fetchCurrent();
  }

  Future<void> deleteService({
    required cModels.ServiceProviderType serviceProviderType,
    required int serviceProviderId,
  }) async {
    try {
      final cModels.DeleteServiceProviderResponse res =
          await CloudFunctions.serviceProvider_deleteServiceProvider(
              serviceProviderType: serviceProviderType,
              serviceProviderId: serviceProviderId);
      mezlog(res.toFirebaseFormattedJson());
      if (res.success) {
        await _resetData();
        fetchCurrent();
      }
    } on FirebaseException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezlog(stk);
    } catch (e, stk) {
      showErrorSnackBar();
      mezlog(e);
      mezlog(stk);
    }
  }

  Future<void> messageService(
      {required int serviceId, required cModels.RecipientType type}) async {
    try {
      int? chatId = await get_admin_chat_id(recepientId: serviceId, type: type);
      mezlog("ChatId: $chatId");
      if (chatId != null) {
        unawaited(BaseMessagingScreen.navigate(chatId: chatId));
      } else {
        final MezAdminChatResponse res =
            await CloudFunctions.serviceProvider_createMezAdminChat(
                recipientId: serviceId, recipientType: type);
        mezlog(res.toFirebaseFormattedJson());
        if (res.success) {
          unawaited(BaseMessagingScreen.navigate(chatId: res.chatId!.toInt()));
        }
      }
    } on FirebaseException catch (e) {
      showErrorSnackBar(errorText: e.message.toString());
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _resetData() async {
    _restaurants.value = RxList.empty();
    _laundries.value = RxList.empty();
    _dvCompanies.value = RxList.empty();
    _businesses.value = RxList.empty();
    _businessCurrentOffset = 0;
    _businessFetchingData = false;
    _businessReachedEndOfData = false;
    _laundryCurrentOffset = 0;
    _laundryFetchingData = false;
    _laundryReachedEndOfData = false;
    _restCurrentOffset = 0;
    _restFetchingData = false;
    _restReachedEndOfData = false;
    _dvCurrentOffset = 0;
    _dvFetchingData = false;
    _dvReachedEndOfData = false;
    await scrollController.animateTo(0,
        duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
  }
}
