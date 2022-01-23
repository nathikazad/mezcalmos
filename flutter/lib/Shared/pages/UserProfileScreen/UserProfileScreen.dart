import 'dart:async';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class UserProfile extends StatefulWidget {
  final AuthController authController = Get.find<AuthController>();
  // this is just to controll incase we want to make a push to this route with a pre-defined mode.
  final UserProfileMode pageInitMode;
  // UserProfileController
  final UserProfileController userProfileController = UserProfileController();
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
          return onWillPopScopeFunction();
        },
        child: Obx(
          () => Scaffold(
            appBar: getRightAppBar(),
            body: isUploadingImg.value
                ? topViewLayerWhenUploading()
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
                        children: bodyContent(),
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
        quality: qualityCompressionOfUserImage);
    mezDbgPrint("after => ${result.length}");
    return result;
  }

  // -------------------------------------------------------- View-related Widgets --------------------------------------------------------

  Widget topViewLayerWhenUploading() {
    return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Uploading ...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          ],
        ));
  }

  /// this holds the Main body parts.
  List<Widget> bodyContent() {
    return [
      userInfoTitle(),
      Flexible(
        flex: 1,
        // fit: FlexFit.tight,
        child: Stack(
          fit: StackFit.passthrough,
          children: pictureContainerWidget(),
        ),
      ),
      Flexible(flex: 1, child: showUserNameOrTextField()),
      Flexible(
          flex: 1,
          child: Container(
              margin: EdgeInsets.only(bottom: 50, left: 50, right: 50),
              child: showEditOrSaveAndCancelButton())),
    ];
  }

  /// this Holds the Circled Container in the middle of the screen that has the user Image
  List<Widget> pictureContainerWidget() {
    return [
      Center(
        child: GestureDetector(
          onTap: widget.userProfileController.stateMode == UserProfileMode.Edit
              ? onBrowsImageClick
              : () {},
          child: Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: showDefaultOrUserImg(
                            memoryImg:
                                widget.userProfileController.userImgBytes.value)
                        .image)),
            child:
                widget.userProfileController.stateMode == UserProfileMode.Edit
                    ? browsImageButton()
                    : SizedBox(),
          ),
        ),
      ),
    ];
  }

  /// this is the brows button inside  [pictureContainerWidget] When on [UserProfileMode.Edit] mode it shows up.
  Center browsImageButton() {
    return Center(
      child: Container(
        height: 150.h,
        width: 150.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library_outlined,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Text(
              ' select ',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  /// this is the top title of the userProfileScreen
  Flexible userInfoTitle() {
    return Flexible(
      flex: 1,
      child: Center(
          child: Text(
        "User Information",
        style: TextStyle(fontSize: 30),
      )),
    );
  }

  /// This gets the appBar depending on if the user has already set his infos or not.
  ///
  /// In case the user hasn't his image and name set , the back arrow of the appbar won't work,
  ///
  /// and the user can't go out of the screen unless he sets up his infos.
  AppBar getRightAppBar() {
    if (widget.userProfileController.checkIfUserHasAllInfosSet() &&
        !isUploadingImg.value) {
      // return popable button
      return mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: () => Get.back(closeOverlays: true));
    } else {
      // none popable buttom
      return mezcalmosAppBar(AppBarLeftButtonType.Back);
    }
  }

  /// this return an onWillPopScope bool, defining if user can pop the scope or not depending on the [UserProfileMode]
  bool onWillPopScopeFunction() {
    if (widget.userProfileController.checkIfUserHasAllInfosSet()) {
      widget.userProfileController.disposeController();
      return true;
    } else
      return false;
  }

  /// this basically either shows the UserName or shows the textField depending on [UserProfileMode].
  Widget showUserNameOrTextField() {
    if (widget.userProfileController.stateMode == UserProfileMode.Show) {
      return Text(
        _authController.user!.name!,
        style: TextStyle(fontSize: 30),
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 55),
            child: TextField(
                style: TextStyle(color: Colors.purple.shade400, fontSize: 15),
                controller: widget.userProfileController.textEditingController,
                onChanged: (value) {
                  widget.userProfileController.userName.value = value;
                }),
          ),
          if (widget.userProfileController.errorReport.value != null)
            Container(
              // height: 20,
              margin: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      widget.userProfileController.errorReport.value!,
                      overflow: TextOverflow.visible,
                      style: TextStyle(color: Colors.red),
                      softWrap: true,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            )
        ],
      );
    }
  }

  /// this shows either the edit infos Button or the Save button,
  ///
  /// depending on [UserProfileMode] , and in case the user has already his infos set up , a cancel button will shows up.
  Widget showEditOrSaveAndCancelButton() {
    if (widget.userProfileController.stateMode == UserProfileMode.Show) {
      return TextButton(onPressed: onStartEdit, child: Text("Edit User Info"));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // save button---
          Expanded(
            flex: 2,
            child: InkWell(
                onTap: widget.userProfileController.didUserChangedInfos() &&
                        !clickedSave.value
                    ? () async {
                        await onSaveChangesClick();
                      }
                    : () {
                        MezSnackbar("Oops", "No Changes to be applied!",
                            position: SnackPosition.TOP);
                      },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade100),
                      color:
                          widget.userProfileController.didUserChangedInfos() &&
                                  !clickedSave.value
                              ? Colors.purple.shade400
                              : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  // width: Get.width - 100,
                  child: Center(
                      child: !clickedSave.value
                          ? Text(
                              "Save",
                              style: TextStyle(
                                  color: widget.userProfileController
                                          .didUserChangedInfos()
                                      ? Colors.white
                                      : Colors.grey.shade400),
                            )
                          : CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.black,
                            )),
                )),
          ),
          // cancel button
          if (widget.userProfileController.checkIfUserHasAllInfosSet() &&
              widget.userProfileController.stateMode == UserProfileMode.Edit &&
              !clickedSave.value)
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    widget.userProfileController.reset();
                    widget.userProfileController
                        .setUserProfileMode(UserProfileMode.Show);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple.shade400),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    // width: Get.width - 100,
                    child: Center(
                        child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.purple.shade400),
                    )),
                  ),
                )),
        ],
      );
    }
  }
}
