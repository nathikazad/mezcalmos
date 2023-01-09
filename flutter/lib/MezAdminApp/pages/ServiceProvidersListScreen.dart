import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

class ServiceProvidersListScreen extends StatefulWidget {
  const ServiceProvidersListScreen({
    this.onMenuClick,
    this.onOperatorsClick,
    this.onOrdersClick,
    super.key,
  });
  final Function? onOrdersClick;
  final Function? onMenuClick;
  final Function? onOperatorsClick;
  @override
  State<ServiceProvidersListScreen> createState() =>
      _ServiceProvidersListScreenState();
}

class _ServiceProvidersListScreenState
    extends State<ServiceProvidersListScreen> {
  final MezAdminAuthController _mezAdminAuthController =
      Get.find<MezAdminAuthController>();

  RxList<Restaurant> restaus = <Restaurant>[].obs;

  @override
  void initState() {
    _fetchServiceProviders();
    super.initState();
  }

  void _fetchServiceProviders() {
    // TODO : fetch services list
    fetch_restaurants().then((value) {
      mezDbgPrint("[MMM] Fetched ${value.length}");
      restaus.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Obx(
        () => Column(
          children:
              restaus.map((element) => _serviceCardComponent(element)).toList(),
        ),
      ),
    );
  }

  Widget _serviceCardComponent(Restaurant restaurant) {
    // TODO : ServiceCardComponent

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
                  backgroundImage:
                      CachedNetworkImageProvider(restaurant.info.image),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    restaurant.info.name,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: (bool v) async {
                    await Get.find<RestaurantsInfoController>().setOpen(
                        status: 'closed_indefinitely',
                        restaurantId: restaurant.info.hasuraId);
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
                        foregroundColor: primaryBlueColor,
                        backgroundColor: Colors.transparent,
                        textStyle: Get.textTheme.bodyText1,
                        padding: const EdgeInsets.all(3)),
                    onPressed: () => widget.onMenuClick?.call(),
                    icon: Icon(Icons.restaurant),
                    label: Text('Menu'),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: () =>
                        widget.onOrdersClick?.call(restaurant.info.hasuraId),
                    style: TextButton.styleFrom(
                        foregroundColor: primaryBlueColor,
                        backgroundColor: Colors.transparent,
                        textStyle: Get.textTheme.bodyText1,
                        padding: const EdgeInsets.all(3)),
                    icon: Icon(Icons.history),
                    label: Text('Orders'),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: () => widget.onOperatorsClick?.call(),
                    style: TextButton.styleFrom(
                        foregroundColor: primaryBlueColor,
                        backgroundColor: Colors.transparent,
                        textStyle: Get.textTheme.bodyText1,
                        padding: const EdgeInsets.all(3)),
                    icon: Icon(Icons.support_agent),
                    label: Text('operators'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
