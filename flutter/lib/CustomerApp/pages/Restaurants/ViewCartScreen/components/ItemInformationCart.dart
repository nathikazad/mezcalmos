import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemInformationCart extends StatefulWidget {
  const ItemInformationCart({
    Key? key,
    this.imageUrl,
    required this.itemName,
    required this.restaurantName,
    required this.itemsPrice,
  }) : super(key: key);

  final String itemName;
  final String restaurantName;
  final String itemsPrice;
  final String? imageUrl;

  @override
  _ItemInformationCartState createState() => _ItemInformationCartState();
}

class _ItemInformationCartState extends State<ItemInformationCart> {
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      // width: Get.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.imageUrl != null)
            //===================== item image avatar=============
            Flexible(
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl!,
                  imageBuilder: (_, ImageProvider imageProvider) {
                    return Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                  errorWidget: (_, __, ___) => Container(
                    width: 70,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300,
                      ),
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                  placeholder: (_, __) => Container(
                    width: 70,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.imageUrl != null) const SizedBox(width: 10),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: Text(
              "${widget.itemName}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: txt.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
