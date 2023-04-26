import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart' as review;

class CustBusinessViewController {
  // instances //

  // streams //

  // variables //

  late int _businessId;
  late TabController tabController;

  // states variables //
  Rxn<Business> _business = Rxn<Business>();
  final RxList<review.Review> _reviews = RxList.empty();
  final RxnNum _ratingAverage = RxnNum();

// getters

  int get businessId => _businessId;

  Business? get business => _business.value;
  bool get isBusinessLoaded => _business.value != null;
  RxList<review.Review> get reviews => _reviews;
  RxnNum get ratingAverage => _ratingAverage;

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

    unawaited(get_service_reviews(
            serviceId: businessId,
            serviceProviderType: ServiceProviderType.Business,
            withCache: false)
        .then((List<review.Review>? value) {
      if (value != null) {
        _reviews.value = value;
      }
    }));

    unawaited(get_service_review_average(
            serviceId: businessId,
            serviceProviderType: ServiceProviderType.Business,
            withCache: false)
        .then((num? value) {
      if (value != null) {
        _ratingAverage.value = value;
      }
    }));
  }

  void dispose() {}
}
