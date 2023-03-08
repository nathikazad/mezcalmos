import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/components/CreateServiceImageComponent.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["CreateServiceInfoPage"];

//
class CreateServiceInfoPage extends StatelessWidget {
  const CreateServiceInfoPage({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: viewController.infoFromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateServiceImageComponent(viewController: viewController),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['name']}",
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.serviceName,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()['nameError']}";
                }
                return null;
              },
              style: Get.textTheme.bodyLarge,
              decoration: InputDecoration(
                  hintStyle: Get.textTheme.bodyMedium,
                  hintText: "${_i18n()['hintNameText']}"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['description']}",
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              minLines: 2,
              maxLines: 7,
              controller: viewController.description,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()['descriptionError']}";
                }
                return null;
              },
              style: Get.textTheme.bodyLarge,
              decoration: InputDecoration(
                  hintStyle: Get.textTheme.bodyMedium,
                  hintText: "${_i18n()['descriptionHintText']}"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['phoneText']}",
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: viewController.phone,
              keyboardType: TextInputType.phone,
              validator: (String? v) {
                if (v == null || v.isEmpty || v.isPhoneNumber == false) {
                  return "${_i18n()['phoneTextError']}";
                }
                return null;
              },
              style: Get.textTheme.bodyLarge,
              decoration: InputDecoration(
                  hintStyle: Get.textTheme.bodyMedium,
                  hintText: "${_i18n()['phoneTextDescription']}"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${_i18n()['location']}",
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 10,
            ),
            _locationCard(),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationCard() {
    return FormField(validator: (Object? value) {
      if (viewController.newLocation.value == null) {
        return "${_i18n()['locationError']}";
      }
      return null;
    }, builder: (FormFieldState<Object?> state) {
      return Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey.shade200,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  final MezLocation? newLoc =
                      await MezRouter.toNamed(SharedRoutes.kPickLocationNew)
                          as MezLocation?;

                  if (newLoc != null) {
                    viewController.setNewLocation(newLoc);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.place_rounded,
                        color: primaryBlueColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Text(
                            viewController.newLocation.value?.address ??
                                "${_i18n()['pickLoc']}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryBlueColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (!state.isValid)
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    state.errorText ?? "",
                    style:
                        Get.textTheme.titleMedium?.copyWith(color: Colors.red),
                  ))
          ],
        ),
      );
    });
  }
}
