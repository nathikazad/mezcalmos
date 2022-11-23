// ignore_for_file: non_constant_identifier_names

import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/user/__generated/user.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:get/get.dart';

final HasuraDb hs = Get.find<HasuraDb>();

Future<UserInfo?> get_user_by_firebase_id({required String firebase_id}) async {
  final QueryResult<Query$getUserByFirebaseId> _hasura_user =
      await hs.graphQLClient.query$getUserByFirebaseId(
    Options$Query$getUserByFirebaseId(
      variables: Variables$Query$getUserByFirebaseId(firebase_id: firebase_id),
    ),
  );

  mezDbgPrint(
      "[777] get_user_by_firebase_id: -$firebase_id- ---> result : ${_hasura_user.data} ");

  mezDbgPrint(
      "[777] get_user_by_firebase_id: -$firebase_id- ---> result : ${_hasura_user.parsedData} ");

  if (!_hasura_user.hasException &&
      _hasura_user.parsedData != null &&
      _hasura_user.parsedData!.user.isNotEmpty) {
    mezDbgPrint(
        "[7771] get_user_by_firebase_id: Has exception ${_hasura_user.exception} ");

    return UserInfo.fromHasura(_hasura_user.parsedData!.user[0]);
  }
  return null;
}
