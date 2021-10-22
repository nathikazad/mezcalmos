import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum AccountState {
  free,
  picked,
  // cropped,
}
const mypadding = const EdgeInsets.symmetric(horizontal: 10);

class UserProfile extends StatelessWidget {
  AuthController auth = Get.find<AuthController>();
  LanguageController lang = Get.find<LanguageController>();

  var state = Rx<AccountState>(AccountState.free);
  var isEditing = false.obs;
  TextEditingController textController = new TextEditingController();
  Rx<File> imageFile = Rx<File>(File("test"));
  Widget _buildButtonIcon() {
    if (state.value == AccountState.free)
      return Icon(
        Icons.photo_camera_outlined,
        color: Colors.grey[500],
      );
    else if (state.value == AccountState.picked)
      return Icon(
        Icons.delete,
        color: Colors.grey[500],
      );
    // else if (state.value == AccountState.cropped)
    //   return Icon(
    //     Icons.delete_outline_outlined,
    //     color: Colors.grey[500],
    //   );
    else
      return Container();
  }

  void _clearImage() {
    imageFile.value = File("test");

    state.value = AccountState.free;
  }

  Future<Null> _pickImage() async {
    var pickedImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    imageFile.value = File(pickedImage!.path);
    if (imageFile.value.path != "test") {
      state.value = AccountState.picked;
      _cropImage();
    }
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.value.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile.value = croppedFile;
      state.value = AccountState.picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("++++++++++ USERPRODILE SCREEEN GOT REBUILT --------");

    textController.text =
        (auth.user?.displayName == null) ? "user" : "${auth.user?.displayName}";

    return WillPopScope(
      onWillPop: () async {
        mezDbgPrint("Will popppppopopopopopopopo scope !");
        textController.dispose();
        return true;
      },
      child: Scaffold(
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () {
          textController.dispose();
          Get.back();
        }),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.88,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                Container(
                  child: Text(
                    lang.strings['shared']['userInfo']["title"],
                    style: TextStyle(color: Colors.black, fontSize: 45),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(
                //   height: Get.height * 0.05,
                // ),
                Spacer(),
                Container(
                  height: 161,
                  width: 161,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Container(
                            height: 161,
                            width: 161,
                            color: Color.fromRGBO(243, 243, 243, 1),
                            child: Obx(() => (imageFile.value.path == "test")
                                ? (auth.user!.image == null ||
                                        auth.user!.image == "")
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Choose A \n Photo",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Image.network(
                                        "${auth.user!.image}",
                                        fit: BoxFit.cover,
                                      )
                                : Image.file(
                                    imageFile.value,
                                    fit: BoxFit.cover,
                                  ))),
                      ),
                      Obx(() => (isEditing.value)
                          ? Positioned(
                              left: 124,
                              top: 124,
                              child: InkWell(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    child: ClipOval(
                                      child: Container(
                                        child: _buildButtonIcon(),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (state.value == AccountState.free)
                                      _pickImage();
                                    else if (state.value == AccountState.picked)
                                      //   _cropImage();
                                      // else if (state.value == AccountState.cropped)
                                      _clearImage();
                                  }
                                  // _cropImage,
                                  ),
                            )
                          : Container())
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  child: Obx(() => (!isEditing.value)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Obx(
                                () => Center(
                                  child: Text(
                                    (auth.user!.displayName == null)
                                        ? "User"
                                        : "${auth.user!.displayName}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'psb',
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                lang.strings['shared']['userInfo']["fullName"],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.blue)),
                              child: TextField(
                                controller: textController,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () async {
                    isEditing.value = !isEditing.value;
                    if (isEditing.value) {
                      mezDbgPrint("editing" + textController.text);
                    } else {
                      mezDbgPrint("saved");
                      auth.user!.displayName = textController.text;
                      if (imageFile.value.path != "test") {
                        var xUrl = await auth.getImageUrl(
                            imageFile.value, auth.user!.uid);
                        mezDbgPrint(xUrl);
                        auth.user!.image = xUrl;
                        auth.editUserProfile(textController.text.trim(), xUrl);
                      } else {
                        mezDbgPrint("the path is empty");

                        auth.editUserProfile(
                            textController.text.trim(), auth.user!.image);
                      }
                    }
                  },
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 48,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(81, 132, 255, 1),
                              Color.fromRGBO(206, 73, 252, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => Icon(
                                  (!isEditing.value)
                                      ? Icons.edit_outlined
                                      : Icons.save_outlined,
                                  color: Colors.white,
                                  size: 19,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Obx(
                              () => Text(
                                (!isEditing.value)
                                    ? lang.strings['shared']['userInfo']
                                        ["editBtn"]
                                    : lang.strings['shared']['userInfo']
                                        ["saveBtn"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
