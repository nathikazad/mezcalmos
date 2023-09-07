import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/components/CustRestaurantCard.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

class CustHomeViewController {
  late TabController tabController;
  late BuildContext context;
  final GlobalKey<AnimatedListState> animatedListKey =
      GlobalKey<AnimatedListState>();

  MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  RxList<Restaurant> _restaurants = RxList.empty();
  RxList<Restaurant> _filtredRestaurants = RxList.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;
  ScrollController restaurantsScrollController = ScrollController();
  RxList<Item> filteredItems = RxList<Item>.empty();
  RxSet<Marker> _restaurantsMarkers = <Marker>{}.obs;
  RxSet<Marker> get restaurantsMarkers => _restaurantsMarkers;
  List<int> servicesIds = [];

  int fetchSize = 25;
  int offset = 0;
  RxBool hasReachedEndData = RxBool(false);
  RxBool isFetchingRestaurants = RxBool(false);
  RxBool isFetchingItems = RxBool(false);

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(false);

  RxString searchQuery = RxString("");
  // MAP //
  RxBool _isMapView = false.obs;
  bool get isMapView => _isMapView.value;
  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;
  RxList<Restaurant> _mapViewRestaurants = <Restaurant>[].obs;
  List<Restaurant> get mapViewRestaurants => _mapViewRestaurants;
  int mapMarkersOffset = 0;
  int mapMarkersFetchSize = 25;
  bool _hasReachedEndOfMarkers = false;
  // MAP //

  BuildContext? ctx;

  List<Restaurant> get restaurants => _filtredRestaurants.value;
  List<Item> get items => filteredItems.value;
  bool get showRestaurantShimmer =>
      isFetchingRestaurants.value && _filtredRestaurants.isEmpty;
  bool get showIemsShimmer => isFetchingItems.value;

  Future<void> init(
      {required TickerProvider vsync, required BuildContext context}) async {
    this.context = context;
    _initTabController(vsync);
    // restaurantsScrollController.onBottomReach(() {
    //   if (searchType.value == SearchType.searchByRestaurantName &&
    //       searchQuery.value.isEmpty) {
    //     mezDbgPrint("Scroll down call back 🤯🤯🤯🤯🤯🤯");
    //     _fetchRestaurants();
    //   }
    // });
    await Future.wait([
      _fetchRestaurants().then((value) => _assignServiceIds()),
      _searchItem(),
      filter()
    ]);
  }

