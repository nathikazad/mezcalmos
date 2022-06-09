import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/EditInfoWidgets.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpEditLocationCard.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/LaundryOpImageEditComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/components/languageSelectorComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['EditInfoView'];

class LaundryOpEditInfoView extends StatefulWidget {
  const LaundryOpEditInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpEditInfoView> createState() => _LaundryOpEditInfoViewState();
}

class _LaundryOpEditInfoViewState extends State<LaundryOpEditInfoView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  EditInfoController editInfoController = EditInfoController();
  late final EditInfoWidgets viewWidgets;

  @override
  void initState() {
    editInfoController.init();
    viewWidgets = EditInfoWidgets(
        editInfoController: editInfoController, context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LaundryAppAppBar(
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            LaundryOpImageEditComponent(editInfoController: editInfoController),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                editInfoController.laundry.value?.info.name ?? "",
                style: Get.textTheme.headline3,
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
            LanguageSelectorComponent(
                languageValue: editInfoController.primaryLang,
                oppositeLanguageValue: editInfoController.secondaryLang,
                onChangeShouldUpdateLang:
                    editInfoController.validatePrimaryLanguUpdate),

            SizedBox(
              height: 25,
            ),
            Text("${_i18n()["secondaryLanguage"]}"),
            SizedBox(
              height: 10,
            ),
            LanguageSelectorComponent(
              languageValue: editInfoController.secondaryLang,
              oppositeLanguageValue: editInfoController.primaryLang,
              onChangeShouldUpdateLang:
                  editInfoController.validateSecondaryLanguUpdate,
              showDeleteIcon: true,
            ),
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
      bottomNavigationBar: _editInfoSaveButton(),
    );
  }

  TextFormField _laundryNameTextField() {
    return TextFormField(
      controller: editInfoController.laundryNameController,
      style: Get.textTheme.bodyText1,
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
                    editInfoController.updateLaundryInfo();
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
