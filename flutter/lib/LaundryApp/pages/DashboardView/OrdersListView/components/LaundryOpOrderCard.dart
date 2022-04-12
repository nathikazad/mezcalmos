/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:shimmer/shimmer.dart';

class LaundryOpOrderCard extends StatelessWidget {
  const LaundryOpOrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 8,
        bottom: 8,
        end: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _orderImageComponent(),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Customer name",
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      "Customer address",
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF65E189),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              color: Color(0xFFEDEDED),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total cost : 50.00 \$",
                  style: textTheme.bodyText2,
                ),
                const SizedBox(width: 24),
                Flexible(
                  child: Text(
                    "Date :  12/04/2021 at 08:20 AM",
                    style: textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _orderImageComponent() {
  const double imageSize = 46;
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: CachedNetworkImage(
      imageUrl: '',
      fit: BoxFit.fill,
      placeholder: (_, __) {
        return Shimmer.fromColors(
          child: Container(
            color: Colors.grey,
          ),
          highlightColor: Colors.grey[400]!,
          baseColor: Colors.grey[300]!,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 1),
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          height: imageSize,
          width: imageSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: keyAppColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            'C n'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    ),
  );
}
