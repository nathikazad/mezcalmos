import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProfileView extends StatefulWidget {
  final int? serviceDetailsId;
  final int? serviceId;
  final int? deliveryDetailsId;
  const ServiceProfileView(
      {super.key,
      this.serviceDetailsId,
      this.serviceId,
      this.deliveryDetailsId});

  @override
  State<ServiceProfileView> createState() => _ServiceProfileViewState();
}

class _ServiceProfileViewState extends State<ServiceProfileView> {
  ServiceProfileController _viewController =
      Get.find<ServiceProfileController>();
  int? serviceDetailsId;
  int? serviceId;
  int? deliveryDetailsId;
  @override
  void initState() {
    mezDbgPrint(Get.parameters);
    _assignVars();
    if (serviceDetailsId != null &&
        serviceId != null &&
        deliveryDetailsId != null) {
      _viewController.assignVars(
          serviceDetailsId: serviceDetailsId!,
          serviceId: serviceId!,
          deliveryDetailsId: deliveryDetailsId!);
      _viewController.fetchService();
    }
    super.initState();
  }

  void _assignVars() {
    serviceDetailsId = widget.serviceDetailsId ??
        int.tryParse(Get.parameters["serviceDetailsId"] ?? "");
    serviceId =
        widget.serviceId ?? int.tryParse(Get.parameters["serviceId"] ?? "");
    deliveryDetailsId = widget.deliveryDetailsId ??
        int.tryParse(Get.parameters["deliveryDetailsId"] ?? "");
  }

  bool get asTab => widget.serviceDetailsId != null;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_viewController.hasData) {
          return Scaffold(
            appBar: _getAppBar(),
            body: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
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
                                    navigateToServiceInfoEdit(
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
                                    if (_viewController.service.serviceLinkId !=
                                        null) {
                                      navigateToOperators(
                                          serviceLinkId: _viewController
                                              .service.serviceLinkId!,
                                          serviceProviderId:
                                              _viewController.serviceId,
                                          serviceProviderType: _viewController
                                              .service.serviceProviderType!);
                                    } else {
                                      showErrorSnackBar(
                                          errorText:
                                              "This service have no links please add them first");
                                    }
                                  },
                                  icon: Icons.support_agent,
                                  label: "Operators"),
                              _navigationLink(
                                  onClick: () async {
                                    await MezRouter.toNamed(
                                        kserviceScheduleEdit);
                                  },
                                  icon: Icons.calendar_today,
                                  label: "Schedule"),
                              _navigationLink(
                                  onClick: () async {
                                    navigateToServicePayments(
                                        serviceProviderId:
                                            _viewController.serviceId,
                                        serviceProviderType: _viewController
                                            .service.serviceProviderType!);
                                  },
                                  icon: Icons.payment_rounded,
                                  label: "Payments"),
                              _navigationLink(
                                  icon: Icons.star_rate_rounded,
                                  onClick: () async {
                                    await MezRouter.toNamed(kserviceReview);
                                  },
                                  label: "Reviews"),
                              _navigationLink(
                                onClick: () async {
                                  navigateToDeliverySettings(
                                      deliveryDetailsID:
                                          _viewController.deliveryDetailsId,
                                      detailsId: _viewController.detailsId,
                                      serviceProviderId:
                                          _viewController.serviceId,
                                      serviceProviderType: _viewController
                                          .service.serviceProviderType!);
                                },
                                label: "Delivery",
                                icon: Icons.delivery_dining,
                              ),
                              _navigationLink(
                                  icon: Icons.share,
                                  label: "Share",
                                  trailingWidget: MezIconButton(
                                    icon: Icons.copy,
                                    onTap: () {},
                                  )),
                              _navigationLink(
                                  onClick: () async {
                                    await launch(GetStorage()
                                        .read(getxPrivacyPolicyLink));
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
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MezButton(
                        label: _viewController.service.state.isClosedIndef
                            ? "Open service"
                            : "Close Service",
                        icon: _viewController.service.state.isClosedIndef
                            ? Icons.lock_open
                            : Icons.lock,
                        textColor: !_viewController.service.state.isClosedIndef
                            ? Colors.red
                            : null,
                        backgroundColor:
                            _viewController.service.state.isClosedIndef
                                ? Colors.green
                                : offRedColor,
                        onClick: () async {
                          await _viewController.switchOpen(
                              _viewController.service.state.isClosedIndef);
                        },
                      )
                    ],
                  ),
                )),
          );
        } else {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
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
      preferredSize: _viewController.hasData
          ? Size.fromHeight(_viewController.getAppbarHeight)
          : Size.fromHeight(kTextTabBarHeight),
      child: Obx(
        () => MezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          title: "Dashboard",
          tabBar: (!_viewController.isApproved ||
                  _viewController.service.state.isClosedIndef)
              ? PreferredSize(
                  preferredSize: Size(double.infinity, kToolbarHeight),
                  child: Column(
                    children: [
                      if (_viewController.service.state.isClosedIndef)
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          color: offRedColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                  "Service is closed indefinitely",
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyLarge
                                      ?.copyWith(color: Colors.redAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!_viewController.isApproved)
                        Container(
                          padding: const EdgeInsets.all(12),
                          color: secondaryLightBlueColor,
                          child: Text(
                            "Your restaurant is under review, you’ll be notifiedonce it’s approved.",
                            style: Get.textTheme.bodyLarge
                                ?.copyWith(color: primaryBlueColor),
                          ),
                        ),
                    ],
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
