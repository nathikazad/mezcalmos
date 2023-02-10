import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceInfoEditView/components/ServiceEditLocationCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceInfoEditView/components/ServiceImageEditComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceInfoEditView/controllers/ServiceInfoEditViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["ServiceInfoEditView"];

//
class ServiceInfoEditView extends StatefulWidget {
  const ServiceInfoEditView({super.key});

  @override
  State<ServiceInfoEditView> createState() => _ServiceInfoEditViewState();
}

class _ServiceInfoEditViewState extends State<ServiceInfoEditView> {
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;
  late ServiceInfoEditViewController viewController;
  @override
  void initState() {
    serviceProviderId = int.tryParse(Get.parameters["serviceProviderId"]!);
    serviceProviderType =
        Get.arguments?["serviceProviderType"] as ServiceProviderType;
    _assignController();
    viewController.init(
        serviceProvierId: serviceProviderId!,
        serviceProviderType: serviceProviderType!);
    super.initState();
  }

  void _assignController() {
    switch (serviceProviderType) {
      case ServiceProviderType.DeliveryCompany:
        viewController = DeliveryInfoEditViewController();

        break;
      case ServiceProviderType.Restaurant:
        viewController = RestauarantInfoEditViewController();

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "${_i18n()['info']}"),
      bottomSheet: MezButton(
        label: "${_i18n()['save']}",
        borderRadius: 0,
        onClick: () async {
          await viewController.saveInfo().then((bool value) {
            if (value) {
              Get.snackbar("${_i18n()['saved']}", "${_i18n()['savedSuccess']}",
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  shouldIconPulse: false,
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ));
            } else {
              Get.snackbar("${_i18n()['error']}", "${_i18n()['error']}",
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  shouldIconPulse: false,
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ));
            }
          });
        },
      ),
      body: Obx(
        () {
          if (viewController.service.value != null) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ServiceImageEditComponent(
                        editInfoController: viewController),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        viewController.service.value?.info.name ?? "",
                        style: Get.textTheme.headline3,
                      ),
                    )
                    // Laundry name fiels
                    ,
                    SizedBox(
                      height: 25,
                    ),
                    Text("${_i18n()['name']}"),
                    SizedBox(
                      height: 5,
                    ),
                    _restNameTextField(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '${_i18n()['description']} ${viewController.primaryLang.value?.toLanguageName()}'),
                    SizedBox(
                      height: 5,
                    ),
                    _prdescTextField(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '${_i18n()['description']} ${viewController.secondaryLang.value?.toLanguageName()}'),
                    SizedBox(
                      height: 5,
                    ),
                    _scdescTextField(),
                    SizedBox(
                      height: 15,
                    ),
                    Text("${_i18n()['location']}"),
                    SizedBox(
                      height: 5,
                    ),
                    ServiceEditLocationCard(
                      editInfoController: viewController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //  Text("${_i18n()["defaultLanguage"]}"),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // ROpLanguageSelectorComponent(
                    //     languageValue: editInfoController.editablePrLang,
                    //     oppositeLanguageValue: editInfoController.editableScLang,
                    //     onChangeShouldUpdateLang:
                    //         editInfoController.changePrimaryLang),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Text("${_i18n()["secondaryLanguage"]}"),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // // ROpLanguageSelectorComponent(
                    // //   languageValue: editInfoController.editableScLang,
                    // //   oppositeLanguageValue: editInfoController.editablePrLang,
                    // //   onChangeShouldUpdateLang:
                    // //       editInfoController.changePrimaryLang,
                    // //   isSecondary: true,
                    // // ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ));
          } else {
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  TextFormField _restNameTextField() {
    return TextFormField(
      controller: viewController.serviceNameTxt,
      style: Get.textTheme.bodyText1,
    );
  }

  TextFormField _prdescTextField() {
    return TextFormField(
      controller: viewController.primaryServiceDesc,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
    );
  }

  TextFormField _scdescTextField() {
    return TextFormField(
      controller: viewController.secondayServiceDesc,
      style: Get.textTheme.bodyText1,
      maxLines: 5,
      minLines: 3,
    );
  }
}
