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
    required this.owner,
    required this.status,
    required this.user_id,
    required this.user,
    required this.delivery_company_id,
    required this.$__typename,
  });

  factory Query$getOperatorByUserId$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$$__typename = json['__typename'];
    return Query$getOperatorByUserId$delivery_operator(
      id: (l$id as int),
      owner: (l$owner as bool),
      status: (l$status as String),
      user_id: (l$user_id as int),
      user: Query$getOperatorByUserId$delivery_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      delivery_company_id: (l$delivery_company_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool owner;

  final String status;

  final int user_id;

  final Query$getOperatorByUserId$delivery_operator$user user;

  final int delivery_company_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$owner = owner;
    final l$status = status;
    final l$user_id = user_id;
    final l$user = user;
    final l$delivery_company_id = delivery_company_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$owner,
      l$status,
      l$user_id,
      l$user,
      l$delivery_company_id,
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
    bool? owner,
    String? status,
    int? user_id,
    Query$getOperatorByUserId$delivery_operator$user? user,
    int? delivery_company_id,
    String? $__typename,
  });
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user;
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
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? delivery_company_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOperatorByUserId$delivery_operator(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getOperatorByUserId$delivery_operator$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator<TRes>
    implements CopyWith$Query$getOperatorByUserId$delivery_operator<TRes> {
  _CopyWithStubImpl$Query$getOperatorByUserId$delivery_operator(this._res);

  TRes _res;

  call({
    int? id,
    bool? owner,
    String? status,
    int? user_id,
    Query$getOperatorByUserId$delivery_operator$user? user,
    int? delivery_company_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOperatorByUserId$delivery_operator$user<TRes> get user =>
      CopyWith$Query$getOperatorByUserId$delivery_operator$user.stub(_res);
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
    required this.delivery_operator,
    required this.$__typename,
  });

  factory Subscription$restaurantOperatorStatusStream.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_operator = json['delivery_operator'];
    final l$$__typename = json['__typename'];
    return Subscription$restaurantOperatorStatusStream(
      delivery_operator: (l$delivery_operator as List<dynamic>)
          .map((e) =>
              Subscription$restaurantOperatorStatusStream$delivery_operator
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$restaurantOperatorStatusStream$delivery_operator>
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
    if (!(other is Subscription$restaurantOperatorStatusStream) ||
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
    List<Subscription$restaurantOperatorStatusStream$delivery_operator>?
        delivery_operator,
    String? $__typename,
  });
  TRes delivery_operator(
      Iterable<Subscription$restaurantOperatorStatusStream$delivery_operator> Function(
              Iterable<
                  CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
                      Subscription$restaurantOperatorStatusStream$delivery_operator>>)
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
    Object? delivery_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$restaurantOperatorStatusStream(
        delivery_operator: delivery_operator == _undefined ||
                delivery_operator == null
            ? _instance.delivery_operator
            : (delivery_operator as List<
                Subscription$restaurantOperatorStatusStream$delivery_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_operator(
          Iterable<Subscription$restaurantOperatorStatusStream$delivery_operator> Function(
                  Iterable<
                      CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
                          Subscription$restaurantOperatorStatusStream$delivery_operator>>)
              _fn) =>
      call(
          delivery_operator: _fn(_instance.delivery_operator.map((e) =>
              CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream<TRes>
    implements CopyWith$Subscription$restaurantOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream(this._res);

  TRes _res;

  call({
    List<Subscription$restaurantOperatorStatusStream$delivery_operator>?
        delivery_operator,
    String? $__typename,
  }) =>
      _res;
  delivery_operator(_fn) => _res;
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

class Subscription$restaurantOperatorStatusStream$delivery_operator {
  Subscription$restaurantOperatorStatusStream$delivery_operator({
    required this.status,
    required this.$__typename,
  });

  factory Subscription$restaurantOperatorStatusStream$delivery_operator.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$restaurantOperatorStatusStream$delivery_operator(
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
            is Subscription$restaurantOperatorStatusStream$delivery_operator) ||
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

extension UtilityExtension$Subscription$restaurantOperatorStatusStream$delivery_operator
    on Subscription$restaurantOperatorStatusStream$delivery_operator {
  CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
          Subscription$restaurantOperatorStatusStream$delivery_operator>
      get copyWith =>
          CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
    TRes> {
  factory CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator(
    Subscription$restaurantOperatorStatusStream$delivery_operator instance,
    TRes Function(Subscription$restaurantOperatorStatusStream$delivery_operator)
        then,
  ) = _CopyWithImpl$Subscription$restaurantOperatorStatusStream$delivery_operator;

  factory CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$delivery_operator;

  TRes call({
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$restaurantOperatorStatusStream$delivery_operator<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
            TRes> {
  _CopyWithImpl$Subscription$restaurantOperatorStatusStream$delivery_operator(
    this._instance,
    this._then,
  );

  final Subscription$restaurantOperatorStatusStream$delivery_operator _instance;

  final TRes Function(
      Subscription$restaurantOperatorStatusStream$delivery_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$restaurantOperatorStatusStream$delivery_operator(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$delivery_operator<
        TRes>
    implements
        CopyWith$Subscription$restaurantOperatorStatusStream$delivery_operator<
            TRes> {
  _CopyWithStubImpl$Subscription$restaurantOperatorStatusStream$delivery_operator(
      this._res);

  TRes _res;

  call({
    String? status,
    String? $__typename,
  }) =>
      _res;
}
