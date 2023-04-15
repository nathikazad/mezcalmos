/*
* Created By Mirai Devs.
* On 3/25/2022.
*/
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmerCard extends StatelessWidget {
  const RestaurantShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          height: 145,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Shimmer.fromColors(
                        highlightColor: Colors.grey[400]!,
                        baseColor: Colors.grey[300]!,
                        child: Container(
                          height: 10,
                          width: 40.mezW,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Shimmer.fromColors(
                        highlightColor: Colors.grey[400]!,
                        baseColor: Colors.grey[300]!,
                        child: Container(
                          height: 10,
                          width: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Shimmer.fromColors(
                        highlightColor: Colors.grey[400]!,
                        baseColor: Colors.grey[300]!,
                        child: Container(
                          height: 10,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Shimmer.fromColors(
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              child: Container(
                                height: 10.mezSp,
                                width: 10.mezSp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Shimmer.fromColors(
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              child: Container(
                                height: 10,
                                width: 32.5.mezW,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Shimmer.fromColors(
                highlightColor: Colors.grey[400]!,
                baseColor: Colors.grey[300]!,
                child: Container(
                  height: double.infinity,
                  width: 35.mezW,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
