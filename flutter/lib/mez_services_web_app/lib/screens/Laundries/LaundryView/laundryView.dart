import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/LaundryController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/helpers/changeLagWithParams.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/models/Services/Laundry.dart';
import 'package:mez_services_web_app/screens/Laundries/LaundryView/components/laundryViewForDesktop.dart';
import 'package:mez_services_web_app/screens/Laundries/LaundryView/components/laundryViewForMobile.dart';
import 'package:mez_services_web_app/screens/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezBottomBar.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
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
    print("this is the id of laundry ${QR.params['itemId'].toString()}");
    ever(isLoadded, (val) {
      changeLangWithParams();
      Get.find<LaundryController>()
          .getLaundry(QR.params['itemId'].toString())
          .then((value) {
        laundry = value;
        print(laundry!.toJson());
        setState(() {});
      }).catchError((err, stk) {
        print(
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
