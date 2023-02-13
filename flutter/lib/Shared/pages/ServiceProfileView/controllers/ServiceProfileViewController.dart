import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class ServiceProfileViewController {
  // Vars //
  Rxn<MainService> service = Rxn();

  bool get isApproved => false;
  bool get hasData => service.value != null;

  // methods //
  // init //
  Future<void> init({required serviceDetailsId}) async {
    // get details //
    // service.value = ;
  }
}
