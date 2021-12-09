import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/userMenuComponent.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantSliverAppBar extends StatelessWidget {
  const RestaurantSliverAppBar({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: 300,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      actions: [UserMenu()],
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(12),
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        title: Text(
          restaurant.name,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
        background: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(restaurant.photo), fit: BoxFit.cover)),
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black.withOpacity(0.7),
                const Color(0x00000000).withOpacity(0.1),
                Colors.black.withOpacity(0.7),
              ])),
        ),
      ),
    );
  }
}
