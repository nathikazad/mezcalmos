import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart' show StringHelper;
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileScreen"];

class UserProfileWidgetsClass {
  // Singleton
  final UserProfileController userProfileController;
  UserProfileWidgetsClass({required this.userProfileController});

  /// this holds the Main body parts.
  List<Widget> bodyContent({
    required void Function() onBrowsImageClick,
    required void Function() onEditButtonClick,
    required void Function() onSaveClick,
    required bool isImageBeingUploaded,
    required bool clickedSave,
  }) {
    return [
      userInfoTitle(),
      pictureContainerWidget(
          onBrowsImageClick: onBrowsImageClick,
          isImageBeingUploaded: isImageBeingUploaded),
      SizedBox(
        height: 20,
      ),
      showUserNameOrTextField(isImageBeingUploaded: isImageBeingUploaded),
      SizedBox(
        height: 51,
      ),

      // margin: EdgeInsets.all(16),
      showEditOrSaveAndCancelButton(
        onSaveClick: onSaveClick,
        onStartEdit: onEditButtonClick,
        clickedSave: clickedSave,
        isImageBeingUploaded: isImageBeingUploaded,
      ),
    ];
  }

  /// this Holds the Circled Container in the middle of the screen that has the user Image
  Widget pictureContainerWidget(
      {required Function() onBrowsImageClick,
      required bool isImageBeingUploaded}) {
    return Padding(
      padding: const EdgeInsets.only(top: 17.0),
      child: GestureDetector(
        onTap: userProfileController.stateMode.value == UserProfileMode.Edit &&
                !isImageBeingUploaded
            ? onBrowsImageClick
            : () {},
        child: Stack(
          children: [
            Container(
              height: 137,
              width: 137,
              decoration: BoxDecoration(
                color: Get.find<AuthController>().isUserImgSet()
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(217, 217, 217, 1),
                shape: BoxShape.circle,
                image: Get.find<AuthController>().isUserImgSet() ||
                        userProfileController.userImgBytes.value != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: showDefaultOrUserImg(
                          memoryImg: userProfileController.userImgBytes.value,
                        ).image,
                      )
                    : null,
              ),
              child: userProfileController.stateMode.value ==
                          UserProfileMode.Edit &&
                      !Get.find<AuthController>().isUserImgSet()
                  ? browsImageButton(isImageBeingUploaded: isImageBeingUploaded)
                  : SizedBox(),
            ),
            if (userProfileController.stateMode.value == UserProfileMode.Edit)
              Positioned(
                bottom: 1,
                right: 16,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.black, //.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// this is the brows button inside  [pictureContainerWidget] When on [UserProfileMode.Edit] mode it shows up.
  Center browsImageButton({required bool isImageBeingUploaded}) {
    return Center(
      child: Center(
        child: Text(
          // _i18n()['uploadPic'],

          "Add profile picture",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// this is the top title of the userProfileScreen
  Padding userInfoTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 17.0),
      child: Text(
        _i18n()["UserProfileWidgets"]['title'],
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
      ),
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
      mezDbgPrint("CheckIfUserHasAllInfosSet -[ True ]- !!!");
      // return popable button
      return MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
      );
    } else {
      mezDbgPrint("CheckIfUserHasAllInfosSet -[ False ]- !!!");
      // none popable buttom
      return MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: () {
          Get.closeAllSnackbars();

          MezSnackbar(
            "Oops",
            _i18n()["UserProfileScreen"]['mustSetUserNameError'],
            position: SnackPosition.TOP,
          );

          mezDbgPrint(_i18n()["UserProfileScreen"]['mustSetUserNameError']);
        },
      );
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
      return Column(
        children: [
          Text(
            Get.find<AuthController>().user?.name ?? "-",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
          if (userProfileController.userCreationTime != null)
            Container(
              margin: const EdgeInsets.only(top: 11),
              child: Text(
                "${_i18n()["UserProfileWidgets"]["memberSince"]} ${DateFormat("dd/MM/yyyy").format(userProfileController.userCreationTime!)}",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                  color: Color.fromRGBO(33, 33, 33, 0.5),
                ),
              ),
            ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            Get.find<AuthController>().user?.name ?? "-",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),

          if (userProfileController.userCreationTime != null)
            Container(
              margin: const EdgeInsets.only(top: 11),
              child: Text(
                "${_i18n()["UserProfileWidgets"]["memberSince"]} ${DateFormat("dd/MM/yyyy").format(userProfileController.userCreationTime!)}",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                  color: Color.fromRGBO(33, 33, 33, 0.5),
                ),
              ),
            ),
          SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["UserProfileWidgets"]["name"]}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(120, 120, 120, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 9),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
              color: Color.fromRGBO(237, 237, 237, 0.6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                fillColor: Colors.grey.shade200,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: _i18n()["UserProfileWidgets"]['namePlaceHolder'],
              ),
              enabled: !isImageBeingUploaded,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              controller: userProfileController.textEditingController,
              onChanged: (String value) {
                userProfileController.userName.value = value.inCaps;
              },
            ),
          ),
          SizedBox(height: 7),
          Container(
            height: 22,
            margin: EdgeInsets.only(left: 24, right: 24),
            child: userProfileController.errorReport.value != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: Color.fromRGBO(226, 17, 50, 1),
                        size: 19,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            userProfileController.errorReport.value!,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color.fromRGBO(226, 17, 50, 1),
                            ),
                            softWrap: true,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ),
          // SizedBox(height: 12),
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
    if (!isImageBeingUploaded) {
      //   return ThreeDotsLoading(
      //     dotsColor: Colors.purple.shade400,
      //   );
      // } else {
      if (userProfileController.stateMode.value == UserProfileMode.Show) {
        return editButton(onStartEdit: onStartEdit);
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // save button---
            saveButton(onSaveClick, clickedSave),
            // cancel button
            if (userProfileController.checkIfUserHasAllInfosSet() &&
                userProfileController.stateMode.value == UserProfileMode.Edit &&
                !clickedSave)
              cancelButton(),

            SizedBox(
              height: 10,
            ),
          ],
        );
      }
    } else
      return SizedBox();
  }

