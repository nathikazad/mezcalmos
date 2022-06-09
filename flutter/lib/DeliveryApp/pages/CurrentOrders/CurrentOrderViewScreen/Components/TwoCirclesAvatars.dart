import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class TwoCirclesAvatar extends StatelessWidget {
  final String topImg;
  // final String bottomImg;
  final IconData bottomIconData;
  const TwoCirclesAvatar(
      {required this.topImg, required this.bottomIconData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 85,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 6,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(topImg),
            ),
          ),
          Positioned(
            bottom: 6,
            // child: Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: Colors.white,
            //     ),
            //   ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryBlueColor,
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Icon(
                  bottomIconData,
                  color: Colors.white,
                ),
              ),
            ),

            // CircleAvatar(
            //   radius: 20,
            //   backgroundImage: CachedNetworkImageProvider(bottomImg),
            // ),
          ),
          // ),
        ],
      ),
    );
  }
}
