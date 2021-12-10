import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class TowAvatars extends StatelessWidget {
  final OrderType type;
  final String? url;
  TowAvatars({required this.type, this.url, Key? key}) : super(key: key);
  var widget = null;
  var color = null;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OrderType.Restaurant:
        //to do
        widget = FoodImage(
          sw: 20,
          sh: 20,
        );
        color = const Color(0xff5582ff).withOpacity(0.25);
        break;
      case OrderType.Taxi:
        //to do
        widget = TaxiImage(
          sw: 20,
          sh: 20,
        );
        color = Color(0xfffceb4d).withOpacity(0.25);
        break;
      default:
    }
    return Container(
      //color: Colors.red,
      width: 70,
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: color,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: widget,
              ),
            ),
          ),
          Positioned(
            left: 27,
            child: Container(
              width: 40,
              height: 40,
              child: ClipOval(
                  child: mLoadImage(url: url, fit: BoxFit.cover)
                  //     Image.network(
                  //   "$url",
                  //   fit: BoxFit.cover,
                  // )
                  ),
            ),
          )
        ],
      ),
    );
  }
}
