import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/ListRestaurantsScreen.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/main.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:mezcalmos/WebApp/views/components/installAppBarComponent.dart';

class ShowListOfRestaurants extends StatefulWidget {
  ShowListOfRestaurants({Key? key}) : super(key: key);

  @override
  State<ShowListOfRestaurants> createState() => _ShowListOfRestaurantsState();
}

class _ShowListOfRestaurantsState extends State<ShowListOfRestaurants> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            return Scaffold(
              appBar: InstallAppBarComponent(),
              body: ListRestaurantsScreen(
                isRunningOnWeb: true,
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
