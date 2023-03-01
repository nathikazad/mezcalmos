import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getOperatorByUserId {
  factory Variables$Query$getOperatorByUserId({required int userId}) =>
      Variables$Query$getOperatorByUserId._({
        r'userId': userId,
      });

  Variables$Query$getOperatorByUserId._(this._$data);

  factory Variables$Query$getOperatorByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getOperatorByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getOperatorByUserId<
          Variables$Query$getOperatorByUserId>
      get copyWith => CopyWith$Variables$Query$getOperatorByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOperatorByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Query$getOperatorByUserId<TRes> {
  factory CopyWith$Variables$Query$getOperatorByUserId(
    Variables$Query$getOperatorByUserId instance,
    TRes Function(Variables$Query$getOperatorByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getOperatorByUserId;

  factory CopyWith$Variables$Query$getOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOperatorByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getOperatorByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getOperatorByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getOperatorByUserId _instance;

  final TRes Function(Variables$Query$getOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getOperatorByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getOperatorByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getOperatorByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getOperatorByUserId {
  Query$getOperatorByUserId({
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId.fromJson(Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) => Query$getOperatorByUserId$delivery_operator.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOperatorByUserId$delivery_operator> delivery_operator;

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
    if (!(other is Query$getOperatorByUserId) ||
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

extension UtilityExtension$Query$getOperatorByUserId
    on Query$getOperatorByUserId {
  CopyWith$Query$getOperatorByUserId<Query$getOperatorByUserId> get copyWith =>
      CopyWith$Query$getOperatorByUserId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOperatorByUserId<TRes> {
  factory CopyWith$Query$getOperatorByUserId(
    Query$getOperatorByUserId instance,
    TRes Function(Query$getOperatorByUserId) then,
  ) = _CopyWithImpl$Query$getOperatorByUserId;

  factory CopyWith$Query$getOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId;

  TRes call({
    List<Query$getOperatorByUserId$delivery_operator>? delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Query$getOperatorByUserId$delivery_operator> Function(
              Iterable<
                  CopyWith$Query$getOperatorByUserId$delivery_operator<
                      Query$getOperatorByUserId$delivery_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getOperatorByUserId<TRes>
    implements CopyWith$Query$getOperatorByUserId<TRes> {
  _CopyWithImpl$Query$getOperatorByUserId(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId _instance;

  final TRes Function(Query$getOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId(
        delivery_operator:
            delivery_operator == _undefined || delivery_operator == null
                ? _instance.delivery_operator
                : (delivery_operator
                    as List<Query$getOperatorByUserId$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Query$getOperatorByUserId$delivery_operator> Function(
                  Iterable<
                      CopyWith$Query$getOperatorByUserId$delivery_operator<
                          Query$getOperatorByUserId$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator
              .map((e) => CopyWith$Query$getOperatorByUserId$delivery_operator(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getOperatorByUserId<TRes>
    implements CopyWith$Query$getOperatorByUserId<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId(this._res);

  TRes _res;

  call({
    List<Query$getOperatorByUserId$delivery_operator>? delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
}

const documentNodeQuerygetOperatorByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOperatorByUserId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
                    value: VariableNode(name: NameNode(value: 'userId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'operator_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'user_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
                name: NameNode(value: 'details_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'service_link_id'),
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
                name: NameNode(value: 'delivery_details_id'),
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
Query$getOperatorByUserId _parserFn$Query$getOperatorByUserId(
        Map<String, dynamic> data) =>
    Query$getOperatorByUserId.fromJson(data);

class Options$Query$getOperatorByUserId
    extends graphql.QueryOptions<Query$getOperatorByUserId> {
  Options$Query$getOperatorByUserId({
    String? operationName,
    required Variables$Query$getOperatorByUserId variables,
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
          document: documentNodeQuerygetOperatorByUserId,
          parserFn: _parserFn$Query$getOperatorByUserId,
        );
}

class WatchOptions$Query$getOperatorByUserId
    extends graphql.WatchQueryOptions<Query$getOperatorByUserId> {
  WatchOptions$Query$getOperatorByUserId({
    String? operationName,
    required Variables$Query$getOperatorByUserId variables,
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
          document: documentNodeQuerygetOperatorByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOperatorByUserId,
        );
}

class FetchMoreOptions$Query$getOperatorByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOperatorByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOperatorByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOperatorByUserId,
        );
}

extension ClientExtension$Query$getOperatorByUserId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOperatorByUserId>>
      query$getOperatorByUserId(
              Options$Query$getOperatorByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOperatorByUserId>
      watchQuery$getOperatorByUserId(
              WatchOptions$Query$getOperatorByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getOperatorByUserId({
    required Query$getOperatorByUserId data,
    required Variables$Query$getOperatorByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOperatorByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOperatorByUserId? readQuery$getOperatorByUserId({
    required Variables$Query$getOperatorByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOperatorByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOperatorByUserId.fromJson(result);
  }
}

class Query$getOperatorByUserId$delivery_operator {
  Query$getOperatorByUserId$delivery_operator({
    required this.id,
    required this.operator_details,
    required this.user_id,
    required this.user,
    required this.delivery_company_id,
    required this.delivery_company,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$operator_details = json['operator_details'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$delivery_company = json['delivery_company'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator(
      id: (l$id as int),
      operator_details:
          Query$getOperatorByUserId$delivery_operator$operator_details.fromJson(
              (l$operator_details as Map<String, dynamic>)),
      user_id: (l$user_id as int),
      user: Query$getOperatorByUserId$delivery_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      delivery_company_id: (l$delivery_company_id as int),
      delivery_company:
          Query$getOperatorByUserId$delivery_operator$delivery_company.fromJson(
              (l$delivery_company as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getOperatorByUserId$delivery_operator$operator_details
      operator_details;

  final int user_id;

  final Query$getOperatorByUserId$delivery_operator$user user;

  final int delivery_company_id;

  final Query$getOperatorByUserId$delivery_operator$delivery_company
      delivery_company;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$operator_details = operator_details;
    _resultData['operator_details'] = l$operator_details.toJson();
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$operator_details = operator_details;
    final l$user_id = user_id;
    final l$user = user;
    final l$delivery_company_id = delivery_company_id;
    final l$delivery_company = delivery_company;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$operator_details,
      l$user_id,
      l$user,
      l$delivery_company_id,
      l$delivery_company,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorByUserId$delivery_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$operator_details = operator_details;
    final lOther$operator_details = other.operator_details;
    if (l$operator_details != lOther$operator_details) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getOperatorByUserId$delivery_operator
    on Query$getOperatorByUserId$delivery_operator {
  CopyWith$Query$getOperatorByUserId$delivery_operator<
          Query$getOperatorByUserId$delivery_operator>
      get copyWith => CopyWith$Query$getOperatorByUserId$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$delivery_operator<TRes> {
  factory CopyWith$Query$getOperatorByUserId$delivery_operator(
    Query$getOperatorByUserId$delivery_operator instance,
    TRes Function(Query$getOperatorByUserId$delivery_operator) then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$delivery_operator;

  factory CopyWith$Query$getOperatorByUserId$delivery_operator.stub(TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator;

  TRes call({
    int? id,
    Query$getOperatorByUserId$delivery_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getOperatorByUserId$delivery_operator$user? user,
    int? delivery_company_id,
    Query$getOperatorByUserId$delivery_operator$delivery_company?
        delivery_company,
    String? $__typename,
  });
  CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<TRes>
      get operator_details;
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user;
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<TRes>
      get delivery_company;
}

class _CopyWithImpl$Query$getOperatorByUserId$delivery_operator<TRes>
    implements CopyWith$Query$getOperatorByUserId$delivery_operator<TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$delivery_operator(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$delivery_operator _instance;

  final TRes Function(Query$getOperatorByUserId$delivery_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? operator_details = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? delivery_company_id = _undefined,
    Object? delivery_company = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$delivery_operator(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getOperatorByUserId$delivery_operator$operator_details),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getOperatorByUserId$delivery_operator$user),
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        delivery_company: delivery_company == _undefined ||
                delivery_company == null
            ? _instance.delivery_company
            : (delivery_company
                as Query$getOperatorByUserId$delivery_operator$delivery_company),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<TRes>
      get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getOperatorByUserId$delivery_operator$user(
        local$user, (e) => call(user: e));
  }

  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<TRes>
      get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company(
        local$delivery_company, (e) => call(delivery_company: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator<TRes>
    implements CopyWith$Query$getOperatorByUserId$delivery_operator<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator(this._res);

  TRes _res;

  call({
    int? id,
    Query$getOperatorByUserId$delivery_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getOperatorByUserId$delivery_operator$user? user,
    int? delivery_company_id,
    Query$getOperatorByUserId$delivery_operator$delivery_company?
        delivery_company,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<TRes>
      get operator_details =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details
              .stub(_res);
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user =>
      CopyWith$Query$getOperatorByUserId$delivery_operator$user.stub(_res);
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<TRes>
      get delivery_company =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company
              .stub(_res);
}

class Query$getOperatorByUserId$delivery_operator$operator_details {
  Query$getOperatorByUserId$delivery_operator$operator_details({
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator$operator_details(
      owner: (l$owner as bool),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool owner;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$owner = owner;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$getOperatorByUserId$delivery_operator$operator_details) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getOperatorByUserId$delivery_operator$operator_details
    on Query$getOperatorByUserId$delivery_operator$operator_details {
  CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<
          Query$getOperatorByUserId$delivery_operator$operator_details>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details(
    Query$getOperatorByUserId$delivery_operator$operator_details instance,
    TRes Function(Query$getOperatorByUserId$delivery_operator$operator_details)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$operator_details;

  factory CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$operator_details;

  TRes call({
    bool? owner,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$operator_details(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$delivery_operator$operator_details _instance;

  final TRes Function(
      Query$getOperatorByUserId$delivery_operator$operator_details) _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$delivery_operator$operator_details(
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

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOperatorByUserId$delivery_operator$user {
  Query$getOperatorByUserId$delivery_operator$user({
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator$user(
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String firebase_id;

  final String? image;

  final String language_id;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firebase_id,
      l$image,
      l$language_id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorByUserId$delivery_operator$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getOperatorByUserId$delivery_operator$user
    on Query$getOperatorByUserId$delivery_operator$user {
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<
          Query$getOperatorByUserId$delivery_operator$user>
      get copyWith => CopyWith$Query$getOperatorByUserId$delivery_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> {
  factory CopyWith$Query$getOperatorByUserId$delivery_operator$user(
    Query$getOperatorByUserId$delivery_operator$user instance,
    TRes Function(Query$getOperatorByUserId$delivery_operator$user) then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$user;

  factory CopyWith$Query$getOperatorByUserId$delivery_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$user;

  TRes call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$user<TRes>
    implements CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$user(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$delivery_operator$user _instance;

  final TRes Function(Query$getOperatorByUserId$delivery_operator$user) _then;

  static const _undefined = {};

  TRes call({
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$delivery_operator$user(
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$user<TRes>
    implements CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$user(this._res);

  TRes _res;

  call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOperatorByUserId$delivery_operator$delivery_company {
  Query$getOperatorByUserId$delivery_operator$delivery_company({
    required this.details_id,
    this.details,
    required this.delivery_details_id,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator$delivery_company(
      details_id: (l$details_id as int),
      details: l$details == null
          ? null
          : Query$getOperatorByUserId$delivery_operator$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getOperatorByUserId$delivery_operator$delivery_company$details?
      details;

  final int delivery_details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$details = details;
    final l$delivery_details_id = delivery_details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$details,
      l$delivery_details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOperatorByUserId$delivery_operator$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$getOperatorByUserId$delivery_operator$delivery_company
    on Query$getOperatorByUserId$delivery_operator$delivery_company {
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<
          Query$getOperatorByUserId$delivery_operator$delivery_company>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company(
    Query$getOperatorByUserId$delivery_operator$delivery_company instance,
    TRes Function(Query$getOperatorByUserId$delivery_operator$delivery_company)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company;

  factory CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company;

  TRes call({
    int? details_id,
    Query$getOperatorByUserId$delivery_operator$delivery_company$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  });
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$delivery_operator$delivery_company _instance;

  final TRes Function(
      Query$getOperatorByUserId$delivery_operator$delivery_company) _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$delivery_operator$delivery_company(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getOperatorByUserId$delivery_operator$delivery_company$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getOperatorByUserId$delivery_operator$delivery_company$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details
              .stub(_res);
}

class Query$getOperatorByUserId$delivery_operator$delivery_company$details {
  Query$getOperatorByUserId$delivery_operator$delivery_company$details({
    this.service_link_id,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$service_link_id = json['service_link_id'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator$delivery_company$details(
      service_link_id: (l$service_link_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? service_link_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_link_id = service_link_id;
    _resultData['service_link_id'] = l$service_link_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_link_id = service_link_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_link_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOperatorByUserId$delivery_operator$delivery_company$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_link_id = service_link_id;
    final lOther$service_link_id = other.service_link_id;
    if (l$service_link_id != lOther$service_link_id) {
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

extension UtilityExtension$Query$getOperatorByUserId$delivery_operator$delivery_company$details
    on Query$getOperatorByUserId$delivery_operator$delivery_company$details {
  CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
          Query$getOperatorByUserId$delivery_operator$delivery_company$details>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details(
    Query$getOperatorByUserId$delivery_operator$delivery_company$details
        instance,
    TRes Function(
            Query$getOperatorByUserId$delivery_operator$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details;

  factory CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details;

  TRes call({
    int? service_link_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$delivery_operator$delivery_company$details
      _instance;

  final TRes Function(
          Query$getOperatorByUserId$delivery_operator$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? service_link_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOperatorByUserId$delivery_operator$delivery_company$details(
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$delivery_operator$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator$delivery_company$details(
      this._res);

  TRes _res;

  call({
    int? service_link_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$dvOperatorStatusStream {
  factory Variables$Subscription$dvOperatorStatusStream(
          {required int userId}) =>
      Variables$Subscription$dvOperatorStatusStream._({
        r'userId': userId,
      });

  Variables$Subscription$dvOperatorStatusStream._(this._$data);

  factory Variables$Subscription$dvOperatorStatusStream.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Subscription$dvOperatorStatusStream._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Subscription$dvOperatorStatusStream<
          Variables$Subscription$dvOperatorStatusStream>
      get copyWith => CopyWith$Variables$Subscription$dvOperatorStatusStream(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$dvOperatorStatusStream) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Subscription$dvOperatorStatusStream<TRes> {
  factory CopyWith$Variables$Subscription$dvOperatorStatusStream(
    Variables$Subscription$dvOperatorStatusStream instance,
    TRes Function(Variables$Subscription$dvOperatorStatusStream) then,
  ) = _CopyWithImpl$Variables$Subscription$dvOperatorStatusStream;

  factory CopyWith$Variables$Subscription$dvOperatorStatusStream.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$dvOperatorStatusStream;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Subscription$dvOperatorStatusStream<TRes>
    implements CopyWith$Variables$Subscription$dvOperatorStatusStream<TRes> {
  _CopyWithImpl$Variables$Subscription$dvOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Variables$Subscription$dvOperatorStatusStream _instance;

  final TRes Function(Variables$Subscription$dvOperatorStatusStream) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Subscription$dvOperatorStatusStream._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$dvOperatorStatusStream<TRes>
    implements CopyWith$Variables$Subscription$dvOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Variables$Subscription$dvOperatorStatusStream(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Subscription$dvOperatorStatusStream {
  Subscription$dvOperatorStatusStream({
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Subscription$dvOperatorStatusStream.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Subscription$dvOperatorStatusStream(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) =>
              Subscription$dvOperatorStatusStream$delivery_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$dvOperatorStatusStream$delivery_operator>
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
    if (!(other is Subscription$dvOperatorStatusStream) ||
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

extension UtilityExtension$Subscription$dvOperatorStatusStream
    on Subscription$dvOperatorStatusStream {
  CopyWith$Subscription$dvOperatorStatusStream<
          Subscription$dvOperatorStatusStream>
      get copyWith => CopyWith$Subscription$dvOperatorStatusStream(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$dvOperatorStatusStream<TRes> {
  factory CopyWith$Subscription$dvOperatorStatusStream(
    Subscription$dvOperatorStatusStream instance,
    TRes Function(Subscription$dvOperatorStatusStream) then,
  ) = _CopyWithImpl$Subscription$dvOperatorStatusStream;

  factory CopyWith$Subscription$dvOperatorStatusStream.stub(TRes res) =
      _CopyWithStubImpl$Subscription$dvOperatorStatusStream;

  TRes call({
    List<Subscription$dvOperatorStatusStream$delivery_operator>?
        delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Subscription$dvOperatorStatusStream$delivery_operator> Function(
              Iterable<
                  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<
                      Subscription$dvOperatorStatusStream$delivery_operator>>)
          _fn);
}

class _CopyWithImpl$Subscription$dvOperatorStatusStream<TRes>
    implements CopyWith$Subscription$dvOperatorStatusStream<TRes> {
  _CopyWithImpl$Subscription$dvOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Subscription$dvOperatorStatusStream _instance;

  final TRes Function(Subscription$dvOperatorStatusStream) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$dvOperatorStatusStream(
        delivery_operator: delivery_operator == _undefined ||
                delivery_operator == null
            ? _instance.delivery_operator
            : (delivery_operator
                as List<Subscription$dvOperatorStatusStream$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Subscription$dvOperatorStatusStream$delivery_operator> Function(
                  Iterable<
                      CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<
                          Subscription$dvOperatorStatusStream$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator.map((e) =>
              CopyWith$Subscription$dvOperatorStatusStream$delivery_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$dvOperatorStatusStream<TRes>
    implements CopyWith$Subscription$dvOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Subscription$dvOperatorStatusStream(this._res);

  TRes _res;

  call({
    List<Subscription$dvOperatorStatusStream$delivery_operator>?
        delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
}

const documentNodeSubscriptiondvOperatorStatusStream =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'dvOperatorStatusStream'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
                    value: VariableNode(name: NameNode(value: 'userId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'operator_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
Subscription$dvOperatorStatusStream
    _parserFn$Subscription$dvOperatorStatusStream(Map<String, dynamic> data) =>
        Subscription$dvOperatorStatusStream.fromJson(data);

class Options$Subscription$dvOperatorStatusStream
    extends graphql.SubscriptionOptions<Subscription$dvOperatorStatusStream> {
  Options$Subscription$dvOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$dvOperatorStatusStream variables,
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
          document: documentNodeSubscriptiondvOperatorStatusStream,
          parserFn: _parserFn$Subscription$dvOperatorStatusStream,
        );
}

class WatchOptions$Subscription$dvOperatorStatusStream
    extends graphql.WatchQueryOptions<Subscription$dvOperatorStatusStream> {
  WatchOptions$Subscription$dvOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$dvOperatorStatusStream variables,
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
          document: documentNodeSubscriptiondvOperatorStatusStream,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$dvOperatorStatusStream,
        );
}

class FetchMoreOptions$Subscription$dvOperatorStatusStream
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$dvOperatorStatusStream({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$dvOperatorStatusStream variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptiondvOperatorStatusStream,
        );
}

extension ClientExtension$Subscription$dvOperatorStatusStream
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$dvOperatorStatusStream>>
      subscribe$dvOperatorStatusStream(
              Options$Subscription$dvOperatorStatusStream options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$dvOperatorStatusStream>
      watchSubscription$dvOperatorStatusStream(
              WatchOptions$Subscription$dvOperatorStatusStream options) =>
          this.watchQuery(options);
}

class Subscription$dvOperatorStatusStream$delivery_operator {
  Subscription$dvOperatorStatusStream$delivery_operator({
    required this.operator_details,
    required this.$__typename,
  });

  factory Subscription$dvOperatorStatusStream$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$operator_details = json['operator_details'];
    final l$$__typename = json['__typename'];
    return Subscription$dvOperatorStatusStream$delivery_operator(
      operator_details:
          Subscription$dvOperatorStatusStream$delivery_operator$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$dvOperatorStatusStream$delivery_operator$operator_details
      operator_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$operator_details = operator_details;
    _resultData['operator_details'] = l$operator_details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$operator_details = operator_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$operator_details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$dvOperatorStatusStream$delivery_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$operator_details = operator_details;
    final lOther$operator_details = other.operator_details;
    if (l$operator_details != lOther$operator_details) {
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

extension UtilityExtension$Subscription$dvOperatorStatusStream$delivery_operator
    on Subscription$dvOperatorStatusStream$delivery_operator {
  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<
          Subscription$dvOperatorStatusStream$delivery_operator>
      get copyWith =>
          CopyWith$Subscription$dvOperatorStatusStream$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<
    TRes> {
  factory CopyWith$Subscription$dvOperatorStatusStream$delivery_operator(
    Subscription$dvOperatorStatusStream$delivery_operator instance,
    TRes Function(Subscription$dvOperatorStatusStream$delivery_operator) then,
  ) = _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator;

  factory CopyWith$Subscription$dvOperatorStatusStream$delivery_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator;

  TRes call({
    Subscription$dvOperatorStatusStream$delivery_operator$operator_details?
        operator_details,
    String? $__typename,
  });
  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
      TRes> get operator_details;
}

class _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator<TRes>
    implements
        CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<TRes> {
  _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator(
    this._instance,
    this._then,
  );

  final Subscription$dvOperatorStatusStream$delivery_operator _instance;

  final TRes Function(Subscription$dvOperatorStatusStream$delivery_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? operator_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$dvOperatorStatusStream$delivery_operator(
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Subscription$dvOperatorStatusStream$delivery_operator$operator_details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }
}

class _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator<
        TRes>
    implements
        CopyWith$Subscription$dvOperatorStatusStream$delivery_operator<TRes> {
  _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator(
      this._res);

  TRes _res;

  call({
    Subscription$dvOperatorStatusStream$delivery_operator$operator_details?
        operator_details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details
              .stub(_res);
}

class Subscription$dvOperatorStatusStream$delivery_operator$operator_details {
  Subscription$dvOperatorStatusStream$delivery_operator$operator_details({
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Subscription$dvOperatorStatusStream$delivery_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
      owner: (l$owner as bool),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool owner;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$owner = owner;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Subscription$dvOperatorStatusStream$delivery_operator$operator_details) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Subscription$dvOperatorStatusStream$delivery_operator$operator_details
    on Subscription$dvOperatorStatusStream$delivery_operator$operator_details {
  CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
          Subscription$dvOperatorStatusStream$delivery_operator$operator_details>
      get copyWith =>
          CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
    TRes> {
  factory CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
    Subscription$dvOperatorStatusStream$delivery_operator$operator_details
        instance,
    TRes Function(
            Subscription$dvOperatorStatusStream$delivery_operator$operator_details)
        then,
  ) = _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details;

  factory CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details;

  TRes call({
    bool? owner,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
            TRes> {
  _CopyWithImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
    this._instance,
    this._then,
  );

  final Subscription$dvOperatorStatusStream$delivery_operator$operator_details
      _instance;

  final TRes Function(
          Subscription$dvOperatorStatusStream$delivery_operator$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
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

class _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Subscription$dvOperatorStatusStream$delivery_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Subscription$dvOperatorStatusStream$delivery_operator$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCompanyOerators {
  factory Variables$Query$getCompanyOerators({required int companyId}) =>
      Variables$Query$getCompanyOerators._({
        r'companyId': companyId,
      });

  Variables$Query$getCompanyOerators._(this._$data);

  factory Variables$Query$getCompanyOerators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$companyId = data['companyId'];
    result$data['companyId'] = (l$companyId as int);
    return Variables$Query$getCompanyOerators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get companyId => (_$data['companyId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$companyId = companyId;
    result$data['companyId'] = l$companyId;
    return result$data;
  }

  CopyWith$Variables$Query$getCompanyOerators<
          Variables$Query$getCompanyOerators>
      get copyWith => CopyWith$Variables$Query$getCompanyOerators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCompanyOerators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$companyId = companyId;
    final lOther$companyId = other.companyId;
    if (l$companyId != lOther$companyId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$companyId = companyId;
    return Object.hashAll([l$companyId]);
  }
}

abstract class CopyWith$Variables$Query$getCompanyOerators<TRes> {
  factory CopyWith$Variables$Query$getCompanyOerators(
    Variables$Query$getCompanyOerators instance,
    TRes Function(Variables$Query$getCompanyOerators) then,
  ) = _CopyWithImpl$Variables$Query$getCompanyOerators;

  factory CopyWith$Variables$Query$getCompanyOerators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCompanyOerators;

  TRes call({int? companyId});
}

class _CopyWithImpl$Variables$Query$getCompanyOerators<TRes>
    implements CopyWith$Variables$Query$getCompanyOerators<TRes> {
  _CopyWithImpl$Variables$Query$getCompanyOerators(
    this._instance,
    this._then,
  );

  final Variables$Query$getCompanyOerators _instance;

  final TRes Function(Variables$Query$getCompanyOerators) _then;

  static const _undefined = {};

  TRes call({Object? companyId = _undefined}) =>
      _then(Variables$Query$getCompanyOerators._({
        ..._instance._$data,
        if (companyId != _undefined && companyId != null)
          'companyId': (companyId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCompanyOerators<TRes>
    implements CopyWith$Variables$Query$getCompanyOerators<TRes> {
  _CopyWithStubImpl$Variables$Query$getCompanyOerators(this._res);

  TRes _res;

  call({int? companyId}) => _res;
}

class Query$getCompanyOerators {
  Query$getCompanyOerators({
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Query$getCompanyOerators.fromJson(Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) => Query$getCompanyOerators$delivery_operator.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCompanyOerators$delivery_operator> delivery_operator;

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
    if (!(other is Query$getCompanyOerators) ||
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

extension UtilityExtension$Query$getCompanyOerators
    on Query$getCompanyOerators {
  CopyWith$Query$getCompanyOerators<Query$getCompanyOerators> get copyWith =>
      CopyWith$Query$getCompanyOerators(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCompanyOerators<TRes> {
  factory CopyWith$Query$getCompanyOerators(
    Query$getCompanyOerators instance,
    TRes Function(Query$getCompanyOerators) then,
  ) = _CopyWithImpl$Query$getCompanyOerators;

  factory CopyWith$Query$getCompanyOerators.stub(TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators;

  TRes call({
    List<Query$getCompanyOerators$delivery_operator>? delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Query$getCompanyOerators$delivery_operator> Function(
              Iterable<
                  CopyWith$Query$getCompanyOerators$delivery_operator<
                      Query$getCompanyOerators$delivery_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getCompanyOerators<TRes>
    implements CopyWith$Query$getCompanyOerators<TRes> {
  _CopyWithImpl$Query$getCompanyOerators(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators _instance;

  final TRes Function(Query$getCompanyOerators) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators(
        delivery_operator:
            delivery_operator == _undefined || delivery_operator == null
                ? _instance.delivery_operator
                : (delivery_operator
                    as List<Query$getCompanyOerators$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Query$getCompanyOerators$delivery_operator> Function(
                  Iterable<
                      CopyWith$Query$getCompanyOerators$delivery_operator<
                          Query$getCompanyOerators$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator
              .map((e) => CopyWith$Query$getCompanyOerators$delivery_operator(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCompanyOerators<TRes>
    implements CopyWith$Query$getCompanyOerators<TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators(this._res);

  TRes _res;

  call({
    List<Query$getCompanyOerators$delivery_operator>? delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
}

const documentNodeQuerygetCompanyOerators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCompanyOerators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'companyId')),
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
                name: NameNode(value: 'delivery_company_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'companyId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'details_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'service_link_id'),
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
                name: NameNode(value: 'delivery_details_id'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'operator_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'owner'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'app_version'),
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
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
Query$getCompanyOerators _parserFn$Query$getCompanyOerators(
        Map<String, dynamic> data) =>
    Query$getCompanyOerators.fromJson(data);

class Options$Query$getCompanyOerators
    extends graphql.QueryOptions<Query$getCompanyOerators> {
  Options$Query$getCompanyOerators({
    String? operationName,
    required Variables$Query$getCompanyOerators variables,
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
          document: documentNodeQuerygetCompanyOerators,
          parserFn: _parserFn$Query$getCompanyOerators,
        );
}

class WatchOptions$Query$getCompanyOerators
    extends graphql.WatchQueryOptions<Query$getCompanyOerators> {
  WatchOptions$Query$getCompanyOerators({
    String? operationName,
    required Variables$Query$getCompanyOerators variables,
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
          document: documentNodeQuerygetCompanyOerators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCompanyOerators,
        );
}

class FetchMoreOptions$Query$getCompanyOerators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCompanyOerators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCompanyOerators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCompanyOerators,
        );
}

extension ClientExtension$Query$getCompanyOerators on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCompanyOerators>>
      query$getCompanyOerators(
              Options$Query$getCompanyOerators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCompanyOerators>
      watchQuery$getCompanyOerators(
              WatchOptions$Query$getCompanyOerators options) =>
          this.watchQuery(options);
  void writeQuery$getCompanyOerators({
    required Query$getCompanyOerators data,
    required Variables$Query$getCompanyOerators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCompanyOerators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCompanyOerators? readQuery$getCompanyOerators({
    required Variables$Query$getCompanyOerators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCompanyOerators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCompanyOerators.fromJson(result);
  }
}

class Query$getCompanyOerators$delivery_operator {
  Query$getCompanyOerators$delivery_operator({
    required this.delivery_company_id,
    required this.delivery_company,
    required this.id,
    required this.operator_details,
    required this.user,
    required this.$__typename,
  });

  factory Query$getCompanyOerators$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_company_id = json['delivery_company_id'];
    final l$delivery_company = json['delivery_company'];
    final l$id = json['id'];
    final l$operator_details = json['operator_details'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators$delivery_operator(
      delivery_company_id: (l$delivery_company_id as int),
      delivery_company:
          Query$getCompanyOerators$delivery_operator$delivery_company.fromJson(
              (l$delivery_company as Map<String, dynamic>)),
      id: (l$id as int),
      operator_details:
          Query$getCompanyOerators$delivery_operator$operator_details.fromJson(
              (l$operator_details as Map<String, dynamic>)),
      user: Query$getCompanyOerators$delivery_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int delivery_company_id;

  final Query$getCompanyOerators$delivery_operator$delivery_company
      delivery_company;

  final int id;

  final Query$getCompanyOerators$delivery_operator$operator_details
      operator_details;

  final Query$getCompanyOerators$delivery_operator$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$operator_details = operator_details;
    _resultData['operator_details'] = l$operator_details.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company_id = delivery_company_id;
    final l$delivery_company = delivery_company;
    final l$id = id;
    final l$operator_details = operator_details;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_company_id,
      l$delivery_company,
      l$id,
      l$operator_details,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCompanyOerators$delivery_operator) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$operator_details = operator_details;
    final lOther$operator_details = other.operator_details;
    if (l$operator_details != lOther$operator_details) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$getCompanyOerators$delivery_operator
    on Query$getCompanyOerators$delivery_operator {
  CopyWith$Query$getCompanyOerators$delivery_operator<
          Query$getCompanyOerators$delivery_operator>
      get copyWith => CopyWith$Query$getCompanyOerators$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCompanyOerators$delivery_operator<TRes> {
  factory CopyWith$Query$getCompanyOerators$delivery_operator(
    Query$getCompanyOerators$delivery_operator instance,
    TRes Function(Query$getCompanyOerators$delivery_operator) then,
  ) = _CopyWithImpl$Query$getCompanyOerators$delivery_operator;

  factory CopyWith$Query$getCompanyOerators$delivery_operator.stub(TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator;

  TRes call({
    int? delivery_company_id,
    Query$getCompanyOerators$delivery_operator$delivery_company?
        delivery_company,
    int? id,
    Query$getCompanyOerators$delivery_operator$operator_details?
        operator_details,
    Query$getCompanyOerators$delivery_operator$user? user,
    String? $__typename,
  });
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<TRes>
      get delivery_company;
  CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<TRes>
      get operator_details;
  CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> get user;
}

class _CopyWithImpl$Query$getCompanyOerators$delivery_operator<TRes>
    implements CopyWith$Query$getCompanyOerators$delivery_operator<TRes> {
  _CopyWithImpl$Query$getCompanyOerators$delivery_operator(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators$delivery_operator _instance;

  final TRes Function(Query$getCompanyOerators$delivery_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company_id = _undefined,
    Object? delivery_company = _undefined,
    Object? id = _undefined,
    Object? operator_details = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators$delivery_operator(
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        delivery_company: delivery_company == _undefined ||
                delivery_company == null
            ? _instance.delivery_company
            : (delivery_company
                as Query$getCompanyOerators$delivery_operator$delivery_company),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getCompanyOerators$delivery_operator$operator_details),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getCompanyOerators$delivery_operator$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<TRes>
      get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company(
        local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<TRes>
      get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getCompanyOerators$delivery_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getCompanyOerators$delivery_operator$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator<TRes>
    implements CopyWith$Query$getCompanyOerators$delivery_operator<TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator(this._res);

  TRes _res;

  call({
    int? delivery_company_id,
    Query$getCompanyOerators$delivery_operator$delivery_company?
        delivery_company,
    int? id,
    Query$getCompanyOerators$delivery_operator$operator_details?
        operator_details,
    Query$getCompanyOerators$delivery_operator$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<TRes>
      get delivery_company =>
          CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company
              .stub(_res);
  CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<TRes>
      get operator_details =>
          CopyWith$Query$getCompanyOerators$delivery_operator$operator_details
              .stub(_res);
  CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> get user =>
      CopyWith$Query$getCompanyOerators$delivery_operator$user.stub(_res);
}

class Query$getCompanyOerators$delivery_operator$delivery_company {
  Query$getCompanyOerators$delivery_operator$delivery_company({
    required this.details_id,
    this.details,
    required this.delivery_details_id,
    required this.$__typename,
  });

  factory Query$getCompanyOerators$delivery_operator$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators$delivery_operator$delivery_company(
      details_id: (l$details_id as int),
      details: l$details == null
          ? null
          : Query$getCompanyOerators$delivery_operator$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getCompanyOerators$delivery_operator$delivery_company$details?
      details;

  final int delivery_details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$details = details;
    final l$delivery_details_id = delivery_details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$details,
      l$delivery_details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCompanyOerators$delivery_operator$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$getCompanyOerators$delivery_operator$delivery_company
    on Query$getCompanyOerators$delivery_operator$delivery_company {
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<
          Query$getCompanyOerators$delivery_operator$delivery_company>
      get copyWith =>
          CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<
    TRes> {
  factory CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company(
    Query$getCompanyOerators$delivery_operator$delivery_company instance,
    TRes Function(Query$getCompanyOerators$delivery_operator$delivery_company)
        then,
  ) = _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company;

  factory CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company;

  TRes call({
    int? details_id,
    Query$getCompanyOerators$delivery_operator$delivery_company$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  });
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<
            TRes> {
  _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators$delivery_operator$delivery_company _instance;

  final TRes Function(
      Query$getCompanyOerators$delivery_operator$delivery_company) _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators$delivery_operator$delivery_company(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getCompanyOerators$delivery_operator$delivery_company$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getCompanyOerators$delivery_operator$delivery_company$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details
              .stub(_res);
}

class Query$getCompanyOerators$delivery_operator$delivery_company$details {
  Query$getCompanyOerators$delivery_operator$delivery_company$details({
    this.service_link_id,
    required this.$__typename,
  });

  factory Query$getCompanyOerators$delivery_operator$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$service_link_id = json['service_link_id'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators$delivery_operator$delivery_company$details(
      service_link_id: (l$service_link_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? service_link_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_link_id = service_link_id;
    _resultData['service_link_id'] = l$service_link_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_link_id = service_link_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_link_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCompanyOerators$delivery_operator$delivery_company$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_link_id = service_link_id;
    final lOther$service_link_id = other.service_link_id;
    if (l$service_link_id != lOther$service_link_id) {
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

extension UtilityExtension$Query$getCompanyOerators$delivery_operator$delivery_company$details
    on Query$getCompanyOerators$delivery_operator$delivery_company$details {
  CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
          Query$getCompanyOerators$delivery_operator$delivery_company$details>
      get copyWith =>
          CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
    TRes> {
  factory CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details(
    Query$getCompanyOerators$delivery_operator$delivery_company$details
        instance,
    TRes Function(
            Query$getCompanyOerators$delivery_operator$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details;

  factory CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details;

  TRes call({
    int? service_link_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators$delivery_operator$delivery_company$details
      _instance;

  final TRes Function(
          Query$getCompanyOerators$delivery_operator$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? service_link_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators$delivery_operator$delivery_company$details(
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$delivery_company$details(
      this._res);

  TRes _res;

  call({
    int? service_link_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCompanyOerators$delivery_operator$operator_details {
  Query$getCompanyOerators$delivery_operator$operator_details({
    required this.owner,
    this.app_version,
    required this.status,
    required this.$__typename,
  });

  factory Query$getCompanyOerators$delivery_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$app_version = json['app_version'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators$delivery_operator$operator_details(
      owner: (l$owner as bool),
      app_version: (l$app_version as String?),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool owner;

  final String? app_version;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$owner = owner;
    final l$app_version = app_version;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$owner,
      l$app_version,
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
            is Query$getCompanyOerators$delivery_operator$operator_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
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

extension UtilityExtension$Query$getCompanyOerators$delivery_operator$operator_details
    on Query$getCompanyOerators$delivery_operator$operator_details {
  CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<
          Query$getCompanyOerators$delivery_operator$operator_details>
      get copyWith =>
          CopyWith$Query$getCompanyOerators$delivery_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<
    TRes> {
  factory CopyWith$Query$getCompanyOerators$delivery_operator$operator_details(
    Query$getCompanyOerators$delivery_operator$operator_details instance,
    TRes Function(Query$getCompanyOerators$delivery_operator$operator_details)
        then,
  ) = _CopyWithImpl$Query$getCompanyOerators$delivery_operator$operator_details;

  factory CopyWith$Query$getCompanyOerators$delivery_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$operator_details;

  TRes call({
    bool? owner,
    String? app_version,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCompanyOerators$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<
            TRes> {
  _CopyWithImpl$Query$getCompanyOerators$delivery_operator$operator_details(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators$delivery_operator$operator_details _instance;

  final TRes Function(
      Query$getCompanyOerators$delivery_operator$operator_details) _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? app_version = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators$delivery_operator$operator_details(
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getCompanyOerators$delivery_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? app_version,
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCompanyOerators$delivery_operator$user {
  Query$getCompanyOerators$delivery_operator$user({
    required this.id,
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getCompanyOerators$delivery_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getCompanyOerators$delivery_operator$user(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String firebase_id;

  final String? image;

  final String language_id;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCompanyOerators$delivery_operator$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getCompanyOerators$delivery_operator$user
    on Query$getCompanyOerators$delivery_operator$user {
  CopyWith$Query$getCompanyOerators$delivery_operator$user<
          Query$getCompanyOerators$delivery_operator$user>
      get copyWith => CopyWith$Query$getCompanyOerators$delivery_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> {
  factory CopyWith$Query$getCompanyOerators$delivery_operator$user(
    Query$getCompanyOerators$delivery_operator$user instance,
    TRes Function(Query$getCompanyOerators$delivery_operator$user) then,
  ) = _CopyWithImpl$Query$getCompanyOerators$delivery_operator$user;

  factory CopyWith$Query$getCompanyOerators$delivery_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$user;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCompanyOerators$delivery_operator$user<TRes>
    implements CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> {
  _CopyWithImpl$Query$getCompanyOerators$delivery_operator$user(
    this._instance,
    this._then,
  );

  final Query$getCompanyOerators$delivery_operator$user _instance;

  final TRes Function(Query$getCompanyOerators$delivery_operator$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCompanyOerators$delivery_operator$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$user<TRes>
    implements CopyWith$Query$getCompanyOerators$delivery_operator$user<TRes> {
  _CopyWithStubImpl$Query$getCompanyOerators$delivery_operator$user(this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
