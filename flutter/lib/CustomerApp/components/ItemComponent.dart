import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';

class ItemComponent extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? subtitle;
  final String? restaurantId;
  // final int? index;
  ItemComponent({this.imgUrl, this.title, this.subtitle, this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: (subtitle != null)
            ? null
            : const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        //  width: Get.width,
        height: 60,
        decoration: BoxDecoration(
            border: (subtitle != null)
                ? null
                : Border.all(color: const Color(0x410d0d0d), width: 0.5),
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffffffff)),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 43,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  "$imgUrl",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),

            // width: Get.width * 0.65,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w500,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
                (subtitle != null)
                    ? Text("Mushroom,Rice,Beans",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w400,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left)
                    : SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            )
          ],
        ),
      ),
      onTap: (subtitle != null)
          ? null
          : () {
              print("nothing");
              Get.to(() => ViewRestaurantScreen(restaurantId!),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 350));
            },
    );
  }
}
