import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpEditInfoWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpEditLocationCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpImageEditComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROplanguageSelectorComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['EditInfoView'];

class ROpEditInfoView extends StatefulWidget {
  const ROpEditInfoView({Key? key}) : super(key: key);

  @override
  State<ROpEditInfoView> createState() => _ROpEditInfoViewState();
}

class _ROpEditInfoViewState extends State<ROpEditInfoView> {
  // LaundryInfoController laundryInfoController =
  //     Get.find<LaundryInfoController>();
  AnimatedSliderController animatedSliderController =
      AnimatedSliderController();
  ROpEditInfoController editInfoController = ROpEditInfoController();
  late final ROpEditInfoWidgets viewWidgets;

  @override
  void initState() {
    editInfoController.init();
    viewWidgets = ROpEditInfoWidgets(
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
            ROpImageEditComponent(editInfoController: editInfoController),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                editInfoController.restaurant.value?.info.name ?? "",
                style: Get.textTheme.headline3,
              ),
            )
            // Laundry name fiels
            ,
            SizedBox(
              height: 25,
            ),
            Text("Restaurant name"),
            SizedBox(
              height: 5,
            ),
            _laundryNameTextField(),
            SizedBox(
              height: 15,
            ),
            Text("${_i18n()["defaultLanguage"]}"),
            ROpLanguageSelectorComponent(
                languageValue: editInfoController.primaryLang,
                oppositeLanguageValue: editInfoController.secondaryLang,
                onChangeShouldUpdateLang:
                    editInfoController.validatePrimaryLanguUpdate),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 15,
            ),
            Text("${_i18n()["secondaryLanguage"]}"),
            SizedBox(
              height: 5,
            ),
            ROpLanguageSelectorComponent(
              languageValue: editInfoController.secondaryLang,
              oppositeLanguageValue: editInfoController.primaryLang,
              onChangeShouldUpdateLang:
                  editInfoController.validateSecondaryLanguUpdate,
              showDeleteIcon: true,
            ),
            SizedBox(
              height: 15,
            ),
            Text('${_i18n()["location"]}'),
            SizedBox(
              height: 5,
            ),
            ROpEditLocationCard(
              editInfoController: editInfoController,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: viewWidgets.editWorkingHoursComponent(),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _editInfoSaveButton(),
    );
  }

  TextFormField _laundryNameTextField() {
    return TextFormField(
      controller: editInfoController.restaurantNameTxt,
      style: Get.textTheme.bodyText1,
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
