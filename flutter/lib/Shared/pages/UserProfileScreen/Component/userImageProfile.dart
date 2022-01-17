import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

enum AccountState {
  free,
  picked,
  // cropped,
}

class UserImageProfile extends StatefulWidget {
  UserImageProfile(
      {Key? key, required this.isEditing, required this.onImageUserChanged})
      : super(key: key);
  final bool isEditing;
  final ValueChanged<File>? onImageUserChanged;

  @override
  _UserImageProfileState createState() => _UserImageProfileState();
}

class _UserImageProfileState extends State<UserImageProfile> {
  AuthController auth = Get.find<AuthController>();
  LanguageController lang = Get.find<LanguageController>();
  AccountState state = AccountState.free;
  File imageFile = File("test");
  String defaultPic =
      "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";

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
      widget.onImageUserChanged!(imageFile);
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
        widget.onImageUserChanged!(imageFile);
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
        widget.onImageUserChanged!(imageFile);
        state = AccountState.picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        color: Color.fromRGBO(243, 243, 243, 1),
                        child: imageFile.path == "test"
                            ? (auth.user!.image == null ||
                                    auth.user!.image == "")
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Choose A \n Photo",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Obx(() => Container(
                                      height: 161.h,
                                      width: 161.w,
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: auth.user!.image!,
                                            fit: BoxFit.fill,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              width: 15.w,
                                              height: 15.w,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          auth.user!.image == defaultPic
                                              ? Container(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  child: Center(
                                                    child: Text(
                                                      "${lang.strings['shared']['userInfo']["choosePic"]}",
                                                      style: TextStyle(
                                                          shadows: <Shadow>[
                                                            Shadow(
                                                              offset: Offset(
                                                                  5.0, 5.0),
                                                              blurRadius: 9.0,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      .5),
                                                            ),
                                                          ],
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                widget.isEditing
                    ? Positioned(
                        left: 124.sp,
                        top: 124.sp,
                        child: InkWell(
                            child: Container(
                              height: 35.sp,
                              width: 35.sp,
                              child: ClipOval(
                                child: Container(
                                  child: _buildButtonIcon(),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              if (state == AccountState.free)
                                _pickImage();
                              else if (state == AccountState.picked)
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
      ],
    );
  }
}
