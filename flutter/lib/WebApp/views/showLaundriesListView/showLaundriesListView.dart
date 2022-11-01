import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/LaundriesListView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/main.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:mezcalmos/WebApp/views/components/installAppBarComponent.dart';

class ShowLaundriesListView extends StatefulWidget {
  ShowLaundriesListView({Key? key}) : super(key: key);

  @override
  State<ShowLaundriesListView> createState() => _ShowLaundriesListViewState();
}

class _ShowLaundriesListViewState extends State<ShowLaundriesListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setupFirebase(
            launchMode: typeMode.toLaunchMode(),
            func: () {
              Get.put(LaundryController());
            }),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            return Scaffold(
              appBar: InstallAppBarComponent(),
              body: LaundriesListView(
                isRuningOnWeb: true,
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
