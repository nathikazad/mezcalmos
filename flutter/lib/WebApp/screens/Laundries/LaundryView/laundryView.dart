import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/LaundryView/components/laundryViewForDesktop.dart';
import 'package:mezcalmos/WebApp/screens/Laundries/LaundryView/components/laundryViewForMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/MezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/ChangeLagWithParams.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

class LaundryView extends StatefulWidget {
  const LaundryView({Key? key}) : super(key: key);

  @override
  State<LaundryView> createState() => _LaundryViewState();
}

class _LaundryViewState extends State<LaundryView> {
  Rx<bool> isLoadded = false.obs;
  Laundry? laundry = null;

  @override
  void initState() {
    mezDbgPrint("this is the id of laundry ${QR.params['id'].toString()}");
    ever(isLoadded, (val) {
      changeLangWithParams();
      Get.find<LaundryController>()
          .getLaundry(QR.params['id'].toString())
          .then((value) {
        laundry = value;
        mezDbgPrint(laundry!.toJson());
        setState(() {});
      }).catchError((err, stk) {
        mezDbgPrint(
            "this is another error in laundry item view screen ${err.toString()}");
        QR.to("/404");
      });
      return val;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setupFirebase(
            launchMode: typeMode.toLaunchMode(),
            func: () {
              isLoadded.value = true;
            }),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true && laundry != null) {
            return Scaffold(
                appBar: InstallAppBarComponent(),
                bottomNavigationBar: MezBottomBar(),
                body: getResponciveWidget(context, laundry!));
          } else {
            return Scaffold(
              body: Center(child: Text("loading")),
            );
          }
        });
  }

  Widget getResponciveWidget(BuildContext context, Laundry laundry) {
    if (MezCalmosResizer.isMobile(context) ||
        MezCalmosResizer.isSmallMobile(context)) {
      return LaundryViewForMobile(
        laundry: laundry,
      );
    } else {
      return LaundryViewForDesktop(
        laundry: laundry,
      );
    }
  }
}
