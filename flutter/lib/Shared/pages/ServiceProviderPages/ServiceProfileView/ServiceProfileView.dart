// ignore_for_file: unawaited_futures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/ServiceReviewsView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["ServiceProfileView"];

class ServiceProfileView extends StatefulWidget {
  final int? serviceDetailsId;
  final int? serviceId;
  final int? deliveryDetailsId;

  const ServiceProfileView(
      {super.key,
      this.serviceDetailsId,
      this.serviceId,
      this.deliveryDetailsId});

  static Future<void> navigate(
      {required int serviceProviderId,
      required int serviceDetailsId,
      required int? deliveryDetailsId}) {
    return MezRouter.toPath(SharedServiceProviderRoutes.kServiceProfileRoute
        .replaceAll(":serviceId", serviceProviderId.toString())
        .replaceAll(":serviceDetailsId", serviceDetailsId.toString())
        .replaceAll(":deliveryDetailsId", deliveryDetailsId.toString()));
  }

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
    mezDbgPrint(MezRouter.urlArguments);
    _assignVars();
    if (serviceDetailsId != null && serviceId != null) {
      _viewController.assignVars(
          serviceDetailsId: serviceDetailsId!,
          serviceId: serviceId!,
          deliveryDetailsId: deliveryDetailsId);
      _viewController.fetchService();
    }
    super.initState();
  }

  void _assignVars() {
    serviceDetailsId = widget.serviceDetailsId ??
        int.tryParse(MezRouter.urlArguments["serviceDetailsId"].toString());
    serviceId = widget.serviceId ??
        int.tryParse(MezRouter.urlArguments["serviceId"].toString());
    deliveryDetailsId = widget.deliveryDetailsId ??
        int.tryParse(MezRouter.urlArguments["deliveryDetailsId"].toString());
  }

  bool get asTab => widget.serviceDetailsId != null;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_viewController.hasData) {
          return Scaffold(
            appBar: _getAppBar(),
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
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
                                    await _viewController.navigateToEdit();
                                  },
                                  icon: Icons.person,
                                  label: "${_i18n()['info']}"),
                              // if (_viewController.serviceLink != null)
                              _navigationLink(
                                  onClick: () async {
                                    await _viewController.navigateToOperators();
                                  },
                                  icon: Icons.support_agent,
                                  label: "${_i18n()['operators']}"),
                              if (_viewController.deliveryDetailsId != null &&
                                  !_viewController.isBusiness)
                                _navigationLink(
                                  onClick: () async {
                                    await _viewController
                                        .navigateToDeliverySettings();
                                  },
                                  label: "${_i18n()['delivery']}",
                                  icon: Icons.delivery_dining,
                                ),
                              _navigationLink(
                                onClick: () async => _accountIdModal(),
                                label: '${_i18n()['businessId']}',
                                subtitle: 'mezkala.app/puerto_fitness',
                                icon: Icons.fingerprint,
                              ),
                              if (_viewController.selfDelivery &&
                                  !_viewController.isBusiness)
                                _navigationLink(
                                    onClick: () async {
                                      await _viewController.navigateToDrivers();
                                    },
                                    icon: Icons.people,
                                    label: "${_i18n()['drivers']}"),
                              _navigationLink(
                                  onClick: () async {
                                    await MezRouter.toNamed(
                                        SharedServiceProviderRoutes
                                            .kserviceScheduleEditRoute);
                                  },
                                  icon: Icons.calendar_month_rounded,
                                  label: "${_i18n()['schedule']}"),
                              if (!_viewController.isBusiness)
                                _navigationLink(
                                    onClick: () async {
                                      ServicePaymentsView.navigate(
                                          serviceProviderId:
                                              _viewController.serviceId,
                                          serviceProviderType: _viewController
                                              .service.serviceProviderType!);
                                    },
                                    icon: Icons.credit_card,
                                    label: "${_i18n()['payments']}"),
                              _navigationLink(
                                  icon: Icons.star_rate_rounded,
                                  onClick: () async {
                                    ServiceReviewsView.navigate();
                                  },
                                  label: "${_i18n()['reviews']}"),
                              if (_viewController.serviceLink != null)
                                _navigationLink(
                                    icon: Icons.share,
                                    label: "${_i18n()['share']}",
                                    trailingWidget: MezIconButton(
                                      elevation: 0,
                                      icon: Icons.copy,
                                      iconSize: 20,
                                      onTap: () {
                                        final String text = _viewController
                                            .serviceLink!.customerDeepLink
                                            .toString();
                                        Clipboard.setData(
                                                ClipboardData(text: text))
                                            .then((value) => showSavedSnackBar(
                                                title: "Copied",
                                                subtitle: text));
                                      },
                                    )),
                              _navigationLink(
                                  showDivider: false,
                                  onClick: () async {
                                    await launchUrlString(
                                        MezEnv.appType.getPrivacyLink());
                                  },
                                  icon: Icons.privacy_tip,
                                  label: "${_i18n()['privacyPolicies']}"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MezButton(
                        label: _viewController.service.state.isClosedIndef
                            ? "${_i18n()['openService']}"
                            : "${_i18n()['closeService']}",
                        icon: _viewController.service.state.isClosedIndef
                            ? Icons.lock_open_outlined
                            : Icons.lock_outline,
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
          style: context.txt.displaySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }

  AppBar _getAppBar() {
    return MezcalmosAppBar(
      asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
      onClick: (asTab) ? null : MezRouter.back,
      tabbarHeight: _viewController.getAppbarHeight,
      title: "${_i18n()['profile']}",
      tabBar: (!_viewController.isApproved ||
              _viewController.service.state.isClosedIndef)
          ? PreferredSize(
              preferredSize:
                  Size(double.infinity, _viewController.getAppbarHeight),
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
                              "${_i18n()['serviceClosed']}",
                              textAlign: TextAlign.center,
                              style: context.txt.bodyLarge
                                  ?.copyWith(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!_viewController.isApproved)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      color: secondaryLightBlueColor,
                      child: Text(
                        "${_i18n()['serviceUnderReview']}",
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required String label,
      String? subtitle,
      Widget? labelWidget,
      Widget? trailingWidget,
      Color? iconColor,
      bool showDivider = true,
      Future<void> Function()? onClick}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onClick,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    icon,
                    color: iconColor ?? Color(0xFFC4C4C4),
                    size: 22,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelWidget ??
                        Text(
                          label,
                          style: context.txt.bodyLarge,
                        ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: context.txt.bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                  ],
                ),
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

  void _accountIdModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              padding: const EdgeInsets.all(17.5),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  '${_i18n()['businessId']}',
                  style: context.txt.displaySmall,
                ),
                SizedBox(height: 27.5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 17.5, top: 7.5, bottom: 10),
                              hintText: 'mezkala.app/',
                              hintStyle: context.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.black54)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 0, top: 7.5, bottom: 10),
                              hintText: 'puerto_fitness',
                              hintStyle: context.textTheme.bodyMedium),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: primaryBlueColor,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                              child: Text('${_i18n()['onlySevenDays']}',
                                  style: context.txt.bodyMedium?.copyWith(
                                      fontSize: 12.5, color: primaryBlueColor)))
                        ])),
                Row(children: [
                  Expanded(
                    child: MezButton(
                      height: 45,
                      onClick: () async => Navigator.pop(context),
                      label: '${_i18n()['cancel']}',
                      textColor: redAccentColor,
                      borderColor: redAccentColor,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: MezButton(
                    height: 45,
                    onClick: () async => Navigator.pop(context),
                    label: '${_i18n()['save']}',
                    backgroundColor: primaryBlueColor,
                  ))
                ])
              ]));
        });
  }
}
