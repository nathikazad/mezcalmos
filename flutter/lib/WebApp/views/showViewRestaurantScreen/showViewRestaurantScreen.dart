import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/WebApp/main.dart';
import 'package:mezcalmos/WebApp/views/components/installAppBarComponent.dart';

import '../../../Shared/controllers/restaurantsInfoController.dart';

class ShowViewRestaurantScreen extends StatefulWidget {
  ShowViewRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<ShowViewRestaurantScreen> createState() =>
      _ShowViewRestaurantScreenState();
}

class _ShowViewRestaurantScreenState extends State<ShowViewRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setupFirebase(
          launchMode: "stage".toLaunchMode(),
        ),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            return Scaffold(
                appBar: InstallAppBarComponent(),
                body: ViewRestaurantScreen(
                  isRunningOnWeb: true,
                ));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
    // return FutureBuilder<bool>(
    //     future: setupFirebase(
    //       launchMode: "stage".toLaunchMode(),
    //     ).then((value) async {
    //       Get.to(() => ViewRestaurantScreen(), arguments: [
    //         await getTheShit(Get.parameters["id"].toString()),
    //         "webVirsion"
    //       ]);
    //       return value;
    //     }),
    //     builder: (context, snapShot) {
    //       if (snapShot.hasData && snapShot.data == true) {
    //         final LanguageController Lcontroller =
    //             Get.find<LanguageController>();

    //         return Scaffold(
    //             appBar: InstallAppBarComponent(),
    //             body: FutureBuilder<Restaurant?>(
    //                 future: Future<Restaurant?>(() async {
    //               String restaurant_id = Get.parameters["id"].toString();

    //               print("${Get.isRegistered<RestaurantsInfoController>()}");

    //               return getTheShit(Get.parameters["id"].toString());
    //             }), builder: (context, snapShot) {
    //               if (snapShot.hasData && snapShot.data != null) {
    //                 return Text(snapShot.data.toString());
    //               } else
    //                 return Container(
    //                   child: Center(
    //                     child: Text("Please wait ..."),
    //                   ),
    //                 );
    //             }));
    //       } else {
    //         return Scaffold(
    //           body: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     });
  }

  getTheShit(restaurant_id) async {
    await Get.find<RestaurantsInfoController>()
        .getRestaurant(restaurant_id)
        .then((value) {
      return value;
    });
  }
}
