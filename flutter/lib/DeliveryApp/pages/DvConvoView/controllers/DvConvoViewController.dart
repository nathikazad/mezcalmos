import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';

class DvConvoViewController {
  bool get showAcceptBtn => true;
  RxList<DeliveryMessage> dvMessage = RxList.empty();

  void init({required String phoneNumber}) {}
}
