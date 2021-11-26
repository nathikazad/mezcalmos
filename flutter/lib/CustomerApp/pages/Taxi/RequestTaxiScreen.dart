import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  Rxn<TaxiRequest> taxiRequest = Rxn();
  TaxiController controller = Get.find<TaxiController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.requestTaxi(taxiRequest.value!);
    return Text("data");
  }
}
