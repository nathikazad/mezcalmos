import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
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
  File imageFile = File("test");

  @override
  void initState() {
    // should only executes once because when state rebuilds upon any focus (This gets re-executes making it impossible to apply userName changes)
    super.initState();
    if (auth.user?.name != null) {
    } else {
      isEditing.value = true;
    }

    textController.text = auth.isDisplayNameSet() ? auth.user!.name! : "";
  }

  Widget _buildButtonIcon() {
    if (state == AccountState.free)
      return Icon(
        Icons.photo_camera_outlined,
        color: Colors.grey[500],
      );
    else if (state == AccountState.picked)
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
    setState(() {
      imageFile = File("test");
      state = AccountState.free;
    });
  }

  Future<Null> _pickImage() async {
    var pickedImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imageFile = File(pickedImage!.path);
      if (imageFile.path != "test") {
        state = AccountState.picked;
        _cropImage();
      }
    });
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
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
      setState(() {
        imageFile = croppedFile;
        state = AccountState.picked;
      });
    }
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
    String defaultPic =
        "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";
    final RegExp nameExp = new RegExp(r"^[a-z ,.'-]+$", caseSensitive: false);
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
            !checkNameValidation() && !auth.isDisplayNameSet()
                ? showModalBottomSheet<void>(
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
                                    if (imageFile.path != "test") {
                                      var xUrl = await auth.getImageUrl(
                                          imageFile, auth.user!.uid);
                                      mezDbgPrint(xUrl);
                                      auth.user!.image = xUrl;
                                      auth.editUserProfile(
                                          textController.text.trim(), xUrl);
                                      isEditing.value = true;
                                    } else {
                                      mezDbgPrint("the path is empty");

                                      auth.editUserProfile(
                                          textController.text.trim(),
                                          auth.user!.image);
                                      isEditing.value = true;
                                    }
                                    Get.back();
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Get.back();
            // Get.back();
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
                          constraints: BoxConstraints(maxHeight: Get.height),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 0.sp,
                                ),
                                Container(
                                  child: Text(
                                    lang.strings['shared']['userInfo']["title"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'psr'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.sp,
                                ),
                                // Spacer(),

                                Obx(
                                  () => Container(
                                    height: 161.h,
                                    width: 161.w,
                                    child: Stack(
                                      children: [
                                        ClipOval(
                                            child: Container(
                                                height: 161.w,
                                                width: 161.h,
                                                color: Color.fromRGBO(
                                                    243, 243, 243, 1),
                                                child: imageFile.path == "test"
                                                    ? (auth.user!.image ==
                                                                null ||
                                                            auth.user!.image ==
                                                                "")
                                                        ? Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Choose A \n Photo",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )
                                                        : Obx(() => Container(
                                                              height: 161.h,
                                                              width: 161.w,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Stack(
                                                                children: [
                                                                  CachedNetworkImage(
                                                                    imageUrl: auth
                                                                        .user!
                                                                        .image!,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    imageBuilder:
                                                                        (context,
                                                                                imageProvider) =>
                                                                            Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              imageProvider,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            Container(
                                                                      width:
                                                                          15.w,
                                                                      height:
                                                                          15.w,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  auth.user!.image ==
                                                                          defaultPic
                                                                      ? Container(
                                                                          color: Colors
                                                                              .black
                                                                              .withOpacity(0.4),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "${lang.strings['shared']['userInfo']["choosePic"]}",
                                                                              style: TextStyle(shadows: <Shadow>[
                                                                                Shadow(
                                                                                  offset: Offset(5.0, 5.0),
                                                                                  blurRadius: 9.0,
                                                                                  color: Colors.white.withOpacity(.5),
                                                                                ),
                                                                              ], color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ))
                                                    : Image.file(
                                                        imageFile,
                                                        fit: BoxFit.cover,
                                                      ))),
                                        isEditing.value
                                            ? Positioned(
                                                left: 124.sp,
                                                top: 124.sp,
                                                child: InkWell(
                                                    child: Container(
                                                      height: 35.sp,
                                                      width: 35.sp,
                                                      child: ClipOval(
                                                        child: Container(
                                                          child:
                                                              _buildButtonIcon(),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      if (state ==
                                                          AccountState.free)
                                                        _pickImage();
                                                      else if (state ==
                                                          AccountState.picked)
                                                        //   _cropImage();
                                                        // else if (state.value == AccountState.cropped)
                                                        _clearImage();
                                                    }
                                                    // _cropImage,
                                                    ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.sp,
                                ),
                                Container(
                                  child: Obx(() => !isEditing.value
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  (!auth.isDisplayNameSet())
                                                      ? "User"
                                                      : "${auth.user!.name}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'psb',
                                                    fontSize: 35.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50.sp,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                lang.strings['shared']
                                                    ['userInfo']["fullName"],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.sp,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return '${lang.strings['shared']['userInfo']['validationTxtOne']}';
                                                  } else {
                                                    if (!nameExp
                                                        .hasMatch(value)) {
                                                      return '${lang.strings['shared']['userInfo']['validationTxtTwo']}';
                                                    }
                                                    return null;
                                                  }
                                                },
                                                controller: textController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      gapPadding: 0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    hintText:
                                                        "${lang.strings['shared']['userInfo']["hintTxt"]}",
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10)),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                ),

                                SizedBox(
                                  height: 50.sp,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 20.sp),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (checkNameValidation()) {
                                      } else {
                                        if (!isEditing.value) {
                                          mezDbgPrint(
                                              "editing" + textController.text);

                                          isEditing.value = !isEditing.value;
                                        } else {
                                          mezDbgPrint(
                                              "Saved ${textController.text}");

                                          auth.user!.name = textController.text;
                                          if (imageFile.path != "test") {
                                            var xUrl = await auth.getImageUrl(
                                                imageFile, auth.user!.uid);
                                            mezDbgPrint(xUrl);
                                            auth.user!.image = xUrl;
                                            auth.editUserProfile(
                                                textController.text.trim(),
                                                xUrl);
                                            isEditing.value = !isEditing.value;
                                          } else {
                                            mezDbgPrint("the path is empty");

                                            auth.editUserProfile(
                                                textController.text.trim(),
                                                auth.user!.image);
                                            isEditing.value = !isEditing.value;
                                          }
                                        }
                                      }
                                    },
                                    padding: EdgeInsets.only(left: 0, right: 0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Container(
                                        height: 48.sp,
                                        width: (Get.width - 20).sp,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Obx(
                                                () => Icon(
                                                  (!isEditing.value)
                                                      ? Icons.edit_outlined
                                                      : Icons.save_outlined,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                (!isEditing.value)
                                                    ? lang.strings['shared']
                                                        ['userInfo']["editBtn"]
                                                    : lang.strings['shared']
                                                        ['userInfo']["saveBtn"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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

  bool checkNameValidation() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      return false;
    } else {
      return true;
    }
  }
}
