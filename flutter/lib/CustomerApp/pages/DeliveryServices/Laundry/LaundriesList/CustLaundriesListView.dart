import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/CustShowOnlyOpenService.dart';
import 'package:mezcalmos/CustomerApp/components/MezServicesMapView.dart';
import 'package:mezcalmos/CustomerApp/components/NoOpenServiceComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundriesList/controllers/CustLaundriesListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["LaundriesListView"];

class CustLaundriesListView extends StatefulWidget {
  const CustLaundriesListView({Key? key}) : super(key: key);

  static Future<void> navigate() {
    return MezRouter.toNamed(LaundryRoutes.laundriesListRoute);
  }

  @override
  State<CustLaundriesListView> createState() => _CustLaundriesListViewState();
}

class _CustLaundriesListViewState extends State<CustLaundriesListView> {
  CustLaundriesListViewController viewController =
      CustLaundriesListViewController();

  @override
  void initState() {
    viewController.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(
                viewController.isMapView
                    ? '${_i18n()['map']}'
                    : '${_i18n()['laundries']}',
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
        if (viewController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (viewController.isMapView) {
            return _mapView();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (viewController.isLoading.value == false) {
                    return _buildLaundries();
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(15),
                      child: CircularProgressIndicator(),
                    );
                  }
                })
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _mapView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Obx(() => Expanded(
                child: CustSwitchOpenService(
                  label: '${_i18n()["showOnlyOpenLaundries"]}',
                  showOnlyOpen: viewController.showOnlyOpen.value,
                  onChange: (bool value) {},
                ),
              ))),
                Obx(
        () => Expanded(
          child: MezServicesMapView(
            mGoogleMapController: viewController.mapController,
            fetchNewData: (LatLng? mapCenter, double? distance) async {
              await viewController.fetchMapViewLaundries(
                  fromLoc: mapCenter, distance: distance);
              return viewController.allMarkers.toList();
            },
            markers: viewController.allMarkers.value,
          ),
        ),
      ),
      // Expanded(
      //     child: Stack(
      //   children: [
      //     Obx(() {
      //       viewController.allMarkers.isNotEmpty;
      //       return GoogleMap(
      //           compassEnabled: false,
      //           mapToolbarEnabled: false,
      //           zoomControlsEnabled: false,
      //           markers: viewController.laundriesMarkers,
      //           onMapCreated: viewController.onMapCreated,
      //           onCameraMove: viewController.onCameraMove,
      //           initialCameraPosition: CameraPosition(
      //             target: viewController.currentLocation,
      //             zoom: 14,
      //           ));
      //     }),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10),
      //       child: Align(
      //         alignment: Alignment.topCenter,
      //         child: Obx(
      //           () => viewController.showFetchButton.value
      //               ? InkWell(
      //                   onTap: () => viewController.fetchMapViewLaundries(),
      //                   child: Material(
      //                       color: Colors.white,
      //                       elevation: 1,
      //                       borderRadius: BorderRadius.circular(25),
      //                       child: Padding(
      //                         padding: const EdgeInsets.symmetric(
      //                             vertical: 8, horizontal: 20),
      //                         child: Text(
      //                           '${_i18n()['fetchLaundriesInThisArea']}',
      //                           style: context.textTheme.bodyLarge
      //                               ?.copyWith(color: primaryBlueColor),
      //                         ),
      //                       )),
      //                 )
      //               : SizedBox.shrink(),
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomRight,
      //       child: Padding(
      //         padding: const EdgeInsets.only(right: 20, bottom: 20),
      //         child: MezIconButton(
      //           icon: Icons.my_location,
      //           iconColor: Colors.black,
      //           backgroundColor: Colors.white,
      //           onTap: () => viewController.recenterMap(),
      //         ),
      //       ),
      //     )
      //   ],
      // ))
    ]);
  }

  Widget _filterButton(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 0),
      color: Color(0xFFF0F0F0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          FilterInput? data = await cusShowBusinessFilerSheet(
              context: context,
              filterInput: viewController.filterInput,
              defaultFilterInput: viewController.defaultFilters());
          if (data != null) {
            await viewController.filter(data);
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

  Widget _buildLaundries() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchCoomponent(context),
        _sortingSwitcher(),
        _filterButton(context),
        (viewController.filteredServices.value.isNotEmpty)
            ? Column(
                children: List.generate(
                  viewController.filteredServices.value.length,
                  (int index) => CustomerLaundrySelectCard(
                    laundry: viewController.filteredServices[index],
                    customerLocation: viewController.customerLocation,
                  ),
                ),
              )
            : NoOpenServiceComponent(
                showOnlyOpen: viewController.showOnlyOpen.value,
                onClick: () {
                  viewController.changeAlwaysOpenSwitch(false);
                  viewController.filter(viewController.filterInput);
                },
              ),
      ],
    );
  }

  Widget _sortingSwitcher() {
    return Obx(() => CustSwitchOpenService(
          label: '${_i18n()["showOnlyOpenLaundries"]}',
          showOnlyOpen: viewController.showOnlyOpen.value,
          onChange: (bool value) {
            viewController.changeAlwaysOpenSwitch(value);
            viewController.filter(viewController.filterInput);
          },
        ));
  }

  Widget _searchCoomponent(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: context.textTheme.bodyLarge,
      onChanged: (String value) {
        viewController.searchQuery.value = value;
        viewController.filter(viewController.filterInput);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade300,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
          ),
          hintText: '${_i18n()['search']}...'),
    );
  }
}
