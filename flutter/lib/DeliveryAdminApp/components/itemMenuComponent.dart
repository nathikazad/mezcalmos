import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
//import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';

class ItemMenuComponents extends StatelessWidget {
  final String? itemID;
  final String? photo;
  final num? price;
  final String? title;
  final GestureTapCallback? function;
  ItemMenuComponents(
      {this.itemID, this.photo, this.price, this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: Get.width,
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: const Color(0x1d101010), width: 0.5),
        boxShadow: [
          BoxShadow(
              color: const Color(0x0a000000),
              offset: Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 0)
        ],
        color: const Color(0xffffffff),
      ),
      child: InkWell(
        child: Row(
          children: [
            Container(
              width: 55,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  child: mLoadImage(url: photo)
                  // Image.network(
                  //   "$photo",
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "T$title",
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w500,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                      ),
                    ),
                    Text("\$$price",
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                              color: const Color(0xff000f1c),
                              fontWeight: FontWeight.w400,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.10000000149011612,
                    child: Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                begin: Alignment(0.1689453125, 0),
                                end: Alignment(1, 1),
                                colors: [
                                  const Color(0xff5582ff),
                                  const Color(0xffc54efc)
                                ]))),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 103, 122, 253),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        onTap: function,
      ),
    );
  }
}
