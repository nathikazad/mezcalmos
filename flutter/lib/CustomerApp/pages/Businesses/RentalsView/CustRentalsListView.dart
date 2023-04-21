import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper']['rental'];

// todo @ChiragKr04 fix the cards and ui  of this page
class CustRentalsListView extends StatefulWidget {
  const CustRentalsListView({super.key});
  static Future<void> navigate({required RentalCategory1 category}) {
    final String route = CustBusinessRoutes.custRentalsListRoute;
    return MezRouter.toPath(route, arguments: {"category": category});
  }

  @override
  State<CustRentalsListView> createState() => _CustRentalsListViewState();
}

class _CustRentalsListViewState extends State<CustRentalsListView> {
  CustRentalsListViewController viewController =
      CustRentalsListViewController();

  @override
  void initState() {
    RentalCategory1? category =
        MezRouter.bodyArguments?["category"] as RentalCategory1?;
    if (category != null) {
      viewController.init(rentalCategory: category);
    } else {
      showErrorSnackBar(errorText: "Category not found : $category");
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
            '${_i18n()[viewController.rentalCategory.name.toLowerCase()]['title']}'),
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
                      if (viewController.showFilter) _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildRentals(),
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
                '${_i18n()[viewController.rentalCategory.name.toLowerCase()]['title']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.motorcycle,
            borderRadius: 35,
            backgroundColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade300
                : null,
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
            label: '${_i18n()['shared']['store']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.store,
            borderRadius: 35,
            backgroundColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade300
                : null,
            textColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade800
                : null,
          ),
        ),
      ],
    );
  }

  Widget _filterButton(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 15),
      color: Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          _showFilterSheet(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${_i18n()['shared']['filter']}:',
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                child: Text(
                  (viewController.selectedCategories.length == 1)
                      ? "${viewController.selectedCategories.first.name}"
                      : "${viewController.selectedCategories.length}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>?> _showFilterSheet<String>(
    BuildContext context,
  ) {
    return showModalBottomSheet<List<String>?>(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${_i18n()['shared']['filter']}'),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.filterCategories.length, (int index) {
                      return CheckboxListTile(
                        //    checkColor: primaryBlueColor,
                        activeColor: primaryBlueColor,
                        title:
                            Text(viewController.filterCategories[index].name),
                        value: viewController.selectedCategories
                            .contains(viewController.filterCategories[index]),
                        onChanged: (bool? v) {
                          viewController.switchFilterCategory(v, index);
                        },
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: MezButton(
                            label: '${_i18n()['shared']['cancel']}',
                            backgroundColor: offRedColor,
                            textColor: redAccentColor,
                            onClick: () async {
                              //   viewController.resetFilter();

                              Navigator.pop(context, null);
                            })),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: MezButton(
                            label: '${_i18n()['shared']['confirm']}',
                            onClick: () async {
                              viewController.filter();
                              Navigator.pop(
                                context,
                              );
                            })),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            radius: 30,
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewController.businesses[index].name,
                  style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _getAcceptedPaymentIcons(
                        viewController.businesses[index].acceptedPayments),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.star,
                          color: primaryBlueColor,
                        ),
                        Text(
                          '${viewController.businesses[index].avgRating ?? '0'}',
                          style: context.textTheme.bodyLarge,
                        ),
                        Text(
                          '(${viewController.businesses[index].reviewCount})',
                          style: context.textTheme.bodyMedium,
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text('${_i18n()['shared']['noBusinessFound']}'));
  }

  Widget _buildRentals() {
    if (viewController.rentals.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.rentals.length,
        (int index) => MezCard(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController
                                .rentals[index].details.name[userLanguage] ??
                            "",
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.displaySmall?.copyWith(
                            fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${viewController.rentals[index].details.cost.values.first.toString()}/${'${_i18n()['shared'][viewController.rentals[index].details.cost.keys.first.toStringDuration().toLowerCase()]} '}',
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyLarge?.copyWith(
                            height: 2,
                            fontSize: 11.5.mezSp,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  if (viewController.rentals[index].details.firstImage != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                          width: 50.mezSp,
                          height: 50.mezSp,
                          fit: BoxFit.cover,
                          imageUrl: viewController
                              .rentals[index].details.firstImage!),
                    )
                ],
              ),
              Divider(),
              Text(viewController
                      .rentals[index].details.description?[userLanguage] ??
                  '${_i18n()['shared']['none']}')
            ],
          ),
          // action: (viewController.rentals[index].details.firstImage != null)
          //     ? CachedNetworkImage(
          //         width: 50.mezSp,
          //         height: 50.mezSp,
          //         imageUrl: viewController.rentals[index].details.firstImage!)
          //     : null,
        ),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text('${_i18n()['shared']['noRentalsFound']}'));
  }

//Should be shared
  Row _getAcceptedPaymentIcons(Map<PaymentType, bool> acceptedPayments) {
    final List<IconData> iconList = [];
    acceptedPayments.forEach((PaymentType key, bool value) {
      if (value) {
        switch (key) {
          case PaymentType.Cash:
            iconList.add(Icons.payments_outlined);
            break;
          case PaymentType.Card:
            iconList.add(Icons.credit_card_outlined);
            break;
          case PaymentType.BankTransfer:
            iconList.add(Icons.account_balance_outlined);
            break;
        }
      }
    });

    return Row(
      children: <Icon>[for (IconData icon in iconList) Icon(icon)],
    );
  }
}
