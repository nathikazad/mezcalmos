import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class Business extends Service {
  // LaundryCosts laundryCosts;

  Business({
    required ServiceInfo userInfo,
    required Schedule? schedule,
    required PaymentInfo paymentInfo,
    required ServiceState businessState,
    required super.deliveryCost,
    required super.serviceDetailsId,
    // required this.laundryCosts,
    required Map<LanguageType, bool> languages,
  }) : super(
            info: userInfo,
            schedule: schedule,
            languages: languages,
            state: businessState,
            paymentInfo: paymentInfo);

  // double get getAverageCost {
  //   double allCosts = 0;

  //   laundryCosts.lineItems.forEach((LaundryCostLineItem element) {
  //     allCosts += element.cost;
  //   });
  //   final double averageCost = allCosts / laundryCosts.lineItems.length;

  //   return averageCost;
  // }

  // num get getCheapestCategory {
  //   final LaundryCostLineItem cheapestCostCategory = laundryCosts.lineItems
  //       .reduce((LaundryCostLineItem a, LaundryCostLineItem b) =>
  //           a.cost < b.cost ? a : b);
  //   return cheapestCostCategory.cost;
  // }

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     "info": info.toJson(),
  //     "state": state.toJson(),
  //   };
  // }
}
