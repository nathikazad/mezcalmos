import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

import 'AuthScreens/SMS/PhoneNumberScreen.dart';

enum AccountState {
  free,
  picked,
  // cropped,
}
const mypadding = const EdgeInsets.symmetric(horizontal: 10);

class UserProfile extends StatelessWidget {
  final Rx<User?> user;
  UserProfile(this.user);

  var state = Rx<AccountState>(AccountState.free);
  var isEditing = false.obs;
  AuthController auth = Get.find<AuthController>();
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
    textController.text = (user.value?.displayName == null)
        ? "user"
        : "${user.value?.displayName}";

    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
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
                  "User Information",
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
                              ? (user.value!.image == null ||
                                      user.value!.image == "")
                                  ? Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Choose A \n Photo",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : Image.network(
                                      "${user.value!.image}",
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
                                      child: Obx(() => _buildButtonIcon()),
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
                              () => Text(
                                (user.value!.displayName == null)
                                    ? "User"
                                    : "${user.value!.displayName}",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          (user.value!.phone != null)
                              ? Container(
                                  padding: mypadding,
                                  child: ListTile(
                                      leading: Icon(
                                        Icons.phone_iphone_outlined,
                                        color: Colors.black,
                                      ),
                                      title: Text("Add phone number",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                      trailing: InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.edit_outlined,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(() => PhoneNumberScreen());
                                        },
                                      )),
                                )
                              : Container(),
                          // Container(
                          //   child: Text(
                          //     "406 874 5993",
                          //     style: TextStyle(
                          //         fontSize: 15, fontWeight: FontWeight.w800),
                          //   ),
                          // ),
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
                              "Full Name",
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
                    print("editing" + textController.text);
                  } else {
                    print("saved");
                    user.value!.displayName = textController.text;
                    if (imageFile.value.path != "test") {
                      var xUrl = await auth.getImageUrl(
                          imageFile.value, user.value!.uid);
                      print(xUrl);
                      user.value!.image = xUrl;
                      auth.editUserProfile(textController.text.trim(), xUrl);
                    } else {
                      print("the path is empty");
                      auth.editUserProfile(textController.text.trim(), "");
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
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(81, 132, 255, 1),
                        Color.fromRGBO(206, 73, 252, 1)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
                                  ? "Edit Infomation"
                                  : "Save Infomation",
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
    );
  }
}
