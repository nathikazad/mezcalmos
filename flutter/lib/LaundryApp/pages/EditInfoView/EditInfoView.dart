import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/EditInfoWidgets.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpEditLocationCard.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpImageEditComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['EditInfoView'];

class LaundryOpEditInfoView extends StatefulWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpEditInfoView> createState() => _LaundryOpEditInfoViewState();
}

class _LaundryOpEditInfoViewState extends State<LaundryOpEditInfoView> {
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  EditInfoController editInfoController = EditInfoController();
  late final EditInfoWidgets viewWidgets;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? laundryId;
  @override
  void initState() {
    laundryId = Get.parameters["laundryId"];
    if (laundryId != null) {
      editInfoController.init(laundryID: laundryId!);
      viewWidgets = EditInfoWidgets(
          editInfoController: editInfoController, context: context);
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  void dispose() {
    editInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LaundryAppAppBar(
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      body: Obx(() {
        if (editInfoController.laundry.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  LaundryOpImageEditComponent(
                      editInfoController: editInfoController),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      editInfoController.laundry.value?.info.name ?? "",
                      style: Get.textTheme.headline3
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  )
                  // Laundry name fiels
                  ,
                  SizedBox(
                    height: 25,
                  ),

                  Text("${_i18n()["laundryName"]}"),
                  SizedBox(
                    height: 10,
                  ),
                  _laundryNameTextField(),
                  SizedBox(
                    height: 25,
                  ),
                  Text("${_i18n()["defaultLanguage"]}"),
                  SizedBox(
                    height: 10,
                  ),
                  _laundryPrimaryLang(),
                  // LanguageSelectorComponent(
                  //     languageValue: editInfoController.primaryLang,
                  //     oppositeLanguageValue: editInfoController.secondaryLang,
                  //     onChangeShouldUpdateLang:
                  //         editInfoController.validatePrimaryLanguUpdate),

                  SizedBox(
                    height: 25,
                  ),
                  Text("${_i18n()["secondaryLanguage"]}"),
                  SizedBox(
                    height: 10,
                  ),
                  _laundrySecondaryang(),
                  // LanguageSelectorComponent(
                  //   languageValue: editInfoController.secondaryLang,
                  //   oppositeLanguageValue: editInfoController.primaryLang,
                  //   onChangeShouldUpdateLang:
                  //       editInfoController.validateSecondaryLanguUpdate,
                  //   showDeleteIcon: true,
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('${_i18n()["location"]}'),
                  SizedBox(
                    height: 10,
                  ),
                  LaundryOpEditLocationCard(
                    editInfoController: editInfoController,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: viewWidgets.editWorkingHoursComponent(),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      }),
      bottomNavigationBar: _editInfoSaveButton(),
    );
  }

  Widget _laundryNameTextField() {
    return TextFormField(
      controller: editInfoController.laundryNameController,
      style: Get.textTheme.bodyText1,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "${_i18n()["nameErrorText"]}";
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade200),
    );
  }

  Widget _laundryPrimaryLang() {
    return TextFormField(
      initialValue: editInfoController.primaryLang.value!.toLanguageName(),
      style: Get.textTheme.bodyText1,
      enabled: false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade200),
    );
  }

  Widget _laundrySecondaryang() {
    return TextFormField(
      initialValue: editInfoController.secondaryLang.value!.toLanguageName(),
      style: Get.textTheme.bodyText1,
      enabled: false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade200),
    );
  }
  // SAVE BUTTON ON THE FOOTER OF SCREEN

  Widget _editInfoSaveButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(gradient: bluePurpleGradient),
      child: Obx(
        () => TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder()),
            onPressed: (editInfoController.btnClicked.value)
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      editInfoController.updateLaundryInfo();
                    }
                  },
            child: (editInfoController.btnClicked.value)
                ? Container(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["saveInfo"]}'))),
      ),
    );
  }
}
