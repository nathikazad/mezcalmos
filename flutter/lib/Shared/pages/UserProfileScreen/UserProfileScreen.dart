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
import 'package:flutter_image_compress/flutter_image_compress.dart';

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
    widget.userProfileWidgets =
        UserProfileWidgetsClass(this.widget.userProfileController);
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
          return widget.userProfileWidgets.onWillPopScopeFunction();
        },
        child: Obx(
          () => Scaffold(
            appBar: widget.userProfileWidgets
                .getRightAppBar(this.isUploadingImg.value),
            body: isUploadingImg.value
                ? widget.userProfileWidgets.topViewLayerWhenUploading()
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: Get.height - 140, maxWidth: Get.width),
                      child: Column(
                        // direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: widget.userProfileWidgets.bodyContent(
                            onBrowsImageClick: onBrowsImageClick,
                            onSaveClick: onSaveChangesClick,
                            onEditButtonClick: onStartEdit,
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

  /// this is called when the user clicks Save
  Future<void> onSaveChangesClick() async {
    if (widget.userProfileController.nameIsValidString()) {
      mezDbgPrint("Started onSaveChangesClick");
      clickedSave.value = true;
      await _authController.editUserProfile(
          widget.userProfileController.userName.value,
          widget.userProfileController.compressedImgUrl);
      mezDbgPrint("Set new compressed image and user name done!");

      await _authController
          .setOriginalUserImage(widget.userProfileController.originalImgUrl);

      mezDbgPrint("Set Original image done!");

      await Future.delayed(Duration(milliseconds: 500));
      mezDbgPrint("Delay done!");
      widget.userProfileController.reset();
      widget.userProfileController.setUserProfileMode(UserProfileMode.Show);
      clickedSave.value = false;
    } else {
      widget.userProfileController.setErrorTextForXDuration(
          "Only Alphabet letters and spaces allowed.",
          duration: Duration(seconds: 4));
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
        io.File compressedFile = await writeCompressedFileFromBytes(
            filePath: widget.userProfileController.userImg.value!.path,
            compressedImageBytes: _compressedVersion);
        // generating a temp image from the Fiel , so we can resolve image provider.
        Image img = Image.file(io.File(_res.path));
        // resolving ImagePrivider (We will use this late to reduce the height and width of the image to the same percenteage )
        img.image
            .resolve(new ImageConfiguration())
            .addListener(ImageStreamListener((ImageInfo info, bool _) async {
          // put the compressed file to firebaseStorage
          String _compressedUrl = await _authController.getImageUrl(
              compressedFile, _authController.user!.uid);
          // we set our _compressed FirebaseStorage Url in our controller.
          widget.userProfileController.compressedImgUrl = _compressedUrl;
          // once uploaded we need to remove the temporary compressed version from user's device
          compressedFile.delete();
          // put the original file to firebaseStorage
          String _originalUrl = await _authController.getImageUrl(
              io.File(widget.userProfileController.userImg.value!.path),
              _authController.user!.uid);
          // we set our original FirebaseStorage Url in our controller.
          widget.userProfileController.originalImgUrl = _originalUrl;
          // after the uploading of the image is done, we set back this to false.
          isUploadingImg.value = false;
        }));
      }
    }
  }

  /// this compresses the Original Image using jpeg format Since it's much ligher.
  ///
  /// and reduce the quality down to [qualityCompressionOfUserImage = 25%].
  Future<Uint8List> compressImageBytes(Uint8List originalImg) async {
    final ByteData data = ByteData.sublistView(originalImg);
    final beforeCompress = data.lengthInBytes;
    mezDbgPrint("s@s:beforeCompress =>s $beforeCompress");
    final result = await FlutterImageCompress.compressWithList(
        data.buffer.asUint8List(),
        quality: nQualityCompressionOfUserImage);
    mezDbgPrint("after => ${result.length}");
    return result;
  }
}
