import 'package:collection/collection.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class Laundry extends Service {
  LaundryCosts laundryCosts;
  LanguageType primaryLanguage;
  LanguageType? secondaryLanguage;
  Laundry(
      {required ServiceInfo userInfo,
      required Schedule schedule,
      required ServiceState laundryState,
      required this.laundryCosts,
      required this.primaryLanguage,
      this.secondaryLanguage})
      : super(info: userInfo, schedule: schedule, state: laundryState);

  factory Laundry.fromLaundryData(
      // ignore: avoid_annotating_with_dynamic
      {required String laundryId, required dynamic laundryData}) {
    final ServiceState laundryState =
        ServiceState.fromServiceStateData(laundryData["state"]);

    final Schedule schedule =
        Schedule.fromData(laundryData["details"]["schedule"]);

    final LaundryCosts laundryCosts =
        LaundryCosts.fromData(laundryData["details"]["costs"]);

    final LanguageType primaryLanguage = laundryData["details"]?["language"]
                ?["primary"]
            .toString()
            .toLanguageType() ??
        LanguageType.ES;

    final LanguageType? secondaryLanguage = laundryData["details"]?["language"]
                ?["secondary"]
            .toString()
            .toNullableLanguageType() ??
        null;

    final Laundry laundry = Laundry(
        userInfo: ServiceInfo.fromData(laundryData["info"]),
        schedule: schedule,
        laundryState: laundryState,
        laundryCosts: laundryCosts,
        primaryLanguage: primaryLanguage,
        secondaryLanguage: secondaryLanguage);
    return laundry;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "info": info.toJson(),
      "laundryState": state.toJson(),
    };
  }
}

class LaundryCosts {
  List<LaundryCostLineItem> lineItems = <LaundryCostLineItem>[];
  num minimumCost = 0;
  LaundryCosts();

  factory LaundryCosts.fromData(laundryCostsData) {
    // ignore: prefer_final_locals
    LaundryCosts laundryCosts = LaundryCosts();
    laundryCosts.minimumCost = laundryCostsData['minimumCost'];
    // ignore: avoid_annotating_with_dynamic
    for (var item in laundryCostsData["byType"]) {
      mezDbgPrint(item);
      laundryCosts.lineItems.add(LaundryCostLineItem.fromData(item));
    }
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

  //  factory LaundryCosts.clone(LaundryCosts laundryCosts) {
  //   final Map<Weekday, OpenHours> _cloneSchedule = {};
  //   laundryCosts.lineItems.forEach((LaundryCostLineItem element) { })

  //   return newSchedule;
  // }
}

class LaundryCostLineItem {
  Map<LanguageType, String> name;
  num cost;

  LaundryCostLineItem({required this.name, required this.cost});

  factory LaundryCostLineItem.fromData(laundryCostLineItemData) {
    return LaundryCostLineItem(
        name: convertToLanguageMap(laundryCostLineItemData['name']),
        cost: laundryCostLineItemData['cost']);
  }

  Map<String, dynamic> toFirebaseFormat() {
    return {
      'name': name.toFirebaseFormat(),
      'cost': cost,
    };
  }

  LaundryCostLineItem copyWith({
    Map<LanguageType, String>? name,
    num? cost,
  }) {
    return LaundryCostLineItem(
      name: name ?? this.name,
      cost: cost ?? this.cost,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final bool Function(dynamic e1, dynamic e2) mapEquals =
        const DeepCollectionEquality().equals;

    return other is LaundryCostLineItem &&
        mapEquals(other.name, name) &&
        other.cost == cost;
  }

  @override
  int get hashCode => name.hashCode ^ cost.hashCode;
}
