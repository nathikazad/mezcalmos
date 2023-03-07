// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart'
    deferred as mezAdminWrapper;
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart'
    deferred as adminTabsView;
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart'
    deferred as adminServiceOrdersView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';

// import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRoutes {
  static const String kTabsViewRoute = '/deliveryOpHomeScreen';
  static const String kCurrentDeliveryOrderInfoRoute =
      '/currentDeliveryOrders/:orderId';
  static const String kPastOrdersList = "/pastDeliveryOrders";
  static const String kPastDeliveryOrderInfoRoute =
      '/pastDeliveryOrders/:orderId';
  static const String kServiceProvidersListScreen =
      '/serviceProvidersListScreen';
  static const String kServiceOrdersRoute = '/serviceOrders/:serviceProviderId';
  static const String kNotAuthorizedAdmin = "/unauthorized";
  static const String kDeliveryCostSetter = "/deliveryCostSetter";

  static const String kEditInfoView = '/editInfo/:restaurantId';
  static const String kDashboardView = '/dashboard/:restaurantId';

  static const String kCategoryView = '/categoryScreen/:restaurantId';
  static const String kEditCategoryScreen =
      '/categoryScreen/:categoryId/:restaurantId';

  static const String kEditItemView =
      '/itemView/:restaurantId/:itemId/:categoryId';

  static const String kChoiceView =
      "/Choice/:restaurantId:/:optionId/:choiceId";

  // static const String kLaundryOrderView = '/laundryOrders/:orderId';

  static const String kLaundryAdminView = '/laundry/admin/:laundryId';

  static String currentDeliveryOrderInfoRoute(int orderId) {
    return kCurrentDeliveryOrderInfoRoute.replaceFirst(
        ":orderId", orderId.toString());
  }

  static String pastDeliveryOrderInfoRoute(int orderId) {
    return kPastDeliveryOrderInfoRoute.replaceFirst(
        ":orderId", orderId.toString());
  }

  static String pickDriverForOrderRoute(int orderId) {
    return kServiceProvidersListScreen.replaceFirst(
        ':orderId', orderId.toString());
  }

  static String getROpEditInfoRoute({required int restaurantId}) {
    return kDashboardView.replaceFirst(":restaurantId", "$restaurantId");
  }

  static String getLaundryAdminRoute({required int laundryId}) {
    return kLaundryAdminView.replaceFirst(":laundryId", "$laundryId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
            path: kTabsViewRoute,
            name: kTabsViewRoute,
            builder: () => adminTabsView.AdminTabsView(),
            middleware: <QMiddleware>[
              DefferedLoader(adminTabsView.loadLibrary)
            ]),
        // GetPage(name: kTabsView, page: () => AdminTabsView()),
        QRoute(
            path: SharedRoutes.kHomeRoute,
            name: SharedRoutes.kHomeRoute,
            builder: () => mezAdminWrapper.MezAdminWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(mezAdminWrapper.loadLibrary)
            ]),

        QRoute(
            path: kServiceOrdersRoute,
            name: kServiceOrdersRoute,
            builder: () => adminServiceOrdersView.AdminServiceOrdersView(),
            middleware: <QMiddleware>[
              DefferedLoader(adminServiceOrdersView.loadLibrary)
            ]),

        // GetPage(
        //     name: kServiceOrdersRoute, page: () => AdminServiceOrdersView()),
        //

        // GetPage(
        //   name: SharedRoutes.kHomeRoute,
        //   page: () => MezAdminWrapper(),
        // ),

        // GetPage(
        //   name: kMenuView,
        //   page: () => ROpMenuView(),
        // ),
        // GetPage(
        //   name: kCategoryView,
        //   page: () => ROpCategoryView(),
        // ),
        // GetPage(
        //   name: kEditCategoryScreen,
        //   page: () => ROpCategoryView(),
        // ),
        // GetPage(
        //   name: kAddItemView,
        //   page: () => ROpItemView(),
        // ),
        // GetPage(
        //   name: kEditItemView,
        //   page: () => ROpItemView(),
        // ),
        // GetPage(name: kRestaurantOrderView, page: () => RestaurantOrderView()),

        // GetPage(name: kOptionView, page: () => ROpOptionView()),
        // GetPage(name: kChoiceView, page: () => ROpChoiceView()),

        // GetPage(
        //   name: kDvCompanyOrderView,
        //   page: () => DvCompanyOrderView(),
        // ),

        // GetPage(
        //   name: kLaundryOrderView,
        //   page: () => LaundryOrderView(),
        // ),

        // GetPage(
        //   name: kLaundryCategoryView,
        //   page: () => LaundrOpCategoryView(),
        // ),
        // GetPage(
        //   name: kLaundryAdminView,
        //   page: () => LaundryOpAdminView(),
        // ),
      ] +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes;
//  +
// NativeOnlyRoutes.routes;
}
