import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/ListOrdersScreen/components/twoAvatars.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';

class OrderCardComponenet extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;
  final String price;
  final OrderType type;
  final String? url;
  GestureTapCallback? onPress;
  OrderCardComponenet(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.price,
      required this.type,
      this.url,
      this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: Get.width,
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0xffffffff),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TowAvatars(
                    type: type,
                    url: url,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("$title",
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Text(
                            "$date",
                            // "${ff.format(element.orderTime)}",
                            style: const TextStyle(
                                color: const Color(0xff000f1c),
                                fontWeight: FontWeight.w700,
                                fontFamily: "ProductSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            MezcalmosIcons.map_marker,
                            size: 12,
                          ),
                          Expanded(
                            child: Container(
                              child: Text("$subTitle",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0)),
                            ),
                          ),
                          Text("\$$price",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                              ),
                              textAlign: TextAlign.right)
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          onTap: onPress,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
