import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/components/ServiceEditLocationCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/components/ServiceImageEditComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/controllers/ServiceInfoEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["ServiceInfoEditView"];

//
class ServiceInfoEditView extends StatefulWidget {
  const ServiceInfoEditView({super.key});

  static Future<bool?> navigate(
      {required int serviceDetailsId,
      required int serviceProviderId,
      required ServiceProviderType serviceProviderType}) async {
    await MezRouter.toPath(
        SharedServiceProviderRoutes.kserviceInfoEditRoute
            .replaceAll(":serviceDetailsId", serviceDetailsId.toString())
            .replaceAll(":serviceProviderId", serviceProviderId.toString()),
        arguments: <String, dynamic>{
          "serviceProviderType": serviceProviderType,
        });
    mezDbgPrint("After await 😏==>${MezRouter.backResult}");
    return MezRouter.backResult;
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
    mezDbgPrint(
        "runtimeType ===================================>${_i18n().runtimeType}");
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
      body: Obx(
        () {
          if (viewController.service.value != null) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                              '${_i18n()['description']}',
                              style: context.textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            _prdescTextField(),
                            Obx(() {
                              if (viewController.languages.value?.secondary !=
                                  null) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '${_i18n()['description']} ${viewController.languages.value!.secondary?.toLanguageName() ?? ''}',
                                      style: context.textTheme.bodyLarge,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    _scdescTextField(),
                                  ],
                                );
                              } else
                                return SizedBox();
                            }),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            _phoneNumber(context),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // TextFormField(
                            //   controller: viewController.phoneNumber,
                            //   style: context.txt.bodyLarge,
                            //   keyboardType: TextInputType.phone,
                            //   validator: (String? v) {
                            //     if (v == null || v.isEmpty) {
                            //       return null;
                            //     } else if (v.toString().validatePhoneNumber() ==
                            //         false) {
                            //       return "${_i18n()['phoneErrorText']}";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // SizedBox(
                            //   height: 15,
                            // ),
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
                            meduimSeperator,
                            Text(
                              "${_i18n()['prLang']}",
                              style: context.textTheme.bodyLarge,
                            ),
                            smallSepartor,
                            MezStringDropDown(
                              labelText: "${_i18n()['none']}",
                              value: viewController.languages.value!.primary
                                  .toFirebaseFormatString(),
                              langPath: _i18n(),
                              items: Language.values
                                  .map((Language e) =>
                                      e.toFirebaseFormatString())
                                  .toList(),
                              onChanged: (String? v) {
                                if (v != null) {
                                  viewController.languages.value!.primary =
                                      v.toLanguage();
                                }
                              },
                              validator: (String? p0) {
                                if (p0 == null || p0.isEmpty) {
                                  return "${_i18n()['prLangErrorText']}";
                                }
                                return null;
                              },
                            ),
                            meduimSeperator,
                            Text(
                              "${_i18n()['scLang']}",
                              style: context.textTheme.bodyLarge,
                            ),
                            smallSepartor,
                            MezStringDropDown(
                                labelText: "${_i18n()['none']}",
                                withNoneItem: true,
                                value: viewController.languages.value?.secondary
                                    ?.toFirebaseFormatString(),
                                langPath: _i18n(),
                                validator: (String? v) {
                                  if (v != null &&
                                      v != "none" &&
                                      v.toLanguage() ==
                                          viewController
                                              .languages.value?.primary) {
                                    return "${_i18n()['sameLangErrorText']}";
                                  }
                                  return null;
                                },
                                items: viewController.getSecLangsOptions(),
                                onChanged: (String? v) {
                                  viewController.languages.value?.secondary =
                                      v?.toLanguage() ?? null;
                                  viewController.secondayServiceDesc.text =
                                      viewController
                                                  .service.value?.description?[
                                              viewController.secLang] ??
                                          "";
                                  viewController.languages.refresh();
                                }),
                            bigSeperator,
                            Text(
                              "${_i18n()['uniqueId']}",
                              style: context.textTheme.bodyLarge,
                            ),
                            smallSepartor,
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 17.5,
                                              top: 12.5,
                                              bottom: 15),
                                          hintText: 'mezkala.app/',
                                          hintStyle: context
                                              .textTheme.bodyMedium
                                              ?.copyWith(
                                                  color: Colors.black54)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      enabled: false,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 0, top: 12.5, bottom: 15),
                                          hintText: 'puerto_fitness',
                                          hintStyle:
                                              context.textTheme.bodyMedium),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                MezButton(
                  label: "${_i18n()['save']}",
                  borderRadius: 0,
                  onClick: () async {
                    if (viewController.formKey.currentState?.validate() ==
                        true) {
                      await viewController.saveInfo();
                      await MezRouter.back(backResult: true);
                    }
                  },
                )
              ],
            );
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

  Column _phoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "${_i18n()['phoneNumber']}",
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: 7.5),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                  style: context.txt.bodyLarge,
                  onChanged: (String s) {
                    // if (_prefixTextFieldController.value.text.length > 0 &&
                    //     _numberTextFieldController.value.text.length >= 8) {
                    //   canSendOtp.value = true;
                    // } else {
                    //   canSendOtp.value = false;
                    // }
                    // mezDbgPrint(canSendOtp.value);
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "+52",
                  ),
                  controller: viewController.prefixTextFieldController,
                  keyboardType: TextInputType.phone),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: viewController.phoneNumber,
                style: context.txt.bodyLarge,
                keyboardType: TextInputType.phone,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return null;
                  } else if ((viewController.prefixTextFieldController.text +
                              viewController.phoneNumber.text)
                          .validatePhoneNumber() ==
                      false) {
                    return "${_i18n()['phoneErrorText']}";
                  }
                  return null;
                },
              ),
            )
          ],
        ),
        SizedBox(height: 15),
      ],
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
