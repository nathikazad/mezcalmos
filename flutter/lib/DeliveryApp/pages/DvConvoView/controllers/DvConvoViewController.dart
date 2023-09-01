import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';

class DvConvoViewController {
  late List<WhMessage> convo;

  bool get showAcceptBtn => true;

  void init({required List<WhMessage> messages}) {
    convo = messages;
  }
}
