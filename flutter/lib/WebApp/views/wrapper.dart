import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'dart:html' as html;

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late String? restaurant_id;
  late String? device;
  late LanguageType? lang;
  // final RestaurantController controller
  @override
  void initState() {
    html.window.onUnload.listen((event) async {
      print('Reloaded');
    });
    restaurant_id = Get.parameters["id"].toString();
    device = Get.parameters["device"].toString();
    lang = Get.parameters["lang"].toString().toLanguageType();
    Get.find<LanguageController>().changeLangForWeb(lang);

    //firebase.json

    if (restaurant_id == null ||
        restaurant_id == ":id" ||
        restaurant_id == "") {
      Get.offNamed("/notfound");
      mezDbgPrint("this is the current id ${restaurant_id} it must be null 1");
    } else {
      mezDbgPrint("this is the current id ${restaurant_id!}");
      Get.find<RestaurantsInfoController>()
          .getRestaurant(restaurant_id!)
          .then((value) {
        if (value != null) {
          Get.offNamed(restaurantByID + "/" + restaurant_id!,
              arguments: [value, "webVirsion"]);
        } else {
          mezDbgPrint(
              "this is the current id ${restaurant_id} it must be null 2");
          Get.offNamed("/notfound");
        }
      }).catchError((e) {
        mezDbgPrint(
            "this is the current id ${restaurant_id} it must be null 3 error");
        Get.offNamed("/notfound");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
