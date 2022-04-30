import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileScreen"]["UserProfileWidgets"];

class UserProfileWidgetsClass {
  // Singleton
  final UserProfileController userProfileController;
  UserProfileWidgetsClass({required this.userProfileController});

  /// this holds the Main body parts.
  List<Widget> bodyContent(
      {required Function() onBrowsImageClick,
      required Function() onEditButtonClick,
      required Function() onSaveClick,
      required bool isImageBeingUploaded,
      required bool clickedSave}) {
    return [
      userInfoTitle(),
      SizedBox(
        height: 10,
      ),
      Flexible(
        flex: 4,
        fit: FlexFit.tight,
        child: pictureContainerWidget(
            onBrowsImageClick: onBrowsImageClick,
            isImageBeingUploaded: isImageBeingUploaded),
      ),
      SizedBox(
        height: 10,
      ),
      Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: showUserNameOrTextField(
              isImageBeingUploaded: isImageBeingUploaded)),
      SizedBox(
        height: 10,
      ),
      Flexible(
        flex: 2,
        child: Container(
            margin: EdgeInsets.all(16),
            child: showEditOrSaveAndCancelButton(
                onSaveClick: onSaveClick,
                onStartEdit: onEditButtonClick,
                clickedSave: clickedSave,
                isImageBeingUploaded: isImageBeingUploaded)),
      )
    ];
  }

  /// this Holds the Circled Container in the middle of the screen that has the user Image
  Widget pictureContainerWidget(
      {required Function() onBrowsImageClick,
      required bool isImageBeingUploaded}) {
    return Center(
      child: GestureDetector(
        onTap: userProfileController.stateMode.value == UserProfileMode.Edit &&
                !isImageBeingUploaded
            ? onBrowsImageClick
            : () {},
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: showDefaultOrUserImg(
                          memoryImg: userProfileController.userImgBytes.value)
                      .image)),
          child: userProfileController.stateMode.value == UserProfileMode.Edit
              ? browsImageButton(isImageBeingUploaded: isImageBeingUploaded)
              : SizedBox(),
        ),
      ),
    );
  }

  /// this is the brows button inside  [pictureContainerWidget] When on [UserProfileMode.Edit] mode it shows up.
  Center browsImageButton({required bool isImageBeingUploaded}) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(.66),
        ),
        padding: EdgeInsets.all(5),
        child: !isImageBeingUploaded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    _i18n()['uploadPic'],
                    style: TextStyle(color: Colors.white, fontSize: 11.sp),
                  )
                ],
              )
            : Container(
                height: 40,
                width: 40,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                    color: Colors.purple,
                  ),
                ),
              ),
      ),
    );
  }

  /// this is the top title of the userProfileScreen
  Flexible userInfoTitle() {
    return Flexible(
      flex: 2,
      child: Center(
          child: Text(
        _i18n()['title'],
        style: TextStyle(fontSize: 20.sp),
      )),
    );
  }

  /// This gets the appBar depending on if the user has already set his infos or not.
  ///
  /// In case the user hasn't his image and name set , the back arrow of the appbar won't work,
  ///
  /// and the user can't go out of the screen unless he sets up his infos.
  AppBar getRightAppBar({required bool isImageBeingUploaded}) {
    if (userProfileController.checkIfUserHasAllInfosSet() &&
        !isImageBeingUploaded) {
      // return popable button
      return mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: () => Get.back(closeOverlays: true));
    } else {
      // none popable buttom
      return mezcalmosAppBar(AppBarLeftButtonType.Back);
    }
  }

  /// this return an onWillPopScope bool, defining if user can pop the scope or not depending on the [UserProfileMode]
  bool onWillPopScopeFunction(
      {required bool isImageBeingUploaded, Function? onDispose}) {
    if (userProfileController.checkIfUserHasAllInfosSet() &&
        !isImageBeingUploaded) {
      onDispose?.call();
      return true;
    } else
      return false;
  }

  /// this basically either shows the UserName or shows the textField depending on [UserProfileMode].
  Widget showUserNameOrTextField({required bool isImageBeingUploaded}) {
    if (userProfileController.stateMode.value == UserProfileMode.Show) {
      return Text(
        Get.find<AuthController>().user!.name ?? "No Name",
        style: TextStyle(fontSize: 30),
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 55),
            child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.perm_identity_rounded,
                    color: Colors.purple.shade400,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                enabled: !isImageBeingUploaded,
                style: TextStyle(color: Colors.purple.shade400, fontSize: 15),
                controller: userProfileController.textEditingController,
                onChanged: (String value) {
                  userProfileController.userName.value = value;
                }),
          ),
          if (userProfileController.errorReport.value != null)
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
                      userProfileController.errorReport.value!,
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
  Widget showEditOrSaveAndCancelButton({
    required Function() onStartEdit,
    required Function() onSaveClick,
    required bool clickedSave,
    required bool isImageBeingUploaded,
  }) {
    if (isImageBeingUploaded) {
      return ThreeDotsLoading(
        dotsColor: Colors.purple.shade400,
      );
    } else {
      if (userProfileController.stateMode.value == UserProfileMode.Show) {
        return editButton(onStartEdit: onStartEdit);
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // save button---
            saveButton(onSaveClick, clickedSave),
            // cancel button
            if (userProfileController.checkIfUserHasAllInfosSet() &&
                userProfileController.stateMode.value == UserProfileMode.Edit &&
                !clickedSave)
              cancelButton(),
          ],
        );
      }
    }
  }

  Expanded cancelButton() {
    return Expanded(
        flex: 2,
        child: InkWell(
          onTap: () {
            userProfileController.reset();
            userProfileController.setUserProfileMode(UserProfileMode.Show);
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
              _i18n()['cancel'],
              style: TextStyle(fontSize: 12.sp, color: Colors.purple.shade400),
            )),
          ),
        ));
  }

  Widget editButton({required Function() onStartEdit}) {
    return InkWell(
      onTap: onStartEdit,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple.shade500),
            color: Colors.purple.shade400,
            borderRadius: BorderRadius.circular(8.sp)),
        height: 50,
        // width: Get.width - 100,
        child: Center(
            child: Text(
          _i18n()['editInfo'],
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        )),
      ),
    );
  }

  Expanded saveButton(Function onSaveChangesClick, bool clickedSave) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: !clickedSave
            ? () async {
                await onSaveChangesClick();
              }
            : () {
                MezSnackbar("Oops", _i18n()['noChangesToApply'],
                    position: SnackPosition.TOP);
              },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey.shade100),
              color:
                  !clickedSave ? Colors.purple.shade400 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15)),
          height: 50,
          // width: Get.width - 100,
          child: Center(
            child: !clickedSave
                ? Text(
                    _i18n()['saveBtn'],
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  )
                : CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.black,
                  ),
          ),
        ),
      ),
    );
  }
}
