import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/JoinUs/controllers/JoinUsController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['JoinUsView'];

class JoinUsView extends StatelessWidget {
  const JoinUsView({super.key});

  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.custJoinUsRoute);
  }

  @override
  Widget build(BuildContext context) {
    final JoinUsController _viewController = JoinUsController();
    return Scaffold(
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          title: '${_i18n()['joinUs']}',
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              for (String key in _viewController.options.keys)
                Card(
                    elevation: .5,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          await _viewController.launchApp(key);
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 12.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text('${_i18n()[key]['title']}',
                                            style:
                                                context.textTheme.displaySmall),
                                        Text.rich(TextSpan(
                                            text:
                                                '${_i18n()[key]['subtitle']} ',
                                            style:
                                                context.textTheme.titleMedium,
                                            children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                      Icons.arrow_forward,
                                                      color: primaryBlueColor))
                                            ]))
                                      ],
                                    ),
                                  ),
                                  Image.asset(_viewController
                                      .options[key]!['imageUrl']!)
                                ]))))
            ])));
  }
}