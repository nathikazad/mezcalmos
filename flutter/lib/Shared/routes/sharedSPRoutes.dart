import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/ServiceInfoEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/OperatorsListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleView/ServiceScheduleView.dart';
import 'package:qlevar_router/qlevar_router.dart';

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
      builder: () => DeliveryCostSettingView(),
    ),
    QRoute(
      path: kPickDriverRoute,
      name: kPickDriverRoute,
      builder: () => PickDriverView(),
    ),
    QRoute(
      path: kDriversRoute,
      name: kDriversRoute,
      builder: () => ServiceDriversListView(),
    ),
    QRoute(
      path: kOperatorsListRoute,
      name: kOperatorsListRoute,
      builder: () => OperatorsListView(),
    ),
    QRoute(
      path: kDeliveryCostRoute,
      name: kDeliveryCostRoute,
      builder: () => DeliveryCostSettingView(),
    ),
    QRoute(
      path: kServicePaymentsRoute,
      name: kServicePaymentsRoute,
      builder: () => ServicePaymentsView(),
    ),
    QRoute(
      path: kserviceInfoEditRoute,
      name: kserviceInfoEditRoute,
      builder: () => ServiceInfoEditView(),
    ),
    QRoute(
      path: kCreateServiceRoute,
      name: kCreateServiceRoute,
      builder: () => CreateServiceView(),
    ),
    QRoute(
      path: kDeliverySettingsViewRoute,
      name: kDeliverySettingsViewRoute,
      builder: () => DeliverySettingsView(),
    ),
    QRoute(
      path: kserviceScheduleEditRoute,
      name: kserviceScheduleEditRoute,
      builder: () => ServiceScheduleView(),
    ),
    //need to confirm
    QRoute(
      path: kServiceProfileRoute,
      name: kServiceProfileRoute,
      builder: () => ServiceProfileView(),
    ),
  ];
}
