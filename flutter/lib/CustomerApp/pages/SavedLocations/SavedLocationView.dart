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
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/saved_location.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
  StreamSubscription<List<SavedLocation>?>? savedLocationsStreamSub;
  String? _subscriptionId;

  @override
  void initState() {
    super.initState();
    // first get the old savedLocations , in-customer snapshot !
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    setState(() {
      savedLocations
          .assignAll(_customerAuthController.customer?.savedLocations ?? []);
    });
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    // then start a listener in case there are changes in /savedLocations db node!
    hasuraDb.createSubscription(start: () {
      savedLocationsStreamSub = listen_on_customer_locations(
              customer_id: Get.find<AuthController>().user!.hasuraId)
          .listen((List<SavedLocation>? event) {
        mezDbgPrint("GOT S/LOCATIONS ===> ${event?.length}");
        _customerAuthController.customer?.savedLocations.clear();
        _customerAuthController.customer?.savedLocations.addAll(event ?? []);
        setState(() {
          savedLocations.assignAll(
              _customerAuthController.customer?.savedLocations ?? []);
        });
      });
    }, cancel: () {
      if (_subscriptionId != null)
        hasuraDb.cancelSubscription(_subscriptionId!);
      savedLocationsStreamSub?.cancel();
      savedLocationsStreamSub = null;
    });
  }

  @override
  void dispose() {
    if (_subscriptionId != null) hasuraDb.cancelSubscription(_subscriptionId!);
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
        canClick: true,
        widget: Center(
          child: Text(
            "${_i18n()["addNewLoc"]}",
            style:
                txt.headline1!.copyWith(color: Colors.white, fontSize: 12.sp),
          ),
        ),
        function: () {
          MezRouter.toNamed<void>(kPickLocationRoute, arguments: false);
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
