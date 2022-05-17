import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/components/SavedLocationBody.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/components/SavedLocationIsEmpty.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["SavedLocationView"];

class SavedLocationView extends StatefulWidget {
  const SavedLocationView({
    Key? key,
  }) : super(key: key);

  @override
  _SavedLocationViewState createState() => _SavedLocationViewState();
}

class _SavedLocationViewState extends State<SavedLocationView> {
  /// CustomerAuthController
  CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();

  /// savedLocations
  List<SavedLocation> savedLocations = <SavedLocation>[];

  /// savedLocationsStreamSub
  StreamSubscription<List<SavedLocation>>? savedLocationsStreamSub;

  @override
  void initState() {
    super.initState();
    // first get the old savedLocations , in-customer snapshot !
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    setState(() {
      savedLocations.assignAll(
          _customerAuthController.customer.value?.savedLocations ?? []);
    });
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    // then start a listener in case there are changes in /savedLocations db node!
    savedLocationsStreamSub = _customerAuthController.customer
        .map<List<SavedLocation>>((Customer? customerInstance) {
      return customerInstance?.savedLocations ?? <SavedLocation>[];
    }).listen((List<SavedLocation> _savedLocations) {
      mezDbgPrint("==============");
      mezDbgPrint(savedLocations);
      mezDbgPrint("==============");
      mezDbgPrint("New Data ! $_savedLocations");
      setState(() {
        // set the new locations!
        savedLocations.assignAll(_savedLocations);
      });
    });
  }

  @override
  void dispose() {
    savedLocationsStreamSub?.cancel();
    savedLocationsStreamSub = null;
    super.dispose();
  }

  int getLocationNumbers() {
    return savedLocations.length;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()["title"]}",
        autoBack: true,
      ),
      bottomNavigationBar: ButtonComponent(
        widget: Center(
          child: Text(
            "${_i18n()["addNewLoc"]}",
            style:
                txt.headline1!.copyWith(color: Colors.white, fontSize: 12.sp),
          ),
        ),
        function: () {
          Get.toNamed<void>(kPickLocationRoute, arguments: false);
        },
      ),
      body: savedLocations.length > 0
          ? SavedLocationBody(
              savedLocations: savedLocations,
            )
          : SavedLocationISEmpty(),
    );
  }
}
