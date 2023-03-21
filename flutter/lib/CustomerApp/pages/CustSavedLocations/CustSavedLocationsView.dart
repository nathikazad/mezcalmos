import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/components/SavedLocationIsEmpty.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/controllers/CustSavedLocationsViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/SaveLocationDailog.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["SavedLocationView"];

class SavedLocationView extends StatefulWidget {
  const SavedLocationView({
    Key? key,
  }) : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.savedLocations);
  }

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
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "${_i18n()["title"]}",
      ),
      bottomNavigationBar: MezButton(
        borderRadius: 0,
        height: 70,
        label: "${_i18n()["addNewLoc"]}",
        onClick: () async {
          // ignore: unawaited_futures
          MezLocation? newLoc = await PickLocationView.navigate(
            initialLocation: null,
            onSaveLocation: ({MezLocation? location}) async {
              if (location != null) {
                await savedLocationDailog(
                    context: context, loc: location, skippable: false);
              }
            },
          );
          await viewController.fetchLocations();
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 8.sp, left: 16),
                  child: Text(
                    "${_i18n()["location"] + 's'}",
                    style: txt.displaySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //   SizedBox(height: 0.1.h),
                Column(
                  children: List.generate(
                      viewController.savedLocs.value!.length,
                      (int index) => SavedLocationComponent(
                            savelocation:
                                viewController.savedLocs.value![index],
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
