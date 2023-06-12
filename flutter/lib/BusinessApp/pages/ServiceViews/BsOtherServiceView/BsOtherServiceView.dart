import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/components/BsOpOtherCategorySelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/components/BsOpOtherServiceSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsOtherServiceView/controller/BsOtherServiceViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['services']['otherService'];

class BsOtherServiceView extends StatefulWidget {
  const BsOtherServiceView({super.key});

  @override
  State<BsOtherServiceView> createState() => _BsOtherServiceViewState();

  static Future<void> navigate({
    required OtherServiceType profileName,
    required BsServicesListViewController controller,
  }) async {
    final String route = BusinessOpRoutes.kBsOtherService;
    await MezRouter.toPath(route, arguments: {
      "profileName": profileName,
      "bsServicesListViewController": controller,
    });
  }
}

class _BsOtherServiceViewState extends State<BsOtherServiceView> {
  final BsOtherServiceViewController viewController =
      BsOtherServiceViewController();
  late BsServicesListViewController listController;

  @override
  void initState() {
    final OtherServiceType profileName =
        MezRouter.bodyArguments!["profileName"] as OtherServiceType;
    listController = MezRouter.bodyArguments!["bsServicesListViewController"]
        as BsServicesListViewController;
    viewController.init(profileName, listController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appbar(),
        bottomNavigationBar: MezButton(
          label: "${_i18n()["next"]}",
          borderRadius: 0,
          withGradient: true,
          onClick: () async {
            await viewController.navigate();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["whatService"]}",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              BsOpOtherServiceSelector(
                value:
                    viewController.possibleServiceTypeMap.entries.first.value,
                label: "${_i18n()["serviceType"]}",
                items: viewController.possibleServiceTypeMap.values.toList(),
                onChanged: (p0) {
                  viewController.changeServiceStype(p0!);
                },
              ),
              bigSeperator,
              Text(
                "${_i18n()["whatCategory"]}",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              BsOpOtherCategorySelector(
                value: viewController.selectedCategoryItem.value,
                label: "${_i18n()["serviceType"]}",
                items: viewController.selectedCategory,
                onChanged: (p0) {
                  viewController.changeCategory(p0!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back();
    }, titleWidget: Obx(() => Text(_i18n()["title"])));
  }
}
