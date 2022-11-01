import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmerGrid extends StatelessWidget {
  const RestaurantShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // width: 300,
      // height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4.0,
              spreadRadius: -1),
        ],
      ),
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Container(
                width: Get.width,
                height: double.infinity,
                child: Shimmer.fromColors(
                  highlightColor: Colors.grey[400]!,
                  baseColor: Colors.grey[300]!,
                  child: Container(
                    // height: 10,
                    // width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(children: [
            //title
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 0, right: 10, left: 10),
              child: Shimmer.fromColors(
                highlightColor: Colors.grey[400]!,
                baseColor: Colors.grey[300]!,
                child: Container(
                  height: 20,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 0, right: 10, left: 10),
              child: Shimmer.fromColors(
                highlightColor: Colors.grey[400]!,
                baseColor: Colors.grey[300]!,
                child: Container(
                  height: 20,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ])
        ],
      ),
    );
  }
}
