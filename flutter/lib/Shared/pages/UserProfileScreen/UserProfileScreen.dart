import 'dart:async';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileWidgets.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileScreen"]["UserProfileScreen"];

class UserProfile extends StatefulWidget {
  final AuthController authController = Get.find<AuthController>();
  // this is just to controll incase we want to make a push to this router with a pre-defined mode.
  final UserProfileMode pageInitMode;
  // UserProfileController
  final UserProfileController userProfileController = UserProfileController();
  late final UserProfileWidgetsClass userProfileWidgets;

  // Constructor!
  UserProfile({Key? key, this.pageInitMode = UserProfileMode.Show})
      : super(key: key) {
    userProfileController.setUserProfileMode(pageInitMode);
    userProfileWidgets =
        UserProfileWidgetsClass(userProfileController: userProfileController);
  }

  @override
  State<StatefulWidget> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile>
    with TickerProviderStateMixin {
  AuthController _authController = Get.find<AuthController>();
  RxBool isUploadingImg = false.obs;
  RxBool clickedSave = false.obs;
  late AnimationController animationController;

  @override
  void initState() {
    widget.userProfileController.initSetup();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    widget.userProfileController.disposeController();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.userProfileWidgets
            .onWillPopScopeFunction(isImageBeingUploaded: isUploadingImg.value);
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: true,

          backgroundColor: Colors.white,
          appBar: widget.userProfileWidgets
              .getRightAppBar(isImageBeingUploaded: isUploadingImg.value),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...widget.userProfileWidgets.bodyContent(
                      onBrowsImageClick: onBrowsImageClick,
                      onSaveClick: onSaveChangesClick,
                      onEditButtonClick: onStartEdit,
                      isImageBeingUploaded: isUploadingImg.value,
                      clickedSave: clickedSave.value,
                    ),
                    if (widget.userProfileController.stateMode.value ==
                        UserProfileMode.Show) ...[
                      SizedBox(height: 10),
                      Center(
                        child: InkWell(
                          onTap: () {
                            showConfirmationDialog(
                              context,
                              title: '${_i18n()["deleteTitle"]}',
                              primaryButtonText: "${_i18n()["deletePrBtn"]}",
                              secondaryButtonText: "${_i18n()["deleteScBtn"]}",
                              helperText: "${_i18n()["deleteHelper"]}",
                              onYesClick: () async {
                                final ServerResponse res =
                                    await _authController.deleteAccount();
                                if (!res.success) {
                                  MezSnackbar(
                                    "Oops",
                                    res.errorMessage ?? "Server problem!",
                                  );
                                }
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            width: Get.width,
                            // margin: ,
                            decoration: BoxDecoration(
                              // color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "${_i18n()["deleteAccount"]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
                if (isUploadingImg.value)
                  Container(
                    color: Colors.black.withOpacity(.2),
                    height: Get.height,
                    width: Get.width,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(22),
                        width: 90.w,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Uploading picture",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                valueColor: animationController.drive(
                                  ColorTween(
                                    begin: Color.fromRGBO(172, 89, 252, 1),
                                    end: Color.fromRGBO(103, 121, 254, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // getToolTips(),
        ),
      ),
    );
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
    // first check if user has uploaded an Img successfully.
    if (!widget.authController.isUserImgSet()) {
      widget.userProfileController.setErrorTextForXDuration(
        _i18n()['mustSetUserImgError'],
        duration: Duration(seconds: 5),
      );
      return;
    }

    // 2. check if the name is not null or empty
    if (widget.userProfileController.userName.value == null ||
        widget.userProfileController.userName.value!.isEmpty) {
      widget.userProfileController.setErrorTextForXDuration(
        _i18n()['mustSetUserNameError'],
        duration: Duration(seconds: 5),
      );
      return;
    }

    //3. check if name only letters
    if (!widget.userProfileController.userName.value!
        .replaceAll(' ', '')
        .isAlphabetOnly) {
      widget.userProfileController.setErrorTextForXDuration(
        _i18n()['nameMustBeLettersOnly'],
        duration: Duration(seconds: 5),
      );
      return;
    }

    // 4. check if the name contains at least 4 letters.
    if (!widget.userProfileController.nameLengthIsValid()) {
      widget.userProfileController.setErrorTextForXDuration(
        _i18n()['nameMustBeFourLettersOrMore'],
        duration: Duration(seconds: 5),
      );
      return;
    }
    // We trim the user name given :
    widget.userProfileController.userName.value =
        widget.userProfileController.userName.value!.trim();
    // we set the new changes.
    clickedSave.value = true;
    if (_authController.user!.name !=
        widget.userProfileController.userName.value) {
      await _authController.editUserProfile(
          widget.userProfileController.userName.value, null);
    }
    await Future<void>.delayed(Duration(milliseconds: 500));
    widget.userProfileController.reset();
    widget.userProfileController.setUserProfileMode(UserProfileMode.Show);
    clickedSave.value = false;
  }

  /// this gets called when the user presses [browsImageButton()],
  ///
  /// It actually ask the user if he wants to take a picture or brows his gallery,
  ///
  /// And once the user actually selects something , it start uploading the compressed version first along with the original one.
  Future<void> onBrowsImageClick() async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);
    if (_from != null) {
      widget.userProfileController.reset();
      final imPicker.XFile? _res = await imagePicker(
          picker: widget.userProfileController.picker, source: _from);

      try {
        // this check is needed in case user presses back button without picking any image
        if (_res != null) {
          isUploadingImg.value = true;
          // this holds XFile which holds the original image
          widget.userProfileController.userImg.value = _res;
          // this holds userImgBytes of the original
          widget.userProfileController.userImgBytes.value =
              await _res.readAsBytes();
          // this is the bytes of our compressed image .
          final Uint8List _compressedVersion = await compressImageBytes(
              widget.userProfileController.userImgBytes.value!);
          // Get the actual File compressed
          final io.File compressedFile = await writeFileFromBytesAndReturnIt(
              filePath: widget.userProfileController.userImg.value!.path,
              imgBytes: _compressedVersion);
          // generating a temp image from the Fiel , so we can resolve image provider.
          final Image img = Image.file(io.File(_res.path));
          // resolving ImagePrivider (We will use this late to reduce the height and width of the image to the same percenteage )
          img.image
              .resolve(new ImageConfiguration())
              .addListener(ImageStreamListener((ImageInfo info, bool _) async {
            // ------------------- Original Version -----------------//
            // put the original file to firebaseStorage
            final String _originalUrl = await uploadImgToFbStorage(
                hasuraUserId: _authController.hasuraUserId!,
                imageFile:
                    io.File(widget.userProfileController.userImg.value!.path));
            // we set our original FirebaseStorage Url in our controller.
            widget.userProfileController.originalImgUrl = _originalUrl;
            // Setting Original Image aka (bigImage)
            await _authController.setOriginalUserImage(
                widget.userProfileController.originalImgUrl);
            // ------------------- Compressed Version -----------------//
            // put the compressed file to firebaseStorage
            final String _compressedUrl = await uploadImgToFbStorage(
                hasuraUserId: _authController.hasuraUserId!,
                imageFile: compressedFile,
                isCompressed: true);
            // we set our _compressed FirebaseStorage Url in our controller.
            widget.userProfileController.compressedImgUrl = _compressedUrl;
            // we right away set it in database
            await _authController.editUserProfile(
                null, widget.userProfileController.compressedImgUrl);
            mezDbgPrint("ayono@ayono@ : ClickedSave = false!");
            mezDbgPrint(
              "ayono@ayono@ widget.userProfileController.checkIfUserHasAllInfosSet() : ${widget.userProfileController.checkIfUserHasAllInfosSet()}",
            );
            // mezDbgPrint(
            //   "ayono@ayono@ widget.userProfileController.didUserChangedInfos() : ${widget.userProfileController.didUserChangedInfos()}",
            // );

            // once uploaded we need to remove the temporary compressed version from user's device
            await compressedFile.delete();
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
