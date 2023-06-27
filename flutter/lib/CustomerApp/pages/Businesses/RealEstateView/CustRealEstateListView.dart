import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRealestateView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RealEstateView/controllers/CustRealEstateListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['CustRealEstateListView'];

class CustRealEstateListView extends StatefulWidget {
  const CustRealEstateListView({super.key});

  @override
  State<CustRealEstateListView> createState() => _CustRealEstateListViewState();

  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custRealEstateListRoute;
    return MezRouter.toPath(route);
  }
}

class _CustRealEstateListViewState extends State<CustRealEstateListView> {
  final CustRealEstateListViewController viewController =
      CustRealEstateListViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
       actionIcons: [
          FloatingCartComponent(
            cartType: CartType.business,
          ),
        ],
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(
                viewController.isMapView
                    ? '${_i18n()['map']}'
                    : '${_i18n()['properties']}',
              ))),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Obx(
          () => MezButton(
            height: 42.5,
            onClick: () async {
              viewController.switchView();
            },
            icon: viewController.isMapView ? Icons.list : Icons.room,
            label: viewController.isMapView
                ? '${_i18n()['viewAsList']}'
                : '${_i18n()['viewOnMap']}',
            borderRadius: 25,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (viewController.isMapView) {
            return _mapView();
          }
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
                      if (viewController.showBusiness.isFalse)
                        _filterButton(context),

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

  Widget _mapView() {
    return Stack(
      children: [
        Obx(() {
          viewController.allMarkers.isNotEmpty;
          return GoogleMap(
              compassEnabled: false,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              markers: viewController.buisinessesMarkers,
              onMapCreated: viewController.onMapCreated,
              onCameraMove: viewController.onCameraMove,
              initialCameraPosition: CameraPosition(
                target: viewController.currentLocation,
                zoom: 14,
              ));
        }),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => viewController.showFetchButton.value
                  ? InkWell(
                      onTap: () => viewController.fetchMapViewRentals(),
                      child: Material(
                          color: Colors.white,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(25),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Text(
                              '${_i18n()['fetchHomesInThisArea']}',
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          )),
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: MezIconButton(
              icon: Icons.my_location,
              iconColor: Colors.black,
              backgroundColor: Colors.white,
              onTap: () => viewController.recenterMap(),
            ),
          ),
        )
      ],
    );
  }

  Widget _filterButton(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 15),
      color: Color(0xFFF0F0F0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          // _showFilterSheet(context);
          FilterInput? data = await cusShowBusinessFilerSheet(
              context: context,
              filterInput: viewController.filterInput,
              isTherapy: true,
              defaultFilterInput: viewController.defaultFilters());
          if (data != null) {
            viewController.filter(data);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                '${_i18n()['filter']}:',
              ),
              SizedBox(
                width: 3,
              ),
              Flexible(
                child: Text(
                  "${_i18n()["offerOnly"]}",
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

  Widget _viewBusinessesSwitcher() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Flexible(
            child: MezButton(
              label: '${_i18n()['properties']}',
              height: 35,
              onClick: () async {
                viewController.showBusiness.value = false;
              },
              icon: Icons.real_estate_agent,
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
              icon: Icons.business,
              borderRadius: 35,
              backgroundColor: viewController.showBusiness.isFalse
                  ? Color(0xFFF0F0F0)
                  : null,
              textColor: viewController.showBusiness.isFalse
                  ? Colors.grey.shade800
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            elevation: 0,
            margin: EdgeInsets.only(bottom: 12.5),
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
            radius: 20.mezSp,
            contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
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
                    SizedBox(
                      width: 15,
                    ),
                    if (viewController.businesses[index].avgRating != null &&
                        viewController.businesses[index].avgRating! > 0)
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
                                '${viewController.businesses[index].avgRating}',
                                style: context.textTheme.bodySmall),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
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
            )),
      ));
    } else
      return NoServicesFound();
  }

  Widget _buildRentals() {
    if (viewController.realEstate.isNotEmpty) {
      return Column(
          children: List.generate(
              viewController.realEstate.length,
              (int index) => MezCard(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 0,
                    onClick: () {
                      CustRealestateView.navigate(
                        realestateId:
                            viewController.realEstate[index].details.id.toInt(),
                      );
                    },
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewController.realEstate[index].details.name
                              .getTranslation(userLanguage)!
                              .inCaps,
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.price_check),
                                      Text(
                                        '${viewController.realEstate[index].details.cost.values.first.toPriceString()}',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.bodyLarge
                                            ?.copyWith(
                                                fontSize: 12.5.mezSp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  if (viewController
                                          .realEstate[index].bedrooms !=
                                      null)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.single_bed_outlined,
                                            size: 15.mezSp),
                                        Text(
                                            ' ${viewController.realEstate[index].bedrooms} ${_i18n()['bedrooms']}',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                  // if (viewController.rentals[0].bathrooms !=
                                  //     null)
                                  //   Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: [
                                  //       Icon(Icons.bed, size: 15.mezSp),
                                  //       Text(
                                  //           ' ${viewController.rentals[0].bathrooms} ${_i18n()['bathrooms']}',
                                  //           style: context.textTheme.bodyLarge
                                  //               ?.copyWith(
                                  //                   fontSize: 12.5.mezSp,
                                  //                   fontWeight:
                                  //                       FontWeight.w600)),
                                  //     ],
                                  //   ),
                                  if (viewController.realEstate[index].details
                                          .additionalParameters?['area'] !=
                                      null)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.house_siding,
                                            size: 15.mezSp),
                                        Text(
                                            ' ${viewController.realEstate[index].details.additionalParameters?['area']}m²',
                                            style: context.textTheme.bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12.5.mezSp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            if (viewController
                                    .realEstate[index].details.image !=
                                null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                    width: 50.mezSp,
                                    height: 50.mezSp,
                                    fit: BoxFit.cover,
                                    imageUrl: viewController
                                        .realEstate[index].details.image![0]),
                              )
                          ],
                        ),
                        Divider(),
                        Text(viewController.realEstate[index].businessName)
                      ],
                    ),
                  )));
    } else
      return NoServicesFound();
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
