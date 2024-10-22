import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/VolunteerView/controllers/CustVolunteerListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessEventCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['VolunteerView']['CustVolunteerListView'];

// todo @ChiragKr04 fix the cards and ui  of this page
class CustVolunteerListView extends StatefulWidget {
  const CustVolunteerListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custVolunteerListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustVolunteerListView> createState() => _CustVolunteerListViewState();
}

class _CustVolunteerListViewState extends State<CustVolunteerListView> {
  CustVolunteerListViewController viewController =
      CustVolunteerListViewController();

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
        title: '${_i18n()['volunteer']}',
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
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
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildVolunteer(),
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
            label: '${_i18n()['volunteer']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            fontSize: 12.mezSp,
            icon: Icons.volunteer_activism,
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
            icon: Icons.local_activity,
            fontSize: 12.mezSp,
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
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
                          _getAcceptedPaymentIcons(viewController
                              .businesses[index].acceptedPayments),
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
                  ))));
    } else
      return NoServicesFound();
  }

  Widget _buildVolunteer() {
    if (viewController.volunteer.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.volunteer.length,
        (int index) => CustBusinessEventCard(
          event: viewController.volunteer[index],
          needBussinessName: true,
        ),
      ));
    } else
      return NoServicesFound();
  }

  Column oneTimeBuilder(EventCard eventData) {
    return Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              eventData.period == null
                  ? '-'
                  : "${eventData.period?.start.toDayName().inCaps} ${eventData.period?.start.day} ${DateFormat.MMMM().format(eventData.period!.start)}",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(eventData.period == null
                ? '-'
                : "${eventData.period!.formatTime(eventData.period!.start)} - ${eventData.period!.formatTime(eventData.period!.end)}"),
          ],
        ),
      ],
    );
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
