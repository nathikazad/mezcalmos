import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/components/ServiceOpenCloseSwitcher.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ServiceProfileView extends StatefulWidget {
  final int? serviceDetailsId;
  final int? serviceId;
  const ServiceProfileView({super.key, this.serviceDetailsId, this.serviceId});

  @override
  State<ServiceProfileView> createState() => _ServiceProfileViewState();
}

class _ServiceProfileViewState extends State<ServiceProfileView> {
  ServiceProfileController _viewController =
      Get.find<ServiceProfileController>();
  int? serviceDetailsId;
  int? serviceId;
  @override
  void initState() {
    _assignVars();
    if (serviceDetailsId != null && serviceId != null) {
      _viewController.assignVars(
          serviceDetailsId: serviceDetailsId!, serviceId: serviceId!);
      _viewController.fetchService();
    }
    super.initState();
  }

  void _assignVars() {
    serviceDetailsId = widget.serviceDetailsId ??
        int.tryParse(Get.parameters["serviceDetailsId"] ?? "");
    serviceId =
        widget.serviceId ?? int.tryParse(Get.parameters["serviceId"] ?? "");
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get asTab => widget.serviceDetailsId != null;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _getAppBar(),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          child: (_viewController.hasData)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      _headerImageAndTitle(),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              _navigationLink(
                                  onClick: () async {
                                    SharedServiceProviderRoutes
                                        .navigateToServiceInfoEdit(
                                            serviceProviderId:
                                                _viewController.serviceId,
                                            serviceDetailsId:
                                                _viewController.detailsId,
                                            serviceProviderType: _viewController
                                                .service.serviceProviderType!);
                                  },
                                  icon: Icons.person,
                                  label: "Info"),
                              _navigationLink(
                                  onClick: () async {
                                    SharedServiceProviderRoutes
                                        .navigateToOperators(
                                            serviceProviderId:
                                                _viewController.serviceId,
                                            serviceProviderType: _viewController
                                                .service.serviceProviderType!);
                                  },
                                  icon: Icons.support_agent,
                                  label: "Operators"),
                              _navigationLink(
                                  onClick: () async {
                                    await MezRouter.toNamed(
                                        SharedServiceProviderRoutes
                                            .kserviceScheduleEdit);
                                  },
                                  icon: Icons.calendar_today,
                                  label: "Schedule"),
                              _navigationLink(
                                  onClick: () async {
                                    SharedServiceProviderRoutes
                                        .navigateToServicePayments(
                                            serviceProviderId:
                                                _viewController.serviceId,
                                            serviceProviderType: _viewController
                                                .service.serviceProviderType!);
                                  },
                                  icon: Icons.payment_rounded,
                                  label: "Payments"),
                              _navigationLink(
                                  icon: Icons.star_rate_rounded,
                                  label: "Reviews"),
                              _navigationLink(
                                  onClick: () async {
                                    SharedServiceProviderRoutes
                                        .navigateToDeliverySettings(
                                            serviceProviderId:
                                                _viewController.serviceId,
                                            serviceProviderType: _viewController
                                                .service.serviceProviderType!);
                                  },
                                  label: "",
                                  icon: Icons.delivery_dining,
                                  labelWidget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivery',
                                          style: Get.textTheme.bodyLarge),
                                    ],
                                  )),
                              _navigationLink(
                                  icon: Icons.share,
                                  label: "Share",
                                  trailingWidget: MezIconButton(
                                    icon: Icons.copy,
                                    onTap: () {},
                                  )),
                              ServiceOpenCloseSwitcher(
                                  title: 'Service open',
                                  subtitle: 'Service open subtile',
                                  onTurnedOn: () {
                                    _viewController.switchOpen(true);
                                  },
                                  onTurnedOff: () {
                                    _viewController.switchOpen(false);
                                  },
                                  initialSwitcherValue:
                                      _viewController.isAvailable),
                              Divider(),
                              _navigationLink(
                                  onClick: () async {
                                    await launchUrlString(
                                        MezEnv.appType.getPrivacyLink());
                                  },
                                  icon: Icons.privacy_tip,
                                  label: "Privacy policies"),
                              _navigationLink(
                                  showDivider: false,
                                  onClick: () async {
                                    await Get.find<AuthController>().signOut();
                                  },
                                  label: "",
                                  icon: Icons.logout,
                                  iconColor: Colors.red,
                                  labelWidget: Text(
                                    'Logout',
                                    style: Get.textTheme.bodyLarge
                                        ?.copyWith(color: Colors.red),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _headerImageAndTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
              CachedNetworkImageProvider(_viewController.service.info.image),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          _viewController.service.info.name,
          style: Get.textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  PreferredSize _getAppBar() {
    return PreferredSize(
      preferredSize: (_viewController.isApproved)
          ? Size.fromHeight(kToolbarHeight)
          : Size.fromHeight(kToolbarHeight * 2),
      child: Obx(
        () => mezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          title: "Dashboard",
          tabBar: (!_viewController.isApproved)
              ? PreferredSize(
                  preferredSize: Size(double.infinity, kToolbarHeight),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: secondaryLightBlueColor,
                    child: Text(
                      "Your restaurant is under review, you’ll be notifiedonce it’s approved.",
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required String label,
      Widget? labelWidget,
      Widget? trailingWidget,
      Color? iconColor,
      bool showDivider = true,
      Future<void> Function()? onClick}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onClick,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    icon,
                    color: iconColor ?? Color(0xFFC4C4C4),
                    size: 22,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: labelWidget ??
                        Text(
                          label,
                          style: Get.textTheme.bodyLarge,
                        )),
                SizedBox(
                  width: 5,
                ),
                if (trailingWidget != null) trailingWidget
              ],
            ),
          ),
        ),
        if (showDivider) Divider()
      ],
    );
  }
}
