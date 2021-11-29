import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
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
        appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              "${lang.strings['customer']['restaurant']['restaurants']}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Column(
            children: List.generate(
                restaurants.length,
                (index) => RestaurantCard(
                      restaurant: restaurants[index],
                      onClick: () {
                        Get.toNamed(getRestaurantRoute(restaurants[index].id));
                      },
                    )),
          ),
          // Expanded(
          //     child: Container(
          //         child: ListView(
          //             padding: const EdgeInsets.only(top: 10),
          //             children: restaurants
          //                 .map((restaurant) => ItemComponent(
          //                       imgUrl: restaurant.photo,
          //                       title: restaurant.name,
          //                       restaurantId: restaurant.id,
          //                       withBorder: true,
          //                       margin: const EdgeInsets.symmetric(
          //                           horizontal: 10, vertical: 5),
          //                       onClick: () {
          //                         Get.toNamed(
          //                             getRestaurantRoute(restaurant.id));
          //                       },
          //                     ))
          //                 .toList())))
        ]));
  }
}
