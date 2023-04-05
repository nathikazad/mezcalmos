import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/components/ServiceEditLocationCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/components/ServiceImageEditComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/controllers/ServiceInfoEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["ServiceInfoEditView"];

//
class ServiceInfoEditView extends StatefulWidget {
  const ServiceInfoEditView({super.key});

  static Future<void> navigate(
      {required int serviceDetailsId,
      required int serviceProviderId,
      required ServiceProviderType serviceProviderType}) {
    return MezRouter.toPath(
        SharedServiceProviderRoutes.kserviceInfoEditRoute
            .replaceAll(":serviceDetailsId", serviceDetailsId.toString())
            .replaceAll(":serviceProviderId", serviceProviderId.toString()),
        arguments: <String, dynamic>{
          "serviceProviderType": serviceProviderType,
        });
  }

  @override
  State<ServiceInfoEditView> createState() => _ServiceInfoEditViewState();
}

class _ServiceInfoEditViewState extends State<ServiceInfoEditView> {
  int? detailsId;
  int? serviceId;
  ServiceProviderType? providerType;

  ServiceInfoEditViewController viewController =
      ServiceInfoEditViewController();

  @override
  void initState() {
    detailsId =
        int.tryParse(MezRouter.urlArguments["serviceDetailsId"].toString());
    serviceId =
        int.tryParse(MezRouter.urlArguments["serviceProviderId"].toString());
    providerType = MezRouter.bodyArguments?["serviceProviderType"];

    if (providerType != null && detailsId != null && serviceId != null) {
      viewController.init(
          serviceDetailsId: detailsId!,
          serviceProvidertype: providerType!,
          serviceId: serviceId!);
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "${_i18n()['info']}"),
      bottomSheet: MezButton(
        label: "${_i18n()['save']}",
        borderRadius: 0,
        onClick: () async {
          if (viewController.formKey.currentState?.validate() == true) {
            await viewController.saveInfo();
          }
        },
      ),
      body: Obx(
        () {
          if (viewController.service.value != null) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: viewController.formKey,
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
                          viewController.service.value?.name ?? "",
                          style: context.txt.displaySmall,
                        ),
                      )
                      // Laundry name fiels
                      ,
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${_i18n()['name']}",
                        style: context.txt.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _restNameTextField(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${_i18n()['description']} ${viewController.primaryLang.value.toLanguageName()}',
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _prdescTextField(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${_i18n()['description']} ${viewController.secondaryLang.value.toLanguageName()}',
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _scdescTextField(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${_i18n()['phoneNumber']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: viewController.phoneNumber,
                        style: context.txt.bodyLarge,
                        keyboardType: TextInputType.phone,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return null;
                          } else if (v.toString().isPhoneNumber == false) {
                            return "${_i18n()['phoneErrorText']}";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${_i18n()['location']}",
                        style: context.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ServiceEditLocationCard(
                        editInfoController: viewController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
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
      style: context.txt.bodyLarge,
      validator: (String? v) {
        if (v == null || v.isEmpty) {
          return "";
        }
        return null;
      },
    );
  }

  TextFormField _prdescTextField() {
    return TextFormField(
      controller: viewController.primaryServiceDesc,
      style: context.txt.bodyLarge,
      maxLines: 5,
      minLines: 3,
    );
  }

  TextFormField _scdescTextField() {
    return TextFormField(
      controller: viewController.secondayServiceDesc,
      style: context.txt.bodyLarge,
      maxLines: 5,
      minLines: 3,
    );
  }
}
