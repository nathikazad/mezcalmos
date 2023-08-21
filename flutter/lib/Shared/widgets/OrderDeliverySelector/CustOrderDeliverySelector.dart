import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/controllers/CustOrderDeliverySelectorController.dart';
import 'package:sizer/sizer.dart';

enum CustDeliverySelectorType { Taxi, Driver }

class CustOrderDeliverySelector extends StatefulWidget {
  final ValueChanged<List<int>> onSelectionUpdate;
  final ValueChanged<double> onEstDeliveryPriceChange;
  final CustDeliverySelectorType type;
  final num? distanceInKm;

  const CustOrderDeliverySelector({
    required this.onSelectionUpdate,
    required this.type,
    required this.onEstDeliveryPriceChange,
    this.distanceInKm,
  });

  @override
  State<CustOrderDeliverySelector> createState() =>
      _CustOrderDeliverySelectorState();
}

class _CustOrderDeliverySelectorState extends State<CustOrderDeliverySelector> {
  CustOrderDeliverySelectorController _viewController =
      CustOrderDeliverySelectorController();

  @override
  void initState() {
    mezlog("Distanc in widget ===>${widget.distanceInKm}");
    _viewController.init(
        type: widget.type,
        distance: widget.distanceInKm,
        onSelectionUpdate: widget.onSelectionUpdate,
        onEstDeliveryPriceChange: widget.onEstDeliveryPriceChange);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustOrderDeliverySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    mezDbgPrint(
        "🔥 called didUpdate widget with distance => ${widget.distanceInKm}");
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (widget.distanceInKm != null &&
          widget.distanceInKm != _viewController.distance) {
        _viewController.distance = widget.distanceInKm;
        _viewController.CalculateEstimatedCost();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_viewController.isFetchingCompanies.isTrue) {
        return _loadingWidget(context);
      } else if (_viewController.deliveryCompanies.isNotEmpty) {
        return _buildCampaniesAndSlider(context);
      } else {
        return Text("No open companies found 🥲");
      }
    });
  }

  Container _loadingWidget(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            meduimSeperator,
            Text(
              "Getting comapnies near you ...",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: primaryBlueColor),
            )
          ],
        ));
  }

  Widget _buildCampaniesAndSlider(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        meduimSeperator,
        Text(
          _viewController.isTaxi
              ? 'Choose your taxi@ company'
              : 'Choose your delivery company',
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.info_outline_rounded,
                  color: primaryBlueColor,
                  size: 15.sp,
                ),
              ),
              WidgetSpan(child: SizedBox(width: 3)),
              TextSpan(
                text:
                    'If you choose multiple the first company to accept your order will receive the order.',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: primaryBlueColor,
                ),
              ),
            ],
          ),
        ),
        meduimSeperator,
        Obx(
          () => Column(
            children: _viewController.deliveryCompanies
                .map((DeliveryCompany company) {
              return deliveryCompanySelectCard(
                context: context,
                onNavigateToCompany:
                    _viewController.navigateToCourierServiceView,
                deliveryCompany: company,
                isSelected: _viewController.selectedCompanies
                    .contains(company.info.hasuraId),
                onSelect: (DeliveryCompany selectedCompany) {
                  _viewController.selectCompany(id: company.info.hasuraId);
                },
              );
            }).toList(),
          ),
        ),
        smallSepartor,
        Text(
          "Enter the approximate amount you are willing to pay for the delivery of this order, we will notify all the drivers next to you.",
          style: context.textTheme.bodyMedium,
        ),
        smallSepartor,
        Obx(
          () => Slider(
            min: _viewController.minDeliveryPrice,
            max: _viewController.maxDeliveryPrice,
            thumbColor: primaryBlueColor,
            inactiveColor: secondaryLightBlueColor,
            activeColor: primaryBlueColor,
            label: _viewController.estDeliveryPrice.value.toPriceString(),
            value: _viewController.estDeliveryPrice.value,
            onChanged: (double v) {
              _viewController.estDeliveryPrice.value = v;
              widget.onEstDeliveryPriceChange(v);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_viewController.minDeliveryPrice.toPriceString()),
            Text(_viewController.maxDeliveryPrice.toPriceString()),
          ],
        ),
        meduimSeperator,
      ],
    );
  }
}

Widget deliveryCompanySelectCard({
  required BuildContext context,
  required DeliveryCompany deliveryCompany,
  required bool isSelected,
  required void Function(int) onNavigateToCompany,
  required void Function(DeliveryCompany) onSelect,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              deliveryCompany.info.image,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      deliveryCompany.info.name,
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(width: 3),
                    MezInkwell(
                      backgroundColor: Colors.transparent,
                      label: 'View',
                      textColor: primaryBlueColor,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      onClick: () async =>
                          onNavigateToCompany(deliveryCompany.info.hasuraId),
                    ),
                  ],
                ),
                smallSepartor,
                Row(
                  children: [
                    Text(
                        "${deliveryCompany.deliveryCost!.costPerKm.toPriceString()}/KM"),
                    const SizedBox(width: 5),
                    Text("${6} Drivers"),
                    const SizedBox(width: 5),
                    Icon(Icons.star_rate_rounded, color: primaryBlueColor),
                    Text(
                      "${deliveryCompany.rate?.toStringAsFixed(1)}(${deliveryCompany.numberOfReviews})",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) => onSelect(deliveryCompany),
          ),
        ],
      ),
    ),
  );
}
