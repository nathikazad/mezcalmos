import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
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
      margin: const EdgeInsets.only(right: 40),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: CachedNetworkImageProvider(topImg),
          ),

          Positioned(
            left: 30,
            // child: Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: Colors.white,
            //     ),
            //   ),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryBlueColor,
                border: Border.all(color: Colors.white, width: 1.5),
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
