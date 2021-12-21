
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class NoUserIcon extends StatelessWidget {
  const NoUserIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
                'https://www.dovercourt.org/wp-content/uploads/2019/11/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg'),
            child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kSignInRouteOptional);
                },
              ),
            )));
  }
}
