// ignore_for_file: unawaited_futures

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
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
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/env.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

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
                                onClick: () async {
                                  // _accountIdModal();
                                },
                                label: '${_i18n()['businessId']}',
                                subtitle:
                                    'mezkala.app/${_viewController.service.uniqueId}',
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
                                  onClick: () async {
                                    _showQrPdfModal();
                                  },
                                ),
                              _navigationLink(
                                icon: Icons.grading,
                                label: "",
                                labelWidget: Row(
                                  children: [
                                    Text(
                                      "${_i18n()['onlineOrdering']}",
                                      style: context.txt.bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Tooltip(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      message: "${_i18n()["onlineOrderTip"]}",
                                      triggerMode: TooltipTriggerMode.tap,
                                      showDuration: Duration(seconds: 5),
                                      child: Icon(
                                        Icons.info_outline,
                                        color: primaryBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                                trailingWidget: Builder(builder: (context) {
                                  bool toggle =
                                      _viewController.service.onlineOrdering;
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: primaryBlueColor,
                                      onChanged: (value) {
                                        setState(() {
                                          toggle = value;
                                        });
                                        _viewController
                                            .toggleOnlineOrdering(value);
                                      },
                                      value: toggle,
                                    );
                                  });
                                }),
                              ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      width: 0,
                    ),
                  ],
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

  void _showQrPdfModal() {
    Future<void> downloadPdfFromLink(String url) async {
      try {
        final String fileName = "business_flyer_${DateTime.now()}.pdf";
        // Get the application documents directory
        File? file;
        if (kIsWeb) {
          return;
        } else if (Platform.isIOS) {
          final Directory dir = await getApplicationDocumentsDirectory();
          file = File('${dir.path}/$fileName');
        } else if (Platform.isAndroid) {
          final Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
            Permission.manageExternalStorage,
          ].request();

          var storage = statuses[Permission.storage];
          var manageExternalStorage =
              statuses[Permission.manageExternalStorage];
          if (storage!.isGranted || manageExternalStorage!.isGranted) {
            final String downloadsFolderPath = '/storage/emulated/0/Download';
            final Directory dir = Directory(downloadsFolderPath);
            file = File('${dir.path}/$fileName');
          }
        }
        final String filePath = file!.path;

        // Download the PDF file
        final http.Response response = await http.get(Uri.parse(url));

        // Save the file to the specified path
        // File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        print('PDF downloaded successfully. File path: $filePath');
        OpenFile.open(filePath);
      } catch (e) {
        print('Failed to download PDF: $e');
      }
    }

    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Scan this QR code",
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Obx(
                () => Container(
                  height: 25.h,
                  width: 25.h,
                  child: _viewController.serviceLink?.operatorQrImageLink !=
                          null
                      ? CachedNetworkImage(
                          imageUrl:
                              _viewController.serviceLink!.operatorQrImageLink!,
                        )
                      : CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.link,
                    color: primaryBlueColor,
                  ),
                  SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      final String text = _viewController
                          .serviceLink!.customerDeepLink
                          .toString();
                      Clipboard.setData(ClipboardData(text: text)).then(
                          (value) => showSavedSnackBar(
                              title: "Copied", subtitle: text));
                    },
                    child: Text(
                      "Copy your link",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: primaryBlueColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Text("& share your account"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Divider(),
                  )),
                  Text(
                    "OR",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Divider(),
                  )),
                ],
              ),
              SizedBox(height: 6),
              MezButton(
                label: "Download in English",
                icon: Icons.picture_as_pdf,
                backgroundColor: Colors.white,
                textColor: primaryBlueColor,
                borderColor: primaryBlueColor,
                onClick: () async {
                  if (_viewController.serviceLink!.customerFlyerLinks != null) {
                    await downloadPdfFromLink(_viewController
                        .serviceLink!.customerFlyerLinks![Language.EN]!);
                    return;
                  }
                  showErrorSnackBar(
                    errorText: "No flyer link available for download",
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MezButton(
                icon: Icons.picture_as_pdf,
                label: "Download in Spanish",
                borderColor: primaryBlueColor,
                textColor: primaryBlueColor,
                backgroundColor: Colors.white,
                onClick: () async {
                  if (_viewController.serviceLink!.customerFlyerLinks != null) {
                    await downloadPdfFromLink(_viewController
                        .serviceLink!.customerFlyerLinks![Language.ES]!);
                    return;
                  }
                  showErrorSnackBar(
                    errorText: "No flyer link available for download",
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _accountIdModal() {
    showModalBottomSheet<void>(
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
                              hintText: _viewController.service.uniqueId,
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
