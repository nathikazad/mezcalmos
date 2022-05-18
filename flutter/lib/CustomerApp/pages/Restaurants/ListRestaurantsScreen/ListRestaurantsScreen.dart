import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantFutureBody.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
  List<Restaurant> searchedRestaurants = <Restaurant>[];
  String? searchQuerry;

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
            mezDbgPrint("Updating :::::");

            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    style: Get.textTheme.bodyText1,
                    onChanged: (String value) {
                      if (value.length > 2) {
                        _restaurantsInfoController.querry = value;
                        setState(() {
                          _restaurantsInfoController.getRestaurants();
                        });
                      } else {
                        _restaurantsInfoController.querry = '';

                        setState(() {
                          _restaurantsInfoController.getRestaurants();
                        });
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search restaurants"),
                  ),
                  SwitchListTile(
                    value: _restaurantsInfoController.showOnlyOpen.isTrue,
                    onChanged: (bool v) {
                      _restaurantsInfoController.showOnlyOpen.value =
                          !_restaurantsInfoController.showOnlyOpen.value;
                      setState(() {
                        _restaurantsInfoController.getRestaurants();
                      });
                    },
                    activeColor: customerAppColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    title: Text("Show only open restaurents"),
                  ),
                  RestaurantFutureBody(
                    snapshot: snapshot,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
