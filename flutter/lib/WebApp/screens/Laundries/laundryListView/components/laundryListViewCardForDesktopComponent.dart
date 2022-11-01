import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/components/ShippingCostComponent.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForDesktopAndTablet.dart';

class laundryListViewCardForDesktopComponent extends StatelessWidget {
  laundryListViewCardForDesktopComponent(
      {Key? key,
      required this.laundry,
      this.onClick,
      required this.shippingPrice})
      : super(key: key);
  final Laundry laundry;
  final GestureTapCallback? onClick;
  final num shippingPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                offset: Offset(0, 1),
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 4.0,
                spreadRadius: -1),
          ],
        ),
        child: Column(
          children: [
            Flexible(
              //flex: 2,
              child: Container(
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Container(
                    width: Get.width,
                    child: Image(
                      image: NetworkImage(
                        '${laundry.info.image}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                //title
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${laundry.info.name}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: TitleSize(context),
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                  ),
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.grey.shade800,
                      size: 18,
                    ),
                    ShippingCostComponent(
                      shippingCost: shippingPrice,
                      alignment: MainAxisAlignment.start,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${laundry.averageNumberOfDays} Days",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(children: [
                        Icon(
                          Icons.north_east,
                          size: 15,
                        ),
                      ]),
                    ),
                    Text(
                      "\$${laundry.laundryCosts.minimumCost}/kg",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
