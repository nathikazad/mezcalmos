import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/SavedLocationComponent.dart';

enum SavedLocationViewMode { GetSavedLocation, SeeSaveLocation }

class SavedLocationView extends StatefulWidget {
  final SavedLocationViewMode? savedLocationViewMode;
  SavedLocationView({Key? key, required this.savedLocationViewMode})
      : super(key: key);

  @override
  _SavedLocationViewState createState() => _SavedLocationViewState();
}

class _SavedLocationViewState extends State<SavedLocationView> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
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
          _customerAuthController.customerStream.value?.savedLocations ?? []);
    });
    mezDbgPrint("==============");
    mezDbgPrint(savedLocations);
    mezDbgPrint("==============");
    // then start a listener in case there are changes in /savedLocations db node!
    savedLocationsStreamSub = _customerAuthController.customerStream
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
    _popUpController.hideMenu();
    _popUpController.dispose();
    savedLocationsStreamSub?.cancel();
    savedLocationsStreamSub = null;
    super.dispose();
  }

  int getLocationNumbers() {
    return savedLocations.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customerAppBar(
        AppBarLeftButtonType.Back,
        _popUpController,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(right: 16, bottom: 10, left: 16),
              child: Row(
                children: [
                  Container(
                    child: Text(
                        lang.strings["customer"]["savedLocations"]["title"],
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psr",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                  ),
                  Spacer(),
                  Container(
                    child: Text(
                        "${getLocationNumbers()} ${lang.strings["customer"]["savedLocations"]["location"]}${getLocationNumbers() > 1 ? 's' : ''}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psr",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.right),
                  )
                ],
              ),
            ),
            ...savedLocations.map((savedLocation) => SavedLocationComponent(
                  savelocation: savedLocation,
                  onPress: () {
                    // mezcalmosSnackBar(
                    //     "_title", "Clicked on ${savedLocation.id!}");
                    // Get.back();
                    if (widget.savedLocationViewMode ==
                        SavedLocationViewMode.GetSavedLocation) {
                      Get.back(result: savedLocation);
                    }
                  },
                )),
            SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x332362f1),
                        offset: Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment(0.1689453125, 0),
                      end: Alignment(1, 1),
                      colors: [
                        const Color(0xff5582ff),
                        const Color(0xffc54efc)
                      ]),
                ),
                child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                            fontFamily: "FontAwesome5Pro",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text: "+ "),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text:
                            "    ${lang.strings["customer"]["savedLocations"]["addNewLoc"]}")
                  ])),
                ),
              ),
              onTap: () {
                Get.toNamed(kPickLocationRoute);
              },
            )
          ],
        )),
      ),
    );
  }
}
