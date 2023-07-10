import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';

class ServiceOfferViewController {
  late int serviceProviderId;
  int? serviceLinkId;
  late cModels.ServiceProviderType serviceProviderType;
  RxList<cModels.Offer> serviceOffers = RxList.empty();
  ScrollController scrollController = ScrollController();
  RxBool isLoading = RxBool(false);

  Future<void> init({
    required int serviceProviderId,
    required int? serviceLinkId,
    required cModels.ServiceProviderType serviceProviderType,
  }) async {
    this.serviceProviderId = serviceProviderId;
    this.serviceLinkId = serviceLinkId;
    this.serviceProviderType = serviceProviderType;
    await fetchServiceOffers();

    // await fetchServiceLinks();

    mezDbgPrint("Init offers of service id  ====>$serviceProviderId");
  }

  Future<void> fetchServiceOffers() async {
    isLoading.value = true;
    serviceOffers.value = await get_service_provider_offers(
      serviceProviderId: serviceProviderId,
      serviceProviderType: serviceProviderType,
    );
    mezDbgPrint("Offers fetched $serviceOffers");
    isLoading.value = false;
  }
}
