import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DvOpProfileView extends StatefulWidget {
  const DvOpProfileView({super.key});

  @override
  State<DvOpProfileView> createState() => _DvOpProfileViewState();
}

class _DvOpProfileViewState extends State<DvOpProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
          showNotifications: true, title: "Profile"),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Center(child: _drawerHeader()),
              Text(
                'Settings',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 6),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _navigationLink(
                          icon: Icons.person,
                          title: "Info",
                          onClick: () {
                            // navigateToServiceInfoEdit(
                            //     serviceDetailsId:
                            //         Get.find<DeliveryOpAuthController>()
                            //             .companyId!,
                            //     serviceProviderType:
                            //         ServiceProviderType.DeliveryCompany);
                          }),
                      Divider(),
                      _navigationLink(
                          icon: Icons.people,
                          title: "Operators",
                          onClick: () {
                            SharedServiceProviderRoutes.navigateToOperators(
                                serviceProviderId:
                                    Get.find<DeliveryOpAuthController>()
                                        .companyId!,
                                serviceProviderType:
                                    ServiceProviderType.DeliveryCompany);
                          }),
                    ],
                  ),
                ),
              ),

              // shortcuts
              SizedBox(height: 25),
              Text(
                'Shortcuts',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 6),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _navigationLink(
                          icon: Icons.privacy_tip,
                          title: "Privacy Policy",
                          onClick: () async {
                            await launchUrlString(
                                MezEnv.appType.getPrivacyLink());
                          }),
                      Divider(),
                      _navigationLink(
                          icon: Icons.logout,
                          iconColor: Colors.red,
                          textColor: Colors.red,
                          onClick: () async {
                            await Get.find<AuthController>().signOut();
                          },
                          title: "Logout"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required String title,
      Widget? trailingWidget,
      Color? iconColor,
      Color? textColor,
      Function()? onClick}) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () async {
        await onClick?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
                color: iconColor ?? Color(0xFFC4C4C4),
                size: 22,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  title,
                  style: Get.textTheme.bodyLarge?.copyWith(color: textColor),
                )),
            SizedBox(
              width: 5,
            ),
            if (trailingWidget != null) trailingWidget
          ],
        ),
      ),
    );
  }
}
