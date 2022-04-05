import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';

String operatorsNode({required OperatorType operatorType}) {
  return 'operators/${operatorType.toFirebaseFormatString()}/info';
}

String operatorAuthNode(
    {required OperatorType operatorType, required String uid}) {
  return operatorsNode(operatorType: operatorType) + '/$uid';
}

String operatorStateNode(
    {required OperatorType operatorType, required String uid}) {
  return operatorAuthNode(operatorType: operatorType, uid: uid) + '/state';
}

String operatorAppVersionNode(
    {required OperatorType operatorType, required String uid}) {
  return operatorAuthNode(operatorType: operatorType, uid: uid) +
      '/versionNumber';
}

String operatorNotificationsNode(
    {required OperatorType operatorType, required String uid}) {
  return 'notifications/${operatorType.toFirebaseFormatString()}Operator/$uid';
}
