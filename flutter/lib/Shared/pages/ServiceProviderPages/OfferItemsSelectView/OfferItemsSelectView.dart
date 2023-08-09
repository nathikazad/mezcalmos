import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferItemsSelectView/controller/OfferItemsSelectViewController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';

class OfferItemsSelectView extends StatefulWidget {
  const OfferItemsSelectView({super.key});

  @override
  State<OfferItemsSelectView> createState() => _OfferItemsSelectViewState();

  static Future<List<OfferItemData>?> navigate({
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType,
    required List<int> selectedItems,
  }) async {
    await MezRouter.toPath(
      SharedServiceProviderRoutes.kServiceOfferingListView,
      arguments: {
        "serviceProviderId": serviceProviderId,
        "serviceProviderType": serviceProviderType,
        "selectedItems": selectedItems
      },
    );
    return MezRouter.backResult;
  }
}

class _OfferItemsSelectViewState extends State<OfferItemsSelectView> {
  OfferItemsSelectViewController viewController =
      OfferItemsSelectViewController();
  LanguageController languageController = Get.find<LanguageController>();
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;
  List<int> selectedItems = [];
  @override
  void initState() {
    serviceProviderId =
        int.tryParse(MezRouter.bodyArguments!["serviceProviderId"].toString());
    serviceProviderType =
        MezRouter.bodyArguments!["serviceProviderType"] as ServiceProviderType?;
    selectedItems =
        MezRouter.bodyArguments!["selectedItems"] as List<int>? ?? [];

    if (serviceProviderId != null && serviceProviderType != null) {
      viewController.init(
          serviceId: serviceProviderId!,
          selectedItems: selectedItems,
          serviceProviderType: serviceProviderType!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Items",
      ),
      bottomNavigationBar: MezButton(
        borderRadius: 0,
        label: "Save",
        onClick: () async {
          await MezRouter.back(
            backResult: viewController.selectedOfferings,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchInput(),
            meduimSeperator,
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  viewController.allOfferings.length,
                  (int index) {
                    return MezCard(
                      firstAvatarBgImage: CachedNetworkImageProvider(
                          viewController.allOfferings[index].image),
                      content: CheckboxListTile(
                        activeColor: primaryBlueColor,
                        onChanged: (bool? value) {
                          viewController.selectItem(
                              itemId: viewController.allOfferings[index].id,
                              value: value);
                        },
                        value: viewController.selectedOfferings
                            .contains(viewController.allOfferings[index]),
                        title: Text(
                          viewController.allOfferings[index].name
                                  .getTranslation(Get.find<LanguageController>()
                                      .userLanguageKey) ??
                              "",
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(() {
              if (viewController.allOfferings.isNotEmpty &&
                  !viewController.endData)
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: MezButton(
                      label: "Show more",
                      height: 40,
                      backgroundColor: secondaryLightBlueColor,
                      textColor: primaryBlueColor,
                      onClick: () async {
                        await viewController.fetchItems(
                            keyword: viewController.lastSearchedKeyword);
                      }),
                );
              else
                return SizedBox();
            })
          ],
        ),
      ),
    );
  }

  Widget _searchInput() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: context.textTheme.bodyLarge,
        onChanged: viewController.search,
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            hintText: "Search..."),
      ),
    );
  }
}
