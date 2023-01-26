import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

class DeliverySettingsViewController {
  CreateServiceViewController? createServiceViewController;
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;
  // vars //
  GlobalKey<FormState> costFormKey = GlobalKey();
  // text inputs //

  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();
  // state vars //
  Rxn<Restaurant> restaurant = Rxn();
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  RxnInt deliveryPartnerId = RxnInt();
  RxnNum previewCost = RxnNum();
  Rxn<DeliveryCost> deliveryCost = Rxn();
  Rx<ServiceDeliveryType> deliveryType = Rx(ServiceDeliveryType.Self_delivery);
  // methods //
  Future<void> init({
    CreateServiceViewController? createServiceViewController,
    int? serviceProviderId,
    ServiceProviderType? serviceProviderType,
  }) async {
    this.createServiceViewController = createServiceViewController;
    this.serviceProviderId = serviceProviderId;
    this.serviceProviderType = serviceProviderType;
    if (serviceProviderId != null && serviceProviderType != null) {
      await _initEditMode(serviceProviderId, serviceProviderType);
    }
  }

  Future<void> _initEditMode(
      int? serviceProviderId, ServiceProviderType? serviceProviderType) async {
    restaurant.value = await get_restaurant_by_id(id: serviceProviderId!);
    deliveryType.value = restaurant.value!.selfDelivery
        ? ServiceDeliveryType.Self_delivery
        : ServiceDeliveryType.Delivery_Partner;
    if (restaurant.value!.selfDelivery) {
      await _getDeliveryCost(serviceProviderId, serviceProviderType);
    }
    if (deliveryCost.value != null) {
      _assignDeliveryCost();
    }
  }

  Future<void> _getDeliveryCost(
      int serviceProviderId, ServiceProviderType? serviceProviderType) async {
    deliveryCost.value = await get_delivery_cost(
        serviceProviderId: serviceProviderId,
        providerType: serviceProviderType!);
  }

  void _assignDeliveryCost() {
    freeKmRange.text =
        deliveryCost.value!.freeDeliveryKmRange?.toString() ?? "";
    minCost.text = deliveryCost.value!.minimumCost.toString();
    costPerKm.text = deliveryCost.value!.costPerKm.toString();
  }

  Future<void> getDeliveryCompanies() async {
    deliveryCompanies.clear();
    final List<DeliveryCompany> data = await get_nearby_companies(
        location: isCreatingNewService
            ? createServiceViewController!
                .serviceInput.value.serviceInfo!.location
            : restaurant.value!.info.location);
    deliveryCompanies.addAll(data);
  }

  void switchDeliveryType(ServiceDeliveryType value) {
    if (isCreatingNewService) {
      createServiceViewController!.serviceInput.value.deliveryType = value;
      createServiceViewController!.serviceInput.refresh();
    } else {
      deliveryType.value = value;
    }
  }
  // getters //

  bool get isCreatingNewService => createServiceViewController != null;
  void calculatePreview() {
    final double dist = double.parse(distancePreview.text);
    final double kmCost = double.parse(costPerKm.text);
    final double min = double.parse(costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(costPerKm.text) != null &&
        double.tryParse(minCost.text) != null &&
        double.tryParse(costPerKm.text) != null;
  }

  //
  ServiceDeliveryType get getDeliveryType => isCreatingNewService
      ? createServiceViewController!.serviceInput.value.deliveryType!
      : deliveryType.value;
  GlobalKey<FormState> get getFormKey => isCreatingNewService
      ? createServiceViewController!.costFormKey
      : costFormKey;
}
