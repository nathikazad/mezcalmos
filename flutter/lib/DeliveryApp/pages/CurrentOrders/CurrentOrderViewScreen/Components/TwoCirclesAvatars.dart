import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TwoCirclesAvatar extends StatelessWidget {
  final String topImg;
  final String bottomImg;
  const TwoCirclesAvatar(
      {required this.topImg, required this.bottomImg, Key? key})
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
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(bottomImg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
