import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class CustServiceViewController {
  // instances //

  // streams //

  // variables //
  late ServiceProviderType _serviceProviderType;
  late int _serviceId;
  late int _serviceDetailsId;

  // states variables //
  Rxn<Service> _service = Rxn<Service>();

// getters
  ServiceProviderType get serviceProviderType => _serviceProviderType;
  int get serviceId => _serviceId;
  int get serviceDetailsId => _serviceDetailsId;
  Service? get service => _service.value;
  bool get isServiceLoaded => _service.value != null;

  // methods //
  Future<void> init(
      {required int serviceId,
      required int serviceDetailsId,
      required ServiceProviderType serviceProviderType}) async {
    _serviceId = serviceId;
    _serviceDetailsId = serviceDetailsId;
    _serviceProviderType = serviceProviderType;
    _service.value = await get_service_details_by_id(
        serviceDetailsId: serviceDetailsId, serviceId: serviceId);
  }

  void dispose() {}
}
