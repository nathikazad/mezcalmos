import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

import 'components/SavedLocationComponent.dart';
import 'components/savedLocationBody.dart';
import 'components/savedLocationISEmpty.dart';

class SavedLocationView extends StatefulWidget {
  SavedLocationView({
    Key? key,
  }) : super(key: key);

  @override
  _SavedLocationViewState createState() => _SavedLocationViewState();
}

class _SavedLocationViewState extends State<SavedLocationView> {
  LanguageController lang = Get.find<LanguageController>();
  CustomerAuthController _customerAuthController =
      Get.find<CustomerAuthController>();
  List<SavedLocation> savedLocations = <SavedLocation>[];
  StreamSubscription<List<SavedLocation>>? savedLocationsStreamSub;
  @override
  void initState() {
    // first get the old savedLocations , in-customer snapshot !
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    setState(() {
      savedLocations.assignAll(
          _customerAuthController.customerRxn.value?.savedLocations ?? []);
    });
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    // then start a listener in case there are changes in /savedLocations db node!
    savedLocationsStreamSub = _customerAuthController.customerRxn
        .map<List<SavedLocation>>((customerInstance) {
      return customerInstance?.savedLocations ?? [];
    }).listen((_savedLocations) {
      mezDbgPrint("==============");
      mezDbgPrint(savedLocations);
      mezDbgPrint("==============");
      mezDbgPrint("New Data ! $_savedLocations");
      setState(() {
        // set the new locations!
        savedLocations.assignAll(_savedLocations);
      });
    });

    super.initState();
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
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: CustomerAppBar(
          title: "${lang.strings["customer"]["savedLocations"]["title"]}",
          autoBack: true,
        ),
        bottomNavigationBar: ButtonComponent(
          widget: Center(
            child: Text(
              "${lang.strings["customer"]["savedLocations"]["addNewLoc"]}",
              style: txt.headline1!.copyWith(color: Colors.white),
            ),
          ),
          function: () {
            Get.toNamed(kPickLocationRoute);
          },
        ),
        body: savedLocations.length > 0
            ? SavedLocationBody(
                savedLocations: savedLocations,
              )
            : SavedlocationISEmpty());
  }
}
