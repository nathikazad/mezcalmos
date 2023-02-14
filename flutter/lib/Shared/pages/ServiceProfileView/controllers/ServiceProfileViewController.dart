import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class ServiceProfileViewController {
  // constants //
  late int serviceId;
  late int detailsId;
  // state vars //
  Rxn<MainService> _service = Rxn();
  // getters //
  MainService get service => _service.value!;
  bool get isApproved => false;
  bool get hasData => _service.value != null;

  bool get isAvailable => true;

  // methods //
  // init //
  Future<void> init(
      {required int serviceDetailsId, required int serviceId}) async {
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;

    _service.value = await get_service_details_by_id(
        serviceDetailsId: detailsId, serviceId: this.serviceId);
  }

  void switchOpen(bool bool) {}
}
