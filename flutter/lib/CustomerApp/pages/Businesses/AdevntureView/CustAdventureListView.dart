import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/AdevntureView/controllers/CustAdventureListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/NoServicesFound.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['AdventureView']['CustAdventureListView'];

// todo @ChiragKr04 fix the cards and ui  of this page
class CustAdventureListView extends StatefulWidget {
  const CustAdventureListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custAdventureListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustAdventureListView> createState() => _CustAdventureListViewState();
}

class _CustAdventureListViewState extends State<CustAdventureListView> {
  CustAdventureListViewController viewController =
      CustAdventureListViewController();

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
        title: '${_i18n()['adventure']}',
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
                            : _buildAdventure(),
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
            label: '${_i18n()['adventure']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            fontSize: 12.mezSp,
            icon: Icons.hiking,
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

  Widget _buildAdventure() {
    if (viewController.adventure.isNotEmpty) {
      return Column(
          children: List.generate(
              viewController.adventure.length,
              (int index) => MezCard(
                  elevation: 0,
                  margin: EdgeInsets.only(bottom: 12.5),
                  onClick: () {
                    CustEventView.navigate(
                      eventId:
                          viewController.adventure[index].details.id.toInt(),
                    );
                  },
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl: viewController
                                    .adventure[index].details.firstImage ??
                                defaultUserImgUrl,
                            imageBuilder: (BuildContext context,
                                    ImageProvider<Object> imageProvider) =>
                                CircleAvatar(
                              radius: 16.mezSp,
                              backgroundImage: imageProvider,
                            ),
                          ),
                          if (viewController
                                  .adventure[index].details.firstImage !=
                              null)
                            SizedBox(
                              width: 10,
                            ),
                          Expanded(
                            child: Text(
                              '${viewController.adventure[index].details.name.getTranslation(userLanguage)!.inCaps}',
                              style: context.textTheme.displaySmall?.copyWith(
                                  fontSize: 11.75.mezSp,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Text(
                            '${viewController.adventure[index].details.cost.values.first.toPriceString()}/${'${_i18n()[viewController.adventure[index].details.cost.keys.first.toStringDuration().toLowerCase()]} '}',
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyLarge?.copyWith(
                                fontSize: 12.5.mezSp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      if (viewController.adventure[index].schedule != null)
                        Column(
                          children: [
                            Divider(),
                            CustBusinessScheduleBuilder(
                                showTitle: false,
                                showIcons: false,
                                schedule:
                                    viewController.adventure[index].schedule,
                                scheduleType: viewController
                                    .adventure[index].scheduleType),
                          ],
                        ),
                      if (viewController.adventure[index].scheduleType ==
                          ScheduleType.OneTime)
                        oneTimeBuilder(viewController.adventure[index]),
                      Divider(),
                      Text(viewController.adventure[index].businessName)
                    ],
                  ))));
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
