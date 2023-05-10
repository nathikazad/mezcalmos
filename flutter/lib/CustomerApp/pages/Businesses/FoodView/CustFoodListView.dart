import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/controllers/CustFoodListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['FoodView']['CustFoodListView'];

class CustFoodListView extends StatefulWidget {
  const CustFoodListView({super.key});
  static Future<void> navigate({required ServiceCategory1 serviceCategory}) {
    final String route = CustBusinessRoutes.custFoodRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceCategory": serviceCategory,
    });
  }

  @override
  State<CustFoodListView> createState() => _CustFoodListViewState();
}

class _CustFoodListViewState extends State<CustFoodListView> {
  CustFoodListViewController viewController = CustFoodListViewController();

  @override
  void initState() {
    ServiceCategory1? serviceCategory =
        MezRouter.bodyArguments?["serviceCategory"] as ServiceCategory1?;
    if (serviceCategory != null) {
      viewController.init(serviceCategory: serviceCategory);
    } else {
      showErrorSnackBar(
          errorText: "Service Category not found : $serviceCategory");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        titleWidget: Text(
            '${_i18n()[viewController.serviceCategory.first.toFirebaseFormatString()]}'),
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            margin: const EdgeInsets.all(16),
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              controller: viewController.scrollController,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // search bar

                      _viewBusinessesSwitcher(),

                      // filter bar
                      // if (viewController.showFilter) _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildService(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _viewBusinessesSwitcher() {
    return Row(
      children: [
        Flexible(
          child: MezButton(
            label:
                '${_i18n()[viewController.serviceCategory.first.toFirebaseFormatString()]}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.local_offer,
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isTrue ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade800
                : null,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: MezButton(
            label: '${_i18n()['store']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.local_activity,
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isFalse ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade800
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Text(viewController.businesses[index].name)),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text('${_i18n()['noBusinessesFound']}'));
  }

  Widget _buildService() {
    if (viewController.services.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.services.length,
        (int index) => MezCard(
            onClick: () {
              CustProductView.navigate(
                productId: viewController.services[index].details.id.toInt(),
              );
            },
            firstAvatarBgImage:
                (viewController.services[index].details.firstImage != null)
                    ? CachedNetworkImageProvider(
                        viewController.services[index].details.firstImage!)
                    : CachedNetworkImageProvider(customImageUrl),
            content: Text(viewController.services[index].details.name
                .getTranslation(userLanguage))),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text(
              '${_i18n()['no${viewController.serviceCategory.first.name}Found']}'));
  }
}
