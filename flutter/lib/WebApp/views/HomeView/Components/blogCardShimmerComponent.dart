import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class BlogCardShimmerComponent extends StatelessWidget {
  BlogCardShimmerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MezCalmosResizer.isSmallMobile(context) ? 11.sp : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Container(
                height: getHeightOfImage(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                    ),
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    direction: ShimmerDirection.ltr,
                  ),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 10,
            child: Shimmer.fromColors(
              child: Container(
                color: Colors.grey,
              ),
              highlightColor: Colors.grey[400]!,
              baseColor: Colors.grey[300]!,
              direction: ShimmerDirection.ltr,
            ),
          ),
          SizedBox(
            height: MezCalmosResizer.isMobile(context) ||
                    MezCalmosResizer.isSmallMobile(context)
                ? 10
                : 15,
          ),
          SizedBox(
            height: MezCalmosResizer.isMobile(context) ||
                    MezCalmosResizer.isSmallMobile(context)
                ? 15
                : 20,
          ),
          Container(
            height: 10,
            child: Shimmer.fromColors(
              child: Container(
                color: Colors.grey,
              ),
              highlightColor: Colors.grey[400]!,
              baseColor: Colors.grey[300]!,
              direction: ShimmerDirection.ltr,
            ),
          ),
          Container(
            height: 10,
            child: Shimmer.fromColors(
              child: Container(
                color: Colors.grey,
              ),
              highlightColor: Colors.grey[400]!,
              baseColor: Colors.grey[300]!,
              direction: ShimmerDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 13.sp;
    } else {
      return 7.sp;
    }
  }

  double getHeightOfImage(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 42.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 75.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 130.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 45.sp;
    } else {
      return 50.sp;
    }
  }

  double getSizeForDateText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 7.5;
    } else {
      return 6.sp;
    }
  }

  double getSizeForTimeOrReadingText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 7.5;
    } else {
      return 0;
    }
  }
}
