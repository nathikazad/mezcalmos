import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class Laundry extends Service {
  LaundryCosts laundryCosts;
  num averageNumberOfDays = 2;
  Laundry(
      {required ServiceInfo userInfo,
      required Schedule schedule,
      required PaymentInfo paymentInfo,
      required ServiceState laundryState,
      this.averageNumberOfDays = 2,
      required this.laundryCosts,
      required LanguageType primaryLanguage,
      LanguageType? secondaryLanguage})
      : super(
          info: userInfo,
          schedule: schedule,
          state: laundryState,
          primaryLanguage: primaryLanguage,
          secondaryLanguage: secondaryLanguage,
          paymentInfo: paymentInfo
        );

  factory Laundry.fromLaundryData(
      // ignore: avoid_annotating_with_dynamic
      {required String laundryId,
      required laundryData}) {
    final ServiceState laundryState =
        ServiceState.fromServiceStateData(laundryData["state"]);

    final Schedule schedule =
        Schedule.fromData(laundryData["details"]["schedule"]);

    final PaymentInfo paymentInfo =
        laundryData["details"]["paymentInfo"] != null
            ? PaymentInfo.fromData(laundryData["details"]["paymentInfo"])
            : PaymentInfo();

    final LaundryCosts laundryCosts =
        LaundryCosts.fromData(laundryData["details"]["costs"]);
    final num averageNumberOfDays =
        (laundryData["details"]["averageNumberOfDays"] != null)
            ? laundryData["details"]["averageNumberOfDays"]
            : 2;
    final LanguageType primaryLanguage = laundryData["details"]?["language"]
                ?["primary"]
            .toString()
            .toLanguageType() ??
        LanguageType.ES;

    final LanguageType? secondaryLanguage = laundryData["details"]?["language"]
                ?["secondary"]
            .toString()
            .toNullableLanguageType() ??
        LanguageType.EN;

    final Laundry laundry = Laundry(
        userInfo: ServiceInfo.fromData(laundryData["info"]),
        schedule: schedule,
        paymentInfo: paymentInfo,
        laundryState: laundryState,
        averageNumberOfDays: averageNumberOfDays,
        laundryCosts: laundryCosts,
        primaryLanguage: primaryLanguage,
        secondaryLanguage: secondaryLanguage);
    return laundry;
  }
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
  String id;
  Map<LanguageType, String> name;
  num cost;

  LaundryCostLineItem(
      {required this.name, required this.cost, required this.id});

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
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    final String availableName = name[name.keys.first]!;
    if (name[userLanguage] != null) {
      return name[userLanguage]!;
    } else {
      return availableName;
    }
  }

  LaundryCostLineItem copyWith({
    Map<LanguageType, String>? name,
    num? cost,
  }) {
    return LaundryCostLineItem(
      id: id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
    );
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ cost.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final bool Function(dynamic e1, dynamic e2) mapEquals =
        const DeepCollectionEquality().equals;

    return other is LaundryCostLineItem &&
        other.id == id &&
        mapEquals(other.name, name) &&
        other.cost == cost;
  }
}
