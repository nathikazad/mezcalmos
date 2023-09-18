import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferItemsSelectView/OfferItemsSelectView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/ServiceInfoEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/ServiceOfferEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferView/ServiceOffersListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/OperatorsListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/ServiceReviewsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/ServiceScheduleView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/SingleDayScheduleView.dart';
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
  static const String kServiceReviews = "/reviews";
  static const String kServiceProfileRoute =
      '/serviceProfile/:serviceId/:serviceDetailsId/:deliveryDetailsId';
  static const String kSingleDayServiceScheduleRoute =
      '/singleDayServiceSchedule';
  static const String kServiceOffersRoute =
      "/offers/:serviceProviderId/:serviceLinkId";
  static const String kServiceEditOffersRoute = "/editOffers/:offerId";
  static const String kServiceOfferingListView = "/serviceOfferingListView";
  static final List<QRoute> routes = [
    QRoute(
      path: kServiceOffersRoute,
      name: kServiceOffersRoute,
      builder: () => ServiceOffersListView(),
    ),
    QRoute(
      path: kServiceEditOffersRoute,
      name: kServiceEditOffersRoute,
      builder: () => ServiceOfferEditView(),
    ),
    QRoute(
      path: kServiceOfferingListView,
      name: kServiceOfferingListView,
      builder: () => OfferItemsSelectView(),
    ),
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
      path: kServiceReviews,
      name: kServiceReviews,
      builder: () => ServiceReviewsView(),
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
    QRoute(
      path: kSingleDayServiceScheduleRoute,
      name: kSingleDayServiceScheduleRoute,
      builder: () => SingleDayScheduleView(),
    )
  ];
}
