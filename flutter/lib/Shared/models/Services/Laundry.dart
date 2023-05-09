// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class Laundry extends Service {
  LaundryCosts laundryCosts;
  num averageNumberOfDays = 2;
  bool selfDelivery;
  int deliveryDetailsId;

  Laundry({
    required ServiceInfo userInfo,
    required cModels.Schedule? schedule,
    required PaymentInfo paymentInfo,
    required ServiceState laundryState,
    super.rate,
    super.reviews,
    required super.deliveryCost,
    required this.deliveryDetailsId,
    this.averageNumberOfDays = 2,
    required super.serviceDetailsId,
    required this.selfDelivery,
    required this.laundryCosts,
    required cModels.ServiceProviderLanguage languages,
  }) : super(
            info: userInfo,
            schedule: schedule,
            languages: languages,
            state: laundryState,
            paymentInfo: paymentInfo);

  // factory Laundry.fromLaundryData(
  //     // ignore: avoid_annotating_with_dynamic
  //     {required String laundryId,
  //     required laundryData}) {
  //   final ServiceState laundryState =
  //       ServiceState.fromServiceStateData(laundryData["state"]);

  //   final Schedule schedule =
  //       Schedule.fromData(laundryData["details"]["schedule"]);

  //   final PaymentInfo paymentInfo =
  //       // laundryData["details"]["paymentInfo"] != null
  //       //     ? PaymentInfo.fromData(laundryData["details"]["paymentInfo"])
  //       //     :
  //       PaymentInfo();

  //   final LaundryCosts laundryCosts =
  //       LaundryCosts.fromData(laundryData["details"]["costs"]);
  //   final num averageNumberOfDays =
  //       (laundryData["details"]["averageNumberOfDays"] != null)
  //           ? laundryData["details"]["averageNumberOfDays"]
  //           : 2;
  //   final Language primaryLanguage = laundryData["details"]?["language"]
  //               ?["primary"]
  //           .toString()
  //           .toLanguage() ??
  //       Language.ES;

  //   final Language? secondaryLanguage = laundryData["details"]?["language"]
  //               ?["secondary"]
  //           .toString()
  //           .toNullableLanguageType() ??
  //       Language.EN;

  //   final Laundry laundry = Laundry(
  //       userInfo: ServiceInfo.fromData(laundryData["info"]),
  //       selfDelivery: true,
  //       schedule: schedule,
  //       paymentInfo: paymentInfo,
  //       laundryState: laundryState,
  //       averageNumberOfDays: averageNumberOfDays,
  //       laundryCosts: laundryCosts,
  //       primaryLanguage: primaryLanguage,
  //       secondaryLanguage: secondaryLanguage);
  //   return laundry;
  // }
  double get getAverageCost {
    double allCosts = 0;

    laundryCosts.lineItems.forEach((LaundryCostLineItem element) {
      allCosts += element.cost;
    });
    final double averageCost = allCosts / laundryCosts.lineItems.length;

    return averageCost;
  }

  num get getCheapestCategory {
    final LaundryCostLineItem cheapestCostCategory = laundryCosts.lineItems
        .reduce((LaundryCostLineItem a, LaundryCostLineItem b) =>
            a.cost < b.cost ? a : b);
    return cheapestCostCategory.cost;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "info": info.toJson(),
      "state": state.toJson(),
    };
  }
}

class LaundryCosts {
  List<LaundryCostLineItem> lineItems = <LaundryCostLineItem>[];
  num minimumCost = 0;
  LaundryCosts();

  factory LaundryCosts.fromData(laundryCostsData) {
    final LaundryCosts laundryCosts = LaundryCosts();
    laundryCosts.minimumCost = laundryCostsData?['minimumCost'];

    laundryCostsData?["byType"]?.forEach((elemnt) {
      laundryCosts.lineItems.add(LaundryCostLineItem.fromData(elemnt));
    });

    return laundryCosts;
  }

  Map<String, dynamic> toFirebasFormat() {
    return {
      'byType': lineItems
          .map((LaundryCostLineItem item) => item.toFirebaseFormat())
          .toList(),
      'minimumCost': minimumCost,
    };
  }

  @override
  int get hashCode => lineItems.hashCode ^ minimumCost.hashCode;
}

class LaundryCostLineItem {
  int id;
  Map<cModels.Language, String> name;
  num cost;
  int? nameId;
  int? storeId;
  int position;

  LaundryCostLineItem(
      {required this.name,
      required this.cost,
      required this.id,
      this.position = 0,
      this.nameId,
      this.storeId});

  factory LaundryCostLineItem.fromData(laundryCostLineItemData) {
    return LaundryCostLineItem(
        id: laundryCostLineItemData["id"] ?? "",
        name: convertToLanguageMap(laundryCostLineItemData['name']),
        cost: laundryCostLineItemData['cost']);
  }

  Map<String, dynamic> toFirebaseFormat() {
    return {
      'id': id,
      'name': name.toFirebaseFormat(),
      'cost': cost,
    };
  }

  String getRightNameForUser() {
    final cModels.Language userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    final String availableName = name[name.keys.first]!;
    if (name.getTranslation(userLanguage) != null) {
      return name.getTranslation(userLanguage);
    } else {
      return availableName;
    }
  }

  LaundryCostLineItem copyWith({
    Map<cModels.Language, String>? name,
    num? cost,
  }) {
    return LaundryCostLineItem(
      id: id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
    );
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cost.hashCode ^
        nameId.hashCode ^
        storeId.hashCode ^
        position.hashCode;
  }

  @override
  bool operator ==(covariant LaundryCostLineItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cost == cost &&
        other.nameId == nameId &&
        other.storeId == storeId &&
        other.position == position;
  }
}
