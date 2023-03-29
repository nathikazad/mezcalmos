import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]["notesWidget"];

class OrderBillImage extends StatelessWidget {
  const OrderBillImage({super.key, required this.billImage, this.margin});
  final String? billImage;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    if (billImage != null && billImage!.isURL) {
      return Card(
        margin: margin ?? const EdgeInsets.only(top: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Bill",
                style: context.txt.bodyLarge,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 4),
              Container(
                height: 20.h,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              width: 70.w,
                              height: 60.h,
                              child: PhotoView(
                                imageProvider: CachedNetworkImageProvider(
                                  billImage!,
                                  //  style: context.txt.titleSmall,
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: CachedNetworkImage(
                    imageUrl: billImage!,
                    fit: BoxFit.contain,

                    //  style: context.txt.titleSmall,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );
    } else
      return SizedBox();
  }
}
