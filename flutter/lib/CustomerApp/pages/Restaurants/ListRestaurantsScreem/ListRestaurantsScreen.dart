import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/components/searchField.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/NewViewRestaurant.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

class ListRestaurantsScreen extends StatefulWidget {
  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();

  List<Restaurant> restaurants = <Restaurant>[];
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());
  _ListRestaurantsScreenState() {
    _restaurantsInfoController.getRestaurants().then((value) {
      setState(() {
        restaurants = value;
      });
    });
  }
  @override
  void dispose() {
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        // appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController),
        appBar: CustomerAppBar(
          title: "${lang.strings['customer']['restaurant']['restaurants']}",
          autoBack: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SearchField(),
              Column(
                children: List.generate(
                    restaurants.length,
                    (index) => RestaurantCard(
                          restaurant: restaurants[index],
                          onClick: () {
                            // Get.toNamed(
                            //     getRestaurantRoute(restaurants[index].id));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NewRestaurantViewScreen(
                                            restaurant: restaurants[index])));
                          },
                        )),
              ),
            ]),
          ),
        ));
  }
}
