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
    required this.restaurant_operator,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId.fromJson(Map<String, dynamic> json) {
    final l$restaurant_operator = json['restaurant_operator'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId(
      restaurant_operator: (l$restaurant_operator as List<dynamic>)
          .map((e) => Query$getOperatorByUserId$restaurant_operator.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOperatorByUserId$restaurant_operator> restaurant_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operator = restaurant_operator;
    _resultData['restaurant_operator'] =
        l$restaurant_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operator = restaurant_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operator.map((v) => v)),
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
    final l$restaurant_operator = restaurant_operator;
    final lOther$restaurant_operator = other.restaurant_operator;
    if (l$restaurant_operator.length != lOther$restaurant_operator.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operator.length; i++) {
      final l$restaurant_operator$entry = l$restaurant_operator[i];
      final lOther$restaurant_operator$entry = lOther$restaurant_operator[i];
      if (l$restaurant_operator$entry != lOther$restaurant_operator$entry) {
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
    List<Query$getOperatorByUserId$restaurant_operator>? restaurant_operator,
    String? $__typename,
  });
  TRes restaurant_operator(
      Iterable<Query$getOperatorByUserId$restaurant_operator> Function(
              Iterable<
                  CopyWith$Query$getOperatorByUserId$restaurant_operator<
                      Query$getOperatorByUserId$restaurant_operator>>)
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
    Object? restaurant_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId(
        restaurant_operator:
            restaurant_operator == _undefined || restaurant_operator == null
                ? _instance.restaurant_operator
                : (restaurant_operator
                    as List<Query$getOperatorByUserId$restaurant_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operator(
          Iterable<Query$getOperatorByUserId$restaurant_operator> Function(
                  Iterable<
                      CopyWith$Query$getOperatorByUserId$restaurant_operator<
                          Query$getOperatorByUserId$restaurant_operator>>)
              _fn) =>
      call(
          restaurant_operator: _fn(_instance.restaurant_operator.map(
              (e) => CopyWith$Query$getOperatorByUserId$restaurant_operator(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getOperatorByUserId<TRes>
    implements CopyWith$Query$getOperatorByUserId<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId(this._res);

  TRes _res;

  call({
    List<Query$getOperatorByUserId$restaurant_operator>? restaurant_operator,
    String? $__typename,
  }) =>
      _res;
  restaurant_operator(_fn) => _res;
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
        name: NameNode(value: 'restaurant_operator'),
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
            name: NameNode(value: 'restaurant_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
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

class Query$getOperatorByUserId$restaurant_operator {
  Query$getOperatorByUserId$restaurant_operator({
    required this.id,
    required this.operator_details,
    required this.user_id,
    required this.user,
    required this.restaurant_id,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$restaurant_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$operator_details = json['operator_details'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$restaurant_id = json['restaurant_id'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$restaurant_operator(
      id: (l$id as int),
      operator_details:
          Query$getOperatorByUserId$restaurant_operator$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      user_id: (l$user_id as int),
      user: Query$getOperatorByUserId$restaurant_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      restaurant_id: (l$restaurant_id as int),
      restaurant: l$restaurant == null
          ? null
          : Query$getOperatorByUserId$restaurant_operator$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getOperatorByUserId$restaurant_operator$operator_details
      operator_details;

  final int user_id;

  final Query$getOperatorByUserId$restaurant_operator$user user;

  final int restaurant_id;

  final Query$getOperatorByUserId$restaurant_operator$restaurant? restaurant;

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
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
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
    final l$restaurant_id = restaurant_id;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$operator_details,
      l$user_id,
      l$user,
      l$restaurant_id,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorByUserId$restaurant_operator) ||
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
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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

extension UtilityExtension$Query$getOperatorByUserId$restaurant_operator
    on Query$getOperatorByUserId$restaurant_operator {
  CopyWith$Query$getOperatorByUserId$restaurant_operator<
          Query$getOperatorByUserId$restaurant_operator>
      get copyWith => CopyWith$Query$getOperatorByUserId$restaurant_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$restaurant_operator<TRes> {
  factory CopyWith$Query$getOperatorByUserId$restaurant_operator(
    Query$getOperatorByUserId$restaurant_operator instance,
    TRes Function(Query$getOperatorByUserId$restaurant_operator) then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator;

  factory CopyWith$Query$getOperatorByUserId$restaurant_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator;

  TRes call({
    int? id,
    Query$getOperatorByUserId$restaurant_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getOperatorByUserId$restaurant_operator$user? user,
    int? restaurant_id,
    Query$getOperatorByUserId$restaurant_operator$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<TRes>
      get operator_details;
  CopyWith$Query$getOperatorByUserId$restaurant_operator$user<TRes> get user;
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator<TRes>
    implements CopyWith$Query$getOperatorByUserId$restaurant_operator<TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$restaurant_operator _instance;

  final TRes Function(Query$getOperatorByUserId$restaurant_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? operator_details = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? restaurant_id = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$restaurant_operator(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getOperatorByUserId$restaurant_operator$operator_details),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getOperatorByUserId$restaurant_operator$user),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getOperatorByUserId$restaurant_operator$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<TRes>
      get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getOperatorByUserId$restaurant_operator$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getOperatorByUserId$restaurant_operator$user(
        local$user, (e) => call(user: e));
  }

  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator<TRes>
    implements CopyWith$Query$getOperatorByUserId$restaurant_operator<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator(this._res);

  TRes _res;

  call({
    int? id,
    Query$getOperatorByUserId$restaurant_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getOperatorByUserId$restaurant_operator$user? user,
    int? restaurant_id,
    Query$getOperatorByUserId$restaurant_operator$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<TRes>
      get operator_details =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details
              .stub(_res);
  CopyWith$Query$getOperatorByUserId$restaurant_operator$user<TRes> get user =>
      CopyWith$Query$getOperatorByUserId$restaurant_operator$user.stub(_res);
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant
              .stub(_res);
}

class Query$getOperatorByUserId$restaurant_operator$operator_details {
  Query$getOperatorByUserId$restaurant_operator$operator_details({
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$restaurant_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$restaurant_operator$operator_details(
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
            is Query$getOperatorByUserId$restaurant_operator$operator_details) ||
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

extension UtilityExtension$Query$getOperatorByUserId$restaurant_operator$operator_details
    on Query$getOperatorByUserId$restaurant_operator$operator_details {
  CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<
          Query$getOperatorByUserId$restaurant_operator$operator_details>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details(
    Query$getOperatorByUserId$restaurant_operator$operator_details instance,
    TRes Function(
            Query$getOperatorByUserId$restaurant_operator$operator_details)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$operator_details;

  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$operator_details;

  TRes call({
    bool? owner,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$operator_details(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$restaurant_operator$operator_details
      _instance;

  final TRes Function(
      Query$getOperatorByUserId$restaurant_operator$operator_details) _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$restaurant_operator$operator_details(
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

class _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOperatorByUserId$restaurant_operator$user {
  Query$getOperatorByUserId$restaurant_operator$user({
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$restaurant_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$restaurant_operator$user(
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
    if (!(other is Query$getOperatorByUserId$restaurant_operator$user) ||
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

extension UtilityExtension$Query$getOperatorByUserId$restaurant_operator$user
    on Query$getOperatorByUserId$restaurant_operator$user {
  CopyWith$Query$getOperatorByUserId$restaurant_operator$user<
          Query$getOperatorByUserId$restaurant_operator$user>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$restaurant_operator$user<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$user(
    Query$getOperatorByUserId$restaurant_operator$user instance,
    TRes Function(Query$getOperatorByUserId$restaurant_operator$user) then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$user;

  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$user;

  TRes call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$user<TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$user<TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$user(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$restaurant_operator$user _instance;

  final TRes Function(Query$getOperatorByUserId$restaurant_operator$user) _then;

  static const _undefined = {};

  TRes call({
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$restaurant_operator$user(
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

class _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$user<TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$user<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$user(
      this._res);

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

class Query$getOperatorByUserId$restaurant_operator$restaurant {
  Query$getOperatorByUserId$restaurant_operator$restaurant({
    required this.details_id,
    this.details,
    required this.delivery_details_id,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$restaurant_operator$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$restaurant_operator$restaurant(
      details_id: (l$details_id as int),
      details: l$details == null
          ? null
          : Query$getOperatorByUserId$restaurant_operator$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getOperatorByUserId$restaurant_operator$restaurant$details?
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
    if (!(other is Query$getOperatorByUserId$restaurant_operator$restaurant) ||
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

extension UtilityExtension$Query$getOperatorByUserId$restaurant_operator$restaurant
    on Query$getOperatorByUserId$restaurant_operator$restaurant {
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<
          Query$getOperatorByUserId$restaurant_operator$restaurant>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant(
    Query$getOperatorByUserId$restaurant_operator$restaurant instance,
    TRes Function(Query$getOperatorByUserId$restaurant_operator$restaurant)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant;

  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant;

  TRes call({
    int? details_id,
    Query$getOperatorByUserId$restaurant_operator$restaurant$details? details,
    int? delivery_details_id,
    String? $__typename,
  });
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$restaurant_operator$restaurant _instance;

  final TRes Function(Query$getOperatorByUserId$restaurant_operator$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$restaurant_operator$restaurant(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getOperatorByUserId$restaurant_operator$restaurant$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getOperatorByUserId$restaurant_operator$restaurant$details? details,
    int? delivery_details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details
              .stub(_res);
}

class Query$getOperatorByUserId$restaurant_operator$restaurant$details {
  Query$getOperatorByUserId$restaurant_operator$restaurant$details({
    this.service_link_id,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$restaurant_operator$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$service_link_id = json['service_link_id'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$restaurant_operator$restaurant$details(
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
            is Query$getOperatorByUserId$restaurant_operator$restaurant$details) ||
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

extension UtilityExtension$Query$getOperatorByUserId$restaurant_operator$restaurant$details
    on Query$getOperatorByUserId$restaurant_operator$restaurant$details {
  CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
          Query$getOperatorByUserId$restaurant_operator$restaurant$details>
      get copyWith =>
          CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
    TRes> {
  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details(
    Query$getOperatorByUserId$restaurant_operator$restaurant$details instance,
    TRes Function(
            Query$getOperatorByUserId$restaurant_operator$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details;

  factory CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details;

  TRes call({
    int? service_link_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getOperatorByUserId$restaurant_operator$restaurant$details
      _instance;

  final TRes Function(
      Query$getOperatorByUserId$restaurant_operator$restaurant$details) _then;

  static const _undefined = {};

  TRes call({
    Object? service_link_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$restaurant_operator$restaurant$details(
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getOperatorByUserId$restaurant_operator$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$restaurant_operator$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? service_link_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantOperators {
  factory Variables$Query$getRestaurantOperators({required int restaurantId}) =>
      Variables$Query$getRestaurantOperators._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$getRestaurantOperators._(this._$data);

  factory Variables$Query$getRestaurantOperators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$getRestaurantOperators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantOperators<
          Variables$Query$getRestaurantOperators>
      get copyWith => CopyWith$Variables$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    return Object.hashAll([l$restaurantId]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Variables$Query$getRestaurantOperators(
    Variables$Query$getRestaurantOperators instance,
    TRes Function(Variables$Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantOperators;

  factory CopyWith$Variables$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantOperators;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantOperators _instance;

  final TRes Function(Variables$Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$getRestaurantOperators._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$getRestaurantOperators {
  Query$getRestaurantOperators({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantOperators$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantOperators
    on Query$getRestaurantOperators {
  CopyWith$Query$getRestaurantOperators<Query$getRestaurantOperators>
      get copyWith => CopyWith$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Query$getRestaurantOperators(
    Query$getRestaurantOperators instance,
    TRes Function(Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Query$getRestaurantOperators;

  factory CopyWith$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators;

  TRes call({
    Query$getRestaurantOperators$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators _instance;

  final TRes Function(Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({
    Query$getRestaurantOperators$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk
              .stub(_res);
}

const documentNodeQuerygetRestaurantOperators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantOperators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restaurantId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_operators'),
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
                name: NameNode(value: 'restaurant_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'restaurant'),
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
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
Query$getRestaurantOperators _parserFn$Query$getRestaurantOperators(
        Map<String, dynamic> data) =>
    Query$getRestaurantOperators.fromJson(data);

class Options$Query$getRestaurantOperators
    extends graphql.QueryOptions<Query$getRestaurantOperators> {
  Options$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class WatchOptions$Query$getRestaurantOperators
    extends graphql.WatchQueryOptions<Query$getRestaurantOperators> {
  WatchOptions$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class FetchMoreOptions$Query$getRestaurantOperators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantOperators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantOperators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantOperators,
        );
}

extension ClientExtension$Query$getRestaurantOperators
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantOperators>>
      query$getRestaurantOperators(
              Options$Query$getRestaurantOperators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantOperators>
      watchQuery$getRestaurantOperators(
              WatchOptions$Query$getRestaurantOperators options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantOperators({
    required Query$getRestaurantOperators data,
    required Variables$Query$getRestaurantOperators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantOperators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantOperators? readQuery$getRestaurantOperators({
    required Variables$Query$getRestaurantOperators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantOperators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantOperators.fromJson(result);
  }
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk({
    required this.restaurant_operators,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_operators = json['restaurant_operators'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk(
      restaurant_operators: (l$restaurant_operators as List<dynamic>)
          .map((e) =>
              Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>
      restaurant_operators;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operators = restaurant_operators;
    _resultData['restaurant_operators'] =
        l$restaurant_operators.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operators = restaurant_operators;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operators.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators$restaurant_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_operators = restaurant_operators;
    final lOther$restaurant_operators = other.restaurant_operators;
    if (l$restaurant_operators.length != lOther$restaurant_operators.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operators.length; i++) {
      final l$restaurant_operators$entry = l$restaurant_operators[i];
      final lOther$restaurant_operators$entry = lOther$restaurant_operators[i];
      if (l$restaurant_operators$entry != lOther$restaurant_operators$entry) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantOperators$restaurant_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk;

  TRes call({
    List<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  });
  TRes restaurant_operators(
      Iterable<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators> Function(
              Iterable<
                  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
                      Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantOperators$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_operators = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators$restaurant_restaurant_by_pk(
        restaurant_operators: restaurant_operators == _undefined ||
                restaurant_operators == null
            ? _instance.restaurant_operators
            : (restaurant_operators as List<
                Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operators(
          Iterable<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
                          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>>)
              _fn) =>
      call(
          restaurant_operators: _fn(_instance.restaurant_operators.map((e) =>
              CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    List<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  }) =>
      _res;
  restaurant_operators(_fn) => _res;
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators({
    required this.id,
    required this.restaurant_id,
    this.restaurant,
    required this.operator_details,
    required this.user,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_id = json['restaurant_id'];
    final l$restaurant = json['restaurant'];
    final l$operator_details = json['operator_details'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
      id: (l$id as int),
      restaurant_id: (l$restaurant_id as int),
      restaurant: l$restaurant == null
          ? null
          : Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      operator_details:
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      user:
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int restaurant_id;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant?
      restaurant;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
      operator_details;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
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
    final l$id = id;
    final l$restaurant_id = restaurant_id;
    final l$restaurant = restaurant;
    final l$operator_details = operator_details;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_id,
      l$restaurant,
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
    if (!(other
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators;

  TRes call({
    int? id,
    int? restaurant_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant?
        restaurant,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details?
        operator_details,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
      TRes> get restaurant;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
      TRes> get operator_details;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_id = _undefined,
    Object? restaurant = _undefined,
    Object? operator_details = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant?),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
      this._res);

  TRes _res;

  call({
    int? id,
    int? restaurant_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant?
        restaurant,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details?
        operator_details,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
              .stub(_res);
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
              .stub(_res);
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
          TRes>
      get user =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
              .stub(_res);
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant({
    required this.details_id,
    this.details,
    required this.delivery_details_id,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
      details_id: (l$details_id as int),
      details: l$details == null
          ? null
          : Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details?
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
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant) ||
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant;

  TRes call({
    int? details_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details?
        details,
    int? delivery_details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
              .stub(_res);
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details({
    this.service_link_id,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$service_link_id = json['service_link_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
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
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details) ||
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details;

  TRes call({
    int? service_link_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? service_link_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? service_link_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details({
    required this.owner,
    required this.status,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
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
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details) ||
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details;

  TRes call({
    bool? owner,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
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

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user({
    this.phone,
    this.name,
    this.image,
    required this.language_id,
    required this.id,
    required this.firebase_id,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user.fromJson(
      Map<String, dynamic> json) {
    final l$phone = json['phone'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
      phone: (l$phone as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? phone;

  final String? name;

  final String? image;

  final String language_id;

  final int id;

  final String firebase_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$phone = phone;
    final l$name = name;
    final l$image = image;
    final l$language_id = language_id;
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$phone,
      l$name,
      l$image,
      l$language_id,
      l$id,
      l$firebase_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user;

  TRes call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? phone = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
      this._res);

  TRes _res;

  call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$restaurantOperatorStatusStream {
  factory Variables$Subscription$restaurantOperatorStatusStream(
          {required int userId}) =>
      Variables$Subscription$restaurantOperatorStatusStream._({
        r'userId': userId,
      });

  Variables$Subscription$restaurantOperatorStatusStream._(this._$data);

  factory Variables$Subscription$restaurantOperatorStatusStream.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Subscription$restaurantOperatorStatusStream._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Subscription$restaurantOperatorStatusStream<
          Variables$Subscription$restaurantOperatorStatusStream>
      get copyWith =>
          CopyWith$Variables$Subscription$restaurantOperatorStatusStream(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$restaurantOperatorStatusStream) ||
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

abstract class CopyWith$Variables$Subscription$restaurantOperatorStatusStream<
    TRes> {
  factory CopyWith$Variables$Subscription$restaurantOperatorStatusStream(
    Variables$Subscription$restaurantOperatorStatusStream instance,
    TRes Function(Variables$Subscription$restaurantOperatorStatusStream) then,
  ) = _CopyWithImpl$Variables$Subscription$restaurantOperatorStatusStream;

  factory CopyWith$Variables$Subscription$restaurantOperatorStatusStream.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$restaurantOperatorStatusStream;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Subscription$restaurantOperatorStatusStream<TRes>
    implements
        CopyWith$Variables$Subscription$restaurantOperatorStatusStream<TRes> {
  _CopyWithImpl$Variables$Subscription$restaurantOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Variables$Subscription$restaurantOperatorStatusStream _instance;

  final TRes Function(Variables$Subscription$restaurantOperatorStatusStream)
      _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Subscription$restaurantOperatorStatusStream._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$restaurantOperatorStatusStream<
        TRes>
    implements
        CopyWith$Variables$Subscription$restaurantOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Variables$Subscription$restaurantOperatorStatusStream(
      this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Subscription$restaurantOperatorStatusStream {
  Subscription$restaurantOperatorStatusStream({
    required this.restaurant_operator,
    required this.$__typename,
  });

  factory Subscription$restaurantOperatorStatusStream.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_operator = json['restaurant_operator'];
    final l$$__typename = json['__typename'];
    return Subscription$restaurantOperatorStatusStream(
      restaurant_operator: (l$restaurant_operator as List<dynamic>)
          .map((e) =>
              Subscription$restaurantOperatorStatusStream$restaurant_operator
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$restaurantOperatorStatusStream$restaurant_operator>
      restaurant_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operator = restaurant_operator;
    _resultData['restaurant_operator'] =
        l$restaurant_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operator = restaurant_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$restaurantOperatorStatusStream) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_operator = restaurant_operator;
    final lOther$restaurant_operator = other.restaurant_operator;
    if (l$restaurant_operator.length != lOther$restaurant_operator.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operator.length; i++) {
      final l$restaurant_operator$entry = l$restaurant_operator[i];
      final lOther$restaurant_operator$entry = lOther$restaurant_operator[i];
      if (l$restaurant_operator$entry != lOther$restaurant_operator$entry) {
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

extension UtilityExtension$Subscription$restaurantOperatorStatusStream
    on Subscription$restaurantOperatorStatusStream {
  CopyWith$Subscription$restaurantOperatorStatusStream<
          Subscription$restaurantOperatorStatusStream>
      get copyWith => CopyWith$Subscription$restaurantOperatorStatusStream(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$restaurantOperatorStatusStream<TRes> {
  factory CopyWith$Subscription$restaurantOperatorStatusStream(
    Subscription$restaurantOperatorStatusStream instance,
    TRes Function(Subscription$restaurantOperatorStatusStream) then,
  ) = _CopyWithImpl$Subscription$restaurantOperatorStatusStream;

  factory CopyWith$Subscription$restaurantOperatorStatusStream.stub(TRes res) =
      _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream;

  TRes call({
    List<Subscription$restaurantOperatorStatusStream$restaurant_operator>?
        restaurant_operator,
    String? $__typename,
  });
  TRes restaurant_operator(
      Iterable<Subscription$restaurantOperatorStatusStream$restaurant_operator> Function(
              Iterable<
                  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
                      Subscription$restaurantOperatorStatusStream$restaurant_operator>>)
          _fn);
}

class _CopyWithImpl$Subscription$restaurantOperatorStatusStream<TRes>
    implements CopyWith$Subscription$restaurantOperatorStatusStream<TRes> {
  _CopyWithImpl$Subscription$restaurantOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Subscription$restaurantOperatorStatusStream _instance;

  final TRes Function(Subscription$restaurantOperatorStatusStream) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$restaurantOperatorStatusStream(
        restaurant_operator: restaurant_operator == _undefined ||
                restaurant_operator == null
            ? _instance.restaurant_operator
            : (restaurant_operator as List<
                Subscription$restaurantOperatorStatusStream$restaurant_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operator(
          Iterable<Subscription$restaurantOperatorStatusStream$restaurant_operator> Function(
                  Iterable<
                      CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
                          Subscription$restaurantOperatorStatusStream$restaurant_operator>>)
              _fn) =>
      call(
          restaurant_operator: _fn(_instance.restaurant_operator.map((e) =>
              CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream<TRes>
    implements CopyWith$Subscription$restaurantOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream(this._res);

  TRes _res;

  call({
    List<Subscription$restaurantOperatorStatusStream$restaurant_operator>?
        restaurant_operator,
    String? $__typename,
  }) =>
      _res;
  restaurant_operator(_fn) => _res;
}

const documentNodeSubscriptionrestaurantOperatorStatusStream =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'restaurantOperatorStatusStream'),
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
        name: NameNode(value: 'restaurant_operator'),
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
Subscription$restaurantOperatorStatusStream
    _parserFn$Subscription$restaurantOperatorStatusStream(
            Map<String, dynamic> data) =>
        Subscription$restaurantOperatorStatusStream.fromJson(data);

class Options$Subscription$restaurantOperatorStatusStream extends graphql
    .SubscriptionOptions<Subscription$restaurantOperatorStatusStream> {
  Options$Subscription$restaurantOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$restaurantOperatorStatusStream variables,
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
          document: documentNodeSubscriptionrestaurantOperatorStatusStream,
          parserFn: _parserFn$Subscription$restaurantOperatorStatusStream,
        );
}

class WatchOptions$Subscription$restaurantOperatorStatusStream extends graphql
    .WatchQueryOptions<Subscription$restaurantOperatorStatusStream> {
  WatchOptions$Subscription$restaurantOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$restaurantOperatorStatusStream variables,
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
          document: documentNodeSubscriptionrestaurantOperatorStatusStream,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$restaurantOperatorStatusStream,
        );
}

class FetchMoreOptions$Subscription$restaurantOperatorStatusStream
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$restaurantOperatorStatusStream({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$restaurantOperatorStatusStream variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionrestaurantOperatorStatusStream,
        );
}

extension ClientExtension$Subscription$restaurantOperatorStatusStream
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$restaurantOperatorStatusStream>>
      subscribe$restaurantOperatorStatusStream(
              Options$Subscription$restaurantOperatorStatusStream options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$restaurantOperatorStatusStream>
      watchSubscription$restaurantOperatorStatusStream(
              WatchOptions$Subscription$restaurantOperatorStatusStream
                  options) =>
          this.watchQuery(options);
}

class Subscription$restaurantOperatorStatusStream$restaurant_operator {
  Subscription$restaurantOperatorStatusStream$restaurant_operator({
    required this.operator_details,
    required this.$__typename,
  });

  factory Subscription$restaurantOperatorStatusStream$restaurant_operator.fromJson(
      Map<String, dynamic> json) {
    final l$operator_details = json['operator_details'];
    final l$$__typename = json['__typename'];
    return Subscription$restaurantOperatorStatusStream$restaurant_operator(
      operator_details:
          Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
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
    if (!(other
            is Subscription$restaurantOperatorStatusStream$restaurant_operator) ||
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

extension UtilityExtension$Subscription$restaurantOperatorStatusStream$restaurant_operator
    on Subscription$restaurantOperatorStatusStream$restaurant_operator {
  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
          Subscription$restaurantOperatorStatusStream$restaurant_operator>
      get copyWith =>
          CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
    TRes> {
  factory CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator(
    Subscription$restaurantOperatorStatusStream$restaurant_operator instance,
    TRes Function(
            Subscription$restaurantOperatorStatusStream$restaurant_operator)
        then,
  ) = _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator;

  factory CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator;

  TRes call({
    Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details?
        operator_details,
    String? $__typename,
  });
  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
      TRes> get operator_details;
}

class _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
            TRes> {
  _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator(
    this._instance,
    this._then,
  );

  final Subscription$restaurantOperatorStatusStream$restaurant_operator
      _instance;

  final TRes Function(
      Subscription$restaurantOperatorStatusStream$restaurant_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? operator_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$restaurantOperatorStatusStream$restaurant_operator(
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }
}

class _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator<
            TRes> {
  _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator(
      this._res);

  TRes _res;

  call({
    Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details?
        operator_details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
              .stub(_res);
}

class Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details {
  Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details({
    required this.status,
    required this.$__typename,
  });

  factory Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
    on Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details {
  CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
          Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details>
      get copyWith =>
          CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
    TRes> {
  factory CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
    Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
        instance,
    TRes Function(
            Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details)
        then,
  ) = _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details;

  factory CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details;

  TRes call({
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
            TRes> {
  _CopyWithImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
    this._instance,
    this._then,
  );

  final Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details
      _instance;

  final TRes Function(
          Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$restaurant_operator$operator_details(
      this._res);

  TRes _res;

  call({
    String? status,
    String? $__typename,
  }) =>
      _res;
}
