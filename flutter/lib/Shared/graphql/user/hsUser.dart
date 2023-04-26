// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/user/__generated/user.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';

final HasuraDb _db = Get.find<HasuraDb>();
Future<UserInfo> get_user_by_hasura_id({required int hasuraId}) async {
  final QueryResult<Query$getUserById> response = await _db.graphQLClient
      .query$getUserById(Options$Query$getUserById(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getUserById(id: hasuraId)));
  if (response.hasException || response.parsedData?.user_by_pk == null) {
    mezDbgPrint("Get user by id $hasuraId erros ${response.exception}");
    throw Exception("getv user id exception ${response.exception}");
  } else {
    final Query$getUserById$user_by_pk data = response.parsedData!.user_by_pk!;
    return UserInfo(
      hasuraId: hasuraId,
      firebaseId: data.firebase_id,
      name: data.name,
      language: data.language_id.toLanguage(),
      image: data.image,
    );
  }
}

Future<cModels.Language> change_user_language({
  required int userId,
  required cModels.Language language,
}) async {
  final QueryResult<Mutation$changeUserLanguage> _res =
      await _db.graphQLClient.mutate$changeUserLanguage(
    Options$Mutation$changeUserLanguage(
      variables: Variables$Mutation$changeUserLanguage(
        id: Input$user_pk_columns_input(id: userId),
        language: language.toFirebaseFormatString(),
      ),
    ),
  );

  if (_res.parsedData?.update_user_by_pk == null) {
    throwError(_res.exception);
  }
  return _res.parsedData!.update_user_by_pk!.language_id.toLanguage();

  // Get.find<LanguageController>().setLanguage(language);
}

Future<String> change_username({
  required int userId,
  required String name,
}) async {
  final QueryResult<Mutation$changeUserName> _res =
      await _db.graphQLClient.mutate$changeUserName(
    Options$Mutation$changeUserName(
      variables: Variables$Mutation$changeUserName(
        id: Input$user_pk_columns_input(id: userId),
        name: name,
      ),
    ),
  );

  if (_res.parsedData?.update_user_by_pk?.name == null) {
    throw Exception(
        "[🛑] CALLED :: change_username :: EXCEPTION :: ${_res.exception}");
  }
  return _res.parsedData!.update_user_by_pk!.name!;
}

Future<void> change_user_img({
  required int userId,
  required String img,
  bool isBigImg = false,
}) async {
  QueryResult? _res;

  if (!isBigImg) {
    _res = await _db.graphQLClient.mutate$changeUserImg(
      Options$Mutation$changeUserImg(
        variables: Variables$Mutation$changeUserImg(
          id: Input$user_pk_columns_input(id: userId),
          img: img,
        ),
      ),
    );
  } else {
    _res = await _db.graphQLClient.mutate$changeUserBigImg(
      Options$Mutation$changeUserBigImg(
        variables: Variables$Mutation$changeUserBigImg(
          id: Input$user_pk_columns_input(id: userId),
          img: img,
        ),
      ),
    );
  }

  if (_res.hasException != false) {
    mezDbgPrint(
        "[ERROR] CALLED :: change_user_img :: EXCEPTION || NULL :: ${_res.exception}");
  } else {
    mezDbgPrint("[SUCCESS] CALLED :: change_user_img :: DATA :: ${_res.data}");

    // Get.find<LanguageController>().setLanguage(language);
  }
}

Future<String> set_user_image(
    {required String imageUrl, required int userId}) async {
  final QueryResult<Mutation$changeUserImg> _res =
      await _db.graphQLClient.mutate$changeUserImg(
    Options$Mutation$changeUserImg(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$changeUserImg(
        id: Input$user_pk_columns_input(id: userId),
        img: imageUrl,
      ),
    ),
  );
  if (_res.parsedData?.update_user_by_pk?.image == null) {
    throw Exception("🛑 setting user image exception ==>${_res.exception}");
  }
  return _res.parsedData!.update_user_by_pk!.image!;
}

Future<UserInfo> update_user_info(
    {required int userId, required UserInfo userInfo}) async {
  final QueryResult<Mutation$updateUserInfo> res =
      await _db.graphQLClient.mutate$updateUserInfo(
    Options$Mutation$updateUserInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateUserInfo(
        userId: userId,
        data: Input$user_set_input(
          image: userInfo.image,
          name: userInfo.name,
        ),
      ),
    ),
  );
  if (res.parsedData?.update_user_by_pk == null) {
    throw Exception("🛑 update user info exceptions ===< ${res.exception}");
  }
  return UserInfo(
      hasuraId: res.parsedData!.update_user_by_pk!.id,
      name: res.parsedData!.update_user_by_pk!.name,
      image: res.parsedData!.update_user_by_pk!.image);
}
