import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class ServiceProfileController extends GetxController {
  // constants //
  late int serviceId;
  late int detailsId;
  // state vars //
  Rxn<MainService> _service = Rxn();
  RxBool _isAprroved = RxBool(false);
  // getters //
  MainService get service => _service.value!;
  bool get isApproved => _isAprroved.value;
  bool get hasData => _service.value != null;

  bool get isAvailable => true;
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
  void assignVars({required int serviceDetailsId, required int serviceId}) {
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
  }

  Future<void> fetchService() async {
    _service.value = await get_service_details_by_id(
        serviceDetailsId: detailsId, serviceId: serviceId, withCache: false);
    _service.refresh();
  }

  void switchOpen(bool bool) {}
}
