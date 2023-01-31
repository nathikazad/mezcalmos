import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/graphql/delivery_partner/hsDeliveryPartner.dart';
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

  TextEditingController _freeKmRange = TextEditingController();
  TextEditingController _minCost = TextEditingController();
  TextEditingController _costPerKm = TextEditingController();
  TextEditingController _distancePreview = TextEditingController();

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
      await _getDeliveryCost();
      if (deliveryCost.value != null) {
        _assignDeliveryCost();
      }
    }
  }

  Future<void> _initEditMode(
      int? serviceProviderId, ServiceProviderType? serviceProviderType) async {
    restaurant.value =
        await get_restaurant_by_id(id: serviceProviderId!, withCache: false);
    deliveryType.value = restaurant.value!.selfDelivery
        ? ServiceDeliveryType.Self_delivery
        : ServiceDeliveryType.Delivery_Partner;

    deliveryPartnerId.value = await get_service_delivery_partner(
        serviceId: serviceProviderId, providerType: serviceProviderType!);
  }

  Future<void> _getDeliveryCost() async {
    deliveryCost.value = await get_delivery_cost(
        deliveryDetailsId: restaurant.value!.deliveryDetailsId!);
  }

  void _assignDeliveryCost() {
    _freeKmRange.text =
        deliveryCost.value!.freeDeliveryKmRange?.toString() ?? "";
    _minCost.text = deliveryCost.value!.minimumCost.toString();
    _costPerKm.text = deliveryCost.value!.costPerKm.toString();
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

  void pickDeliveryCompany(int id) {
    if (isCreatingNewService) {
      createServiceViewController!.serviceInput.value.deliveryPartnerId = id;
      createServiceViewController!.serviceInput.refresh();
    } else {
      deliveryPartnerId.value = id;
    }
  }

  Future<bool> handleSave() async {
    if (isSelfDelivery) {
      return _handleSaveDeliveryCost();
    } else {
      await update_service_delivery_partner(
          serviceId: serviceProviderId!,
          providerType: serviceProviderType!,
          newCompanyId: deliveryPartnerId.value!);
      await update_restaurant_info(
          id: serviceProviderId!,
          restaurant: restaurant.value!.copyWith(
            selfDelivery: false,
          ));
      return true;
    }
  }

  Future<bool> _handleSaveDeliveryCost() async {
    if (costFormKey.currentState?.validate() == true) {
      if (deliveryCost.value == null) {
        final int? newId =
            await add_delivery_cost(deliveryCost: _constructDeliveryCost());
        if (newId != null) {
          await update_restaurant_info(
              id: serviceProviderId!,
              restaurant: restaurant.value!
                  .copyWith(selfDelivery: true, deliveryDetailsId: newId));
          return true;
        }
      } else {
        await update_delivery_cost(
            deliveryCostId: deliveryCost.value!.id!,
            deliveryCost: deliveryCost.value!);
        await update_restaurant_info(
            id: serviceProviderId!,
            restaurant: restaurant.value!.copyWith(
              selfDelivery: true,
            ));
      }
      return true;
    }
    return false;
  }

  // getters //
  DeliveryCost _constructDeliveryCost() {
    return DeliveryCost(
        id: null,
        minimumCost: double.parse(_minCost.text),
        freeDeliveryKmRange: double.tryParse(_freeKmRange.text),
        costPerKm: double.parse(_costPerKm.text));
  }

  bool get isCreatingNewService => createServiceViewController != null;
  void calculatePreview() {
    final double dist = double.parse(_distancePreview.text);
    final double kmCost = double.parse(_costPerKm.text);
    final double min = double.parse(_costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(_costPerKm.text) != null &&
        double.tryParse(_minCost.text) != null &&
        double.tryParse(_costPerKm.text) != null;
  }

  //
  ServiceDeliveryType get getDeliveryType => isCreatingNewService
      ? createServiceViewController!.serviceInput.value.deliveryType!
      : deliveryType.value;
  GlobalKey<FormState> get getFormKey => isCreatingNewService
      ? createServiceViewController!.costFormKey
      : costFormKey;
  int? get getPartnerId => isCreatingNewService
      ? createServiceViewController!.serviceInput.value.deliveryPartnerId
      : deliveryPartnerId.value;

  bool get hasData {
    if (serviceProviderId != null && serviceProviderType != null) {
      return restaurant.value != null &&
          (deliveryCost.value != null || deliveryPartnerId.value != null);
    } else
      return true;
  }

  bool get isSelfDelivery =>
      getDeliveryType == ServiceDeliveryType.Self_delivery;
  TextEditingController get freeKmRange => (isCreatingNewService)
      ? createServiceViewController!.freeKmRange
      : _freeKmRange;
  TextEditingController get minCost =>
      (isCreatingNewService) ? createServiceViewController!.minCost : _minCost;
  TextEditingController get costPerKm => (isCreatingNewService)
      ? createServiceViewController!.costPerKm
      : _costPerKm;
  TextEditingController get distancePreview => (isCreatingNewService)
      ? createServiceViewController!.distancePreview
      : _distancePreview;
}
