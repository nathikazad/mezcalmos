import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemInformationCart extends StatefulWidget {
  final String itemName;
  final String restaurantName;
  final String itemsPrice;
  final String imageUrl;
  ItemInformationCart(
      {Key? key,
      required this.imageUrl,
      required this.itemName,
      required this.restaurantName,
      required this.itemsPrice})
      : super(key: key);

  @override
  _ItemInformationCartState createState() => _ItemInformationCartState();
}

class _ItemInformationCartState extends State<ItemInformationCart> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      width: Get.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          //===================== item image avatar=============
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 40,
                width: 40,
                child: Image.network(
                  "${widget.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: Get.width * 0.495,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //===================== restaurant name=================
                Container(
                  child: Text(
                    "${widget.restaurantName}",
                    style: txt.subtitle2!
                        .copyWith(fontSize: 9, fontWeight: FontWeight.w500),
                  ),
                ),

                Row(
                  children: [
                    Container(
                      //===================== item name=======================
                      child: Text(
                        "${widget.itemName}",
                        style: txt.headline2,
                      ),
                    ),
                    Spacer(),
                    Container(
                      //===================== items price========================
                      child: Text(
                        "${widget.itemsPrice} \$",
                        style: txt.headline2!
                            .copyWith(color: Color.fromRGBO(172, 89, 252, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
