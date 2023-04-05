import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

class CustCourierServicesListView extends StatefulWidget {
  static Future<void> navigate() {
    return MezRouter.toPath(CourierRoutes.kCouriersRoute);
  }

  const CustCourierServicesListView({super.key});

  @override
  State<CustCourierServicesListView> createState() =>
      _CustCourierServicesListViewState();
}

class _CustCourierServicesListViewState
    extends State<CustCourierServicesListView> {
  Rxn<List<DeliveryCompany>> companies = Rxn();

  @override
  void initState() {
    try {
      fetchCompanies();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    super.initState();
  }

  Future<void> fetchCompanies() async {
    // Location location = Location();
    // final LocationData currentLocation = await location.getLocation();
    // MezLocation mezLocation = MezLocation.fromLocationData(
    //     MezLocation.buildLocationData(15.87037, -97.07726));

    mezDbgPrint("Calling query....");
    companies.value = await get_dv_companies() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
          title: 'Courier', AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: Obx(
        () {
          if (companies.value != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // _searchCoomponent(context),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: List.generate(
                        companies.value!.length,
                        (int index) =>
                            _companyCard(companies.value![index], context)),
                  )
                ],
              ),
            );
          } else
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Widget _searchCoomponent(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(5),
            child: TextFormField(
              style: context.txt.bodyLarge,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: primaryBlueColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        MezIconButton(
          icon: Icons.place,
          padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
        )
      ],
    );
  }

  Widget _companyCard(DeliveryCompany company, BuildContext context) {
    return MezCard(
        onClick: () {
          mezDbgPrint("Clicked");
          CustCourierServiceView.navigate(companyId: company.info.hasuraId);
        },
        firstAvatarBgImage: CachedNetworkImageProvider(company.info.image),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company.info.name,
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 7.5,
            ),
            _detailsRow(company, context)
          ],
        ));
  }
}

Widget _detailsRow(DeliveryCompany company, BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.delivery_dining,
              color: Colors.black,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            ShippingCostComponent(
              shippingCost: 50,
              showPerKm: true,
              alignment: MainAxisAlignment.start,
              textStyle: context.txt.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 3.w,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Icon(
                  Icons.payments,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              SizedBox(width: 5),
              if (company.paymentInfo?.acceptCard == false)
                Icon(
                  Icons.credit_card,
                  color: Colors.black,
                  size: 22,
                ),
            ],
          ),
        ),
        SizedBox(
          width: 8,
        ),
        if (company.rate != null && company.rate != 0)
          Flexible(
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 22,
                  color: Color(0xFF6779FE),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  company.rate.toString(),
                  style: context.txt.bodyMedium,
                )
              ],
            ),
          ),
      ],
    ),
  );
}
