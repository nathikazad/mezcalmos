// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/user/__generated/user.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

final HasuraDb _db = Get.find<HasuraDb>();
Future<UserInfo> get_user_by_hasura_id({required int hasuraId}) async {
  final QueryResult<Query$getUserById> response = await _db.graphQLClient
      .query$getUserById(Options$Query$getUserById(
          variables: Variables$Query$getUserById(id: hasuraId)));
  if (response.hasException || response.parsedData?.user_by_pk == null) {
    mezDbgPrint("Get user by is erros ${response.exception}");
    throw Exception("getv user id exception ${response.exception}");
  } else {
    final Query$getUserById$user_by_pk data = response.parsedData!.user_by_pk!;
    return UserInfo(
        hasuraId: hasuraId,
        firebaseId: data.firebase_id,
        name: data.name,
        language: data.language_id.toLanguageType(),
        image: data.image);
  }
}
