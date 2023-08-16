import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicePostsList/CustServicePostsList.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessHomeCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessPaymentMethods.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessProductCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessRentalCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessServiceCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessEventCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/components/CustBusinessAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/RentalHelper.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart' as review;
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/controllers/MessagesListViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustBusinessView'];

class CustBusinessView extends StatefulWidget {
  const CustBusinessView({Key? key}) : super(key: key);
  static Future<void> navigate({
    required int businessId,
  }) async {
    return MezRouter.toPath(constructUrl(businessId: businessId));
  }

  static String constructUrl({required int businessId}) {
    return CustomerRoutes.custBusinessRoute
        .replaceFirst(':businessId', businessId.toString());
  }

  @override
  _CustBusinessViewState createState() => _CustBusinessViewState();
}

class _CustBusinessViewState extends State<CustBusinessView>
    with TickerProviderStateMixin {
  CustBusinessViewController _viewController = CustBusinessViewController();
  int? businessId;
  @override
  void initState() {
    mezDbgPrint("init state business view");

    businessId = int.tryParse(MezRouter.urlArguments['businessId'].toString());
    if (businessId != null) {
      _viewController.init(businessId: businessId!, vsync: this);
    } else {
      showErrorSnackBar(errorText: "businessId is null");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_viewController.isBusinessLoaded) {
        mezDbgPrint(
            "BUSINESS DATA ${_viewController.business?.details.location.toFirebaseFormattedJson()}");
        mezDbgPrint(
            "BUSINESS DATA ${_viewController.business?.details.acceptedPayments}");
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool value) {
            return [
              CustBusinessViewAppbar(
                viewController: _viewController,
              ),
            ];
          },
          body: TabBarView(
            controller: _viewController.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  children: [
                    if (_viewController.promotions.isNotEmpty)
                      _promotions(context),
                    if (_viewController.business!.homes != null &&
                        _viewController.business!.homes!.isNotEmpty)
                      _home(context),
                    if (_viewController.business!.rentals != null &&
                        _viewController.business!.rentals!.isNotEmpty)
                      _rentals(context),
                    if (_viewController.business!.events != null &&
                        _viewController.business!.events!.isNotEmpty)
                      _events(context),
                    if (_viewController.business!.products != null &&
                        _viewController.business!.products!.isNotEmpty)
                      _products(context),
                    if (_viewController.business!.services != null &&
                        _viewController.business!.services!.isNotEmpty)
                      _services(context)
                    // Column(
                    //   children: List.generate(
                    //       viewController.business.events.length,
                    //       (index) => BusinessEventCard(event : event)),
                    // )
                    // todo @iyadh implements all the needed services / events / rentals .... lists cards of the business
                  ],
                ),
              ),
              CustServicePostsList(
                serviceId: _viewController.businessId,
                serviceImage: _viewController.business!.details.image,
                serviceName: _viewController.business!.details.name,
                serviceProviderType: ServiceProviderType.Business,
              ),
              Container(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    // todo @iyadh implements info tab view
                    __headerButtons(),
                    _description(context),
                    if (_viewController.business!.details.schedule != null)
                      MezServiceOpenHours(
                          schedule:
                              _viewController.business!.details.schedule!),
                    ServiceLocationCard(
                        location: MezLocation(
                            _viewController.business!.details.location.address,
                            MezLocation.buildLocationData(
                                _viewController.business!.details.location.lat
                                    .toDouble(),
                                _viewController.business!.details.location.lng
                                    .toDouble()))),
                    if (_viewController.business!.details.acceptedPayments !=
                        null)
                      CustBusinessPaymentMethods(
                          margin: EdgeInsets.only(top: 10),
                          paymentsMethods: _viewController
                              .business!.details.acceptedPayments!),
                    // CustBusinessPaymentMethods(
                    //     margin: EdgeInsets.only(top: 10),
                    //     paymentsMethods: {
                    //       PaymentType.Card: true,
                    //       PaymentType.Cash: true,
                    //       PaymentType.BankTransfer: true
                    //     }),

                    if (_viewController.business!.details.schedule != null)
                      MezServiceOpenHours(
                          schedule:
                              _viewController.business!.details.schedule!),
                    _reviewsList(context),
                  ],
                ),
              ),
            ],
          ),
        );
        // return CustomScrollView(
        //   slivers: [
        //     CustBusinessViewAppbar(viewController: viewController),

        //     SliverFillRemaining(
        //       //  hasScrollBody: false,
        //       child: TabBarView(
        //         controller: viewController.tabController,
        //         children: <Widget>[
        //           Container(
        //             child: Column(
        //               children: List.generate(
        //                   150,
        //                   (int index) => MezCard(
        //                         content: Text(index.toString()),
        //                       )),
        //             ),
        //           ),
        //           Container(),
        //           Container(),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('${_i18n()['loading']}', style: context.textTheme.bodyMedium
                  //   ?.copyWith(color: pr),
                  ),
            ],
          ),
        );
      }
    }));
  }

  Column _promotions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promotions',
          style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
        ),
        SizedBox(height: 5),
        ..._viewController.promotions.map(
          (Offer element) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF0F2FF),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      aPriceCheck,
                      color: Colors.white,
                      height: 48,
                      width: 48,
                    ),
                    radius: 24,
                    backgroundColor: primaryBlueColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    element.name!.getTranslation(userLanguage) ?? "",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: primaryBlueColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Column _home(BuildContext context) {
    final List<Home> homes = _viewController.business!.homes!
        .where((Home element) => element.forRent)
        .toList();
    final List<Home> realEstate = _viewController.business!.homes!
        .where((Home element) => element.forSale)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Home Rentals
        if (homes.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['homesRentals']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Home home in homes)
                CustBusinessHomeCard(
                  margin: EdgeInsets.only(bottom: 10),
                  rental: home,
                  elevation: 0,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        if (realEstate.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['realEstate']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Home home in realEstate)
                CustBusinessHomeCard(
                  margin: EdgeInsets.only(bottom: 10),
                  rental: home,
                  elevation: 0,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
      ],
    );
  }

  Column _rentals(BuildContext context) {
    final List<Rental> surfRentals = _viewController.business!.rentals!
        .where((Rental element) => element.isSurf)
        .toList();
    final List<Rental> vehicleRentals = _viewController.business!.rentals!
        .where((Rental element) => element.isVehicle)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Surf Rentals
        if (surfRentals.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['surfRentals']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Rental rental in surfRentals)
                CustBusinessRentalCard(
                  margin: EdgeInsets.only(bottom: 10),
                  rental: rental,
                  elevation: 0,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        /// Vehicle Rentals
        if (vehicleRentals.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['vehicleRentals']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Rental rental in vehicleRentals)
                CustBusinessRentalCard(
                  margin: EdgeInsets.only(bottom: 10),
                  rental: rental,
                  elevation: 0,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
      ],
    );
  }

  Column _events(BuildContext context) {
    final List<Event> scheduledEvents = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.Scheduled && !element.isClass)
        .toList();
    final List<Event> oneTimeEvents = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.OneTime && !element.isClass)
        .toList();
    final List<Event> onDemandEvents = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.OnDemand && !element.isClass)
        .toList();
    final List<Event> scheduledClass = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.Scheduled && element.isClass)
        .toList();
    final List<Event> oneTimeClass = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.OneTime && element.isClass)
        .toList();
    final List<Event> onDemandClass = _viewController.business!.events!
        .where((Event element) =>
            element.scheduleType == ScheduleType.OnDemand && element.isClass)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Weekly Events
        if (scheduledEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['weeklyEvents']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in scheduledEvents)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        /// Weekly Classes
        if (scheduledClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['weeklyClasses']}}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in scheduledClass)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        /// One time Events
        if (oneTimeEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['oneTimeEvents']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in oneTimeEvents)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        /// One time Classes
        if (oneTimeClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['oneTimeClasses']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in oneTimeClass)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),

        /// on demand Events
        if (onDemandEvents.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['onDemandEvents']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in onDemandEvents)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              )
            ],
          ),

        /// on demand classes
        if (onDemandClass.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()['onDemandClasses']}',
                style: context.textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 5),
              for (Event event in onDemandClass)
                CustBusinessEventCard(
                  event: EventCard(
                    event: event,
                    businessName: _viewController.business!.details.name,
                    currency: _viewController.business!.details.currency!,
                  ),
                  needBussinessName: false,
                ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
      ],
    );
  }

  Widget _products(BuildContext context) {
    return _viewController.business!.products!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${_i18n()['products']}',
                  style:
                      context.textTheme.displayMedium?.copyWith(fontSize: 20)),
              SizedBox(height: 5),
              for (Product product in _viewController.business!.products!)
                CustBusinessProductCard(
                    margin: EdgeInsets.only(bottom: 10),
                    elevation: 0,
                    product: product),
              SizedBox(
                height: 10,
              )
            ],
          )
        : SizedBox.shrink();
  }

  Widget _services(BuildContext context) {
    return _viewController.business!.services!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${_i18n()['services']}',
                  style:
                      context.textTheme.displayMedium?.copyWith(fontSize: 20)),
              SizedBox(height: 5),
              for (Service service in _viewController.business!.services!)
                CustBusinessServiceCard(
                  margin: EdgeInsets.only(bottom: 10),
                  service: service,
                  elevation: 0,
                ),
              SizedBox(
                height: 10,
              )
            ],
          )
        : SizedBox.shrink();
  }

  Widget __headerButtons() {
    Future<void> navigateToChat() async {
      // check if user not logged in
      if (Get.find<AuthController>().user == null) {
        await SignInView.navigateAtOrderTime();
      } else {
        await CustMessagesListViewController().initiateChat(
          businessId: _viewController.business!.id.toInt(),
          offeringImage: _viewController.business!.details.image,
          offeringName: null,
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Builder(builder: (BuildContext context) {
            bool isLoading = false;
            return StatefulBuilder(builder: (BuildContext context, setState) {
              return Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    side: MaterialStatePropertyAll(BorderSide(
                      color: primaryBlueColor,
                    )),
                    shape: MaterialStatePropertyAll(StadiumBorder()),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await navigateToChat();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? FittedBox(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Icon(
                                Icons.sms,
                                color: primaryBlueColor,
                              ),
                            ),
                            Text(
                              '${_i18n()["chatWithUs"]}',
                              style: context.txt.bodyLarge
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ],
                        ),
                ),
              );
            });
          }),
        ),
        Expanded(
          child: Builder(builder: (BuildContext context) {
            bool isLoading = false;
            return StatefulBuilder(builder: (BuildContext context, setState) {
              return Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    side: MaterialStatePropertyAll(BorderSide(
                      color: primaryBlueColor,
                    )),
                    shape: MaterialStatePropertyAll(StadiumBorder()),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await navigateToChat();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? FittedBox(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Icon(
                                Icons.phone,
                                color: primaryBlueColor,
                              ),
                            ),
                            Text(
                              '${_i18n()["contactUs"]}',
                              style: context.txt.bodyLarge
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ],
                        ),
                ),
              );
            });
          }),
        ),
      ],
    );
  }

  Column _description(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          '${_i18n()['description']}',
          style: context.textTheme.bodyLarge,
        ),
        Text(
          '${_viewController.business?.details.description?[userLanguage]?.trim() ?? _i18n()['noDescription']}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _reviewsList(BuildContext context) {
    return Obx(
      () => _viewController.reviews.isEmpty
          ? SizedBox.shrink()
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${_i18n()['reviews']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  if (_viewController.ratingAverage.value != null)
                    Text(
                      _viewController.ratingAverage.value!.toStringAsFixed(1),
                      style: context.txt.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text(
                      "(${_viewController.reviews.length})",
                      style: context.txt.titleSmall
                          ?.copyWith(color: offLightShadeGreyColor),
                    ),
                  ),
                  Spacer(),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Ink(
                  //     color: Colors.transparent,
                  //     padding: const EdgeInsets.all(10),
                  //     child: Text(
                  //       '${_i18n()['viewAll']}',
                  //       style: context.txt.bodyLarge
                  //           ?.copyWith(color: primaryBlueColor),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              for (review.Review rev in _viewController.reviews)
                ReviewCard(
                    review: review.Review(
                        rating: rev.rating,
                        fromEntityId: rev.fromEntityId,
                        comment: rev.comment,
                        toEntityId: rev.toEntityId,
                        toEntityType: rev.toEntityType,
                        toImage: rev.toImage,
                        toName: rev.toName,
                        fromName: rev.fromName,
                        reviewTime: rev.reviewTime,
                        fromEntityType: rev.fromEntityType),
                    showUserImage: false)
            ]),
    );
  }
}
