import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class CustCourierServiceViewController {
  // instances //

  // states vars //
  Rxn<DeliveryCompany> _deliveryCompany = Rxn();

  // getters //
  bool get hasData => _deliveryCompany.value != null;
  DeliveryCompany get company => _deliveryCompany.value!;

  // methods //

  Future<void> init({required int companyId}) async {
    _deliveryCompany.value = await get_delivery_company(companyId: companyId);

    unawaited(get_service_reviews(
            serviceId: companyId,
            serviceProviderType: ServiceProviderType.DeliveryCompany,
            withCache: false)
        .then((List<Review>? value) {
      if (value != null) {
        _deliveryCompany.value?.reviews = value;
      }
    }));

    unawaited(get_service_review_average(
            serviceId: companyId,
            serviceProviderType: ServiceProviderType.DeliveryCompany,
            withCache: false)
        .then((num? value) {
      if (value != null) {
        _deliveryCompany.value?.rate = value;
        _deliveryCompany.refresh();
      }
    }));
  }

  void dispose() {}
}
