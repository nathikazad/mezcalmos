import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/ServiceInfoEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOperatorsList/OperatorsListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleView/ServiceScheduleView.dart';

// GetX based Router (For navigating)
class SharedServiceProviderRoutes {
  static const String kPickDriver = "/pickDriver/:orderId";
  static const String kDriversList = "/driversList/:serviceProviderId";
  static const String kServicePayments = "/servicePayments/:ServiceProviderId";
  static const String kDeliveryCost = "/deliveryCost/:deliveryDetailsId";
  static const String kCreateService = "/createService";
  static const String kOperatorsList =
      "/operatorsList/:serviceProviderId/:serviceLinkId";

  static const String kdeliverySettingsView =
      "/deliverySettings/:serviceProviderId";
  static const String kserviceInfoEdit =
      "/info/:serviceProviderId/:serviceDetailsId";
  static const String kserviceScheduleEdit = "/schedule";
  static const String kDeliveryCostSettingScreen =
      "/costDeliverySettingScreen/:providerId/:providerType";
  static const String kserviceReview = "/reviews";
  static const String kServiceProfile =
      '/service/:serviceId/:serviceDetailsId/:deliveryDetailsId';

// shared navigation methods //
  static void navigateToPickDriver(
      {required int deliveryOrderId, required bool showForwardButton}) {
    final String route =
        kPickDriver.replaceFirst(":orderId", "$deliveryOrderId");
    MezRouter.toNamed(route, arguments: {
      "showForwardButton": showForwardButton,
    });
  }

  static void navigateToDrivers(
      {required int serviceProviderId,
      required ServiceProviderType controllerType}) {
    final String route =
        kDriversList.replaceFirst(":serviceProviderId", "$serviceProviderId");
    MezRouter.toNamed(route, arguments: {
      "serviceProviderType": controllerType,
      "showAppBar": true,
    });
  }

  static void navigateToServiceProfile({
    required int serviceProviderId,
    required int serviceDetailsId,
    required int deliveryDetailsId,
  }) {
    String route =
        kServiceProfile.replaceFirst(":serviceId", "$serviceProviderId");
    route = route.replaceFirst(":serviceDetailsId", "$serviceDetailsId");
    route = route.replaceFirst(":deliveryDetailsId", "$deliveryDetailsId");
    MezRouter.toNamed(
      route,
    );
  }

  static void navigateToDeliveryCost({
    required int deliveryDetailsId,
  }) {
    final String route =
        kDeliveryCost.replaceFirst(":deliveryDetailsId", "$deliveryDetailsId");
    MezRouter.toNamed(route);
  }

  static void navigateToServiceInfoEdit(
      {required int serviceDetailsId,
      required int serviceProviderId,
      required ServiceProviderType serviceProviderType}) {
    String route =
        kserviceInfoEdit.replaceFirst(":serviceDetailsId", "$serviceDetailsId");
    route = route.replaceFirst(":serviceProviderId", "$serviceProviderId");

    MezRouter.toNamed(route, arguments: {
      "serviceProviderType": serviceProviderType,
    });
  }

  static void navigateToServicePayments(
      {required int serviceProviderId,
      required ServiceProviderType serviceProviderType}) {
    final String route = kServicePayments.replaceFirst(
        ":ServiceProviderId", "$serviceProviderId");
    MezRouter.toNamed(route, arguments: {
      "serviceProviderType": serviceProviderType,
    });
  }

  static void navigateToCreateService(
      {required ServiceProviderType serviceProviderType}) {
    MezRouter.toNamed(kCreateService, arguments: {
      "serviceProviderType": serviceProviderType,
    });
  }

  static void navigateToOperators(
      {required int serviceProviderId,
      required int serviceLinkId,
      required ServiceProviderType serviceProviderType}) {
    String route =
        kOperatorsList.replaceFirst(":serviceProviderId", "$serviceProviderId");
    route = route.replaceFirst(":serviceLinkId", "$serviceLinkId");
    MezRouter.toNamed(route, arguments: {
      "serviceProviderType": serviceProviderType,
      "showAppBar": true,
    });
  }

  static void navigateToDeliverySettings({
    required int serviceProviderId,
    required int detailsId,
    required int deliveryDetailsID,
    required ServiceProviderType serviceProviderType,
  }) {
    String route = kdeliverySettingsView.replaceFirst(
        ":serviceProviderId", "$serviceProviderId");
    route = route.replaceFirst(":detailsId", "$detailsId");
    route = route.replaceFirst(":deliveryDetailsId", "$deliveryDetailsID");
    MezRouter.toNamed(route, arguments: {
      "serviceProviderType": serviceProviderType,
    });
  }

  static List<GetPage> routes = [
    GetPage(
        name: kDeliveryCostSettingScreen,
        page: () => DeliveryCostSettingView()),
    GetPage(name: kPickDriver, page: () => PickDriverView()),
    GetPage(name: kDriversList, page: () => ServiceDriversListView()),
    GetPage(name: kOperatorsList, page: () => OperatorsListView()),
    GetPage(name: kDeliveryCost, page: () => DeliveryCostSettingView()),
    GetPage(name: kServicePayments, page: () => ServicePaymentsView()),
    GetPage(name: kserviceInfoEdit, page: () => ServiceInfoEditView()),
    GetPage(name: kCreateService, page: () => CreateServiceView()),
    GetPage(name: kdeliverySettingsView, page: () => DeliverySettingsView()),
    GetPage(name: kserviceScheduleEdit, page: () => ServiceScheduleView()),
  ];
}
