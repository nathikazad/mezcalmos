import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/hsDeliveryMessage.dart';

class DvConvoViewController {
  late String phoneNumber;
  bool get showAcceptBtn => true;
  RxList<DeliveryMessage> dvMessages = RxList.empty();

  String? get title {
    if (dvMessages.isNotEmpty) {
      return dvMessages.first.userName ?? dvMessages.first.phoneNumber;
    }
    return null;
  }

  Future<void> init({required String phoneNumber}) async {
    this.phoneNumber = phoneNumber;
    dvMessages.value =
        await getCustomerDvMessages(phoneNumber: phoneNumber, withCache: false);
  }
}
