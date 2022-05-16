import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantFutureBody.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({Key? key}) : super(key: key);

  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  /// List<Restaurant>
  List<Restaurant> restaurants = <Restaurant>[];

  /// RestaurantsInfoController
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());

  _ListRestaurantsScreenState() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()['restaurants']}",
        autoBack: true,
      ),
      floatingActionButton: FloatingCartComponent(),
      body: FutureBuilder<List<Restaurant>>(
        future: _restaurantsInfoController.getRestaurants(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Restaurant>> snapshot,
        ) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: Get.textTheme.bodyText1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search restaurants"),
                ),
                SwitchListTile(
                  value: true,
                  onChanged: (bool v) {},
                  activeColor: customerAppColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  title: Text("Show only open restaurents"),
                ),
                RestaurantFutureBody(snapshot: snapshot),
              ],
            ),
          );
        },
      ),
    );
  }
}
