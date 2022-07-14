import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:url_launcher/url_launcher.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["ContactUsPopUp"];

//
class ContactUsPopUp extends StatelessWidget {
  const ContactUsPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              final Uri _url = Uri.parse(
                  "mailto:<admin@mezcalmos.com>,<nathikazad@gmail.com>,<valletorralbaa@gmail.com>?subject=MezCalmos%20${_i18n()["help"]}&body=${_i18n()["hello"]}%20MezCalmos%20${_i18n()["team"]}");
              try {
                await launchUrl(_url);
              } catch (e) {
                //To handle error and display error message
                Get.snackbar("Error", "");
              } finally {
                Get.back();
              }
            },
            child: Ink(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/shared/gmailIcon.png",
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      '${_i18n()["contactEmail"]}',
                      style: Get.textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 0.2,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              final String recieverNumber = "+529541184711";
              final String text =
                  "${_i18n()["hello"]}%20MezCalmos%20${_i18n()["team"]}";
              final String whatsappUrl =
                  "whatsapp://send?phone=$recieverNumber" + "&text=$text";
              try {
                await launch(whatsappUrl);
              } catch (e) {
                //To handle error and display error message
                Get.snackbar("Error", "");
              } finally {
                Get.back();
              }
            },
            child: Ink(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/shared/whatsappIcon.png",
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      '${_i18n()["contactWhatsapp"]}',
                      style: Get.textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
