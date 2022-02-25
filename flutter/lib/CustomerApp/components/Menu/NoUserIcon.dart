import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
            radius: 15.h,
            backgroundImage: AssetImage(aDefaultAvatar),
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
