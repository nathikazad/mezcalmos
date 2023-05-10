import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart'
    deferred as custEventsListView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart'
    deferred as custEventView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart'
    deferred as custHomeRentalView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart'
    deferred as custProducView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView.dart'
    deferred as custRentalView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart'
    deferred as custServiceView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart'
    deferred as custHomeRentalsListView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart'
    deferred as custRentalsListView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsWrapper.dart'
    deferred as custRentalsWrapperView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesWrapper.dart'
    deferred as custServicesWrapperView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart'
    deferred as custServicesListView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/ClassView/CustClassesListView.dart'
    deferred as custClassesView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/TherapyView/CustTherapyListView.dart'
    deferred as custTherapyView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/VolunteerView/CustVolunteerListView.dart'
    deferred as custVolunteerView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/AdevntureView/CustAdventureListView.dart'
    deferred as custAdventureView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeWrapper.dart'
    deferred as custLocallyMadeWrapperView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeListView.dart'
    deferred as custLocallyMadeView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodWrapper.dart'
    deferred as custFoodWrapperView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodListView.dart'
    deferred as custFoodView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessImageScreen.dart'
    deferred as custImageView;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CustBusinessRoutes {
  static String custServiceRoute = "/service/:id";
  static String custProductRoute = "/product/:id";
  static String custEventRoute = "/event/:id";
  static String custHomeRentalRoute = "/homeRental/:id";
  static String custRentalRoute = "/otherRental/:id";
  static String custEventsListRoute = "/customer/events";
  static String custServicesListRoute = "/customer/services";
  static String custRentalsListRoute = "/customer/rentals";
  static String custHomeRentalsListRoute = "/customer/homeRentals";
  static String custClassesListRoute = "/customer/classes";
  static String custTherapyListRoute = "/customer/therapy";
  static String custVolunteerListRoute = "/customer/volunteer";
  static String custAdventureListRoute = "/customer/adventure";
  static String custLocallyMadeRoute = "/customer/locallyMade";
  static String custFoodRoute = "/customer/food";
  static String custImageViewRoute = "/customer/imageView";

  // wrappers //
  static String custRentalsWrapperRoute = "/rentalsWrapper";
  static String custServicesWrapperRoute = "/servicesWrapper";
  static String custLocallyMadeWrapperRoute = "/locallyMadeWrapper";
  static String custFoodWrapperRoute = "/food";

  final List<QRoute> routes = [
    QRoute(
        name: custServiceRoute,
        path: custServiceRoute,
        builder: () => custServiceView.CustServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(custServiceView.loadLibrary),
        ]),
    QRoute(
        name: custProductRoute,
        path: custProductRoute,
        builder: () => custProducView.CustProductView(),
        middleware: <QMiddleware>[
          DefferedLoader(custProducView.loadLibrary),
        ]),
    QRoute(
        name: custEventRoute,
        path: custEventRoute,
        builder: () => custEventView.CustEventView(),
        middleware: <QMiddleware>[
          DefferedLoader(custEventView.loadLibrary),
        ]),
    QRoute(
        name: custServicesListRoute,
        path: custServicesListRoute,
        builder: () => custServicesListView.CustServicesListView(),
        middleware: <QMiddleware>[
          DefferedLoader(custServicesListView.loadLibrary),
        ]),
    QRoute(
      name: custServicesWrapperRoute,
      path: custServicesWrapperRoute,
      builder: () => custServicesWrapperView.CustServicesWrapper(),
      middleware: <QMiddleware>[
        DefferedLoader(custServicesWrapperView.loadLibrary),
      ],
    ),
    QRoute(
      name: custEventsListRoute,
      path: custEventsListRoute,
      builder: () => custEventsListView.CustEventsListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custEventsListView.loadLibrary),
      ],
    ),
    QRoute(
      name: custRentalsListRoute,
      path: custRentalsListRoute,
      builder: () => custRentalsListView.CustRentalsListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custRentalsListView.loadLibrary),
      ],
    ),
    QRoute(
      name: custHomeRentalsListRoute,
      path: custHomeRentalsListRoute,
      builder: () => custHomeRentalsListView.CustHomeRentalListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custHomeRentalsListView.loadLibrary),
      ],
    ),
    QRoute(
      name: custRentalsWrapperRoute,
      path: custRentalsWrapperRoute,
      builder: () => custRentalsWrapperView.CustRentalWrapper(),
      middleware: <QMiddleware>[
        DefferedLoader(custRentalsWrapperView.loadLibrary),
      ],
    ),
    QRoute(
      name: custHomeRentalRoute,
      path: custHomeRentalRoute,
      builder: () => custHomeRentalView.CustHomeRentalView(),
      middleware: <QMiddleware>[
        DefferedLoader(custHomeRentalView.loadLibrary),
      ],
    ),
    QRoute(
      name: custRentalRoute,
      path: custRentalRoute,
      builder: () => custRentalView.CustRentalView(),
      middleware: <QMiddleware>[
        DefferedLoader(custRentalView.loadLibrary),
      ],
    ),
    QRoute(
      name: custClassesListRoute,
      path: custClassesListRoute,
      builder: () => custClassesView.CustClassesListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custClassesView.loadLibrary),
      ],
    ),
    QRoute(
      name: custTherapyListRoute,
      path: custTherapyListRoute,
      builder: () => custTherapyView.CustTherapyListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custTherapyView.loadLibrary),
      ],
    ),
    QRoute(
      name: custVolunteerListRoute,
      path: custVolunteerListRoute,
      builder: () => custVolunteerView.CustVolunteerListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custVolunteerView.loadLibrary),
      ],
    ),
    QRoute(
      name: custAdventureListRoute,
      path: custAdventureListRoute,
      builder: () => custAdventureView.CustAdventureListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custAdventureView.loadLibrary),
      ],
    ),
    QRoute(
      name: custLocallyMadeWrapperRoute,
      path: custLocallyMadeWrapperRoute,
      builder: () => custLocallyMadeWrapperView.CustLocallyMadeWrapper(),
      middleware: <QMiddleware>[
        DefferedLoader(custLocallyMadeWrapperView.loadLibrary),
      ],
    ),
    QRoute(
      name: custLocallyMadeRoute,
      path: custLocallyMadeRoute,
      builder: () => custLocallyMadeView.CustLocallyMadeListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custLocallyMadeView.loadLibrary),
      ],
    ),
    QRoute(
      name: custFoodWrapperRoute,
      path: custFoodWrapperRoute,
      builder: () => custFoodWrapperView.CustFoodWrapper(),
      middleware: <QMiddleware>[
        DefferedLoader(custFoodWrapperView.loadLibrary),
      ],
    ),
    QRoute(
      name: custFoodRoute,
      path: custFoodRoute,
      builder: () => custFoodView.CustFoodListView(),
      middleware: <QMiddleware>[
        DefferedLoader(custFoodView.loadLibrary),
      ],
    ),
    QRoute(
      name: custImageViewRoute,
      path: custImageViewRoute,
      builder: () => custImageView.CustBusinessImageScreen(),
      middleware: <QMiddleware>[
        DefferedLoader(custImageView.loadLibrary),
      ],
    ),
  ];
}
