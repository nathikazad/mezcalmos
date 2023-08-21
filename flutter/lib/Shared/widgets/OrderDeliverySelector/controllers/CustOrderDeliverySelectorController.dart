import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_company/hsDeliveryCompany.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/CustOrderDeliverySelector.dart';

class CustOrderDeliverySelectorController {
  RxList<DeliveryCompany> deliveryCompanies = RxList.empty();
  RxList<int> selectedCompanies = RxList.empty();
  RxBool isFetchingCompanies = RxBool(false);

  double minDeliveryPrice = 40;

  double maxDeliveryPrice = 200;

  RxDouble estDeliveryPrice = RxDouble(40);
  num? distance;
  late ValueChanged<List<int>> _onSelectionUpdate;
  late ValueChanged<double> _onEstDeliveryPriceChange;
  late CustDeliverySelectorType type;
  bool get isTaxi => type == CustDeliverySelectorType.Taxi;

  void init(
      {num? distance,
      required CustDeliverySelectorType type,
      required ValueChanged<List<int>> onSelectionUpdate,
      required ValueChanged<double> onEstDeliveryPriceChange}) {
    this.distance = distance;
    this.type = type;
    _onSelectionUpdate = onSelectionUpdate;
    _onEstDeliveryPriceChange = onEstDeliveryPriceChange;
    mezDbgPrint("Distance $distance");
    if (type == CustDeliverySelectorType.Taxi) {
      deliveryCompanies.value = [
        DeliveryCompany(
            rate: 3.7,
            numberOfReviews: 4,
            info: ServiceInfo(
                location: aDefaultLocation,
                hasuraId: 0,
                image:
                    "https://t4.ftcdn.net/jpg/01/51/73/15/360_F_151731523_9svpFTdFSaOC0gcoEeMuDqckjPS3mvmm.jpg",
                name: "MezTaxi"),
            state: ServiceState(ServiceStatus.Open, true),
            isOpen: true,
            serviceDetailsId: 1,
            languages: ServiceProviderLanguage(primary: Language.EN),
            schedule: null,
            deliveryCost: DeliveryCost(
              costPerKm: 25,
              id: null,
              minimumCost: 0,
              selfDelivery: true,
            ),
            onlineOrdering: true,
            creationTime: DateTime.now()),
        DeliveryCompany(
            rate: 4,
            numberOfReviews: 5,
            info: ServiceInfo(
                location: aDefaultLocation,
                hasuraId: 1,
                image:
                    "https://t3.ftcdn.net/jpg/05/24/56/02/360_F_524560208_1O26bz3jdLuZHt77Yu82dXcL0ZvECaZN.jpg",
                name: "NearTaxi"),
            state: ServiceState(ServiceStatus.Open, true),
            isOpen: true,
            serviceDetailsId: 3,
            languages: ServiceProviderLanguage(primary: Language.EN),
            schedule: null,
            deliveryCost: DeliveryCost(
              costPerKm: 15,
              id: null,
              minimumCost: 0,
              selfDelivery: true,
            ),
            onlineOrdering: true,
            creationTime: DateTime.now()),
        DeliveryCompany(
            rate: 4.2,
            numberOfReviews: 2,
            info: ServiceInfo(
                location: aDefaultLocation,
                hasuraId: 2,
                image:
                    "https://st.depositphotos.com/1987177/2213/v/600/depositphotos_22137639-stock-illustration-city-taxi-logo.jpg",
                name: "BeeTaxi"),
            state: ServiceState(ServiceStatus.Open, true),
            isOpen: true,
            serviceDetailsId: 5,
            languages: ServiceProviderLanguage(primary: Language.EN),
            schedule: null,
            deliveryCost: DeliveryCost(
              costPerKm: 24,
              id: null,
              minimumCost: 0,
              selfDelivery: true,
            ),
            onlineOrdering: true,
            creationTime: DateTime.now()),
      ];
    } else
      _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    try {
      isFetchingCompanies.value = true;
      List<DeliveryCompany>? _companies = await get_dv_companies(isOpen: true);
      if (_companies != null) {
        deliveryCompanies.clear();
        selectedCompanies.clear();
        deliveryCompanies.addAll(_companies);
        selectedCompanies.value = deliveryCompanies
            .map((DeliveryCompany element) => element.info.hasuraId)
            .toList();
        _onSelectionUpdate.call(selectedCompanies);
        CalculateEstimatedCost();
      }
    } catch (e) {
      showErrorSnackBar();
      mezlog("🔴 error =====>$e");

      // TODO
    } finally {
      isFetchingCompanies.value = false;
    }
  }

  void selectCompany({required int id}) {
    if (selectedCompanies.contains(id)) {
      selectedCompanies.remove(id);
    } else {
      selectedCompanies.add(id);
    }

    _onSelectionUpdate.call(selectedCompanies);
  }

  void navigateToCourierServiceView(int id) {
    // ignore: unawaited_futures
    CustCourierServiceView.navigate(
      companyId: id,
    );
  }

  void CalculateEstimatedCost() {
    double _maxDeliveryPrice = 0;

    if (distance == null) {
      mezDbgPrint(
          "Distance is null. Skipping calculating min and max costs 🥲");
      return;
    }

    for (DeliveryCompany company in deliveryCompanies) {
      if (company.deliveryCost != null) {
        final double deliveryCost = company.deliveryCost!.costPerKm * distance!;
        mezDbgPrint(
            "🛵 Delivery cost from ${company.info.hasuraId} => $deliveryCost");

        if (deliveryCost > _maxDeliveryPrice &&
            deliveryCost > company.deliveryCost!.minimumCost) {
          mezDbgPrint(" ✅ Setting est cost to => $deliveryCost");
          _maxDeliveryPrice = deliveryCost;
        } else if (company.deliveryCost!.minimumCost > _maxDeliveryPrice) {
          mezDbgPrint(
              "👋 Delivery cost $deliveryCost is less than company min cost: ${company.deliveryCost!.minimumCost}. Setting min cost...");
          _maxDeliveryPrice = company.deliveryCost!.minimumCost;
        }
      } else {
        mezDbgPrint("Company ${company.info.hasuraId} delivery costs is null");
      }
    }

    if (_maxDeliveryPrice == 0) {
      mezDbgPrint("🔴 Max Delivery Cost is 0 ===> Setting to 40");
      _maxDeliveryPrice = 40;
    }
    if (_maxDeliveryPrice > 200 || _maxDeliveryPrice < 40) {
      mezDbgPrint(
          "Calculated delivery price is out of range 40-200 => $_maxDeliveryPrice, setting to 40...");
      _maxDeliveryPrice = 40;
    }

    estDeliveryPrice.value = _maxDeliveryPrice;
    _onEstDeliveryPriceChange.call(estDeliveryPrice.value);
  }
}
