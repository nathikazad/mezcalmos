import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/controllers/CustEventsListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessEventCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['EventsViews']['CustEventsListView'];

class CustEventsListView extends StatefulWidget {
  const CustEventsListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custEventsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustEventsListView> createState() => _CustEventsListViewState();
}

class _CustEventsListViewState extends State<CustEventsListView> {
  CustEventsListViewController viewController = CustEventsListViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()['events']}',
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final bool onlyScheduleOneTimeIsEmpty = viewController.events
              .where((EventCard element) =>
                  element.scheduleType == ScheduleType.Scheduled ||
                  element.scheduleType == ScheduleType.OneTime)
              .toList()
              .isEmpty;
          return CustomScrollView(
            controller: viewController.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _viewBusinessesSwitcher(),
                      if (viewController.showBusiness.isFalse)
                        _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : onlyScheduleOneTimeIsEmpty
                                ? NoServicesFound()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (!viewController.isWeeklyEventsEmpty)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_i18n()["scheduled"]} ${_i18n()['events'].toString().toLowerCase()}",
                                              style:
                                                  context.textTheme.bodyLarge,
                                            ),
                                            smallSepartor,
                                            _buildEvents(
                                                ScheduleType.Scheduled),
                                          ],
                                        ),
                                      meduimSeperator,
                                      if (!viewController.isOneTimeEventsEmpty)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_i18n()["oneTime"]} ${_i18n()['events'].toString().toLowerCase()}",
                                              style:
                                                  context.textTheme.bodyLarge,
                                            ),
                                            smallSepartor,
                                            _buildEvents(ScheduleType.OneTime),
                                          ],
                                        ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _viewBusinessesSwitcher() {
    return Row(
      children: [
        Flexible(
          child: MezButton(
            label: '${_i18n()['events']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            fontSize: 12.mezSp,
            icon: Icons.celebration,
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isTrue ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isTrue
                ? Colors.grey.shade800
                : null,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: MezButton(
            label: '${_i18n()['organizers']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            fontSize: 12.mezSp,
            icon: Icons.local_activity,
            borderRadius: 35,
            backgroundColor:
                viewController.showBusiness.isFalse ? Color(0xFFF0F0F0) : null,
            textColor: viewController.showBusiness.isFalse
                ? Colors.grey.shade800
                : null,
          ),
        ),
      ],
    );
  }

  Widget _filterButton(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 15),
      color: Color(0xFFF0F0F0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          // _showFilterSheet(context);
          FilterInput? data = await cusShowBusinessFilerSheet(
              context: context,
              filterInput: viewController.filterInput,
              defaultFilterInput: viewController.defaultFilters());
          if (data != null) {
            viewController.filter(data);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${_i18n()['filter']}:',
              ),
              SizedBox(
                width: 3,
              ),
              Flexible(
                child: Text(
                  (viewController.selectedCategories.length == 1)
                      ? "${viewController.selectedCategories.first.name}"
                      : "${viewController.selectedCategoriesText}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinesses() {
    if (viewController.businesses.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.businesses.length,
        (int index) => MezCard(
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
            elevation: 0,
            contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
            margin: EdgeInsets.only(bottom: 15),
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewController.businesses[index].name,
                  style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _getAcceptedPaymentIcons(
                        viewController.businesses[index].acceptedPayments),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 17.5.mezSp,
                            color: Color(0xFF6779FE),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                              '${viewController.businesses[index].avgRating ?? '0'}',
                              style: context.textTheme.bodySmall),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              '(${viewController.businesses[index].reviewCount})',
                              style: context.textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ));
    } else
      return NoServicesFound();
  }

  Widget _buildEvents(ScheduleType scheduleType) {
    return viewController.events.isNotEmpty
        ? Column(
            children: List.generate(
            viewController.events.length,
            (int index) =>
                scheduleType != viewController.events[index].scheduleType
                    ? const SizedBox.shrink()
                    : CustBusinessEventCard(
                        event: viewController.events[index],
                        needBussinessName: true,
                      ),
          ))
        : NoServicesFound();
  }

  Row _getAcceptedPaymentIcons(Map<PaymentType, bool> acceptedPayments) {
    final List<IconData> iconList = [];
    acceptedPayments.forEach((PaymentType key, bool value) {
      if (value) {
        switch (key) {
          case PaymentType.Cash:
            iconList.add(Icons.payments_outlined);
            break;
          case PaymentType.Card:
            iconList.add(Icons.credit_card_outlined);
            break;
          case PaymentType.BankTransfer:
            iconList.add(Icons.account_balance_outlined);
            break;
        }
      }
    });

    return Row(
      children: <Icon>[
        for (IconData icon in iconList)
          Icon(
            icon,
            size: 15.mezSp,
          )
      ],
    );
  }
}
