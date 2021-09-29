import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/Restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/widgets/GetFutureData.dart';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  Widget getRestaurants() {
    return getStreamData(controller.getRestaurants(), (list) {
      return Text(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant list"),
      ),
      body: Center(child: getRestaurants()),
    );
  }
}
