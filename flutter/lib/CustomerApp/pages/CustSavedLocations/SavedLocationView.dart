import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationIsEmpty.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/controllers/CustSavedLocationsViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
  CustSavedLocationViewController viewController =
      CustSavedLocationViewController();

  /// CustomerAuthController
  // CustomerAuthController _customerAuthController =
  //     Get.find<CustomerAuthController>();
  // HasuraDb _hasuraDb = Get.find<HasuraDb>();

  // /// savedLocations
  // List<SavedLocation> savedLocations = <SavedLocation>[];

  // /// savedLocationsStreamSub
  // StreamSubscription<List<SavedLocation>?>? savedLocationsStreamSub;
  // String? _subscriptionId;

  @override
  void initState() {
    super.initState();
    viewController.inti();
    // first get the old savedLocations , in-customer snapshot !
    // mezDbgPrint("==============");
    // mezDbgPrint(savedLocations);
    // mezDbgPrint("==============");
    // setState(() {
    //   savedLocations
    //       .assignAll(_customerAuthController.customer?.savedLocations ?? []);
    // });
    // mezDbgPrint("==============");
    // mezDbgPrint(savedLocations);
    // mezDbgPrint("==============");
    // // then start a listener in case there are changes in /savedLocations db node!
    // _hasuraDb.createSubscription(start: () {
    //   savedLocationsStreamSub = listen_on_customer_locations(
    //           customer_id: Get.find<AuthController>().user!.hasuraId)
    //       .listen((List<SavedLocation>? event) {

    //     _customerAuthController.customer?.savedLocations.clear();
    //     _customerAuthController.customer?.savedLocations.addAll(event ?? []);
    //     setState(() {
    //       savedLocations.assignAll(
    //           _customerAuthController.customer?.savedLocations ?? []);
    //     });
    //   });
    // }, cancel: () {
    //   if (_subscriptionId != null)
    //     _hasuraDb.cancelSubscription(_subscriptionId!);
    //   savedLocationsStreamSub?.cancel();
    //   savedLocationsStreamSub = null;
    // });
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  int getLocationNumbers() {
    return viewController.savedLocs.length;
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
      body: Obx(() {
        if (viewController.initalized == false) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: primaryBlueColor,
            ),
          );
        } else if (viewController.savedLocs.isNotEmpty) {
          return SingleChildScrollView(
              child: Column(children: <Widget>[
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(right: 16, bottom: 10, left: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(_i18n()["title"],
                        style: txt.headline1!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 12),
                        textAlign: TextAlign.center),
                  ),
                  const Spacer(),
                  Container(
                    child: Text(
                      "${getLocationNumbers()} ${_i18n()["location"]}${getLocationNumbers() > 1 ? 's' : ''}",
                      style: txt.headline4!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(
                  viewController.savedLocs.length,
                  (int index) => SavedLocationComponent(
                        savelocation: viewController.savedLocs[index],
                      )),
            ),
            const SizedBox(height: 25),
          ]));
        } else {
          return SavedLocationISEmpty();
        }
      }),
      // body: viewController.savedLocs.length > 0
      //     ? SavedLocationBody(
      //         savedLocations: viewController.savedLocs,
      //       )
      //     : SavedLocationISEmpty(),
    );
  }
}
