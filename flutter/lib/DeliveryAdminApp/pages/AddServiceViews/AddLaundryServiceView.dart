import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class AddLaundryServiceView extends StatefulWidget {
  const AddLaundryServiceView({Key? key}) : super(key: key);

  @override
  State<AddLaundryServiceView> createState() => _AddLaundryServiceViewState();
}

class _AddLaundryServiceViewState extends State<AddLaundryServiceView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // inputs //
  final TextEditingController phoneOrEmail = TextEditingController();
  final TextEditingController name = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, title: "New laundry"),
      bottomNavigationBar: MezButton(
        height: 65,
        label: "Create laundry",
        onClick: () async {
          if (_formKey.currentState!.validate()) {
            await laundryInfoController
                .createLaundry(
                    laundryName: name.text,
                    laundryPhoneOrEmail: phoneOrEmail.text)
                .then((ServerResponse value) => Get.back());
          }
        },
        borderRadius: 0,
        withGradient: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email ID or phone number",
                  style: Get.textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneOrEmail,
                  style: Get.textTheme.bodyText1,
                  validator: (String? v) {
                    if (v == null || v.isEmpty) {
                      return "Required";
                    } else if (!v.isEmail && !v.isPhoneNumber) {
                      return "Please provide an email or phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Laundry name",
                  style: Get.textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: Get.textTheme.bodyText1,
                  controller: name,
                  validator: (String? v) {
                    if (v == null || v.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          )),
    );
  }
}
