import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

class DaRestaurantCard extends StatefulWidget {
  const DaRestaurantCard({Key? key, required this.restaurantId})
      : super(key: key);
  final String restaurantId;

  @override
  State<DaRestaurantCard> createState() => _DaRestaurantCardState();
}

class _DaRestaurantCardState extends State<DaRestaurantCard> {
  StreamSubscription? stream;
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  @override
  void initState() {
    // TODO: implement initState
    stream = Get.find<RestaurantsInfoController>()
        .getRestaurantAsStream(widget.restaurantId)
        .listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (restaurant.value != null) {
          return Card(
            margin: const EdgeInsets.only(bottom: 5),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                            restaurant.value!.info.image),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          restaurant.value!.info.name,
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      Switch(
                        value: restaurant.value!.state.available,
                        onChanged: (bool v) {
                          Get.find<RestaurantsInfoController>().setOpen(
                              isAv: v, restaurantId: restaurant.value!.info.id);
                        },
                        activeColor: primaryBlueColor,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              textStyle: Get.textTheme.bodyText1,
                              padding: const EdgeInsets.all(3),
                              primary: primaryBlueColor),
                          onPressed: () {
                            Get.toNamed(getROpEditInfoRoute(
                                restaurantId: restaurant.value!.info.id));
                          },
                          icon: Icon(Icons.person),
                          label: Text('${_i18n()["editProfile"]}'),
                        ),
                      ),
                      Flexible(
                        child: TextButton.icon(
                          onPressed: () {
                            Get.toNamed(getROpMenuRoute(
                                restaurantId: restaurant.value!.info.id));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              textStyle: Get.textTheme.bodyText1,
                              padding: const EdgeInsets.all(3),
                              primary: primaryBlueColor),
                          icon: Icon(Icons.settings),
                          label: Text('${_i18n()["editAdmin"]}'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else
          return Container();
      },
    );
  }
}
