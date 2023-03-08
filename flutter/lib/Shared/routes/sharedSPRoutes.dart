import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart'
    deferred as serviceProfileView;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart'
    deferred as createServiceView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/DeliveryCostSettingView.dart'
    deferred as deliveryCostSettingView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart'
    deferred as deliverySettingView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart'
    deferred as pickDriverView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/ServiceDriversListView.dart'
    deferred as serviceDriverListView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/ServiceInfoEditView.dart'
    deferred as serviceInfoEditView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/OperatorsListView.dart'
    deferred as operatorsListView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart'
    deferred as servicePaymentsView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleView/ServiceScheduleView.dart'
    deferred as serviceScheduleView;
import 'package:qlevar_router/qlevar_router.dart';

// GetX based Router (For navigating)
class SharedServiceProviderRoutes {
  static const String kPickDriverRoute = "/pickDriver/:orderId";
  static const String kDriversRoute =
      "/driversList/:serviceProviderId/:serviceLinkId";
  static const String kServicePaymentsRoute =
      "/servicePayments/:ServiceProviderId";
  static const String kDeliveryCostRoute = "/deliveryCost/:deliveryDetailsId";
  static const String kCreateServiceRoute = "/createService";
  static const String kOperatorsListRoute =
      "/operatorsList/:serviceProviderId/:serviceLinkId";

  static const String kDeliverySettingsViewRoute =
      "/deliverySettings/:serviceProviderId";
  static const String kserviceInfoEditRoute =
      "/info/:serviceProviderId/:serviceDetailsId";
  static const String kserviceScheduleEditRoute = "/schedule";
  static const String kDeliveryCostSettingRoute =
      "/costDeliverySettingScreen/:providerId/:providerType";
  static const String kserviceReview = "/reviews";
  static const String kServiceProfileRoute =
      '/service/:serviceId/:serviceDetailsId/:deliveryDetailsId';

  static final List<QRoute> routes = [
    QRoute(
        path: kDeliveryCostSettingRoute,
        name: kDeliveryCostSettingRoute,
        builder: () => deliveryCostSettingView.DeliveryCostSettingView(),
        middleware: <QMiddleware>[
          DefferedLoader(deliveryCostSettingView.loadLibrary)
        ]),
    QRoute(
        path: kPickDriverRoute,
        name: kPickDriverRoute,
        builder: () => pickDriverView.PickDriverView(),
        middleware: <QMiddleware>[DefferedLoader(pickDriverView.loadLibrary)]),
    QRoute(
        path: kDriversRoute,
        name: kDriversRoute,
        builder: () => serviceDriverListView.ServiceDriversListView(),
        middleware: <QMiddleware>[
          DefferedLoader(serviceDriverListView.loadLibrary)
        ]),
    QRoute(
        path: kOperatorsListRoute,
        name: kOperatorsListRoute,
        builder: () => operatorsListView.OperatorsListView(),
        middleware: <QMiddleware>[
          DefferedLoader(operatorsListView.loadLibrary)
        ]),
    QRoute(
        path: kDeliveryCostRoute,
        name: kDeliveryCostRoute,
        builder: () => deliveryCostSettingView.DeliveryCostSettingView(),
        middleware: <QMiddleware>[
          DefferedLoader(deliveryCostSettingView.loadLibrary)
        ]),
    QRoute(
        path: kServicePaymentsRoute,
        name: kServicePaymentsRoute,
        builder: () => servicePaymentsView.ServicePaymentsView(),
        middleware: <QMiddleware>[
          DefferedLoader(servicePaymentsView.loadLibrary)
        ]),
    QRoute(
        path: kserviceInfoEditRoute,
        name: kserviceInfoEditRoute,
        builder: () => serviceInfoEditView.ServiceInfoEditView(),
        middleware: <QMiddleware>[
          DefferedLoader(serviceInfoEditView.loadLibrary)
        ]),
    QRoute(
        path: kCreateServiceRoute,
        name: kCreateServiceRoute,
        builder: () => createServiceView.CreateServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(createServiceView.loadLibrary)
        ]),
    QRoute(
        path: kDeliverySettingsViewRoute,
        name: kDeliverySettingsViewRoute,
        builder: () => deliverySettingView.DeliverySettingsView(),
        middleware: <QMiddleware>[
          DefferedLoader(deliverySettingView.loadLibrary)
        ]),
    QRoute(
        path: kserviceScheduleEditRoute,
        name: kserviceScheduleEditRoute,
        builder: () => serviceScheduleView.ServiceScheduleView(),
        middleware: <QMiddleware>[
          DefferedLoader(serviceScheduleView.loadLibrary)
        ]),
    //need to confirm
    QRoute(
        path: kServiceProfileRoute,
        name: kServiceProfileRoute,
        builder: () => serviceProfileView.ServiceProfileView(),
        middleware: <QMiddleware>[
          DefferedLoader(serviceProfileView.loadLibrary)
        ]),
  ];
}
