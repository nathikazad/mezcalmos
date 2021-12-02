import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class TowAvatarsComponent extends StatelessWidget {
  final OrderType type;
  final String url;

  final String? customerImage;
  TowAvatarsComponent(
      {required this.type, required this.url, this.customerImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 30,
              height: 30,
              child: CircleAvatar(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Container(
                            width: 30,
                            height: 30,
                            child: handleIfNetworkImage(
                                url: customerImage,
                                assetInCaseFailed: aDefaultAvatar)
                            // Image.network(
                            //   "$customerImage",
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: 40,
              width: 40,
              child: ClipOval(child: handleIfNetworkImage(url: url)
                  //      Image.network(
                  //   "$url",
                  //   fit: BoxFit.cover,
                  // )
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
