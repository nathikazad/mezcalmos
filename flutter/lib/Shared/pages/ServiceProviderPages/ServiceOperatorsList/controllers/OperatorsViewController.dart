import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/delivery_operator/hsDeliveryOperator.dart';
import 'package:mezcalmos/Shared/graphql/laundry_operator/hsLaundryOperator.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class OperatorsListViewController {
  // instances and streams subscriptions

  RxList<Operator> operators = RxList.empty();

  RxnString opDeepLink = RxnString();
  RxnString qrImageLink = RxnString();

  Rxn<ServiceLink> serviceLink = Rxn();

  // getters //
  /// Restaurant already has deep links generated
  bool get hasLinks {
    return serviceLink.value != null &&
        serviceLink.value!.driverDeepLink != null &&
        serviceLink.value!.driverQrImageLink != null;
  }

  // late variables //

  late int serviceProviderId;
  late int serviceLinkId;
  late cModels.ServiceProviderType serviceProviderType;
  Future<void> init({
    required int serviceProviderId,
    required int serviceLinkId,
    required cModels.ServiceProviderType serviceProviderType,
  }) async {
    this.serviceProviderId = serviceProviderId;
    this.serviceLinkId = serviceLinkId;
    this.serviceProviderType = serviceProviderType;
    await fetchOperators();
    await fetchServiceLinks();

    mezDbgPrint("Init operators of restaurant id  ====>$serviceProviderId");
  }

  Future<void> fetchServiceLinks() async {
    try {
      serviceLink.value = await get_service_link_by_id(
          serviceLinkId: serviceLinkId, withCache: false);
    } on Exception {
      mezDbgPrint("Service dont have links");
    }
  }

  Future<void> fetchOperators() async {
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.DeliveryCompany:
        operators.value = await get_delivery_company_operators(
                companyId: serviceProviderId, withCache: false) ??
            [];

        break;
      case cModels.ServiceProviderType.Restaurant:
        operators.value = await get_restaurant_operators(
                restaurantId: serviceProviderId, withCache: false) ??
            [];

        break;
      case cModels.ServiceProviderType.Laundry:
        operators.value = await get_laundry_operators(
                laundryId: serviceProviderId, withCache: false) ??
            [];

        break;
      default:
    }
  }

  Future<void> approveOperator(
      {required bool approved, required int opId}) async {
    try {
      final cModels.AuthOperatorResponse res =
          await CloudFunctions.serviceProvider_authorizeOperator(
              newOperatorId: opId,
              approved: approved,
              participantType: partType);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      await fetchOperators();
    } on FirebaseException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(errorText: e.message.toString());
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  cModels.ParticipantType get partType {
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        return cModels.ParticipantType.RestaurantOperator;
      case cModels.ServiceProviderType.Laundry:
        return cModels.ParticipantType.LaundryOperator;
      case cModels.ServiceProviderType.DeliveryCompany:
        return cModels.ParticipantType.DeliveryOperator;
      default:
        return cModels.ParticipantType.RestaurantOperator;
    }
  }
}
