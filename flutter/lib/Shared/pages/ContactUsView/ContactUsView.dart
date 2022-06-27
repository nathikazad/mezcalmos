import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["Shared"]["pages"]["ContactUsView"];

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  // inputs //
  final TextEditingController cName = TextEditingController();
  final TextEditingController cSubject = TextEditingController();
  final TextEditingController cEmail = TextEditingController();
  final TextEditingController cMessage = TextEditingController();
  // FormKey //
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  RxBool _emailSended = RxBool(false);

  @override
  void initState() {
    _emailSended.value = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailSended.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: "Contact us"),
      body: Obx(() {
        if (_emailSended.isFalse) {
          return _emailForm();
        } else {
          return _emailSendedComponent();
        }
      }),
    );
  }

  Widget _emailForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              '${_i18n()["name"]}',
              style:
                  Get.textTheme.bodyText1?.copyWith(color: Color(0xFF787878)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              decoration: _decoration(),
              controller: cName,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return '${_i18n()["requiredError"]}';
                }
                return null;
              },
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              '${_i18n()["email"]}',
              style:
                  Get.textTheme.bodyText1?.copyWith(color: Color(0xFF7878780)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              decoration: _decoration(),
              controller: cEmail,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()["requiredError"]}";
                } else if (!v.isEmail) {
                  return "${_i18n()["emailError"]}";
                }
                return null;
              },
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              '${_i18n()["subject"]}',
              style:
                  Get.textTheme.bodyText1?.copyWith(color: Color(0xFF7878780)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: Get.textTheme.bodyText1,
              decoration: _decoration(),
              controller: cSubject,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()["requiredError"]}";
                }
                return null;
              },
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              '${_i18n()["message"]}',
              style:
                  Get.textTheme.bodyText1?.copyWith(color: Color(0xFF787878)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              minLines: 5,
              maxLines: 5,
              style: Get.textTheme.bodyText1,
              decoration: _decoration(),
              controller: cMessage,
              validator: (String? v) {
                if (v == null || v.isEmpty) {
                  return "${_i18n()["requiredError"]}";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            MezButton(
              label: '${_i18n()["send"]}',
              onClick: () async {
                if (_formKey.currentState!.validate()) {
                  await _sendEmail().then((value) => _emailSended.value = true);
                }
              },
              withGradient: true,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
    final Email email = Email(
      body:
          ' Hello MezCalmos Team \n You got new email From : $cEmail.text \n Subject : $cSubject.text \n Message : $cMessage.text',
      subject: 'Customer Help : $cSubject',
      recipients: [
        'admin@mezcalmos.com',
        'nathikazad@gmail.com',
        'valletorralbaa@gmail.com'
      ],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  InputDecoration _decoration() {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.shade200);
  }

  Widget _emailSendedComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40.h,
          width: double.infinity,
          child: Image.asset(
            "assets/images/shared/emailSended.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "${_i18n()["sendedTitle"]}",
          style: Get.textTheme.headline3,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${_i18n()["sendedBody"]}',
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
