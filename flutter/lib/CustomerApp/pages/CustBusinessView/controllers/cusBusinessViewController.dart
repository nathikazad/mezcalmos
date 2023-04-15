import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustBusinessViewController {
  // instances //

  // streams //

  // variables //

  late int _businessId;
  late TabController tabController;

  // states variables //
  Rxn<Business> _business = Rxn<Business>();

// getters

  int get businessId => _businessId;

  Business? get business => _business.value;
  bool get isBusinessLoaded => _business.value != null;

  // methods //
  Future<void> init({
    required int businessId,
    required TickerProvider vsync,
  }) async {
    _businessId = businessId;
    tabController = TabController(length: 3, vsync: vsync);
    mezDbgPrint('businessId: $businessId');
    _business.value =
        await get_business_by_id(id: businessId, withCache: false);
    mezDbgPrint(_business.value?.toFirebaseFormattedJson());

    // _service.value = await get_service_details_by_id(
    //     serviceDetailsId: serviceDetailsId, serviceId: serviceId);
  }

  void dispose() {}
}
