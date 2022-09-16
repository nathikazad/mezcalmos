import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpAcceptedPayments.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpEditInfoWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpEditLocationCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpImageEditComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpOpenClose.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROpStripePaymentSetup.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/components/ROplanguageSelectorComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

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
  late ROpEditInfoWidgets viewWidgets;
  String? restaurantID;

  @override
  void initState() {
    restaurantID = Get.parameters["restaurantId"];
    if (restaurantID != null) {
      editInfoController.init(restaurantId: restaurantID!);

      viewWidgets = ROpEditInfoWidgets(
          editInfoController: editInfoController, context: context);
    } else
      Get.back();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (editInfoController.showStripe.isTrue) {
        return ROpStripePaymentSetup(viewController: editInfoController);
      } else if (editInfoController.setupClicked.isTrue) {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: CircularProgressIndicator(),
        );
      } else if (editInfoController.restaurant.value != null) {
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
                Text('${_i18n()["restaurantName"]}'),
                SizedBox(
                  height: 5,
                ),
                _restNameTextField(),
                SizedBox(
                  height: 15,
                ),
                Text("${_i18n()["defaultLanguage"]}"),
                ROpLanguageSelectorComponent(
                    languageValue: editInfoController.primaryLang,
                    oppositeLanguageValue: editInfoController.secondaryLang,
                    onChangeShouldUpdateLang:
                        editInfoController.changePrimaryLang),
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
                  isSecondary: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '${_i18n()["description"]} ${editInfoController.primaryLang.value!.toLanguageName()}'),
                SizedBox(
                  height: 5,
                ),
                _prdescTextField(),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '${_i18n()["description"]} ${editInfoController.secondaryLang.value!.toLanguageName()}'),
                SizedBox(
                  height: 5,
                ),
                _scdescTextField(),
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
                ROpAcceptedPayments(viewController: editInfoController),
                Container(
                  child: viewWidgets.editWorkingHoursComponent(),
                ),
                SizedBox(
                  height: 25,
                ),
                ROpOpenClose(
                    title: '${_i18n()["openTitle"]}',
                    subtitle: '${_i18n()["openSubtitle"]}',
                    onTurnedOn: () {
                      editInfoController.switchAv(true);
                    },
                    onTurnedOff: () {
                      editInfoController.switchAv(false);
                    },
                    initialSwitcherValue: editInfoController.isAvailable.value),
              ],
            ),
          ),
          bottomNavigationBar: _editInfoSaveButton(),
        );
      } else {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: MezLogoAnimation(
            centered: true,
          ),
        );
      }
    });
  }

  TextFormField _restNameTextField() {
    return TextFormField(
      controller: editInfoController.restaurantNameTxt,
      style: Get.textTheme.bodyText1,
    );
  }

  TextFormField _prdescTextField() {
    return TextFormField(
      controller: editInfoController.prRestaurantDescTxt,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
    );
  }

  TextFormField _scdescTextField() {
    return TextFormField(
      controller: editInfoController.scRestaurantDescTxt,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
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
                    editInfoController.updateLaundryInfo().then((value) =>
                        Get.snackbar(
                            '${_i18n()["saved"]}', '${_i18n()["savedText"]}',
                            backgroundColor: Colors.black,
                            colorText: Colors.white,
                            shouldIconPulse: false,
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )));
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