  Container cancelButton() {
    return Container(
        margin: EdgeInsets.only(top: 12),
        child: InkWell(
          onTap: () {
            userProfileController.reset();
            userProfileController.setUserProfileMode(UserProfileMode.Show);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.purple.shade400),
                color: Color.fromRGBO(249, 216, 214, 1),
                borderRadius: BorderRadius.circular(8)),
            height: 45,
            // width: Get.width - 100,
            child: Center(
                child: Text(
              _i18n()["UserProfileWidgets"]['cancel'],
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'Montserrat',
              ),
            )),
          ),
        ));
  }

  Widget editButton({required Function() onStartEdit}) {
    return InkWell(
      onTap: onStartEdit,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(172, 89, 252, 1),
              Color.fromRGBO(103, 121, 254, 1)
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 45,
        // width: Get.width - 100,
        child: Center(
          child: Text(
            _i18n()["UserProfileWidgets"]['editInfo'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
    );
  }

  InkWell saveButton(Function onSaveChangesClick, bool clickedSave) {
    return InkWell(
      onTap: !clickedSave
          ? () async {
              await onSaveChangesClick();
            }
          : () {
              MezSnackbar(
                  "Oops", _i18n()["UserProfileWidgets"]['noChangesToApply'],
                  position: SnackPosition.TOP);
            },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(172, 89, 252, 1),
              Color.fromRGBO(103, 121, 254, 1)
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 45,
        // width: Get.width - 100,
        child: Center(
          child: !clickedSave
              ? Text(
                  _i18n()["UserProfileWidgets"]['saveBtn'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                  ),
                )
              : Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
