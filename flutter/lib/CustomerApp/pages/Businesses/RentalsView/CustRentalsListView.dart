import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

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
        titleWidget: Text(viewController.rentalCategory.name),
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
            label: "Rentals",
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.celebration,
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
            label: "Organizers",
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.local_activity,
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
                "Filter:",
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
                Text("Filter"),
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
                            label: "Cancel",
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
                            label: "Confirm",
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
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Text(viewController.businesses[index].name)),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No businesses found"));
  }

  Widget _buildRentals() {
    if (viewController.rentals.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.rentals.length,
        (int index) => MezCard(
            onClick: () {
              if (viewController.rentalCategory == RentalCategory1.Home) {
                CustHomeRentalView.navigate(
                  rentalId: viewController.rentals[index].details.id.toInt(),
                );
              } else {
                CustRentalView.navigate(
                  rentalId: viewController.rentals[index].details.id.toInt(),
                );
              }
            },
            firstAvatarBgImage:
                (viewController.rentals[index].details.firstImage != null)
                    ? CachedNetworkImageProvider(
                        viewController.rentals[index].details.firstImage!)
                    : null,
            content: Text(
                viewController.rentals[index].details.name[userLanguage] ??
                    viewController
                        .rentals[index].details.name.entries.first.value)),
      ));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("No rentals found"));
  }
}
