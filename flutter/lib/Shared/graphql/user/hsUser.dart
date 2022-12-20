// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
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

Future<void> change_user_language({
  required int userId,
  required LanguageType language,
}) async {
  QueryResult<Mutation$changeUserLanguage> _res =
      await _db.graphQLClient.mutate$changeUserLanguage(
    Options$Mutation$changeUserLanguage(
      variables: Variables$Mutation$changeUserLanguage(
        id: Input$user_pk_columns_input(id: userId),
        language: language.toFirebaseFormatString(),
      ),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[ERROR] CALLED :: change_user_language :: EXCEPTION :: ${_res.exception}");
  } else {
    mezDbgPrint(
        "[SUCCESS] CALLED :: change_user_language :: DATA :: ${_res.data}");

    // Get.find<LanguageController>().setLanguage(language);
  }
}
