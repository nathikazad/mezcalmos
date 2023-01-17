import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/pages/Cards/CardsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/LaundriesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/LaundryCurrentOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryRequestView/LaundryOrderRequestView.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/SingleLaundry/SingleLaundryScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/CustItemView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/CustCartView.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/SavedLocationView.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/RequestTaxiScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/ViewTaxiOrderScreen.dart';
import 'package:mezcalmos/Shared/pages/PickLocationview.dart' as pickloaction;
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
// import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';

// Routes Keys.
// const String kWrapperRoute = '/wrapper';
const String kTaxiRequestRoute = '/taxiRequest';
const String kOrdersRoute = '/orders';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kViewRestaurantItemRoute = '/items/:restaurantId/:itemId';
const String kRestaurantOrderRoute = '/restaurantOrders/:orderId';
const String kCartRoute = '/cart';
const String kCartItemRoute = '/cart/:cartItemId';
const String kTaxiOrderRoute = '/taxiOrders/:orderId';
const String kLaundryOrderRequest = '/laundryOrderRequest';
const String kLaundryCurrentOrder = '/laundryOrders/:orderId';
const String kPickLocationRoute = '/pickLocationFromMap/addLocation';
const String kPickLocationEditRoute = '/pickLocationFromMap/editLocation';
const String kPickLocationNotAuth = '/pickLocationFromMap/addLocationNoAuth';
const String kSavedLocations = '/savedLocations';
const String kLaundriesListRoute = '/laundriesList';
const String kSavedCards = '/savedCards';
const String kSingleLaundryRoute = '/laundriesList/:laundryId';

String getRestaurantRoute(
  int restaurantId,
) {
  return kRestaurantRoute.replaceFirst(
      ":restaurantId", restaurantId.toString());
}

String getSingleLaundryRoute(String laundryId) {
  return kSingleLaundryRoute.replaceFirst(":laundryId", laundryId);
}

String getItemRoute(int restaurantId, int itemId) {
  return kViewRestaurantItemRoute
      .replaceFirst(":restaurantId", "$restaurantId")
      .replaceFirst(":itemId", itemId.toString());
}

String editCartItemRoute(int cartItemId) {
  return kCartItemRoute.replaceFirst(":cartItemId", cartItemId.toString());
}

String getRestaurantOrderRoute(int orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId.toString());
}

String getTaxiOrderRoute(int orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId.toString());
}

String getLaundryOrderRoute(int orderId) {
  return kLaundryCurrentOrder.replaceFirst(":orderId", orderId.toString());
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(
          name: kHomeRoute,
          page: () => CustomerWrapper(),
        ),
        // restaurant Routes
        GetPage(
          name: kOrdersRoute,
          page: () => CustomerOrdersListView(),
        ),
        GetPage(
          name: kRestaurantsRoute,
          page: () => CustRestaurantListView(),
        ),
        GetPage(
          name: kRestaurantRoute,
          //  page: () => ViewRestaurantScreen(),
          page: () => CustomerRestaurantView(),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kViewRestaurantItemRoute,
          page: () => CustItemView(
            viewItemScreenMode: ViewItemScreenMode.AddItemMode,
          ),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kCartItemRoute,
          page: () =>
              CustItemView(viewItemScreenMode: ViewItemScreenMode.EditItemMode),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kCartItemRoute,
          page: () =>
              CustItemView(viewItemScreenMode: ViewItemScreenMode.EditItemMode),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kCartRoute,
          page: () => ViewCartScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kRestaurantOrderRoute,
          page: () => ViewRestaurantOrderScreen(),
        ),
        GetPage(
          name: kPickLocationRoute,
          page: () => PickLocationView(
              pickloaction.PickLocationMode.AddNewLocation, null, null),
        ),
        GetPage(
          name: kPickLocationEditRoute,
          page: () => PickLocationView(
              pickloaction.PickLocationMode.EditLocation, null, null),
        ),
        GetPage(
          name: kPickLocationNotAuth,
          page: () => PickLocationView(
              pickloaction.PickLocationMode.NonLoggedInPick, null, null),
        ),
        // Taxis Routes
        GetPage(
          name: kTaxiRequestRoute,
          page: () => RequestTaxiScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kTaxiOrderRoute,
          page: () => ViewTaxiOrderScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: kSavedLocations,
          page: () => SavedLocationView(),
        ),
        // Laundry routes
        GetPage(name: kLaundriesListRoute, page: () => LaundriesListView()),
        GetPage(name: kSavedCards, page: () => SavedCardsListView()),

        GetPage(
          name: kLaundryOrderRequest,
          page: () => LaundryOrderRequestView(),
        ),
        GetPage(
          name: kSingleLaundryRoute,
          page: () => SingleLaundryScreen(),
        ),
        GetPage(
          name: kLaundryCurrentOrder,
          page: () => LaundryCurrentOrderView(),
        ),
      ] +
      SharedRouter.sharedRoutes;
}