  void _initTabController(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync);
    tabController.addListener(() {
      if (tabController.index == 0) {
        searchType.value = SearchType.searchByRestaurantName;
      } else {
        searchType.value = SearchType.searchByItemName;
      }
      filter();
    });
  }

  Future<void> fetchMore() async {
    await _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    if (isFetchingRestaurants.value || hasReachedEndData.value) {
      return;
    }
    try {
      isFetchingRestaurants.value = true;
      mezDbgPrint("Fetching new restaurants ...");

      List<Restaurant> newData = await fetch_restaurants(
        is_open: showOnlyOpen.value,
        withCache: false,
        distance: 10000000000000000000,
        limit: fetchSize,
        offset: offset,
        fromLocation: puertoEscondidoLocation,
      );

      if (newData.isNotEmpty) {
        // Use the addItemToAnimatedList function to smoothly add new items
        newData.forEach((Restaurant restaurant) {
          addItemToAnimatedList(restaurant);
        });
      }

      if (newData.length == 0) {
        hasReachedEndData.value = true;
      }
      offset += fetchSize;

      _filtredRestaurants.value = _restaurants;
      _filtredRestaurants.sortByOpen();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isFetchingRestaurants.value = false;
    }
  }

  Future<void> filter() async {
    // _filterInput.clear();

    // changeAlwaysOpenSwitch(
    //     newData['restaurantOpened']?.contains('true') ?? false);
    // mezDbgPrint("_filterInput $_filterInput $newData");
    //   _fetchRestaurantsOnFilter();

    List<Restaurant> newList = new List<Restaurant>.from(_restaurants);

    newList = newList.showOnlyOpen(showOnlyOpen.value) as List<Restaurant>;
    newList.sortByOpen();
    if (searchType.value == SearchType.searchByRestaurantName) {
      _filtredRestaurants.value = newList;
    } else {
      servicesIds =
          newList.map<int>((Restaurant v) => v.info.hasuraId).toList();
      await _searchItem();
    }
  }

  Future<void> _searchItem() async {
    try {
      isFetchingItems.value = true;
      filteredItems.value = await search_items(
          servicesIds: servicesIds,
          keyword: searchQuery.value,
          lang: userLanguage,
          withCache: false);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isFetchingItems.value = false;
    }
  }

  void switchOnlyOpen({required bool value}) {
    showOnlyOpen.value = value;
  }

  void _assignServiceIds() {
    servicesIds =
        _filtredRestaurants.map((Restaurant e) => e.info.hasuraId).toList();
    mezDbgPrint("ITEMS SERVICES IDS LENGTH ${servicesIds.length}");
  }

  Future<void> search(String value) async {
    searchQuery.value = value;
    if (searchType.value == SearchType.searchByRestaurantName) {
      offset = 0;
      hasReachedEndData.value = false;
      isFetchingRestaurants.value = false;
      try {
        isFetchingRestaurants.value = true;
        _filtredRestaurants.value = await fetch_restaurants(
            is_open: showOnlyOpen.value,
            withCache: false,
            keyword: searchQuery.value,
            distance: 10000000000000000000,
            // limit: fetchSize,
            // offset: offset,
            fromLocation: puertoEscondidoLocation);
        _filtredRestaurants.sortByOpen();
      } finally {
        isFetchingRestaurants.value = false;
      }
    } else {
      await _searchItem();
    }
  }

  Future<void> fetchMapViewRentals(
      {required LatLng? fromLoc, required double? distance}) async {
    // if (_hasReachedEndOfMarkers) {
    //   return;
    // }
    try {
      List<Restaurant> newList = await fetch_restaurants(
          fromLocation: cm.Location(
              lat: fromLoc?.latitude ?? _currentLocation.latitude,
              lng: fromLoc?.longitude ?? _currentLocation.longitude,
              address: ''),
          is_open: showOnlyOpen.value,
          withCache: false,
          limit: mapMarkersFetchSize,
          offset: mapMarkersOffset,
          online_ordering: true,
          distance: distance ?? getFetchDistance);
      _mapViewRestaurants += newList;
      mezDbgPrint(
          "NEW MARKERS LENGTH 👋============>${newList.length} \n offset : $mapMarkersOffset , \n limit : $mapMarkersFetchSize");
      if (newList.length == 0) {
        _hasReachedEndOfMarkers = true;
      }
      mapMarkersOffset += mapMarkersFetchSize;
      await _fillMapsMarkers(newData: newList);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      mezDbgPrint("MapView restaurants ====>${_mapViewRestaurants.length}");

      mezDbgPrint(
          "Restaurant markers =======>${restaurantsMarkers.value.length}");
    }
  }

  Future<void> _fillMapsMarkers({required List<Restaurant> newData}) async {
    mezDbgPrint("🔥🔥🔥 FILL IN NEW ${newData.length} MARKERS 🔥🔥🔥");
    for (Restaurant restaurant in newData) {
      await _restaurantsMarkers.addLabelMarker(LabelMarker(
        flat: false,
        label: null,
        anchor: Offset(0.5, 0.5),
        altIconPath: mezRestaurantMarker,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.latitude.toDouble(),
            restaurant.info.location.longitude.toDouble()),
      ));
      // _restaurantsMarkers.add(MezMarker(
      //   flat: true,
      //   fitWithinBounds: false,
      //   markerId: MarkerId(restaurant.info.hasuraId.toString()),
      //   icon: await bitmapDescriptorLoader(
      //       (await cropRonded((await rootBundle.load(mezRestaurantMarker))
      //           .buffer
      //           .asUint8List())),
      //       70,
      //       70,
      //       isBytes: true),
      //   onTap: () => _onSelectRentalTag(restaurant),
      //   position: LatLng(restaurant.info.location.position.latitude!,
      //       restaurant.info.location.position.longitude!),
      // ));
    }
  }

  void _onSelectRentalTag(Restaurant restaurant) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: CustRestaurantCard(restaurant: restaurant),
          );
        });
  }

  Future<void> _fetchCurrentMapMarkers() async {
    LatLng? mapCenter = await mapController.getMapCenter();
    double? distance = calculateDistanceFromBounds(
        await mapController.controller.value!.getVisibleRegion());
    await fetchMapViewRentals(
      fromLoc: mapCenter,
      distance: distance,
    );
    // mapController.markers.clear();
    // mapController.markers
    //     .addAll(_restaurantsMarkers.map((Marker element) => MezMarker(
    //           markerId: element.markerId,
    //           icon: element.icon,
    //           onTap: element.onTap,
    //           consumeTapEvents: true,
    //         )));
  }

  void switchView() {
    _isMapView.value = !_isMapView.value;
    if (_isMapView.isTrue && mapController.isMapReady) {
      _fetchCurrentMapMarkers();
    }
  }

  void addItemToAnimatedList(Restaurant newItem) {
    mezDbgPrint("Adding new Restaurant to Animated List  👋  ");
    final int newIndex = _restaurants.length;
    _restaurants.add(newItem);
    animatedListKey.currentState
        ?.insertItem(newIndex, duration: Duration(milliseconds: 500));
  }
}

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }
