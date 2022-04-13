import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

class Laundry extends Service {
  LaundryCosts laundryCosts;
  LanguageType primaryLanguage;
  LanguageType? secondaryLanguage;
  Laundry(
      {required ServiceUserInfo userInfo,
      required Schedule schedule,
      required ServiceState laundryState,
      required this.laundryCosts,
      required this.primaryLanguage,
      this.secondaryLanguage})
      : super(info: userInfo, schedule: schedule, state: laundryState);

  factory Laundry.fromLaundryData(
      // ignore: avoid_annotating_with_dynamic
      {required String laundryId,
      required laundryData}) {
    mezDbgPrint("Laundry info daaaaaatttttta");
    mezDbgPrint(laundryData);
    final ServiceState laundryState = ServiceState(
        laundryData["state"]?["authorizationStatus"]
                ?.toString()
                .toAuthorizationStatus() ??
            AuthorizationStatus.Unauthorized,
        laundryData["state"]?["available"] ?? false);

    final Schedule schedule =
        Schedule.fromData(laundryData["details"]["schedule"]);

    final LaundryCosts laundryCosts =
        LaundryCosts.fromData(laundryData["details"]["costs"]);

    final LanguageType primaryLanguage =
        laundryData["details"]?["language"]?["first"] ?? LanguageType.ES;
    final LanguageType? secondaryLanguage =
        laundryData["details"]?["language"]?["second"] ?? null;

    final Laundry laundry = Laundry(
        userInfo: ServiceUserInfo.fromData(laundryData["info"]),
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
}

class LaundryCostLineItem {
  Map<LanguageType, String> name;
  num cost;

  LaundryCostLineItem({required this.name, required this.cost});

  factory LaundryCostLineItem.fromData(laundryCostLineItemData) {
    return LaundryCostLineItem(
        name: convertToLanguageMap(laundryCostLineItemData['name']),
        cost: laundryCostLineItemData['costPerKilo']);
  }
}
