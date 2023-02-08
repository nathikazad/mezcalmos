import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/controllers/UserProfileViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileView"];

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final UserProfileViewController viewController;

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
                      radius: 94,
                      backgroundColor: primaryBlueColor,
                      child: CircleAvatar(
                        backgroundColor: secondaryLightBlueColor,
                        backgroundImage: viewController.getRightImage,
                        radius: 90,
                        child: (viewController.imageLoading.isTrue)
                            ? CircularProgressIndicator(
                                color: primaryBlueColor,
                              )
                            : (viewController.newImageFile.value == null &&
                                    viewController.newImageUrl.value == null)
                                ? Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'Your face, your profile',
                                      style: Get.textTheme.bodyText2,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : null,
                      ),
                    ),
                    if (viewController.showImageSetter)
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Material(
                            color: primaryBlueColor,
                            shape: CircleBorder(),
                            child: InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {
                                //  viewController.editImage(context);
                                viewController.newImageUrl.value =
                                    "https://pm1.narvii.com/7153/e8bbf2c5f5214e36a4c05cc247b54819b1ddc5c4r1-720-1280v2_hq.jpg";
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
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
      },
    );
  }
}