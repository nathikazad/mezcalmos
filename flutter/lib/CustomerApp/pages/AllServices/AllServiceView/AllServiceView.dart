import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/AllServiceListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/AppBarActionButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class AllServiceView extends StatefulWidget {
  const AllServiceView({super.key});

  @override
  State<AllServiceView> createState() => _AllServiceViewState();
}

class _AllServiceViewState extends State<AllServiceView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        titleWidget: MezcalmosSharedWidgets.fillMezkalaTitle(
          actionLength: 2,
        ),
        actionIcons: <Widget>[
          AppBarActionButton(
            icon: Icons.notifications,
            onpress: () {},
          ),
          SizedBox(width: 5),
          AppBarActionButton(
            icon: Icons.access_time_filled,
            onpress: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            mezkalaWelcomeContainer(txt.displayMedium!),
            mezkalaDescription(txt.titleMedium!),
            // const SizedBox(height: 10),
            mezkalaServiceTitle(txt.displayMedium!),
            MezCard(
                contentPadding: EdgeInsets.zero,
                radius: 50,
                content: Obx(
                  () => TextField(
                    decoration: InputDecoration(
                      hintText: _i18n()["search"].toString(),
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                )),
            AllServiceListView(),
          ],
        ),
      ),
    );
  }

  Widget _customIconButton({
    required Function onpress,
    required IconData icon,
  }) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onpress();
      },
      child: Ink(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryLightBlueColor,
        ),
        child: Icon(
          icon,
          size: 20,
          color: primaryBlueColor,
        ),
      ),
    );
  }

  Widget mezkalaWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezkalaDescription(TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['appDescription']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezkalaServiceTitle(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Obx(
        () => Text(
          "${_i18n()['services']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
