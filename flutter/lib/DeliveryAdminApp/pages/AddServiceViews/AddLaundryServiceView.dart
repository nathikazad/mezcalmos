import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AddServiceViews/Controllers/AddLaundryServiceViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/TextInputHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["AddLaundryServiceView"];

//
class AddLaundryServiceView extends StatefulWidget {
  const AddLaundryServiceView({Key? key}) : super(key: key);

  @override
  State<AddLaundryServiceView> createState() => _AddLaundryServiceViewState();
}

class _AddLaundryServiceViewState extends State<AddLaundryServiceView> {
  AddServiceViewController viewController = AddServiceViewController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    viewController.init(serviceType: ServiceType.Laundry);
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
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          title: '${_i18n()["newLaundry"]}'),
      bottomNavigationBar: MezButton(
        height: 65,
        label: '${_i18n()["createLaundry"]}',
        onClick: () async {
          if (_formKey.currentState!.validate()) {
            await viewController.saveService();
          }
        },
        borderRadius: 0,
        withGradient: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  _helperText(),
                  SizedBox(
                    height: 10,
                  ),
                  _emailPhoneSelector(),
                  SizedBox(
                    height: 25,
                  ),
                  if (viewController.serviceContact == ServiceContact.Email)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_i18n()["email"]}',
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: Get.textTheme.bodyText1,
                          controller: viewController.email,
                          validator: (String? v) {
                            return viewController.validateEmail(v);
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  if (viewController.serviceContact == ServiceContact.Phone)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_i18n()["phoneNumber"]}',
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _phoneNumberInput(),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  Text(
                    '${_i18n()["laundryName"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: Get.textTheme.bodyText1,
                    inputFormatters: <TextInputFormatter>[
                      UpperCaseTextFormatter()
                    ],
                    controller: viewController.name,
                    validator: (String? v) {
                      return viewController.requiredValidation(v);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _emailPhoneSelector() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: CheckboxListTile(
              value: viewController.serviceContact == ServiceContact.Email,
              onChanged: (bool? v) {
                viewController.switchEmail();
              },
              title:
                  Text('${_i18n()["email"]}', style: Get.textTheme.bodyText1),
              activeColor: primaryBlueColor,
              selectedTileColor: primaryBlueColor,
              contentPadding: EdgeInsets.zero,
              checkboxShape: CircleBorder(),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Flexible(
            child: CheckboxListTile(
              value: viewController.serviceContact == ServiceContact.Phone,
              onChanged: (bool? v) {
                viewController.switchPhone();
              },
              title: Text('${_i18n()["phoneNumber"]}',
                  style: Get.textTheme.bodyText1),
              activeColor: primaryBlueColor,
              contentPadding: EdgeInsets.zero,
              selectedTileColor: primaryBlueColor,
              checkboxShape: CircleBorder(),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        ],
      ),
    );
  }

  Container _helperText() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.help_outline_rounded,
              size: 23,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(child: Text('${_i18n()["helperText"]}')),
        ],
      ),
    );
  }

  Widget _phoneNumberInput() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: TextFormField(
            controller: viewController.phoneCountry,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
            ],
            style: Get.textTheme.bodyText1,
            validator: (String? v) {
              return viewController.requiredValidation(v);
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: TextFormField(
              controller: viewController.phone,
              keyboardType: TextInputType.phone,
              style: Get.textTheme.bodyText1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              validator: (String? v) {
                return viewController.validatePhone(v);
              }),
        ),
      ],
    );
  }
}
