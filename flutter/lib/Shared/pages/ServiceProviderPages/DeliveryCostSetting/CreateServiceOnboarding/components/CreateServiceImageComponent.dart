import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["CreateServiceInfoPage"];

class CreateServiceImageComponent extends StatelessWidget {
  const CreateServiceImageComponent({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (Object? value) {
        if (viewController.newImageFile.value == null &&
            viewController.newImageUrl.value == null) {
          return "${_i18n()['imageError']}";
        }
        return null;
      },
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
                                      'Image',
                                      style: Get.textTheme.bodyText2,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : null,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Material(
                          color: primaryBlueColor,
                          shape: CircleBorder(),
                          child: InkWell(
                            customBorder: CircleBorder(),
                            onTap: () {
                              viewController.newImageUrl.value =
                                  "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";
                              //  viewController.editImage(context);
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
              if (!state.isValid)
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      state.errorText ?? "",
                      style:
                          Get.textTheme.subtitle1?.copyWith(color: Colors.red),
                    ))
            ],
          ),
        );
      },
    );
  }
}
