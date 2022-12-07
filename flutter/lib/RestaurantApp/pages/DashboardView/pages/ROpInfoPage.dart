import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpEditLocationCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpImageEditComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROplanguageSelectorComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpInfoPage extends StatelessWidget {
  const ROpInfoPage({Key? key, required this.editInfoController})
      : super(key: key);
  final ROpEditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Obx(
              () => Column(
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
                  Text(
                      '${_i18n()["description"]} ${editInfoController.primaryLang.value?.toLanguageName()}'),
                  SizedBox(
                    height: 5,
                  ),
                  _prdescTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      '${_i18n()["description"]} ${editInfoController.secondaryLang.value?.toLanguageName()}'),
                  SizedBox(
                    height: 5,
                  ),
                  _scdescTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${_i18n()["location"]}',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ROpEditLocationCard(
                    editInfoController: editInfoController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("${_i18n()["defaultLanguage"]}"),
                  SizedBox(
                    height: 5,
                  ),
                  ROpLanguageSelectorComponent(
                      languageValue: editInfoController.editablePrLang,
                      oppositeLanguageValue: editInfoController.editableScLang,
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
                    languageValue: editInfoController.editableScLang,
                    oppositeLanguageValue: editInfoController.editablePrLang,
                    onChangeShouldUpdateLang:
                        editInfoController.changePrimaryLang,
                    isSecondary: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        MezButton(
          label: '${_i18n()["saveInfo"]}',
          borderRadius: 0,
          withGradient: true,
          height: 70,
          onClick: () async {
            await editInfoController.updateLaundryInfo().then((value) =>
                Get.snackbar('${_i18n()["saved"]}', '${_i18n()["savedText"]}',
                    backgroundColor: Colors.black,
                    colorText: Colors.white,
                    shouldIconPulse: false,
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )));
          },
        )
      ],
    );
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
}
