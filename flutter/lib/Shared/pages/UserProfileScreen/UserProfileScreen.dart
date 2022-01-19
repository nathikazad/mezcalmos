import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/Component/meddleWidgetUserProfile.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/Component/userImageProfile.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/Component/userProfileButton.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/Component/userProfileScreenTitle.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

enum AccountState {
  free,
  picked,
  // cropped,
}
const mypadding = const EdgeInsets.symmetric(horizontal: 10);

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  AuthController auth = Get.find<AuthController>();
  LanguageController lang = Get.find<LanguageController>();
  AccountState state = AccountState.free;
  Rx<bool> isEditing = false.obs;
  TextEditingController textController = new TextEditingController();
  File? imageFile;

  @override
  void initState() {
    // should only executes once because when state rebuilds upon any focus (This gets re-executes making it impossible to apply userName changes)
    super.initState();
    if (auth.user?.name != null || auth.user?.image != defaultPic) {
    } else {
      isEditing.value = true;
    }

    textController.text = auth.user?.name == null ? "" : auth.user!.name!;
    imageFile = File("${auth.user?.image}");
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  SideMenuDrawerController _sideMenuDraweController =
      Get.find<SideMenuDrawerController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return WillPopScope(
        onWillPop: () async {
          if (!auth.isDisplayNameSet()) {
            // Make it so the user can not go back unless
            return false;
          } else {
            // user can go back !

            return true;
          }
        },
        child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, function: () {
            if (auth.user?.name == null || auth.user?.image == defaultPic) {
              if (textController.text == null || textController.text.isEmpty) {
                checkNameValidation();
              } else {
                if (!checkNameValidation()) {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 80,
                        color: Colors.black,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '${lang.strings['shared']['userInfo']['saveTxt']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    child: Text(
                                        "${lang.strings['shared']['userInfo']["saveBtn"]}"),
                                    onPressed: () async {
                                      if (imageFile?.path != defaultPic) {
                                        var xUrl = await auth.getImageUrl(
                                            imageFile!, auth.user!.uid);
                                        mezDbgPrint(xUrl);
                                        auth.user!.image = xUrl;
                                        auth.editUserProfile(
                                            textController.text.trim(), xUrl);
                                        isEditing.value = true;
                                      } else {
                                        if (auth.user!.image == defaultPic) {
                                          mezDbgPrint(
                                              "please change the image");

                                          showAddImageDailog();
                                        } else {
                                          mezDbgPrint("the path is empty");

                                          auth.editUserProfile(
                                              textController.text.trim(),
                                              auth.user!.image);
                                          isEditing.value = !isEditing.value;
                                          Get.back();
                                          Get.back();
                                        }
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  // showUserBottomSheet(
                  //     context: context,
                  //);
                } else {
                  //do: somethig
                }
              }
              ;
            } else {
              Get.back();
            }
          }),
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Obx(
                  () => auth.user != null
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: Get.height, maxWidth: Get.width),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                userProfileScreenTitle(),
                                // Spacer(),
                                Obx(
                                  () => UserImageProfile(
                                    isEditing: isEditing.value,
                                    onImageUserChanged: (val) {
                                      setState(() {
                                        imageFile = val;
                                      });
                                    },
                                  ),
                                ),

                                Obx(() => meddleWidgetUserProfile(
                                    isEditing: isEditing.value,
                                    controller: textController,
                                    keyForm: _formKey)),

                                Obx(
                                  () => UserProfileButton(
                                    function: () async {
                                      if (checkNameValidation()) {
                                      } else {
                                        mezDbgPrint(
                                            " ~~~~ ||| ===>${imageFile?.path}");
                                        if (!isEditing.value) {
                                          mezDbgPrint(
                                              "editing" + textController.text);

                                          isEditing.value = !isEditing.value;
                                        } else {
                                          mezDbgPrint(
                                              "Saved ${textController.text}");

                                          auth.user!.name = textController.text;
                                          if (imageFile?.path != defaultPic) {
                                            var xUrl = await auth.getImageUrl(
                                                imageFile!, auth.user!.uid);
                                            mezDbgPrint(xUrl);
                                            auth.user!.image = xUrl;
                                            auth.editUserProfile(
                                                textController.text.trim(),
                                                xUrl);
                                            isEditing.value = !isEditing.value;
                                          } else {
                                            if (auth.user!.image ==
                                                defaultPic) {
                                              mezDbgPrint(
                                                  "please change the image");
                                              showAddImageDailog();
                                            } else {
                                              mezDbgPrint("the path is empty");

                                              auth.editUserProfile(
                                                  textController.text.trim(),
                                                  auth.user!.image);
                                              isEditing.value =
                                                  !isEditing.value;
                                            }
                                          }
                                        }
                                      }
                                    },
                                    isEditing: isEditing.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : MezLogoAnimation(),
                ),
              ),
            ),
          ),
        ));
  }

  void showAddImageDailog() {
    Get.defaultDialog(
        title: "${lang.strings["shared"]["userInfo"]["choosePic"]}",
        middleText: "",
        content: Column(
          children: [
            Container(
              child: Icon(
                Icons.add_a_photo,
                size: 50,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Container(
                    width: Get.width,
                    child: Center(
                        child: Text(
                            "${lang.strings["shared"]["userInfo"]["cancel"]}"))))
          ],
        ));
  }

  bool checkNameValidation() {
    if (_formKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }
}
