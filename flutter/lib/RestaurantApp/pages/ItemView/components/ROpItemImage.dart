import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class ROpItemImage extends StatelessWidget {
  const ROpItemImage({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final ItemViewController viewController;

  @override
  Widget build(BuildContext context) {
    return FormField(
      // validator: (Object? value) {
      //   if (viewController.newImageFile.value == null &&
      //       viewController.newImageUrl.value == null) {
      //     return "Image is required";
      //   }
      //   return null;
      // },
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
                      radius: 65,
                      child: (viewController.imageLoading.isTrue)
                          ? CircularProgressIndicator(
                              color: primaryBlueColor,
                            )
                          : (viewController.newImageFile.value == null &&
                                  viewController.newImageUrl.value == null)
                              ? Center(
                                  child: Text(
                                    "Add item picture",
                                    style: Get.textTheme.bodyText1,
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
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              // if (!state.isValid)
              //   Container(
              //       margin: const EdgeInsets.only(top: 5),
              //       child: Text(
              //         state.errorText ?? "",
              //         style:
              //             Get.textTheme.subtitle1?.copyWith(color: Colors.red),
              //       ))
            ],
          ),
        );
      },
    );
  }
}