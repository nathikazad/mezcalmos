import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/controllers/ROpCreateRestuarantViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class ROpCreateRestaurantImage extends StatelessWidget {
  const ROpCreateRestaurantImage({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final ROpCreateRestuarantViewController viewController;

  @override
  Widget build(BuildContext context) {
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
                  radius: 80,
                  child: (viewController.imageLoading.isTrue)
                      ? CircularProgressIndicator(
                          color: primaryBlueColor,
                        )
                      : (viewController.newImageFile.value == null &&
                              viewController.restaurantImage.value == null)
                          ? Center(
                              child: Text(
                                'Add image',
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
                          viewController.addImage(context);
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
  }
}
