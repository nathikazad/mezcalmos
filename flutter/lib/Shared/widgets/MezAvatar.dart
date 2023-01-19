import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class MezAvatar extends StatefulWidget {
  const MezAvatar(
      {super.key,
      required this.raduis,
      required this.imageUrl,
      this.showDefaultImageOnError = true,
      this.imagePlaceholderAsset = aNoImage});
  final String imageUrl;
  final double raduis;
  final bool showDefaultImageOnError;
  final String imagePlaceholderAsset;

  @override
  State<MezAvatar> createState() => _MezAvatarState();
}

class _MezAvatarState extends State<MezAvatar> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Show image => $showImage");
    if (showImage == true) {
      return CircleAvatar(
        radius: widget.raduis,
        backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
        onBackgroundImageError: (Object exception, StackTrace? stackTrace) {
          setState(() {
            showImage = false;
          });
        },
      );
    } else if (widget.showDefaultImageOnError) {
      return CircleAvatar(
        radius: widget.raduis,
        backgroundImage: AssetImage(widget.imagePlaceholderAsset),
      );
    } else
      return SizedBox();
  }
}
