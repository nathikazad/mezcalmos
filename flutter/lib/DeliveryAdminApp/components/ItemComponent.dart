import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';

class ItemComponent extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? subtitle;
  final String? restaurantId;
  final bool? withBorder;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onClick;
  final EdgeInsetsGeometry? margin;
  // final int? index;
  ItemComponent(
      {this.imgUrl,
      this.title,
      this.subtitle,
      this.restaurantId,
      this.withBorder = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 10),
      this.margin,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: padding,
        margin: margin,
        //  width: Get.width,
        height: 60,
        decoration: BoxDecoration(
          border: (withBorder == false)
              ? null
              : Border.all(color: const Color(0x410d0d0d), width: 0.5),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff),
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 43,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: mLoadImage(url: imgUrl)
                  // Image.network(
                  //   "$imgUrl",
                  //   fit: BoxFit.cover,
                  // ),
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
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w600,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                    ),
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
      onTap: () {
        print("nothing");
        onClick!();
        // Get.to(() => ViewRestaurantScreen(restaurantId!),
        //     transition: Transition.rightToLeft,
        //     duration: Duration(milliseconds: 350));
      },
    );
    //
  }
}
