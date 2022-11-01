import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

class InstallAppBarComponent extends StatefulWidget
    implements PreferredSizeWidget {
  InstallAppBarComponent({Key? key}) : super(key: key);

  @override
  State<InstallAppBarComponent> createState() => _InstallAppBarComponentState();

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class _InstallAppBarComponentState extends State<InstallAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: kToolbarHeight,
      color: Color.fromRGBO(225, 228, 255, 1),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _launchURL(context);
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Color.fromRGBO(103, 121, 254, 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    "Install App",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.1,
          ),
          Expanded(
              child: Container(
            child: Text(
              "Install the app \nto make orders online.",
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Montserrat",
                  color: Color.fromRGBO(103, 121, 254, 1),
                  fontWeight: FontWeight.w600),
            ),
          ))
        ],
      ),
    );
  }
}

_launchURL(BuildContext context) async {
  if (Theme.of(context).platform == TargetPlatform.android) {
    await launchUrl(Uri.parse(
        "https://play.google.com/store/apps/details?id=com.mezcalmos.customer"));
  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    await launchUrl(
        Uri.parse("https://apps.apple.com/us/app/mezcalmos/id1595882320"));
  } else if (Theme.of(context).platform == TargetPlatform.macOS) {
    await launchUrl(
        Uri.parse("https://apps.apple.com/us/app/mezcalmos/id1595882320"));
  } else {
    await launchUrl(Uri.parse(
        "https://play.google.com/store/apps/details?id=com.mezcalmos.customer"));
  }
}
