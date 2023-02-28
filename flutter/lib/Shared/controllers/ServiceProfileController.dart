import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ServiceProfileController extends GetxController {
  // constants //
  late int serviceId;
  late int detailsId;
  late int deliveryDetailsId;
  // state vars //
  Rxn<MainService> _service = Rxn();
  RxBool _isAprroved = RxBool(true);
  // getters //
  MainService get service => _service.value!;
  bool get isApproved => _isAprroved.value;
  bool get hasData => _service.value != null;

  bool get isAvailable => _service.value!.state.isOpen;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // methods //
  // init //
  void assignVars(
      {required int serviceDetailsId,
      required int serviceId,
      required int deliveryDetailsId}) {
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
    this.deliveryDetailsId = deliveryDetailsId;
  }

  Future<void> fetchService() async {
    _service.value = await get_service_details_by_id(
        serviceDetailsId: detailsId, serviceId: serviceId, withCache: false);
    if (_service.value != null) {
      _isAprroved.value = _service.value!.state.approved;
      _service.refresh();
    }
  }

  Future<void> switchOpen(bool value) async {
    mezDbgPrint(value);
    bool res = await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedIndefinitely,
        approved: null,
        detailsId: detailsId);
    if (res) {
      unawaited(fetchService());
    }
  }
}
