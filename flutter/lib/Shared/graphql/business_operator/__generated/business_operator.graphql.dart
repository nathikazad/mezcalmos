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
            name: NameNode(value: 'business'),
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
                    name: NameNode(value: 'online_ordering'),
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
    required this.business,
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
    final l$business = json['business'];
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
      business:
          Query$getBusinessOperatorByUserId$business_operator$business.fromJson(
              (l$business as Map<String, dynamic>)),
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

  final Query$getBusinessOperatorByUserId$business_operator$business business;

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
    final l$business = business;
    _resultData['business'] = l$business.toJson();
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
    final l$business = business;
    final l$user_id = user_id;
    final l$user = user;
    final l$business_id = business_id;
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$operator_details,
      l$business,
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
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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
    Query$getBusinessOperatorByUserId$business_operator$business? business,
    int? user_id,
    Query$getBusinessOperatorByUserId$business_operator$user? user,
    int? business_id,
    int? details_id,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$operator_details<
      TRes> get operator_details;
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<TRes>
      get business;
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
    Object? business = _undefined,
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
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessOperatorByUserId$business_operator$business),
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

  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessOperatorByUserId$business_operator$business(
        local$business, (e) => call(business: e));
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
    Query$getBusinessOperatorByUserId$business_operator$business? business,
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
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<TRes>
      get business =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$business
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

