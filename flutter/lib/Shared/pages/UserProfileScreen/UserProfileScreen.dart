import 'dart:async';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileWidgets.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';

class UserProfile extends StatefulWidget {
  final AuthController authController = Get.find<AuthController>();
  // this is just to controll incase we want to make a push to this route with a pre-defined mode.
  final UserProfileMode pageInitMode;
  // UserProfileController
  final UserProfileController userProfileController = UserProfileController();
  late UserProfileWidgetsClass userProfileWidgets;

  // Constructor!
  UserProfile({Key? key, this.pageInitMode = UserProfileMode.Show})
      : super(key: key) {
    userProfileController.setUserProfileMode(this.pageInitMode);
    userProfileWidgets = UserProfileWidgetsClass(this.userProfileController);
  }

  @override
  State<StatefulWidget> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  AuthController _authController = Get.find<AuthController>();
  RxBool isUploadingImg = false.obs;
  RxBool clickedSave = false.obs;

  @override
  void initState() {
    widget.userProfileController.initSetup();
    super.initState();
  }

  @override
  void dispose() {
    widget.userProfileController.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return widget.userProfileWidgets.onWillPopScopeFunction(
              isImageBeingUploaded: this.isUploadingImg.value);
        },
        child: Obx(
          () => Scaffold(
            appBar: widget.userProfileWidgets.getRightAppBar(
                isImageBeingUploaded: this.isUploadingImg.value),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: Get.height - 140, maxWidth: Get.width),
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  // fit: StackFit.expand,
                  // alignment: Alignment.topCenter,
                  // direction: Axis.vertical,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.userProfileWidgets.bodyContent(
                      onBrowsImageClick: onBrowsImageClick,
                      onSaveClick: onSaveChangesClick,
                      onEditButtonClick: onStartEdit,
                      isImageBeingUploaded: this.isUploadingImg.value,
                      clickedSave: this.clickedSave.value),
                ),
              ),
            ),
          ),
        ));
  }

  // -------------------------------------------------------- Helper functions ---------------------------------------------------------------

  /// this is called when the user clicks Edit.
  void onStartEdit() {
    widget.userProfileController.userImg.value = null;
    widget.userProfileController.setUserProfileMode(UserProfileMode.Edit);
  }

  /// this is called when the user clicks Save ,
  ///
  /// It saves the userName + the Original Image,
  ///
  /// As for the compressed Image it is being Set to db right after it gets selected By user and uploaded to fbStorage.
  Future<void> onSaveChangesClick() async {
    if (widget.userProfileController.nameIsValidString()) {
      mezDbgPrint("Started onSaveChangesClick");
      clickedSave.value = true;
      if (_authController.user!.name !=
          widget.userProfileController.userName.value) {
        await _authController.editUserProfile(
            widget.userProfileController.userName.value, null);
        mezDbgPrint("Set new compressed image and user name done!");
      }
      mezDbgPrint("Set Original image done!");
      await Future.delayed(Duration(milliseconds: 500));
      mezDbgPrint("Delay done!");
      widget.userProfileController.reset();
      widget.userProfileController.setUserProfileMode(UserProfileMode.Show);
      clickedSave.value = false;
    } else {
      widget.userProfileController.setErrorTextForXDuration(
          "Name must only contains at least 4 letters and spaces",
          duration: Duration(seconds: 5));
    }
  }

  /// this gets called when the user presses [browsImageButton()],
  ///
  /// It actually ask the user if he wants to take a picture or brows his gallery,
  ///
  /// And once the user actually selects something , it start uploading the compressed version first along with the original one.
  void onBrowsImageClick() async {
    imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);
    mezDbgPrint("rESULT ===> $_from");
    if (_from != null) {
      widget.userProfileController.reset();

      try {
        var _res = await imagePicker(
            picker: widget.userProfileController.picker, source: _from);

        // this check is needed in case user presses back button without picking any image
        if (_res != null) {
          isUploadingImg.value = true;
          // this holds XFile which holds the original image
          widget.userProfileController.userImg.value = _res;
          // this holds userImgBytes of the original
          widget.userProfileController.userImgBytes.value =
              await _res.readAsBytes();
          // this is the bytes of our compressed image .
          Uint8List _compressedVersion = await compressImageBytes(
              widget.userProfileController.userImgBytes.value!);
          // Get the actual File compressed
          io.File compressedFile = await writeFileFromBytesAndReturnIt(
              filePath: widget.userProfileController.userImg.value!.path,
              imgBytes: _compressedVersion);
          // generating a temp image from the Fiel , so we can resolve image provider.
          Image img = Image.file(io.File(_res.path));
          // resolving ImagePrivider (We will use this late to reduce the height and width of the image to the same percenteage )
          img.image
              .resolve(new ImageConfiguration())
              .addListener(ImageStreamListener((ImageInfo info, bool _) async {
            // ------------------- Original Version -----------------//
            // put the original file to firebaseStorage
            String _originalUrl =
                await _authController.uploadUserImgToFbStorage(
                    imageFile: io.File(
                        widget.userProfileController.userImg.value!.path));
            // we set our original FirebaseStorage Url in our controller.
            widget.userProfileController.originalImgUrl = _originalUrl;
            // Setting Original Image aka (bigImage)
            _authController.setOriginalUserImage(
                widget.userProfileController.originalImgUrl);
            // ------------------- Compressed Version -----------------//
            // put the compressed file to firebaseStorage
            String _compressedUrl =
                await _authController.uploadUserImgToFbStorage(
                    imageFile: compressedFile, isCompressed: true);
            // we set our _compressed FirebaseStorage Url in our controller.
            widget.userProfileController.compressedImgUrl = _compressedUrl;
            // we right away set it in database
            _authController.editUserProfile(
                null, widget.userProfileController.compressedImgUrl);
            mezDbgPrint("Set of new user compressed image !");
            // once uploaded we need to remove the temporary compressed version from user's device
            compressedFile.delete();
            // after the uploading of the image is done, we set back this to false.
            isUploadingImg.value = false;
          }));
        }
      } catch (e) {
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }
}
