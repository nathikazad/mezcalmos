import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

class CustCourierServicesListView extends StatefulWidget {
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
      appBar:
          MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: Obx(
        () {
          if (companies.value != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Material(
                          elevation: 0.5,
                          borderRadius: BorderRadius.circular(5),
                          child: TextFormField(
                            style: Get.textTheme.bodyLarge,
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: List.generate(companies.value!.length,
                        (int index) => _companyCard(companies.value![index])),
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

  Widget _companyCard(DeliveryCompany company) {
    return MezCard(
        onClick: () {
          mezDbgPrint("Clicked");
          MezRouter.toNamed(getCourierRoute(company.info.hasuraId));
        },
        firstAvatarBgImage: CachedNetworkImageProvider(company.info.image),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company.info.name,
              style: Get.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            _detailsRow(company)
          ],
        ));
  }
}

Widget _detailsRow(DeliveryCompany company) {
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
              size: 22,
            ),
            SizedBox(
              width: 5,
            ),
            ShippingCostComponent(
              shippingCost: 50,
              showPerKm: true,
              alignment: MainAxisAlignment.start,
              textStyle: Get.textTheme.bodyMedium,
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
                  Icons.payments_outlined,
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
                0.toString(),
                style: Get.textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