class Query$getBusinessOperatorByUserId$business_operator$business {
  Query$getBusinessOperatorByUserId$business_operator$business({
    required this.details_id,
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId$business_operator$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId$business_operator$business(
      details_id: (l$details_id as int),
      details:
          Query$getBusinessOperatorByUserId$business_operator$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getBusinessOperatorByUserId$business_operator$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBusinessOperatorByUserId$business_operator$business) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getBusinessOperatorByUserId$business_operator$business
    on Query$getBusinessOperatorByUserId$business_operator$business {
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<
          Query$getBusinessOperatorByUserId$business_operator$business>
      get copyWith =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<
    TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$business(
    Query$getBusinessOperatorByUserId$business_operator$business instance,
    TRes Function(Query$getBusinessOperatorByUserId$business_operator$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business;

  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business;

  TRes call({
    int? details_id,
    Query$getBusinessOperatorByUserId$business_operator$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId$business_operator$business _instance;

  final TRes Function(
      Query$getBusinessOperatorByUserId$business_operator$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperatorByUserId$business_operator$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessOperatorByUserId$business_operator$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getBusinessOperatorByUserId$business_operator$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details
              .stub(_res);
}

class Query$getBusinessOperatorByUserId$business_operator$business$details {
  Query$getBusinessOperatorByUserId$business_operator$business$details({
    required this.online_ordering,
    required this.$__typename,
  });

  factory Query$getBusinessOperatorByUserId$business_operator$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$online_ordering = json['online_ordering'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperatorByUserId$business_operator$business$details(
      online_ordering: (l$online_ordering as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool online_ordering;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$online_ordering = online_ordering;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$online_ordering,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBusinessOperatorByUserId$business_operator$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Query$getBusinessOperatorByUserId$business_operator$business$details
    on Query$getBusinessOperatorByUserId$business_operator$business$details {
  CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
          Query$getBusinessOperatorByUserId$business_operator$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details(
    Query$getBusinessOperatorByUserId$business_operator$business$details
        instance,
    TRes Function(
            Query$getBusinessOperatorByUserId$business_operator$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business$details;

  factory CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business$details;

  TRes call({
    bool? online_ordering,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperatorByUserId$business_operator$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperatorByUserId$business_operator$business$details
      _instance;

  final TRes Function(
          Query$getBusinessOperatorByUserId$business_operator$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? online_ordering = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessOperatorByUserId$business_operator$business$details(
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperatorByUserId$business_operator$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperatorByUserId$business_operator$business$details(
      this._res);

  TRes _res;

  call({
    bool? online_ordering,
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

class Variables$Query$getOperatorBusinessProfile {
  factory Variables$Query$getOperatorBusinessProfile({required int userId}) =>
      Variables$Query$getOperatorBusinessProfile._({
        r'userId': userId,
      });

  Variables$Query$getOperatorBusinessProfile._(this._$data);

  factory Variables$Query$getOperatorBusinessProfile.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getOperatorBusinessProfile._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getOperatorBusinessProfile<
          Variables$Query$getOperatorBusinessProfile>
      get copyWith => CopyWith$Variables$Query$getOperatorBusinessProfile(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOperatorBusinessProfile) ||
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

abstract class CopyWith$Variables$Query$getOperatorBusinessProfile<TRes> {
  factory CopyWith$Variables$Query$getOperatorBusinessProfile(
    Variables$Query$getOperatorBusinessProfile instance,
    TRes Function(Variables$Query$getOperatorBusinessProfile) then,
  ) = _CopyWithImpl$Variables$Query$getOperatorBusinessProfile;

  factory CopyWith$Variables$Query$getOperatorBusinessProfile.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOperatorBusinessProfile;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getOperatorBusinessProfile<TRes>
    implements CopyWith$Variables$Query$getOperatorBusinessProfile<TRes> {
  _CopyWithImpl$Variables$Query$getOperatorBusinessProfile(
    this._instance,
    this._then,
  );

  final Variables$Query$getOperatorBusinessProfile _instance;

  final TRes Function(Variables$Query$getOperatorBusinessProfile) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getOperatorBusinessProfile._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOperatorBusinessProfile<TRes>
    implements CopyWith$Variables$Query$getOperatorBusinessProfile<TRes> {
  _CopyWithStubImpl$Variables$Query$getOperatorBusinessProfile(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getOperatorBusinessProfile {
  Query$getOperatorBusinessProfile({
    required this.business_operator,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessProfile.fromJson(Map<String, dynamic> json) {
    final l$business_operator = json['business_operator'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessProfile(
      business_operator: (l$business_operator as List<dynamic>)
          .map((e) =>
              Query$getOperatorBusinessProfile$business_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOperatorBusinessProfile$business_operator>
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
    if (!(other is Query$getOperatorBusinessProfile) ||
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

extension UtilityExtension$Query$getOperatorBusinessProfile
    on Query$getOperatorBusinessProfile {
  CopyWith$Query$getOperatorBusinessProfile<Query$getOperatorBusinessProfile>
      get copyWith => CopyWith$Query$getOperatorBusinessProfile(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessProfile<TRes> {
  factory CopyWith$Query$getOperatorBusinessProfile(
    Query$getOperatorBusinessProfile instance,
    TRes Function(Query$getOperatorBusinessProfile) then,
  ) = _CopyWithImpl$Query$getOperatorBusinessProfile;

  factory CopyWith$Query$getOperatorBusinessProfile.stub(TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessProfile;

  TRes call({
    List<Query$getOperatorBusinessProfile$business_operator>? business_operator,
    String? $__typename,
  });
  TRes business_operator(
      Iterable<Query$getOperatorBusinessProfile$business_operator> Function(
              Iterable<
                  CopyWith$Query$getOperatorBusinessProfile$business_operator<
                      Query$getOperatorBusinessProfile$business_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getOperatorBusinessProfile<TRes>
    implements CopyWith$Query$getOperatorBusinessProfile<TRes> {
  _CopyWithImpl$Query$getOperatorBusinessProfile(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessProfile _instance;

  final TRes Function(Query$getOperatorBusinessProfile) _then;

  static const _undefined = {};

  TRes call({
    Object? business_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessProfile(
        business_operator: business_operator == _undefined ||
                business_operator == null
            ? _instance.business_operator
            : (business_operator
                as List<Query$getOperatorBusinessProfile$business_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_operator(
          Iterable<Query$getOperatorBusinessProfile$business_operator> Function(
                  Iterable<
                      CopyWith$Query$getOperatorBusinessProfile$business_operator<
                          Query$getOperatorBusinessProfile$business_operator>>)
              _fn) =>
      call(
          business_operator: _fn(_instance.business_operator.map((e) =>
              CopyWith$Query$getOperatorBusinessProfile$business_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOperatorBusinessProfile<TRes>
    implements CopyWith$Query$getOperatorBusinessProfile<TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessProfile(this._res);

  TRes _res;

  call({
    List<Query$getOperatorBusinessProfile$business_operator>? business_operator,
    String? $__typename,
  }) =>
      _res;
  business_operator(_fn) => _res;
}

const documentNodeQuerygetOperatorBusinessProfile = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOperatorBusinessProfile'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'profile'),
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
Query$getOperatorBusinessProfile _parserFn$Query$getOperatorBusinessProfile(
        Map<String, dynamic> data) =>
    Query$getOperatorBusinessProfile.fromJson(data);

class Options$Query$getOperatorBusinessProfile
    extends graphql.QueryOptions<Query$getOperatorBusinessProfile> {
  Options$Query$getOperatorBusinessProfile({
    String? operationName,
    required Variables$Query$getOperatorBusinessProfile variables,
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
          document: documentNodeQuerygetOperatorBusinessProfile,
          parserFn: _parserFn$Query$getOperatorBusinessProfile,
        );
}

class WatchOptions$Query$getOperatorBusinessProfile
    extends graphql.WatchQueryOptions<Query$getOperatorBusinessProfile> {
  WatchOptions$Query$getOperatorBusinessProfile({
    String? operationName,
    required Variables$Query$getOperatorBusinessProfile variables,
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
          document: documentNodeQuerygetOperatorBusinessProfile,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOperatorBusinessProfile,
        );
}

class FetchMoreOptions$Query$getOperatorBusinessProfile
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOperatorBusinessProfile({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOperatorBusinessProfile variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOperatorBusinessProfile,
        );
}

extension ClientExtension$Query$getOperatorBusinessProfile
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOperatorBusinessProfile>>
      query$getOperatorBusinessProfile(
              Options$Query$getOperatorBusinessProfile options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOperatorBusinessProfile>
      watchQuery$getOperatorBusinessProfile(
              WatchOptions$Query$getOperatorBusinessProfile options) =>
          this.watchQuery(options);
  void writeQuery$getOperatorBusinessProfile({
    required Query$getOperatorBusinessProfile data,
    required Variables$Query$getOperatorBusinessProfile variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetOperatorBusinessProfile),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOperatorBusinessProfile? readQuery$getOperatorBusinessProfile({
    required Variables$Query$getOperatorBusinessProfile variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetOperatorBusinessProfile),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getOperatorBusinessProfile.fromJson(result);
  }
}

class Query$getOperatorBusinessProfile$business_operator {
  Query$getOperatorBusinessProfile$business_operator({
    required this.business,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessProfile$business_operator.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessProfile$business_operator(
      business:
          Query$getOperatorBusinessProfile$business_operator$business.fromJson(
              (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOperatorBusinessProfile$business_operator$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorBusinessProfile$business_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getOperatorBusinessProfile$business_operator
    on Query$getOperatorBusinessProfile$business_operator {
  CopyWith$Query$getOperatorBusinessProfile$business_operator<
          Query$getOperatorBusinessProfile$business_operator>
      get copyWith =>
          CopyWith$Query$getOperatorBusinessProfile$business_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessProfile$business_operator<
    TRes> {
  factory CopyWith$Query$getOperatorBusinessProfile$business_operator(
    Query$getOperatorBusinessProfile$business_operator instance,
    TRes Function(Query$getOperatorBusinessProfile$business_operator) then,
  ) = _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator;

  factory CopyWith$Query$getOperatorBusinessProfile$business_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator;

  TRes call({
    Query$getOperatorBusinessProfile$business_operator$business? business,
    String? $__typename,
  });
  CopyWith$Query$getOperatorBusinessProfile$business_operator$business<TRes>
      get business;
}

class _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator<TRes>
    implements
        CopyWith$Query$getOperatorBusinessProfile$business_operator<TRes> {
  _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessProfile$business_operator _instance;

  final TRes Function(Query$getOperatorBusinessProfile$business_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessProfile$business_operator(
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getOperatorBusinessProfile$business_operator$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorBusinessProfile$business_operator$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$getOperatorBusinessProfile$business_operator$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator<TRes>
    implements
        CopyWith$Query$getOperatorBusinessProfile$business_operator<TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator(
      this._res);

  TRes _res;

  call({
    Query$getOperatorBusinessProfile$business_operator$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorBusinessProfile$business_operator$business<TRes>
      get business =>
          CopyWith$Query$getOperatorBusinessProfile$business_operator$business
              .stub(_res);
}

class Query$getOperatorBusinessProfile$business_operator$business {
  Query$getOperatorBusinessProfile$business_operator$business({
    required this.profile,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessProfile$business_operator$business.fromJson(
      Map<String, dynamic> json) {
    final l$profile = json['profile'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessProfile$business_operator$business(
      profile: (l$profile as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String profile;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profile = profile;
    _resultData['profile'] = l$profile;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profile = profile;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$profile,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOperatorBusinessProfile$business_operator$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
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

extension UtilityExtension$Query$getOperatorBusinessProfile$business_operator$business
    on Query$getOperatorBusinessProfile$business_operator$business {
  CopyWith$Query$getOperatorBusinessProfile$business_operator$business<
          Query$getOperatorBusinessProfile$business_operator$business>
      get copyWith =>
          CopyWith$Query$getOperatorBusinessProfile$business_operator$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessProfile$business_operator$business<
    TRes> {
  factory CopyWith$Query$getOperatorBusinessProfile$business_operator$business(
    Query$getOperatorBusinessProfile$business_operator$business instance,
    TRes Function(Query$getOperatorBusinessProfile$business_operator$business)
        then,
  ) = _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator$business;

  factory CopyWith$Query$getOperatorBusinessProfile$business_operator$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator$business;

  TRes call({
    String? profile,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessProfile$business_operator$business<
            TRes> {
  _CopyWithImpl$Query$getOperatorBusinessProfile$business_operator$business(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessProfile$business_operator$business _instance;

  final TRes Function(
      Query$getOperatorBusinessProfile$business_operator$business) _then;

  static const _undefined = {};

  TRes call({
    Object? profile = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessProfile$business_operator$business(
        profile: profile == _undefined || profile == null
            ? _instance.profile
            : (profile as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessProfile$business_operator$business<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessProfile$business_operator$business(
      this._res);

  TRes _res;

  call({
    String? profile,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOperatorBusinessOnlineOrdering {
  factory Variables$Query$getOperatorBusinessOnlineOrdering(
          {required int userId}) =>
      Variables$Query$getOperatorBusinessOnlineOrdering._({
        r'userId': userId,
      });

  Variables$Query$getOperatorBusinessOnlineOrdering._(this._$data);

  factory Variables$Query$getOperatorBusinessOnlineOrdering.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getOperatorBusinessOnlineOrdering._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering<
          Variables$Query$getOperatorBusinessOnlineOrdering>
      get copyWith =>
          CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOperatorBusinessOnlineOrdering) ||
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

abstract class CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering<
    TRes> {
  factory CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering(
    Variables$Query$getOperatorBusinessOnlineOrdering instance,
    TRes Function(Variables$Query$getOperatorBusinessOnlineOrdering) then,
  ) = _CopyWithImpl$Variables$Query$getOperatorBusinessOnlineOrdering;

  factory CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getOperatorBusinessOnlineOrdering;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getOperatorBusinessOnlineOrdering<TRes>
    implements
        CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering<TRes> {
  _CopyWithImpl$Variables$Query$getOperatorBusinessOnlineOrdering(
    this._instance,
    this._then,
  );

  final Variables$Query$getOperatorBusinessOnlineOrdering _instance;

  final TRes Function(Variables$Query$getOperatorBusinessOnlineOrdering) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getOperatorBusinessOnlineOrdering._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOperatorBusinessOnlineOrdering<TRes>
    implements
        CopyWith$Variables$Query$getOperatorBusinessOnlineOrdering<TRes> {
  _CopyWithStubImpl$Variables$Query$getOperatorBusinessOnlineOrdering(
      this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getOperatorBusinessOnlineOrdering {
  Query$getOperatorBusinessOnlineOrdering({
    required this.business_operator,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessOnlineOrdering.fromJson(
      Map<String, dynamic> json) {
    final l$business_operator = json['business_operator'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessOnlineOrdering(
      business_operator: (l$business_operator as List<dynamic>)
          .map((e) => Query$getOperatorBusinessOnlineOrdering$business_operator
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOperatorBusinessOnlineOrdering$business_operator>
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
    if (!(other is Query$getOperatorBusinessOnlineOrdering) ||
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

extension UtilityExtension$Query$getOperatorBusinessOnlineOrdering
    on Query$getOperatorBusinessOnlineOrdering {
  CopyWith$Query$getOperatorBusinessOnlineOrdering<
          Query$getOperatorBusinessOnlineOrdering>
      get copyWith => CopyWith$Query$getOperatorBusinessOnlineOrdering(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessOnlineOrdering<TRes> {
  factory CopyWith$Query$getOperatorBusinessOnlineOrdering(
    Query$getOperatorBusinessOnlineOrdering instance,
    TRes Function(Query$getOperatorBusinessOnlineOrdering) then,
  ) = _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering;

  factory CopyWith$Query$getOperatorBusinessOnlineOrdering.stub(TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering;

  TRes call({
    List<Query$getOperatorBusinessOnlineOrdering$business_operator>?
        business_operator,
    String? $__typename,
  });
  TRes business_operator(
      Iterable<Query$getOperatorBusinessOnlineOrdering$business_operator> Function(
              Iterable<
                  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
                      Query$getOperatorBusinessOnlineOrdering$business_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering<TRes>
    implements CopyWith$Query$getOperatorBusinessOnlineOrdering<TRes> {
  _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessOnlineOrdering _instance;

  final TRes Function(Query$getOperatorBusinessOnlineOrdering) _then;

  static const _undefined = {};

  TRes call({
    Object? business_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessOnlineOrdering(
        business_operator:
            business_operator == _undefined || business_operator == null
                ? _instance.business_operator
                : (business_operator as List<
                    Query$getOperatorBusinessOnlineOrdering$business_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_operator(
          Iterable<Query$getOperatorBusinessOnlineOrdering$business_operator> Function(
                  Iterable<
                      CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
                          Query$getOperatorBusinessOnlineOrdering$business_operator>>)
              _fn) =>
      call(
          business_operator: _fn(_instance.business_operator.map((e) =>
              CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering<TRes>
    implements CopyWith$Query$getOperatorBusinessOnlineOrdering<TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering(this._res);

  TRes _res;

  call({
    List<Query$getOperatorBusinessOnlineOrdering$business_operator>?
        business_operator,
    String? $__typename,
  }) =>
      _res;
  business_operator(_fn) => _res;
}

const documentNodeQuerygetOperatorBusinessOnlineOrdering =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOperatorBusinessOnlineOrdering'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'online_ordering'),
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
Query$getOperatorBusinessOnlineOrdering
    _parserFn$Query$getOperatorBusinessOnlineOrdering(
            Map<String, dynamic> data) =>
        Query$getOperatorBusinessOnlineOrdering.fromJson(data);

class Options$Query$getOperatorBusinessOnlineOrdering
    extends graphql.QueryOptions<Query$getOperatorBusinessOnlineOrdering> {
  Options$Query$getOperatorBusinessOnlineOrdering({
    String? operationName,
    required Variables$Query$getOperatorBusinessOnlineOrdering variables,
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
          document: documentNodeQuerygetOperatorBusinessOnlineOrdering,
          parserFn: _parserFn$Query$getOperatorBusinessOnlineOrdering,
        );
}

class WatchOptions$Query$getOperatorBusinessOnlineOrdering
    extends graphql.WatchQueryOptions<Query$getOperatorBusinessOnlineOrdering> {
  WatchOptions$Query$getOperatorBusinessOnlineOrdering({
    String? operationName,
    required Variables$Query$getOperatorBusinessOnlineOrdering variables,
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
          document: documentNodeQuerygetOperatorBusinessOnlineOrdering,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOperatorBusinessOnlineOrdering,
        );
}

class FetchMoreOptions$Query$getOperatorBusinessOnlineOrdering
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOperatorBusinessOnlineOrdering({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOperatorBusinessOnlineOrdering variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOperatorBusinessOnlineOrdering,
        );
}

extension ClientExtension$Query$getOperatorBusinessOnlineOrdering
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOperatorBusinessOnlineOrdering>>
      query$getOperatorBusinessOnlineOrdering(
              Options$Query$getOperatorBusinessOnlineOrdering options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getOperatorBusinessOnlineOrdering>
      watchQuery$getOperatorBusinessOnlineOrdering(
              WatchOptions$Query$getOperatorBusinessOnlineOrdering options) =>
          this.watchQuery(options);
  void writeQuery$getOperatorBusinessOnlineOrdering({
    required Query$getOperatorBusinessOnlineOrdering data,
    required Variables$Query$getOperatorBusinessOnlineOrdering variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetOperatorBusinessOnlineOrdering),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOperatorBusinessOnlineOrdering?
      readQuery$getOperatorBusinessOnlineOrdering({
    required Variables$Query$getOperatorBusinessOnlineOrdering variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetOperatorBusinessOnlineOrdering),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getOperatorBusinessOnlineOrdering.fromJson(result);
  }
}

class Query$getOperatorBusinessOnlineOrdering$business_operator {
  Query$getOperatorBusinessOnlineOrdering$business_operator({
    required this.business,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessOnlineOrdering$business_operator.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessOnlineOrdering$business_operator(
      business:
          Query$getOperatorBusinessOnlineOrdering$business_operator$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOperatorBusinessOnlineOrdering$business_operator$business
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOperatorBusinessOnlineOrdering$business_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getOperatorBusinessOnlineOrdering$business_operator
    on Query$getOperatorBusinessOnlineOrdering$business_operator {
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
          Query$getOperatorBusinessOnlineOrdering$business_operator>
      get copyWith =>
          CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
    TRes> {
  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator(
    Query$getOperatorBusinessOnlineOrdering$business_operator instance,
    TRes Function(Query$getOperatorBusinessOnlineOrdering$business_operator)
        then,
  ) = _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator;

  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator;

  TRes call({
    Query$getOperatorBusinessOnlineOrdering$business_operator$business?
        business,
    String? $__typename,
  });
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
      TRes> get business;
}

class _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
            TRes> {
  _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessOnlineOrdering$business_operator _instance;

  final TRes Function(Query$getOperatorBusinessOnlineOrdering$business_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessOnlineOrdering$business_operator(
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getOperatorBusinessOnlineOrdering$business_operator$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator(
      this._res);

  TRes _res;

  call({
    Query$getOperatorBusinessOnlineOrdering$business_operator$business?
        business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
          TRes>
      get business =>
          CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business
              .stub(_res);
}

class Query$getOperatorBusinessOnlineOrdering$business_operator$business {
  Query$getOperatorBusinessOnlineOrdering$business_operator$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessOnlineOrdering$business_operator$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessOnlineOrdering$business_operator$business(
      details:
          Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOperatorBusinessOnlineOrdering$business_operator$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$getOperatorBusinessOnlineOrdering$business_operator$business
    on Query$getOperatorBusinessOnlineOrdering$business_operator$business {
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
          Query$getOperatorBusinessOnlineOrdering$business_operator$business>
      get copyWith =>
          CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
    TRes> {
  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business(
    Query$getOperatorBusinessOnlineOrdering$business_operator$business instance,
    TRes Function(
            Query$getOperatorBusinessOnlineOrdering$business_operator$business)
        then,
  ) = _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business;

  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business;

  TRes call({
    Query$getOperatorBusinessOnlineOrdering$business_operator$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
            TRes> {
  _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessOnlineOrdering$business_operator$business
      _instance;

  final TRes Function(
      Query$getOperatorBusinessOnlineOrdering$business_operator$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorBusinessOnlineOrdering$business_operator$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getOperatorBusinessOnlineOrdering$business_operator$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business(
      this._res);

  TRes _res;

  call({
    Query$getOperatorBusinessOnlineOrdering$business_operator$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
          TRes>
      get details =>
          CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
              .stub(_res);
}

class Query$getOperatorBusinessOnlineOrdering$business_operator$business$details {
  Query$getOperatorBusinessOnlineOrdering$business_operator$business$details({
    required this.online_ordering,
    required this.$__typename,
  });

  factory Query$getOperatorBusinessOnlineOrdering$business_operator$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$online_ordering = json['online_ordering'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
      online_ordering: (l$online_ordering as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool online_ordering;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$online_ordering = online_ordering;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$online_ordering,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOperatorBusinessOnlineOrdering$business_operator$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
    on Query$getOperatorBusinessOnlineOrdering$business_operator$business$details {
  CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
          Query$getOperatorBusinessOnlineOrdering$business_operator$business$details>
      get copyWith =>
          CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
    TRes> {
  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
    Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
        instance,
    TRes Function(
            Query$getOperatorBusinessOnlineOrdering$business_operator$business$details)
        then,
  ) = _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details;

  factory CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details;

  TRes call({
    bool? online_ordering,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
            TRes> {
  _CopyWithImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
    this._instance,
    this._then,
  );

  final Query$getOperatorBusinessOnlineOrdering$business_operator$business$details
      _instance;

  final TRes Function(
          Query$getOperatorBusinessOnlineOrdering$business_operator$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? online_ordering = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
        TRes>
    implements
        CopyWith$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getOperatorBusinessOnlineOrdering$business_operator$business$details(
      this._res);

  TRes _res;

  call({
    bool? online_ordering,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getBusinessOperators {
  factory Variables$Query$getBusinessOperators({required int businessId}) =>
      Variables$Query$getBusinessOperators._({
        r'businessId': businessId,
      });

  Variables$Query$getBusinessOperators._(this._$data);

  factory Variables$Query$getBusinessOperators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$businessId = data['businessId'];
    result$data['businessId'] = (l$businessId as int);
    return Variables$Query$getBusinessOperators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get businessId => (_$data['businessId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$businessId = businessId;
    result$data['businessId'] = l$businessId;
    return result$data;
  }

  CopyWith$Variables$Query$getBusinessOperators<
          Variables$Query$getBusinessOperators>
      get copyWith => CopyWith$Variables$Query$getBusinessOperators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getBusinessOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$businessId = businessId;
    final lOther$businessId = other.businessId;
    if (l$businessId != lOther$businessId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$businessId = businessId;
    return Object.hashAll([l$businessId]);
  }
}

abstract class CopyWith$Variables$Query$getBusinessOperators<TRes> {
  factory CopyWith$Variables$Query$getBusinessOperators(
    Variables$Query$getBusinessOperators instance,
    TRes Function(Variables$Query$getBusinessOperators) then,
  ) = _CopyWithImpl$Variables$Query$getBusinessOperators;

  factory CopyWith$Variables$Query$getBusinessOperators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getBusinessOperators;

  TRes call({int? businessId});
}

class _CopyWithImpl$Variables$Query$getBusinessOperators<TRes>
    implements CopyWith$Variables$Query$getBusinessOperators<TRes> {
  _CopyWithImpl$Variables$Query$getBusinessOperators(
    this._instance,
    this._then,
  );

  final Variables$Query$getBusinessOperators _instance;

  final TRes Function(Variables$Query$getBusinessOperators) _then;

  static const _undefined = {};

  TRes call({Object? businessId = _undefined}) =>
      _then(Variables$Query$getBusinessOperators._({
        ..._instance._$data,
        if (businessId != _undefined && businessId != null)
          'businessId': (businessId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getBusinessOperators<TRes>
    implements CopyWith$Variables$Query$getBusinessOperators<TRes> {
  _CopyWithStubImpl$Variables$Query$getBusinessOperators(this._res);

  TRes _res;

  call({int? businessId}) => _res;
}

class Query$getBusinessOperators {
  Query$getBusinessOperators({
    this.business_business_by_pk,
    required this.$__typename,
  });

  factory Query$getBusinessOperators.fromJson(Map<String, dynamic> json) {
    final l$business_business_by_pk = json['business_business_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators(
      business_business_by_pk: l$business_business_by_pk == null
          ? null
          : Query$getBusinessOperators$business_business_by_pk.fromJson(
              (l$business_business_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBusinessOperators$business_business_by_pk?
      business_business_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_business_by_pk = business_business_by_pk;
    _resultData['business_business_by_pk'] =
        l$business_business_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_business_by_pk = business_business_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_business_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_business_by_pk = business_business_by_pk;
    final lOther$business_business_by_pk = other.business_business_by_pk;
    if (l$business_business_by_pk != lOther$business_business_by_pk) {
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

extension UtilityExtension$Query$getBusinessOperators
    on Query$getBusinessOperators {
  CopyWith$Query$getBusinessOperators<Query$getBusinessOperators>
      get copyWith => CopyWith$Query$getBusinessOperators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators<TRes> {
  factory CopyWith$Query$getBusinessOperators(
    Query$getBusinessOperators instance,
    TRes Function(Query$getBusinessOperators) then,
  ) = _CopyWithImpl$Query$getBusinessOperators;

  factory CopyWith$Query$getBusinessOperators.stub(TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators;

  TRes call({
    Query$getBusinessOperators$business_business_by_pk? business_business_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperators$business_business_by_pk<TRes>
      get business_business_by_pk;
}

class _CopyWithImpl$Query$getBusinessOperators<TRes>
    implements CopyWith$Query$getBusinessOperators<TRes> {
  _CopyWithImpl$Query$getBusinessOperators(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators _instance;

  final TRes Function(Query$getBusinessOperators) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperators(
        business_business_by_pk: business_business_by_pk == _undefined
            ? _instance.business_business_by_pk
            : (business_business_by_pk
                as Query$getBusinessOperators$business_business_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessOperators$business_business_by_pk<TRes>
      get business_business_by_pk {
    final local$business_business_by_pk = _instance.business_business_by_pk;
    return local$business_business_by_pk == null
        ? CopyWith$Query$getBusinessOperators$business_business_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getBusinessOperators$business_business_by_pk(
            local$business_business_by_pk,
            (e) => call(business_business_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessOperators<TRes>
    implements CopyWith$Query$getBusinessOperators<TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators(this._res);

  TRes _res;

  call({
    Query$getBusinessOperators$business_business_by_pk? business_business_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessOperators$business_business_by_pk<TRes>
      get business_business_by_pk =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk.stub(
              _res);
}

const documentNodeQuerygetBusinessOperators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getBusinessOperators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'businessId')),
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
        name: NameNode(value: 'business_business_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'businessId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'operators'),
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
                name: NameNode(value: 'business'),
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
                        name: NameNode(value: 'online_ordering'),
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
Query$getBusinessOperators _parserFn$Query$getBusinessOperators(
        Map<String, dynamic> data) =>
    Query$getBusinessOperators.fromJson(data);

class Options$Query$getBusinessOperators
    extends graphql.QueryOptions<Query$getBusinessOperators> {
  Options$Query$getBusinessOperators({
    String? operationName,
    required Variables$Query$getBusinessOperators variables,
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
          document: documentNodeQuerygetBusinessOperators,
          parserFn: _parserFn$Query$getBusinessOperators,
        );
}

class WatchOptions$Query$getBusinessOperators
    extends graphql.WatchQueryOptions<Query$getBusinessOperators> {
  WatchOptions$Query$getBusinessOperators({
    String? operationName,
    required Variables$Query$getBusinessOperators variables,
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
          document: documentNodeQuerygetBusinessOperators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getBusinessOperators,
        );
}

class FetchMoreOptions$Query$getBusinessOperators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getBusinessOperators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getBusinessOperators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetBusinessOperators,
        );
}

extension ClientExtension$Query$getBusinessOperators on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getBusinessOperators>>
      query$getBusinessOperators(
              Options$Query$getBusinessOperators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getBusinessOperators>
      watchQuery$getBusinessOperators(
              WatchOptions$Query$getBusinessOperators options) =>
          this.watchQuery(options);
  void writeQuery$getBusinessOperators({
    required Query$getBusinessOperators data,
    required Variables$Query$getBusinessOperators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetBusinessOperators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getBusinessOperators? readQuery$getBusinessOperators({
    required Variables$Query$getBusinessOperators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetBusinessOperators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getBusinessOperators.fromJson(result);
  }
}

class Query$getBusinessOperators$business_business_by_pk {
  Query$getBusinessOperators$business_business_by_pk({
    required this.operators,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$operators = json['operators'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk(
      operators: (l$operators as List<dynamic>)
          .map((e) =>
              Query$getBusinessOperators$business_business_by_pk$operators
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBusinessOperators$business_business_by_pk$operators>
      operators;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$operators = operators;
    _resultData['operators'] = l$operators.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$operators = operators;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$operators.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBusinessOperators$business_business_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$operators = operators;
    final lOther$operators = other.operators;
    if (l$operators.length != lOther$operators.length) {
      return false;
    }
    for (int i = 0; i < l$operators.length; i++) {
      final l$operators$entry = l$operators[i];
      final lOther$operators$entry = lOther$operators[i];
      if (l$operators$entry != lOther$operators$entry) {
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

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk
    on Query$getBusinessOperators$business_business_by_pk {
  CopyWith$Query$getBusinessOperators$business_business_by_pk<
          Query$getBusinessOperators$business_business_by_pk>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk(
    Query$getBusinessOperators$business_business_by_pk instance,
    TRes Function(Query$getBusinessOperators$business_business_by_pk) then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk;

  TRes call({
    List<Query$getBusinessOperators$business_business_by_pk$operators>?
        operators,
    String? $__typename,
  });
  TRes operators(
      Iterable<Query$getBusinessOperators$business_business_by_pk$operators> Function(
              Iterable<
                  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
                      Query$getBusinessOperators$business_business_by_pk$operators>>)
          _fn);
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk<TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk<TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk _instance;

  final TRes Function(Query$getBusinessOperators$business_business_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? operators = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperators$business_business_by_pk(
        operators: operators == _undefined || operators == null
            ? _instance.operators
            : (operators as List<
                Query$getBusinessOperators$business_business_by_pk$operators>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes operators(
          Iterable<Query$getBusinessOperators$business_business_by_pk$operators> Function(
                  Iterable<
                      CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
                          Query$getBusinessOperators$business_business_by_pk$operators>>)
              _fn) =>
      call(
          operators: _fn(_instance.operators.map((e) =>
              CopyWith$Query$getBusinessOperators$business_business_by_pk$operators(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk<TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk<TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk(
      this._res);

  TRes _res;

  call({
    List<Query$getBusinessOperators$business_business_by_pk$operators>?
        operators,
    String? $__typename,
  }) =>
      _res;
  operators(_fn) => _res;
}

class Query$getBusinessOperators$business_business_by_pk$operators {
  Query$getBusinessOperators$business_business_by_pk$operators({
    required this.id,
    required this.operator_details,
    required this.business,
    required this.user_id,
    required this.user,
    required this.business_id,
    required this.details_id,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk$operators.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$operator_details = json['operator_details'];
    final l$business = json['business'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$business_id = json['business_id'];
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk$operators(
      id: (l$id as int),
      operator_details:
          Query$getBusinessOperators$business_business_by_pk$operators$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      business:
          Query$getBusinessOperators$business_business_by_pk$operators$business
              .fromJson((l$business as Map<String, dynamic>)),
      user_id: (l$user_id as int),
      user: Query$getBusinessOperators$business_business_by_pk$operators$user
          .fromJson((l$user as Map<String, dynamic>)),
      business_id: (l$business_id as int),
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getBusinessOperators$business_business_by_pk$operators$operator_details
      operator_details;

  final Query$getBusinessOperators$business_business_by_pk$operators$business
      business;

  final int user_id;

  final Query$getBusinessOperators$business_business_by_pk$operators$user user;

  final int business_id;

  final int details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$operator_details = operator_details;
    _resultData['operator_details'] = l$operator_details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
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
    final l$business = business;
    final l$user_id = user_id;
    final l$user = user;
    final l$business_id = business_id;
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$operator_details,
      l$business,
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
    if (!(other
            is Query$getBusinessOperators$business_business_by_pk$operators) ||
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
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk$operators
    on Query$getBusinessOperators$business_business_by_pk$operators {
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
          Query$getBusinessOperators$business_business_by_pk$operators>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators(
    Query$getBusinessOperators$business_business_by_pk$operators instance,
    TRes Function(Query$getBusinessOperators$business_business_by_pk$operators)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators;

  TRes call({
    int? id,
    Query$getBusinessOperators$business_business_by_pk$operators$operator_details?
        operator_details,
    Query$getBusinessOperators$business_business_by_pk$operators$business?
        business,
    int? user_id,
    Query$getBusinessOperators$business_business_by_pk$operators$user? user,
    int? business_id,
    int? details_id,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
      TRes> get operator_details;
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
      TRes> get business;
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk$operators _instance;

  final TRes Function(
      Query$getBusinessOperators$business_business_by_pk$operators) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? operator_details = _undefined,
    Object? business = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? business_id = _undefined,
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperators$business_business_by_pk$operators(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getBusinessOperators$business_business_by_pk$operators$operator_details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getBusinessOperators$business_business_by_pk$operators$business),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getBusinessOperators$business_business_by_pk$operators$user),
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
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getBusinessOperators$business_business_by_pk$operators$operator_details?
        operator_details,
    Query$getBusinessOperators$business_business_by_pk$operators$business?
        business,
    int? user_id,
    Query$getBusinessOperators$business_business_by_pk$operators$user? user,
    int? business_id,
    int? details_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details
              .stub(_res);
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
          TRes>
      get business =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business
              .stub(_res);
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
          TRes>
      get user =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user
              .stub(_res);
}

class Query$getBusinessOperators$business_business_by_pk$operators$operator_details {
  Query$getBusinessOperators$business_business_by_pk$operators$operator_details({
    required this.owner,
    required this.status,
    required this.online,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk$operators$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$online = json['online'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
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
            is Query$getBusinessOperators$business_business_by_pk$operators$operator_details) ||
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

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk$operators$operator_details
    on Query$getBusinessOperators$business_business_by_pk$operators$operator_details {
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
          Query$getBusinessOperators$business_business_by_pk$operators$operator_details>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
    Query$getBusinessOperators$business_business_by_pk$operators$operator_details
        instance,
    TRes Function(
            Query$getBusinessOperators$business_business_by_pk$operators$operator_details)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details;

  TRes call({
    bool? owner,
    String? status,
    bool? online,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk$operators$operator_details
      _instance;

  final TRes Function(
          Query$getBusinessOperators$business_business_by_pk$operators$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? online = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
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

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$operator_details(
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

class Query$getBusinessOperators$business_business_by_pk$operators$business {
  Query$getBusinessOperators$business_business_by_pk$operators$business({
    required this.details_id,
    required this.details,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk$operators$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk$operators$business(
      details_id: (l$details_id as int),
      details:
          Query$getBusinessOperators$business_business_by_pk$operators$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final Query$getBusinessOperators$business_business_by_pk$operators$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBusinessOperators$business_business_by_pk$operators$business) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk$operators$business
    on Query$getBusinessOperators$business_business_by_pk$operators$business {
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
          Query$getBusinessOperators$business_business_by_pk$operators$business>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business(
    Query$getBusinessOperators$business_business_by_pk$operators$business
        instance,
    TRes Function(
            Query$getBusinessOperators$business_business_by_pk$operators$business)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business;

  TRes call({
    int? details_id,
    Query$getBusinessOperators$business_business_by_pk$operators$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk$operators$business
      _instance;

  final TRes Function(
          Query$getBusinessOperators$business_business_by_pk$operators$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessOperators$business_business_by_pk$operators$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBusinessOperators$business_business_by_pk$operators$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    Query$getBusinessOperators$business_business_by_pk$operators$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
          TRes>
      get details =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details
              .stub(_res);
}

class Query$getBusinessOperators$business_business_by_pk$operators$business$details {
  Query$getBusinessOperators$business_business_by_pk$operators$business$details({
    this.service_link_id,
    required this.online_ordering,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk$operators$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$service_link_id = json['service_link_id'];
    final l$online_ordering = json['online_ordering'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk$operators$business$details(
      service_link_id: (l$service_link_id as int?),
      online_ordering: (l$online_ordering as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? service_link_id;

  final bool online_ordering;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_link_id = service_link_id;
    _resultData['service_link_id'] = l$service_link_id;
    final l$online_ordering = online_ordering;
    _resultData['online_ordering'] = l$online_ordering;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_link_id = service_link_id;
    final l$online_ordering = online_ordering;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_link_id,
      l$online_ordering,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBusinessOperators$business_business_by_pk$operators$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_link_id = service_link_id;
    final lOther$service_link_id = other.service_link_id;
    if (l$service_link_id != lOther$service_link_id) {
      return false;
    }
    final l$online_ordering = online_ordering;
    final lOther$online_ordering = other.online_ordering;
    if (l$online_ordering != lOther$online_ordering) {
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

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk$operators$business$details
    on Query$getBusinessOperators$business_business_by_pk$operators$business$details {
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
          Query$getBusinessOperators$business_business_by_pk$operators$business$details>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details(
    Query$getBusinessOperators$business_business_by_pk$operators$business$details
        instance,
    TRes Function(
            Query$getBusinessOperators$business_business_by_pk$operators$business$details)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details;

  TRes call({
    int? service_link_id,
    bool? online_ordering,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk$operators$business$details
      _instance;

  final TRes Function(
          Query$getBusinessOperators$business_business_by_pk$operators$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? service_link_id = _undefined,
    Object? online_ordering = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBusinessOperators$business_business_by_pk$operators$business$details(
        service_link_id: service_link_id == _undefined
            ? _instance.service_link_id
            : (service_link_id as int?),
        online_ordering:
            online_ordering == _undefined || online_ordering == null
                ? _instance.online_ordering
                : (online_ordering as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$business$details<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$business$details(
      this._res);

  TRes _res;

  call({
    int? service_link_id,
    bool? online_ordering,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBusinessOperators$business_business_by_pk$operators$user {
  Query$getBusinessOperators$business_business_by_pk$operators$user({
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getBusinessOperators$business_business_by_pk$operators$user.fromJson(
      Map<String, dynamic> json) {
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getBusinessOperators$business_business_by_pk$operators$user(
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
    if (!(other
            is Query$getBusinessOperators$business_business_by_pk$operators$user) ||
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

extension UtilityExtension$Query$getBusinessOperators$business_business_by_pk$operators$user
    on Query$getBusinessOperators$business_business_by_pk$operators$user {
  CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
          Query$getBusinessOperators$business_business_by_pk$operators$user>
      get copyWith =>
          CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
    TRes> {
  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user(
    Query$getBusinessOperators$business_business_by_pk$operators$user instance,
    TRes Function(
            Query$getBusinessOperators$business_business_by_pk$operators$user)
        then,
  ) = _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$user;

  factory CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$user;

  TRes call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$user<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
            TRes> {
  _CopyWithImpl$Query$getBusinessOperators$business_business_by_pk$operators$user(
    this._instance,
    this._then,
  );

  final Query$getBusinessOperators$business_business_by_pk$operators$user
      _instance;

  final TRes Function(
      Query$getBusinessOperators$business_business_by_pk$operators$user) _then;

  static const _undefined = {};

  TRes call({
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBusinessOperators$business_business_by_pk$operators$user(
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

class _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$user<
        TRes>
    implements
        CopyWith$Query$getBusinessOperators$business_business_by_pk$operators$user<
            TRes> {
  _CopyWithStubImpl$Query$getBusinessOperators$business_business_by_pk$operators$user(
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
