import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: CachedNetworkImage(
        width: 65,
        height: 65,
        imageUrl: image ?? "",
        imageBuilder: (_, ImageProvider imageProvider) {
          return Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            ),
          );
        },
        errorWidget: (_, __, ___) => Container(
          width: 65,
          height: 65,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(aNoImage))),
          ),
        ),
        placeholder: (_, __) => Container(
          width: 80,
          height: 60,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
