import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/SavedLocationComponent.dart';

class SavedLocationView extends StatefulWidget {
  SavedLocationView({
    Key? key,
  }) : super(key: key);

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
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: CustomerAppBar(
          title: "Saved Locations",
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
            ? Container(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.07),
                    Container(
                      margin: const EdgeInsets.only(
                          right: 16, bottom: 10, left: 16),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                                lang.strings["customer"]["savedLocations"]
                                    ["title"],
                                style: txt.headline1!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 12),
                                textAlign: TextAlign.left),
                          ),
                          Spacer(),
                          Container(
                            child: Text(
                                "${getLocationNumbers()} ${lang.strings["customer"]["savedLocations"]["location"]}${getLocationNumbers() > 1 ? 's' : ''}",
                                style: txt.headline4!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 12),
                                textAlign: TextAlign.right),
                          )
                        ],
                      ),
                    ),
                    ...savedLocations
                        .map((savedLocation) => SavedLocationComponent(
                              savelocation: savedLocation,
                              onPress: () {
                                Get.back(result: savedLocation);
                              },
                            )),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )),
              )
            : SavedlocationISEmpty());
  }
}

class SavedlocationISEmpty extends StatelessWidget {
  const SavedlocationISEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/noSavedLoc.png"),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              "Your Saved locations list is empty",
              style: txt.headline2!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Add new location by clicking the button below",
              style: txt.subtitle1!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
