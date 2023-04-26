import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getBusinessOperatorByUserId {
  factory Variables$Query$getBusinessOperatorByUserId({required int userId}) =>
      Variables$Query$getBusinessOperatorByUserId._({
        r'userId': userId,
      });

  Variables$Query$getBusinessOperatorByUserId._(this._$data);

  factory Variables$Query$getBusinessOperatorByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getBusinessOperatorByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getBusinessOperatorByUserId<
          Variables$Query$getBusinessOperatorByUserId>
      get copyWith => CopyWith$Variables$Query$getBusinessOperatorByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getBusinessOperatorByUserId) ||
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

abstract class CopyWith$Variables$Query$getBusinessOperatorByUserId<TRes> {
  factory CopyWith$Variables$Query$getBusinessOperatorByUserId(
    Variables$Query$getBusinessOperatorByUserId instance,
    TRes Function(Variables$Query$getBusinessOperatorByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getBusinessOperatorByUserId;

  factory CopyWith$Variables$Query$getBusinessOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getBusinessOperatorByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getBusinessOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getBusinessOperatorByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getBusinessOperatorByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getBusinessOperatorByUserId _instance;

  final TRes Function(Variables$Query$getBusinessOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getBusinessOperatorByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getBusinessOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getBusinessOperatorByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getBusinessOperatorByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getBusinessOperatorByUserId {
  Query$getBusinessOperatorByUserId({
    required this.business_operator,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId.fromJson(
      Map<String, dynamic> json) {
    final l$business_operator = json['business_operator'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId(
      business_operator: (l$business_operator as List<dynamic>)
          .map((e) =>
              Query$getBusinessOperatorByUserId$business_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBusinessOperatorByUserId$business_operator>
      business_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_operator = business_operator;
    _resultData['business_operator'] =
        l$business_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_operator = business_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessOperatorByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_operator = business_operator;
    final lOther$business_operator = other.business_operator;
    if (l$business_operator.length != lOther$business_operator.length) {
      return false;
    }
    for (int i = 0; i < l$business_operator.length; i++) {
      final l$business_operator$entry = l$business_operator[i];
      final lOther$business_operator$entry = lOther$business_operator[i];
      if (l$business_operator$entry != lOther$business_operator$entry) {
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

extension UtilityExtension$Query$getBusinessOperatorByUserId
    on Query$getBusinessOperatorByUserId {
  CopyWith$Query$getBusinessOperatorByUserId<Query$getBusinessOperatorByUserId>
      get copyWith => CopyWith$Query$getBusinessOperatorByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId<TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId(
    Query$getBusinessOperatorByUserId instance,
    TRes Function(Query$getBusinessOperatorByUserId) then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId;

  factory CopyWith$Query$getBusinessOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId;

  TRes call({
    List<Query$getBusinessOperatorByUserId$business_operator>?
        business_operator,
    String? $__typename,
  });
  TRes business_operator(
      Iterable<Query$getBusinessOperatorByUserId$business_operator> Function(
              Iterable<
                  CopyWith$Query$getBusinessOperatorByUserId$business_operator<
                      Query$getBusinessOperatorByUserId$business_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId<TRes>
    implements CopyWith$Query$getBusinessOperatorByUserId<TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId _instance;

  final TRes Function(Query$getBusinessOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? business_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperatorByUserId(
        business_operator: business_operator == _undefined ||
                business_operator == null
            ? _instance.business_operator
            : (business_operator
                as List<Query$getBusinessOperatorByUserId$business_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_operator(
          Iterable<Query$getBusinessOperatorByUserId$business_operator> Function(
                  Iterable<
                      CopyWith$Query$getBusinessOperatorByUserId$business_operator<
                          Query$getBusinessOperatorByUserId$business_operator>>)
              _fn) =>
      call(
          business_operator: _fn(_instance.business_operator.map((e) =>
              CopyWith$Query$getBusinessOperatorByUserId$business_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId<TRes>
    implements CopyWith$Query$getBusinessOperatorByUserId<TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId(this._res);

  TRes _res;

  call({
    List<Query$getBusinessOperatorByUserId$business_operator>?
        business_operator,
    String? $__typename,
  }) =>
      _res;
  business_operator(_fn) => _res;
}

const documentNodeQuerygetBusinessOperatorByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getBusinessOperatorByUserId'),
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
        name: NameNode(value: 'business_operator'),
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
                name: NameNode(value: 'online'),
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
            name: NameNode(value: 'business_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'details_id'),
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
Query$getBusinessOperatorByUserId _parserFn$Query$getBusinessOperatorByUserId(
        Map<String, dynamic> data) =>
    Query$getBusinessOperatorByUserId.fromJson(data);

class Options$Query$getBusinessOperatorByUserId
    extends graphql.QueryOptions<Query$getBusinessOperatorByUserId> {
  Options$Query$getBusinessOperatorByUserId({
    String? operationName,
    required Variables$Query$getBusinessOperatorByUserId variables,
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
          document: documentNodeQuerygetBusinessOperatorByUserId,
          parserFn: _parserFn$Query$getBusinessOperatorByUserId,
        );
}

class WatchOptions$Query$getBusinessOperatorByUserId
    extends graphql.WatchQueryOptions<Query$getBusinessOperatorByUserId> {
  WatchOptions$Query$getBusinessOperatorByUserId({
    String? operationName,
    required Variables$Query$getBusinessOperatorByUserId variables,
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
          document: documentNodeQuerygetBusinessOperatorByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getBusinessOperatorByUserId,
        );
}

class FetchMoreOptions$Query$getBusinessOperatorByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getBusinessOperatorByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getBusinessOperatorByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetBusinessOperatorByUserId,
        );
}

extension ClientExtension$Query$getBusinessOperatorByUserId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getBusinessOperatorByUserId>>
      query$getBusinessOperatorByUserId(
              Options$Query$getBusinessOperatorByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getBusinessOperatorByUserId>
      watchQuery$getBusinessOperatorByUserId(
              WatchOptions$Query$getBusinessOperatorByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getBusinessOperatorByUserId({
    required Query$getBusinessOperatorByUserId data,
    required Variables$Query$getBusinessOperatorByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetBusinessOperatorByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getBusinessOperatorByUserId? readQuery$getBusinessOperatorByUserId({
    required Variables$Query$getBusinessOperatorByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetBusinessOperatorByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getBusinessOperatorByUserId.fromJson(result);
  }
}

class Query$getBusinessOperatorByUserId$business_operator {
  Query$getBusinessOperatorByUserId$business_operator({
    required this.id,
    required this.operator_details,
    required this.user_id,
    required this.user,
    required this.business_id,
    required this.details_id,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId$business_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$operator_details = json['operator_details'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$business_id = json['business_id'];
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId$business_operator(
      id: (l$id as int),
      operator_details:
          Query$getBusinessOperatorByUserId$business_operator$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      user_id: (l$user_id as int),
      user: Query$getBusinessOperatorByUserId$business_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      business_id: (l$business_id as int),
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessOperatorByUserId$business_operator$operator_details
      operator_details;

  final int user_id;

  final Query$getBusinessOperatorByUserId$business_operator$user user;

  final int business_id;

  final int details_id;

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
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
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
    final l$business_id = business_id;
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$operator_details,
      l$user_id,
      l$user,
      l$business_id,
      l$details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessOperatorByUserId$business_operator) ||
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
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
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

extension UtilityExtension$Query$getBusinessOperatorByUserId$business_operator
    on Query$getBusinessOperatorByUserId$business_operator {
  CopyWith$Query$getBusinessOperatorByUserId$business_operator<
          Query$getBusinessOperatorByUserId$business_operator>
      get copyWith =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId$business_operator<
    TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator(
    Query$getBusinessOperatorByUserId$business_operator instance,
    TRes Function(Query$getBusinessOperatorByUserId$business_operator) then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator;

  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator;

  TRes call({
    int? id,
    Query$getBusinessOperatorByUserId$business_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getBusinessOperatorByUserId$business_operator$user? user,
    int? business_id,
    int? details_id,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
      TRes> get operator_details;
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<TRes>
      get user;
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator<TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator<TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId$business_operator _instance;

  final TRes Function(Query$getBusinessOperatorByUserId$business_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? operator_details = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? business_id = _undefined,
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperatorByUserId$business_operator(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getBusinessOperatorByUserId$business_operator$operator_details),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getBusinessOperatorByUserId$business_operator$user),
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$getBusinessOperatorByUserId$business_operator$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator<TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessOperatorByUserId$business_operator$operator_details?
        operator_details,
    int? user_id,
    Query$getBusinessOperatorByUserId$business_operator$user? user,
    int? business_id,
    int? details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details
              .stub(_res);
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<TRes>
      get user =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$user
              .stub(_res);
}

class Query$getBusinessOperatorByUserId$business_operator$operator_details {
  Query$getBusinessOperatorByUserId$business_operator$operator_details({
    required this.owner,
    required this.status,
    required this.online,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId$business_operator$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$online = json['online'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId$business_operator$operator_details(
      owner: (l$owner as bool),
      status: (l$status as String),
      online: (l$online as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool owner;

  final String status;

  final bool online;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$online = online;
    _resultData['online'] = l$online;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$owner = owner;
    final l$status = status;
    final l$online = online;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$owner,
      l$status,
      l$online,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBusinessOperatorByUserId$business_operator$operator_details) ||
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
    final l$online = online;
    final lOther$online = other.online;
    if (l$online != lOther$online) {
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

extension UtilityExtension$Query$getBusinessOperatorByUserId$business_operator$operator_details
    on Query$getBusinessOperatorByUserId$business_operator$operator_details {
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
          Query$getBusinessOperatorByUserId$business_operator$operator_details>
      get copyWith =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
    TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details(
    Query$getBusinessOperatorByUserId$business_operator$operator_details
        instance,
    TRes Function(
            Query$getBusinessOperatorByUserId$business_operator$operator_details)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details;

  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details;

  TRes call({
    bool? owner,
    String? status,
    bool? online,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId$business_operator$operator_details
      _instance;

  final TRes Function(
          Query$getBusinessOperatorByUserId$business_operator$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? online = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessOperatorByUserId$business_operator$operator_details(
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        online: online == _undefined || online == null
            ? _instance.online
            : (online as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    bool? online,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessOperatorByUserId$business_operator$user {
  Query$getBusinessOperatorByUserId$business_operator$user({
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId$business_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId$business_operator$user(
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
    if (!(other is Query$getBusinessOperatorByUserId$business_operator$user) ||
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

extension UtilityExtension$Query$getBusinessOperatorByUserId$business_operator$user
    on Query$getBusinessOperatorByUserId$business_operator$user {
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<
          Query$getBusinessOperatorByUserId$business_operator$user>
      get copyWith =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<
    TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$user(
    Query$getBusinessOperatorByUserId$business_operator$user instance,
    TRes Function(Query$getBusinessOperatorByUserId$business_operator$user)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$user;

  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$user;

  TRes call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$user<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$user(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId$business_operator$user _instance;

  final TRes Function(Query$getBusinessOperatorByUserId$business_operator$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperatorByUserId$business_operator$user(
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

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$user<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$user<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$user(
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
