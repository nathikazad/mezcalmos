import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/Utils/GenerateTheNameExtension.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/MenuComponent.dart';
import 'package:mezcalmos/CustomerApp/components/MyCartAppBarIcon.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantSliverAppBar extends StatelessWidget {
  RestaurantSliverAppBar({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;
  RestaurantController controller = Get.find<RestaurantController>();
  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: 220,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        MyCartAppBarIcon(iconColor: Colors.white),
        MenuComponent(padding: 2),
      ],
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(12),
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        title: Text(
          restaurant.info.name,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
        background: CachedNetworkImage(
          imageUrl: restaurant.info.image,
          fit: BoxFit.cover,
          imageBuilder: (_, __) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(restaurant.info.image),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withOpacity(0.7),
                  const Color(0x00000000).withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          placeholder: (_, __) {
            return Shimmer.fromColors(
              child: Container(
                height: 63,
                width: 63,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              highlightColor: Colors.grey[400]!,
              baseColor: Colors.grey[300]!,
              direction: ShimmerDirection.ltr,
            );
          },
          // placeholder: (context, url) => Container(
          //   width: 15,
          //   height: 15,
          //   child: Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          // errorWidget: (context, url, error) => Container(
          //   width: 15,
          //   height: 15,
          //   child: Center(
          //     child: Icon(Icons.error),
          //   ),
          // ),
          errorWidget: (_, __, ___) {
            return Container(
              height: 63,
              width: 63,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                restaurant.info.name.generateTheName(),
                style: const TextStyle(
                  color: Color.fromRGBO(172, 89, 252, 0.8),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
