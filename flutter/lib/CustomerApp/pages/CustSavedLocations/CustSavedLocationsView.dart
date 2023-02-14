import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationIsEmpty.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/controllers/CustSavedLocationsViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
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

  @override
  void initState() {
    super.initState();
    viewController.inti();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  int getLocationNumbers() {
    return viewController.savedLocs.value!.length;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()["title"]}",
        autoBack: true,
      ),
      bottomNavigationBar: MezButton(
        borderRadius: 0,
        height: 8.h,
        label: "${_i18n()["addNewLoc"]}",
        onClick: () async {
          // ignore: unawaited_futures
          MezRouter.toNamed<void>(kPickLocationRoute, arguments: false);
        },
      ),
      body: Obx(() {
        if (viewController.savedLocs.value == null) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: primaryBlueColor,
            ),
          );
        } else if (viewController.savedLocs.value!.isNotEmpty) {
          return SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(height: 2.h),
            Container(
              margin: EdgeInsets.only(right: 16, bottom: 8.sp, left: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      _i18n()["location"] + 's',
                      style: txt.headline3!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      //     txt.headline2!.copyWith(
                      //   fontWeight: FontWeight.w700,
                      //   fontSize: 12,
                      // ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    child: Text(
                      "${getLocationNumbers()} ${_i18n()["location"]}${(getLocationNumbers() > 1) ? Get.find<LanguageController>().userLanguageKey == LanguageType.EN ? 's' : '' : ''}",
                      style: txt.bodyText1!.copyWith(
                        // fontSize: getProportionateScreenHeight(13.sp),
                        color: Color(0xFF494949),
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
         //   SizedBox(height: 0.1.h),
            Column(
              children: List.generate(
                  viewController.savedLocs.value!.length,
                  (int index) => SavedLocationComponent(
                        savelocation: viewController.savedLocs.value![index],
                      )),
            ),
          ]));
        } else {
          return SavedLocationISEmpty();
        }
      }),
    );
  }
}
