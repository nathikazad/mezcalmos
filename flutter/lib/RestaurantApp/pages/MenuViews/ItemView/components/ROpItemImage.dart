import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"]["components"]["ROpItemImage"];

class ROpItemImage extends StatelessWidget {
  const ROpItemImage({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final ROpItemViewController viewController;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: viewController.getRightImage,
                      radius: 90,
                      child: (viewController.imageLoading.isTrue)
                          ? CircularProgressIndicator(
                              color: primaryBlueColor,
                            )
                          : (viewController.newImageFile.value == null &&
                                  viewController.newImageUrl.value == null)
                              ? Center(
                                  child: Text(
                                    '${_i18n()["addImage"]}',
                                    style: context.txt.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : null,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Material(
                          color: Colors.black,
                          shape: CircleBorder(),
                          child: InkWell(
                            customBorder: CircleBorder(),
                            onTap: () {
                              viewController.editImage(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Icon(
                                Icons.photo_camera,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
