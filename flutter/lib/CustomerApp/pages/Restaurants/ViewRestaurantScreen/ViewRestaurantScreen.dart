import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import 'components/buildRestaurantsItems.dart';

class ViewRestaurantScreen extends StatefulWidget {
  ViewRestaurantScreen({Key? key}) : super(key: key);
//ViewRestaurantScreen
  @override
  _ViewRestaurantScreenState createState() => _ViewRestaurantScreenState();
}

class _ViewRestaurantScreenState extends State<ViewRestaurantScreen> {
  late String restaurantId;
  Restaurant? restaurant;
  LanguageController lang = Get.find<LanguageController>();
  RestaurantsInfoController controller =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());

  @override
  void initState() {
    this.restaurantId = Get.parameters['restaurantId']!;
    mezDbgPrint("param rest_id ===> $restaurantId");
    controller.getRestaurant(restaurantId).then((value) {
      mezDbgPrint("Fetched ===> $value");
      setState(() {
        restaurant = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return (restaurant?.items == null)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: Scaffold(
              backgroundColor: Color.fromRGBO(237, 237, 237, 1),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: Get.width,
                      height: 270,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: handleIfNetworkImage(
                              url: restaurant!.photo, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Text(restaurant!.name.capitalizeFirstofEach,
                          style: txt.headline1!.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.centerLeft,
                      child: Text("Menu",
                          textAlign: TextAlign.left, style: txt.headline2),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    buildResturantItems(restaurant!.items, restaurantId),
                  ],
                ),
              ),
            ),
          );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
