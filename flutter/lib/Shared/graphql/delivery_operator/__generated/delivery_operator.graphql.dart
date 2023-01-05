import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_delivery_operator_by_id {
  factory Variables$Query$get_delivery_operator_by_id({required int user_id}) =>
      Variables$Query$get_delivery_operator_by_id._({
        r'user_id': user_id,
      });

  Variables$Query$get_delivery_operator_by_id._(this._$data);

  factory Variables$Query$get_delivery_operator_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    return Variables$Query$get_delivery_operator_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get user_id => (_$data['user_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_delivery_operator_by_id<
          Variables$Query$get_delivery_operator_by_id>
      get copyWith => CopyWith$Variables$Query$get_delivery_operator_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_delivery_operator_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    return Object.hashAll([l$user_id]);
  }
}

abstract class CopyWith$Variables$Query$get_delivery_operator_by_id<TRes> {
  factory CopyWith$Variables$Query$get_delivery_operator_by_id(
    Variables$Query$get_delivery_operator_by_id instance,
    TRes Function(Variables$Query$get_delivery_operator_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_delivery_operator_by_id;

  factory CopyWith$Variables$Query$get_delivery_operator_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_delivery_operator_by_id;

  TRes call({int? user_id});
}

class _CopyWithImpl$Variables$Query$get_delivery_operator_by_id<TRes>
    implements CopyWith$Variables$Query$get_delivery_operator_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_delivery_operator_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_delivery_operator_by_id _instance;

  final TRes Function(Variables$Query$get_delivery_operator_by_id) _then;

  static const _undefined = {};

  TRes call({Object? user_id = _undefined}) =>
      _then(Variables$Query$get_delivery_operator_by_id._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_delivery_operator_by_id<TRes>
    implements CopyWith$Variables$Query$get_delivery_operator_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_delivery_operator_by_id(this._res);

  TRes _res;

  call({int? user_id}) => _res;
}

class Query$get_delivery_operator_by_id {
  Query$get_delivery_operator_by_id({
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Query$get_delivery_operator_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Query$get_delivery_operator_by_id(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) =>
              Query$get_delivery_operator_by_id$delivery_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_delivery_operator_by_id$delivery_operator>
      delivery_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_operator = delivery_operator;
    _resultData['delivery_operator'] =
        l$delivery_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_operator = delivery_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_delivery_operator_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_operator = delivery_operator;
    final lOther$delivery_operator = other.delivery_operator;
    if (l$delivery_operator.length != lOther$delivery_operator.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_operator.length; i++) {
      final l$delivery_operator$entry = l$delivery_operator[i];
      final lOther$delivery_operator$entry = lOther$delivery_operator[i];
      if (l$delivery_operator$entry != lOther$delivery_operator$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_delivery_operator_by_id
    on Query$get_delivery_operator_by_id {
  CopyWith$Query$get_delivery_operator_by_id<Query$get_delivery_operator_by_id>
      get copyWith => CopyWith$Query$get_delivery_operator_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_delivery_operator_by_id<TRes> {
  factory CopyWith$Query$get_delivery_operator_by_id(
    Query$get_delivery_operator_by_id instance,
    TRes Function(Query$get_delivery_operator_by_id) then,
  ) = _CopyWithImpl$Query$get_delivery_operator_by_id;

  factory CopyWith$Query$get_delivery_operator_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_delivery_operator_by_id;

  TRes call({
    List<Query$get_delivery_operator_by_id$delivery_operator>?
        delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Query$get_delivery_operator_by_id$delivery_operator> Function(
              Iterable<
                  CopyWith$Query$get_delivery_operator_by_id$delivery_operator<
                      Query$get_delivery_operator_by_id$delivery_operator>>)
          _fn);
}

class _CopyWithImpl$Query$get_delivery_operator_by_id<TRes>
    implements CopyWith$Query$get_delivery_operator_by_id<TRes> {
  _CopyWithImpl$Query$get_delivery_operator_by_id(
    this._instance,
    this._then,
  );

  final Query$get_delivery_operator_by_id _instance;

  final TRes Function(Query$get_delivery_operator_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_delivery_operator_by_id(
        delivery_operator: delivery_operator == _undefined ||
                delivery_operator == null
            ? _instance.delivery_operator
            : (delivery_operator
                as List<Query$get_delivery_operator_by_id$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Query$get_delivery_operator_by_id$delivery_operator> Function(
                  Iterable<
                      CopyWith$Query$get_delivery_operator_by_id$delivery_operator<
                          Query$get_delivery_operator_by_id$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator.map((e) =>
              CopyWith$Query$get_delivery_operator_by_id$delivery_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_delivery_operator_by_id<TRes>
    implements CopyWith$Query$get_delivery_operator_by_id<TRes> {
  _CopyWithStubImpl$Query$get_delivery_operator_by_id(this._res);

  TRes _res;

  call({
    List<Query$get_delivery_operator_by_id$delivery_operator>?
        delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
}

const documentNodeQueryget_delivery_operator_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_delivery_operator_by_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_operator'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'user_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: IntValueNode(value: '1'),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_version'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'current_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_company_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_company'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notification_token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'owner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Query$get_delivery_operator_by_id _parserFn$Query$get_delivery_operator_by_id(
        Map<String, dynamic> data) =>
    Query$get_delivery_operator_by_id.fromJson(data);

class Options$Query$get_delivery_operator_by_id
    extends graphql.QueryOptions<Query$get_delivery_operator_by_id> {
  Options$Query$get_delivery_operator_by_id({
    String? operationName,
    required Variables$Query$get_delivery_operator_by_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryget_delivery_operator_by_id,
          parserFn: _parserFn$Query$get_delivery_operator_by_id,
        );
}

class WatchOptions$Query$get_delivery_operator_by_id
    extends graphql.WatchQueryOptions<Query$get_delivery_operator_by_id> {
  WatchOptions$Query$get_delivery_operator_by_id({
    String? operationName,
    required Variables$Query$get_delivery_operator_by_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryget_delivery_operator_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_delivery_operator_by_id,
        );
}

class FetchMoreOptions$Query$get_delivery_operator_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_delivery_operator_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_delivery_operator_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_delivery_operator_by_id,
        );
}

extension ClientExtension$Query$get_delivery_operator_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_delivery_operator_by_id>>
      query$get_delivery_operator_by_id(
              Options$Query$get_delivery_operator_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_delivery_operator_by_id>
      watchQuery$get_delivery_operator_by_id(
              WatchOptions$Query$get_delivery_operator_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_delivery_operator_by_id({
    required Query$get_delivery_operator_by_id data,
    required Variables$Query$get_delivery_operator_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_delivery_operator_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_delivery_operator_by_id? readQuery$get_delivery_operator_by_id({
    required Variables$Query$get_delivery_operator_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_delivery_operator_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_delivery_operator_by_id.fromJson(result);
  }
}

class Query$get_delivery_operator_by_id$delivery_operator {
  Query$get_delivery_operator_by_id$delivery_operator({
    required this.app_version,
    required this.current_gps,
    required this.delivery_company_id,
    required this.delivery_company,
    required this.delivery_driver_type,
    required this.id,
    this.notification_token,
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Query$get_delivery_operator_by_id$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$current_gps = json['current_gps'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$delivery_company = json['delivery_company'];
    final l$delivery_driver_type = json['delivery_driver_type'];
    final l$id = json['id'];
    final l$notification_token = json['notification_token'];
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$get_delivery_operator_by_id$delivery_operator(
      app_version: (l$app_version as String),
      current_gps: geographyFromJson(l$current_gps),
      delivery_company_id: (l$delivery_company_id as int),
      delivery_company:
          Query$get_delivery_operator_by_id$delivery_operator$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      delivery_driver_type: (l$delivery_driver_type as String),
      id: (l$id as int),
      notification_token: (l$notification_token as String?),
      owner: (l$owner as bool),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String app_version;

  final Geography current_gps;

  final int delivery_company_id;

  final Query$get_delivery_operator_by_id$delivery_operator$delivery_company
      delivery_company;

  final String delivery_driver_type;

  final int id;

  final String? notification_token;

  final bool owner;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$current_gps = current_gps;
    _resultData['current_gps'] = geographyToJson(l$current_gps);
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company.toJson();
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notification_token = notification_token;
    _resultData['notification_token'] = l$notification_token;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$current_gps = current_gps;
    final l$delivery_company_id = delivery_company_id;
    final l$delivery_company = delivery_company;
    final l$delivery_driver_type = delivery_driver_type;
    final l$id = id;
    final l$notification_token = notification_token;
    final l$owner = owner;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$current_gps,
      l$delivery_company_id,
      l$delivery_company,
      l$delivery_driver_type,
      l$id,
      l$notification_token,
      l$owner,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_delivery_operator_by_id$delivery_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notification_token = notification_token;
    final lOther$notification_token = other.notification_token;
    if (l$notification_token != lOther$notification_token) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_delivery_operator_by_id$delivery_operator
    on Query$get_delivery_operator_by_id$delivery_operator {
  CopyWith$Query$get_delivery_operator_by_id$delivery_operator<
          Query$get_delivery_operator_by_id$delivery_operator>
      get copyWith =>
          CopyWith$Query$get_delivery_operator_by_id$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_delivery_operator_by_id$delivery_operator<
    TRes> {
  factory CopyWith$Query$get_delivery_operator_by_id$delivery_operator(
    Query$get_delivery_operator_by_id$delivery_operator instance,
    TRes Function(Query$get_delivery_operator_by_id$delivery_operator) then,
  ) = _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator;

  factory CopyWith$Query$get_delivery_operator_by_id$delivery_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator;

  TRes call({
    String? app_version,
    Geography? current_gps,
    int? delivery_company_id,
    Query$get_delivery_operator_by_id$delivery_operator$delivery_company?
        delivery_company,
    String? delivery_driver_type,
    int? id,
    String? notification_token,
    bool? owner,
    String? status,
    String? $__typename,
  });
  CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
      TRes> get delivery_company;
}

class _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator<TRes>
    implements
        CopyWith$Query$get_delivery_operator_by_id$delivery_operator<TRes> {
  _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator(
    this._instance,
    this._then,
  );

  final Query$get_delivery_operator_by_id$delivery_operator _instance;

  final TRes Function(Query$get_delivery_operator_by_id$delivery_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_company_id = _undefined,
    Object? delivery_company = _undefined,
    Object? delivery_driver_type = _undefined,
    Object? id = _undefined,
    Object? notification_token = _undefined,
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_delivery_operator_by_id$delivery_operator(
        app_version: app_version == _undefined || app_version == null
            ? _instance.app_version
            : (app_version as String),
        current_gps: current_gps == _undefined || current_gps == null
            ? _instance.current_gps
            : (current_gps as Geography),
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        delivery_company: delivery_company == _undefined ||
                delivery_company == null
            ? _instance.delivery_company
            : (delivery_company
                as Query$get_delivery_operator_by_id$delivery_operator$delivery_company),
        delivery_driver_type:
            delivery_driver_type == _undefined || delivery_driver_type == null
                ? _instance.delivery_driver_type
                : (delivery_driver_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notification_token: notification_token == _undefined
            ? _instance.notification_token
            : (notification_token as String?),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
        local$delivery_company, (e) => call(delivery_company: e));
  }
}

class _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator<
        TRes>
    implements
        CopyWith$Query$get_delivery_operator_by_id$delivery_operator<TRes> {
  _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator(
      this._res);

  TRes _res;

  call({
    String? app_version,
    Geography? current_gps,
    int? delivery_company_id,
    Query$get_delivery_operator_by_id$delivery_operator$delivery_company?
        delivery_company,
    String? delivery_driver_type,
    int? id,
    String? notification_token,
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company
              .stub(_res);
}

class Query$get_delivery_operator_by_id$delivery_operator$delivery_company {
  Query$get_delivery_operator_by_id$delivery_operator$delivery_company({
    required this.name,
    required this.$__typename,
  });

  factory Query$get_delivery_operator_by_id$delivery_operator$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_delivery_operator_by_id$delivery_operator$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_delivery_operator_by_id$delivery_operator$delivery_company
    on Query$get_delivery_operator_by_id$delivery_operator$delivery_company {
  CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
          Query$get_delivery_operator_by_id$delivery_operator$delivery_company>
      get copyWith =>
          CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
    TRes> {
  factory CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
    Query$get_delivery_operator_by_id$delivery_operator$delivery_company
        instance,
    TRes Function(
            Query$get_delivery_operator_by_id$delivery_operator$delivery_company)
        then,
  ) = _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company;

  factory CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
            TRes> {
  _CopyWithImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
    this._instance,
    this._then,
  );

  final Query$get_delivery_operator_by_id$delivery_operator$delivery_company
      _instance;

  final TRes Function(
          Query$get_delivery_operator_by_id$delivery_operator$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$get_delivery_operator_by_id$delivery_operator$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$get_delivery_operator_by_id$delivery_operator$delivery_company(
      this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$get_delivery_operator_by_id {
  factory Variables$Subscription$get_delivery_operator_by_id(
          {required int user_id}) =>
      Variables$Subscription$get_delivery_operator_by_id._({
        r'user_id': user_id,
      });

  Variables$Subscription$get_delivery_operator_by_id._(this._$data);

  factory Variables$Subscription$get_delivery_operator_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    return Variables$Subscription$get_delivery_operator_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get user_id => (_$data['user_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$get_delivery_operator_by_id<
          Variables$Subscription$get_delivery_operator_by_id>
      get copyWith =>
          CopyWith$Variables$Subscription$get_delivery_operator_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$get_delivery_operator_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    return Object.hashAll([l$user_id]);
  }
}

abstract class CopyWith$Variables$Subscription$get_delivery_operator_by_id<
    TRes> {
  factory CopyWith$Variables$Subscription$get_delivery_operator_by_id(
    Variables$Subscription$get_delivery_operator_by_id instance,
    TRes Function(Variables$Subscription$get_delivery_operator_by_id) then,
  ) = _CopyWithImpl$Variables$Subscription$get_delivery_operator_by_id;

  factory CopyWith$Variables$Subscription$get_delivery_operator_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$get_delivery_operator_by_id;

  TRes call({int? user_id});
}

class _CopyWithImpl$Variables$Subscription$get_delivery_operator_by_id<TRes>
    implements
        CopyWith$Variables$Subscription$get_delivery_operator_by_id<TRes> {
  _CopyWithImpl$Variables$Subscription$get_delivery_operator_by_id(
    this._instance,
    this._then,
  );

  final Variables$Subscription$get_delivery_operator_by_id _instance;

  final TRes Function(Variables$Subscription$get_delivery_operator_by_id) _then;

  static const _undefined = {};

  TRes call({Object? user_id = _undefined}) =>
      _then(Variables$Subscription$get_delivery_operator_by_id._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$get_delivery_operator_by_id<TRes>
    implements
        CopyWith$Variables$Subscription$get_delivery_operator_by_id<TRes> {
  _CopyWithStubImpl$Variables$Subscription$get_delivery_operator_by_id(
      this._res);

  TRes _res;

  call({int? user_id}) => _res;
}

class Subscription$get_delivery_operator_by_id {
  Subscription$get_delivery_operator_by_id({
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Subscription$get_delivery_operator_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Subscription$get_delivery_operator_by_id(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) => Subscription$get_delivery_operator_by_id$delivery_operator
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$get_delivery_operator_by_id$delivery_operator>
      delivery_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_operator = delivery_operator;
    _resultData['delivery_operator'] =
        l$delivery_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_operator = delivery_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_delivery_operator_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_operator = delivery_operator;
    final lOther$delivery_operator = other.delivery_operator;
    if (l$delivery_operator.length != lOther$delivery_operator.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_operator.length; i++) {
      final l$delivery_operator$entry = l$delivery_operator[i];
      final lOther$delivery_operator$entry = lOther$delivery_operator[i];
      if (l$delivery_operator$entry != lOther$delivery_operator$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$get_delivery_operator_by_id
    on Subscription$get_delivery_operator_by_id {
  CopyWith$Subscription$get_delivery_operator_by_id<
          Subscription$get_delivery_operator_by_id>
      get copyWith => CopyWith$Subscription$get_delivery_operator_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_delivery_operator_by_id<TRes> {
  factory CopyWith$Subscription$get_delivery_operator_by_id(
    Subscription$get_delivery_operator_by_id instance,
    TRes Function(Subscription$get_delivery_operator_by_id) then,
  ) = _CopyWithImpl$Subscription$get_delivery_operator_by_id;

  factory CopyWith$Subscription$get_delivery_operator_by_id.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_delivery_operator_by_id;

  TRes call({
    List<Subscription$get_delivery_operator_by_id$delivery_operator>?
        delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Subscription$get_delivery_operator_by_id$delivery_operator> Function(
              Iterable<
                  CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
                      Subscription$get_delivery_operator_by_id$delivery_operator>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_delivery_operator_by_id<TRes>
    implements CopyWith$Subscription$get_delivery_operator_by_id<TRes> {
  _CopyWithImpl$Subscription$get_delivery_operator_by_id(
    this._instance,
    this._then,
  );

  final Subscription$get_delivery_operator_by_id _instance;

  final TRes Function(Subscription$get_delivery_operator_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_delivery_operator_by_id(
        delivery_operator: delivery_operator == _undefined ||
                delivery_operator == null
            ? _instance.delivery_operator
            : (delivery_operator as List<
                Subscription$get_delivery_operator_by_id$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Subscription$get_delivery_operator_by_id$delivery_operator> Function(
                  Iterable<
                      CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
                          Subscription$get_delivery_operator_by_id$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator.map((e) =>
              CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_delivery_operator_by_id<TRes>
    implements CopyWith$Subscription$get_delivery_operator_by_id<TRes> {
  _CopyWithStubImpl$Subscription$get_delivery_operator_by_id(this._res);

  TRes _res;

  call({
    List<Subscription$get_delivery_operator_by_id$delivery_operator>?
        delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
}

const documentNodeSubscriptionget_delivery_operator_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'get_delivery_operator_by_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_operator'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'user_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: IntValueNode(value: '1'),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_version'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'current_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_company_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notification_token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'owner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Subscription$get_delivery_operator_by_id
    _parserFn$Subscription$get_delivery_operator_by_id(
            Map<String, dynamic> data) =>
        Subscription$get_delivery_operator_by_id.fromJson(data);

class Options$Subscription$get_delivery_operator_by_id extends graphql
    .SubscriptionOptions<Subscription$get_delivery_operator_by_id> {
  Options$Subscription$get_delivery_operator_by_id({
    String? operationName,
    required Variables$Subscription$get_delivery_operator_by_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionget_delivery_operator_by_id,
          parserFn: _parserFn$Subscription$get_delivery_operator_by_id,
        );
}

class WatchOptions$Subscription$get_delivery_operator_by_id extends graphql
    .WatchQueryOptions<Subscription$get_delivery_operator_by_id> {
  WatchOptions$Subscription$get_delivery_operator_by_id({
    String? operationName,
    required Variables$Subscription$get_delivery_operator_by_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionget_delivery_operator_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$get_delivery_operator_by_id,
        );
}

class FetchMoreOptions$Subscription$get_delivery_operator_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$get_delivery_operator_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$get_delivery_operator_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionget_delivery_operator_by_id,
        );
}

extension ClientExtension$Subscription$get_delivery_operator_by_id
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$get_delivery_operator_by_id>>
      subscribe$get_delivery_operator_by_id(
              Options$Subscription$get_delivery_operator_by_id options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$get_delivery_operator_by_id>
      watchSubscription$get_delivery_operator_by_id(
              WatchOptions$Subscription$get_delivery_operator_by_id options) =>
          this.watchQuery(options);
}

class Subscription$get_delivery_operator_by_id$delivery_operator {
  Subscription$get_delivery_operator_by_id$delivery_operator({
    required this.app_version,
    required this.current_gps,
    required this.delivery_company_id,
    required this.delivery_driver_type,
    required this.id,
    this.notification_token,
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Subscription$get_delivery_operator_by_id$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$current_gps = json['current_gps'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$delivery_driver_type = json['delivery_driver_type'];
    final l$id = json['id'];
    final l$notification_token = json['notification_token'];
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$get_delivery_operator_by_id$delivery_operator(
      app_version: (l$app_version as String),
      current_gps: geographyFromJson(l$current_gps),
      delivery_company_id: (l$delivery_company_id as int),
      delivery_driver_type: (l$delivery_driver_type as String),
      id: (l$id as int),
      notification_token: (l$notification_token as String?),
      owner: (l$owner as bool),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String app_version;

  final Geography current_gps;

  final int delivery_company_id;

  final String delivery_driver_type;

  final int id;

  final String? notification_token;

  final bool owner;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$current_gps = current_gps;
    _resultData['current_gps'] = geographyToJson(l$current_gps);
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notification_token = notification_token;
    _resultData['notification_token'] = l$notification_token;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$current_gps = current_gps;
    final l$delivery_company_id = delivery_company_id;
    final l$delivery_driver_type = delivery_driver_type;
    final l$id = id;
    final l$notification_token = notification_token;
    final l$owner = owner;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$current_gps,
      l$delivery_company_id,
      l$delivery_driver_type,
      l$id,
      l$notification_token,
      l$owner,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$get_delivery_operator_by_id$delivery_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
      return false;
    }
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notification_token = notification_token;
    final lOther$notification_token = other.notification_token;
    if (l$notification_token != lOther$notification_token) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$get_delivery_operator_by_id$delivery_operator
    on Subscription$get_delivery_operator_by_id$delivery_operator {
  CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
          Subscription$get_delivery_operator_by_id$delivery_operator>
      get copyWith =>
          CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
    TRes> {
  factory CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator(
    Subscription$get_delivery_operator_by_id$delivery_operator instance,
    TRes Function(Subscription$get_delivery_operator_by_id$delivery_operator)
        then,
  ) = _CopyWithImpl$Subscription$get_delivery_operator_by_id$delivery_operator;

  factory CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_delivery_operator_by_id$delivery_operator;

  TRes call({
    String? app_version,
    Geography? current_gps,
    int? delivery_company_id,
    String? delivery_driver_type,
    int? id,
    String? notification_token,
    bool? owner,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_delivery_operator_by_id$delivery_operator<
        TRes>
    implements
        CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
            TRes> {
  _CopyWithImpl$Subscription$get_delivery_operator_by_id$delivery_operator(
    this._instance,
    this._then,
  );

  final Subscription$get_delivery_operator_by_id$delivery_operator _instance;

  final TRes Function(
      Subscription$get_delivery_operator_by_id$delivery_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_company_id = _undefined,
    Object? delivery_driver_type = _undefined,
    Object? id = _undefined,
    Object? notification_token = _undefined,
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_delivery_operator_by_id$delivery_operator(
        app_version: app_version == _undefined || app_version == null
            ? _instance.app_version
            : (app_version as String),
        current_gps: current_gps == _undefined || current_gps == null
            ? _instance.current_gps
            : (current_gps as Geography),
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        delivery_driver_type:
            delivery_driver_type == _undefined || delivery_driver_type == null
                ? _instance.delivery_driver_type
                : (delivery_driver_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notification_token: notification_token == _undefined
            ? _instance.notification_token
            : (notification_token as String?),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_delivery_operator_by_id$delivery_operator<
        TRes>
    implements
        CopyWith$Subscription$get_delivery_operator_by_id$delivery_operator<
            TRes> {
  _CopyWithStubImpl$Subscription$get_delivery_operator_by_id$delivery_operator(
      this._res);

  TRes _res;

  call({
    String? app_version,
    Geography? current_gps,
    int? delivery_company_id,
    String? delivery_driver_type,
    int? id,
    String? notification_token,
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
}
