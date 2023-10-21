import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

import '../../../../../CustomerOldStuff/Businesses/ClassView/controllers/CustClassesListViewController.dart';
import '../../../../../CustomerOldStuff/Businesses/Components/CustBusinessFilterSheet.dart';
import '../../../../../CustomerOldStuff/Businesses/Components/NoServicesFound.dart';
import '../../../../../CustomerOldStuff/Businesses/Offerings/CustEventView/CustEventView.dart';
import '../../../../../CustomerOldStuff/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['ClassView']['CustEventsListView'];

// todo @ChiragKr04 fix the cards and ui  of this page
class CustClassesListView extends StatefulWidget {
  const CustClassesListView({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custClassesListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustClassesListView> createState() => _CustClassesListViewState();
}

class _CustClassesListViewState extends State<CustClassesListView> {
  CustClassesListViewController viewController =
      CustClassesListViewController();

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
        actionIcons: <Widget>[
          FloatingCartComponent(
            cartType: CartType.business,
          ),
        ],
        onClick: MezRouter.back,
        title: '${_i18n()['classes']}',
      ),
      body: Obx(() {
        if (viewController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomScrollView(
            controller: viewController.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _viewBusinessesSwitcher(),
                      if (viewController.showBusiness.isFalse)
                        _filterButton(context),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: (viewController.showBusiness.isTrue)
                            ? _buildBusinesses()
                            : _buildClasses(),
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
      children: <Widget>[
        Flexible(
          child: MezButton(
            label: '${_i18n()['classes']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = false;
            },
            icon: Icons.class_,
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
            label: '${_i18n()['studio']}',
            height: 35,
            onClick: () async {
              viewController.showBusiness.value = true;
            },
            icon: Icons.school,
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
          final FilterInput? data = await cusShowBusinessFilerSheet(
              context: context,
              filterInput: viewController.filterInput,
              isClass: true,
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
            children: <Widget>[
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
            elevation: 0,
            onClick: () {
              CustBusinessView.navigate(
                businessId: viewController.businesses[index].id,
              );
            },
            contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
            margin: EdgeInsets.only(bottom: 15),
            firstAvatarBgImage: CachedNetworkImageProvider(
                viewController.businesses[index].image),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  viewController.businesses[index].name,
                  style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 12.5.mezSp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _getAcceptedPaymentIcons(
                        viewController.businesses[index].acceptedPayments),
                    SizedBox(
                      width: 15,
                    ),
                    if (viewController.businesses[index].avgRating != null &&
                        viewController.businesses[index].avgRating! > 0)
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 17.5.mezSp,
                              color: Color(0xFF6779FE),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                            '${viewController.businesses[index].avgRating}',
                                            style:
                                                context.textTheme.bodySmall)),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: Text(
                                            '(${viewController.businesses[index].reviewCount})',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(fontSize: 7.mezSp)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

  Widget _buildClasses() {
    if (viewController.classes.isNotEmpty) {
      return Column(
          children: List.generate(
        viewController.classes.length,
        (int index) => MezCard(
            elevation: 0,
            margin: EdgeInsets.only(bottom: 12.5),
            onClick: () {
              CustEventView.navigate(
                eventId: viewController.classes[index].details.id.toInt(),
              );
            },
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (viewController.classes[index].details.image != null)
                      Row(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: viewController
                                    .classes[index].details.firstImage ??
                                defaultUserImgUrl,
                            errorWidget:
                                (BuildContext context, String url, error) =>
                                    Icon(Icons.error),
                            imageBuilder: (BuildContext context,
                                    ImageProvider<Object> imageProvider) =>
                                CircleAvatar(
                              radius: 18.5.mezSp,
                              backgroundImage: imageProvider,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    Expanded(
                      child: Text(
                        '${viewController.classes[index].details.name.getTranslation(userLanguage)!.inCaps}',
                        style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 12.5.mezSp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      viewController.classes[index].details.cost.values.first ==
                              0
                          ? '${_i18n()['free']}'
                          : '${viewController.classes[index].details.cost.values.first.toPriceString()}/${'${_i18n()[viewController.classes[index].details.cost.keys.first.toStringDuration().toLowerCase()]} '}',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 12.5.mezSp, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                if (viewController.classes[index].schedule != null &&
                    (viewController.classes[index].scheduleType !=
                        ScheduleType.OnDemand))
                  Column(
                    children: <Widget>[
                      Divider(),
                      CustBusinessScheduleBuilder(
                          period: viewController.classes[index].period,
                          showTitle: false,
                          showIcons: false,
                          schedule: viewController.classes[index].schedule,
                          scheduleType:
                              viewController.classes[index].scheduleType)
                    ],
                  ),
                if (viewController.classes[index].scheduleType ==
                    ScheduleType.OneTime)
                  oneTimeBuilder(viewController.classes[index]),
                SizedBox(height: 3),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(viewController.classes[index].businessName),
                    Text(classType(viewController.classes[index].scheduleType,
                        viewController.classes[index].category1)),
                  ],
                )
              ],
            )),
      ));
    } else
      return NoServicesFound();
  }

  Widget oneTimeBuilder(EventCard classData) {
    return (classData.scheduleType == ScheduleType.OneTime &&
            classData.period != null &&
            classData.startsAt != null &&
            classData.endsAt != null)
        ? Column(
            children: <Widget>[
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${classData.period?.start.toDayName().inCaps} ${classData.period?.start.day} ${classData.period != null ? DateFormat.MMMM().format(classData.period!.start) : ""}",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${formatTime(DateTime.parse(classData.startsAt!).toLocal())} - ${formatTime(DateTime.parse(classData.endsAt!).toLocal())}",
                  ),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }

  String formatTime(DateTime date) {
    return DateFormat("hh:mm a").format(date);
  }

  Row _getAcceptedPaymentIcons(Map<PaymentType, bool> acceptedPayments) {
    final List<IconData> iconList = <IconData>[];
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

  String classType(ScheduleType scheduleType, EventCategory1 category) {
    switch (scheduleType) {
      case ScheduleType.OnDemand:
        return '${_i18n()['private']}/${_i18n()[category.toFirebaseFormatString()]}';
      case ScheduleType.OneTime:
        return '${_i18n()['workshop']}/${_i18n()[category.toFirebaseFormatString()]}';
      default:
        return '${_i18n()['weekly']}/${_i18n()[category.toFirebaseFormatString()]}';
    }
  }
}