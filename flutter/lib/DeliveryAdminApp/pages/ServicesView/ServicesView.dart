import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServicesView/components/DaRestaurantCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["ServicesView"];

//
class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  RxList<Laundry> laundries = RxList([]);
  RxList<Restaurant> restaurants = RxList([]);
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  StreamSubscription? laundiesStream;
  StreamSubscription? restStream;
  RestaurantsInfoController _restaurantsInfoController =
      Get.find<RestaurantsInfoController>();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    restaurants.value = await _restaurantsInfoController.getRestaurants();
    laundries.value = laundryInfoController.laundries;

    laundiesStream =
        laundryInfoController.laundries.stream.listen((List<Laundry> event) {
      laundries.value = event;
    });
    restStream = _restaurantsInfoController.restaurants.stream
        .listen((List<Restaurant> event) {
      restaurants.value = event;
    });
  }

  @override
  void dispose() {
    laundiesStream?.cancel();
    restStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            tabBar: TabBar(tabs: [
              Tab(
                text: "Restaurants",
              ),
              Tab(
                text: "Laundries",
              ),
            ]),
            onClick: Get.back,
            title: '${_i18n()["services"]}'),
        body: TabBarView(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                MezAddButton(onClick: () {
                  Get.toNamed(kAddRestaurantServiceRoute);
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  if (restaurants.isNotEmpty) {
                    return Column(
                      children: List.generate(
                          restaurants.value.length,
                          (int index) => DaRestaurantCard(
                                restaurant: restaurants[index],
                              )),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '${_i18n()["noLaundries"]}',
                        style: Get.textTheme.bodyText1,
                      ),
                    );
                  }
                })
              ],
            ),
          ),
          _laundrisList()
        ]),
      ),
    );
  }

  SingleChildScrollView _laundrisList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MezAddButton(onClick: () {
            Get.toNamed(kAddLaundryServiceRoute);
          }),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            if (laundries.isNotEmpty) {
              return Column(
                children: List.generate(laundries.value.length,
                    (int index) => _laundryCard(laundries.value[index])),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                child: Text(
                  '${_i18n()["noLaundries"]}',
                  style: Get.textTheme.bodyText1,
                ),
              );
            }
          })
        ],
      ),
    );
  }

  Card _addLaundryBtn() {
    return Card(
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(kAddLaundryServiceRoute);
        },
        child: Container(
          width: double.infinity,
          height: 70,
          alignment: Alignment.center,
          child: Icon(
            Icons.add_circle_outline,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _laundryCard(Laundry laundry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(laundry.info.image),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      laundry.info.name,
                      style: Get.textTheme.bodyText1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.all(3),
                                primary: primaryBlueColor),
                            onPressed: () {
                              Get.toNamed(
                                  getEditInfoRoute(laundryId: laundry.info.id));
                            },
                            icon: Icon(Icons.person),
                            label: Text('${_i18n()["editProfile"]}'),
                          ),
                        ),
                        Flexible(
                          child: TextButton.icon(
                            onPressed: () {
                              Get.toNamed(
                                  getAdminRoute(laundryId: laundry.info.id));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.all(3),
                                primary: primaryBlueColor),
                            icon: Icon(Icons.settings),
                            label: Text('${_i18n()["editAdmin"]}'),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
