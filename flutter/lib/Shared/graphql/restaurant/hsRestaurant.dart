import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<Restaurant?> getRestaurantById(int id) async {
  final QueryResult<Query$getOneRestaurant> response = await _db.graphQLClient
      .query$getOneRestaurant(Options$Query$getOneRestaurant(
          variables: Variables$Query$getOneRestaurant(id: id)));

  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
    return null;
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura querry success, data : ${response.data} ");
    final Query$getOneRestaurant$restaurant_by_pk data =
        response.parsedData!.restaurant_by_pk!;
    return Restaurant(
        userInfo: ServiceInfo(
            id: data.id.toString(),
            image: data.image,
            firebaseId: data.firebase_id,
            name: data.name,
            location: Location.fromLocationData(
                data.location_gps, data.location_text)),
        description: {
          data.description!.translations.first.language_id.toLanguageType():
              data.description!.translations.first.value,
          data.description!.translations[1].language_id.toLanguageType():
              data.description!.translations[1].value,
        },
        schedule: Schedule(openHours: {}),
        paymentInfo: PaymentInfo(),
        restaurantState: data.open_status.toServiceStatus().toServiceState(),
        primaryLanguage: data.language_id.toString().toLanguageType(),
        secondaryLanguage:
            data.language_id.toString().toLanguageType().toOpLang());
  } else
    return null;
}
