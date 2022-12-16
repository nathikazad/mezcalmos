import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SideWebBar extends StatelessWidget {
  const SideWebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirbaseAuthController controller = Get.find<FirbaseAuthController>();
    return Container(
        color: Colors.white,
        width: 350,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: kToolbarHeight + 15,
            ),
            Container(
              height: 136,
              width: 136,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryLightBlueColor,
                // border: Border.all(color: Colors.black),
              ),
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: controller.user?.image == null ||
                        controller.user?.image == ""
                    ? Icon(
                        Icons.person,
                        size: 70,
                        color: primaryBlueColor,
                      )
                    : CachedNetworkImage(
                        imageUrl: controller.user!.image!,
                        fit: BoxFit.cover,
                        imageBuilder: (BuildContext context,
                                ImageProvider<Object> imageProvider) =>
                            Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (BuildContext context, String url) =>
                            Container(
                          width: 130,
                          height: 130,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget:
                            (BuildContext context, String url, error) =>
                                Container(
                                    width: 130,
                                    height: 130,
                                    child: Center(child: Icon(Icons.error))),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              controller.user?.name ?? "",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Color.fromRGBO(224, 224, 224, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SideBarListTile(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              title: "Profile",
              onTap: () {
                QR.to("/profile");
              },
            ),
            SideBarListTile(
              icon: Icon(
                Icons.history,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              title: "Orders",
              onTap: () {
                mezDbgPrint("this is a test");
                QR.navigator.replaceAll("/orders");
              },
            ),
            SideBarListTile(
              icon: Icon(
                Icons.privacy_tip,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              title: "Privacy Policy",
              onTap: () async {
                //
                await launchUrl(
                    Uri.parse("https://mezweb.web.app/privacy-policies"));
              },
            ),
            SideBarListTile(
              icon: Icon(
                Icons.logout,
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              title: "Log Out",
              onTap: () {
                QR.to("/cart");
                // Navigator.of(context).pop();
                // Get.find<FirbaseAuthController>().signOut();
              },
            )
          ],
        ));
  }
}

class SideBarListTile extends StatelessWidget {
  SideBarListTile(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final Icon icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          onTap.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          width: 230,
          child: Row(
            children: [
              icon,
              SizedBox(width: 15),
              Text(
                "$title",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
