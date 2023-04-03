import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/components/UserProfileImage.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/controllers/UserProfileViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["UserProfileView"];

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});
  static Future<void> navigate() {
    return MezRouter.toPath(SharedRoutes.kUserNewProfile);
  }

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  UserProfileViewController viewController = UserProfileViewController();

  @override
  void initState() {
    viewController.initProfileView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
        _handleBackClick();
      }, title: "${_i18n()["profile"]}"),
      bottomSheet: Obx(
        () => (viewController.isEditingInfo)
            ? MezButton(
                enabled: viewController.isInfoSet,
                borderRadius: 0,
                height: 80,
                label: "${_i18n()["save"]}",
                onClick: () async {
                  await viewController.setInfo();
                },
              )
            : SizedBox(),
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfileImage(
                viewController: viewController,
              ),
              SizedBox(
                height: 25,
              ),
              if (!viewController.isEditingInfo)
                Text(
                  viewController.user?.name ?? "",
                  style: context.txt.displaySmall,
                ),
              SizedBox(
                height: 25,
              ),
              if (!viewController.isEditingInfo) _editAndDeleteBtns(context),
              if (viewController.isEditingInfo) _userNameInput()
            ],
          ),
        ),
      ),
    );
  }

  void _handleBackClick() {
    if (viewController.mode == UserProfileViewMode.Editing) {
      viewController.switchMode(UserProfileViewMode.None);
    } else {
      MezRouter.back();
    }
  }

  Widget _editAndDeleteBtns(BuildContext context) {
    return Column(
      children: [
        MezButton(
          label: "${_i18n()["edit"]}",
          onClick: () async {
            viewController.switchMode(UserProfileViewMode.Editing);
          },
          backgroundColor: secondaryLightBlueColor,
          textColor: primaryBlueColor,
        ),
        SizedBox(
          height: 25,
        ),
        MezButton(
          label: "${_i18n()["deleteAccount"]}",
          onClick: () async {
            await showConfirmationDialog(
              context,
              title: '${_i18n()["deleteTitle"]}',
              primaryButtonText: "${_i18n()["deletePrBtn"]}",
              secondaryButtonText: "${_i18n()["deleteScBtn"]}",
              helperText: "${_i18n()["deleteHelper"]}",
              onYesClick: () async {
                final ServerResponse res = await viewController.deleteAccount();
                if (!res.success) {
                  MezSnackbar(
                    "Oops",
                    res.errorMessage ?? "Server problem!",
                  );
                }
              },
            );
          },
          backgroundColor: offRedColor,
          textColor: Colors.red,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  Widget _userNameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${_i18n()["name"]}"),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            initialValue: viewController.name.value,
            onChanged: (String v) {
              viewController.name.value = v;
            },
            style: context.txt.bodyMedium?.copyWith(color: blackColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "${_i18n()["hint"]}"),
          ),
        ),
      ],
    );
  }
}
