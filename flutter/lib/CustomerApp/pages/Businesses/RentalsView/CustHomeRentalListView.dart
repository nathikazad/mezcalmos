import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/controllers/CustHomeRentalsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['RentalsView']['CustHomeRentalListView'];

// todo @ChiragKr04 fix the cards ui and translations of this page
class CustHomeRentalListView extends StatefulWidget {
  const CustHomeRentalListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custHomeRentalsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalListView> createState() => _CustHomeRentalListViewState();
}

class _CustHomeRentalListViewState extends State<CustHomeRentalListView> {
  CustHomeRentalsListViewController viewController =
      CustHomeRentalsListViewController();

  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()['homes']}',
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

                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildHomeRentals(),
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
            label: '${_i18n()['home']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.house,
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
            label: '${_i18n()['agency']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.business,
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

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
        children: List.generate(
            viewController.businesses.length,
            (int index) => MezCard(
                elevation: 0,
                margin: EdgeInsets.only(bottom: 15),
                onClick: () {
                  CustBusinessView.navigate(
                    businessId: viewController.businesses[index].id,
                  );
                },
                firstAvatarBgImage: CachedNetworkImageProvider(
                    viewController.businesses[index].image),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 17.5.mezSp,
                                color: Color(0xFF6779FE),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                  '${viewController.businesses[index].avgRating ?? '0'}',
                                  style: context.textTheme.bodySmall),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, bottom: 3),
                                child: Text(
                                  '(${viewController.businesses[index].reviewCount})',
                                  style: context.textTheme.bodyMedium,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ))),
      );
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text('${_i18n()['noBusinessesFound']}'));
  }

  Widget _buildHomeRentals() {
    if (viewController.rentals.isNotEmpty) {
      return Column(
          children: List.generate(
              viewController.rentals.length,
              (int index) => MezCard(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 0,
                    onClick: () {
                      CustHomeRentalView.navigate(
                        rentalId:
                            viewController.rentals[index].details.id.toInt(),
                      );
                    },
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewController.rentals[index].details.name
                              .getTranslation(userLanguage),
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.displaySmall?.copyWith(
                              fontSize: 12.5.mezSp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children: [
                                  Text(
                                    viewController.rentals[index].details.cost
                                                .length ==
                                            0
                                        ? '- / -'
                                        : '${viewController.rentals[index].details.cost.values.first.toPriceString()}/${'${_i18n()[viewController.rentals[index].details.cost.keys.first.toStringDuration().toLowerCase()]}'}',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                            fontSize: 12.5.mezSp,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  if (viewController.rentals[0].bedrooms !=
                                      null)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.bed, size: 15.mezSp),
                                        Text(
                                            ' ${viewController.rentals[0].bedrooms} ${_i18n()['bedrooms']}',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ],
                                    ),
                                  if (viewController.rentals[0].bathrooms !=
                                      null)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.bed, size: 15.mezSp),
                                        Text(
                                            ' ${viewController.rentals[0].bathrooms} ${_i18n()['bathrooms']}',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ],
                                    ),
                                  if (viewController.rentals[index].details
                                          .additionalParameters?['area'] !=
                                      null)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.house_siding,
                                            size: 15.mezSp),
                                        Text(
                                            ' ${viewController.rentals[index].details.additionalParameters?['area']}m²',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            if (viewController
                                    .rentals[index].details.firstImage !=
                                null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                    width: 50.mezSp,
                                    height: 50.mezSp,
                                    fit: BoxFit.cover,
                                    imageUrl: viewController
                                        .rentals[index].details.firstImage!),
                              ),
                          ],
                        ),
                        Divider(),
                        Text(viewController.rentals[index].businessName)
                      ],
                    ),
                  )));
    } else
      return Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text('${_i18n()['noRentalsFound']}'));
  }

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
      children: <Icon>[
        for (IconData icon in iconList)
          Icon(
            icon,
            size: 15.mezSp,
          )
      ],
    );
  }
}
