import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/pages/ServiceProfileView/controllers/ServiceProfileViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ServiceProfileView extends StatefulWidget {
  final int? serviceDetailsId;
  const ServiceProfileView({super.key, this.serviceDetailsId});

  @override
  State<ServiceProfileView> createState() => _ServiceProfileViewState();
}

class _ServiceProfileViewState extends State<ServiceProfileView> {
  ServiceProfileViewController _viewController = ServiceProfileViewController();
  int? serviceDetailsId;
  @override
  void initState() {
    serviceDetailsId =
        widget.serviceDetailsId ?? int.parse(Get.parameters["id"] ?? "");
    if (serviceDetailsId != null) {
      _viewController.init(serviceDetailsId: serviceDetailsId);
    }
    super.initState();
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
              ? _pageContent()
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _pageContent() {
    return SizedBox();
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
          tabBar: (_viewController.isApproved)
              ? PreferredSize(
                  preferredSize: Size(double.infinity, kToolbarHeight),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.amber.shade200,
                    child: Text(
                      "Your restaurant is under review, you’ll be notifiedonce it’s approved.",
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Colors.amber.shade700),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
