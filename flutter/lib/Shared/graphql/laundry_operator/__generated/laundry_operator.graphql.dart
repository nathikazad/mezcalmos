import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$getLaundryOperatorByUserId {
  factory Variables$Query$getLaundryOperatorByUserId({required int userId}) =>
      Variables$Query$getLaundryOperatorByUserId._({
        r'userId': userId,
      });

  Variables$Query$getLaundryOperatorByUserId._(this._$data);

  factory Variables$Query$getLaundryOperatorByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getLaundryOperatorByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryOperatorByUserId<
          Variables$Query$getLaundryOperatorByUserId>
      get copyWith => CopyWith$Variables$Query$getLaundryOperatorByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryOperatorByUserId) ||
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

abstract class CopyWith$Variables$Query$getLaundryOperatorByUserId<TRes> {
  factory CopyWith$Variables$Query$getLaundryOperatorByUserId(
    Variables$Query$getLaundryOperatorByUserId instance,
    TRes Function(Variables$Query$getLaundryOperatorByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryOperatorByUserId;

  factory CopyWith$Variables$Query$getLaundryOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryOperatorByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getLaundryOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getLaundryOperatorByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryOperatorByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryOperatorByUserId _instance;

  final TRes Function(Variables$Query$getLaundryOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getLaundryOperatorByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryOperatorByUserId<TRes>
    implements CopyWith$Variables$Query$getLaundryOperatorByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryOperatorByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getLaundryOperatorByUserId {
  Query$getLaundryOperatorByUserId({
    required this.laundry_operator,
    required this.$__typename,
  });

  factory Query$getLaundryOperatorByUserId.fromJson(Map<String, dynamic> json) {
    final l$laundry_operator = json['laundry_operator'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperatorByUserId(
      laundry_operator: (l$laundry_operator as List<dynamic>)
          .map((e) =>
              Query$getLaundryOperatorByUserId$laundry_operator.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundryOperatorByUserId$laundry_operator>
      laundry_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_operator = laundry_operator;
    _resultData['laundry_operator'] =
        l$laundry_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_operator = laundry_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryOperatorByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_operator = laundry_operator;
    final lOther$laundry_operator = other.laundry_operator;
    if (l$laundry_operator.length != lOther$laundry_operator.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_operator.length; i++) {
      final l$laundry_operator$entry = l$laundry_operator[i];
      final lOther$laundry_operator$entry = lOther$laundry_operator[i];
      if (l$laundry_operator$entry != lOther$laundry_operator$entry) {
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

extension UtilityExtension$Query$getLaundryOperatorByUserId
    on Query$getLaundryOperatorByUserId {
  CopyWith$Query$getLaundryOperatorByUserId<Query$getLaundryOperatorByUserId>
      get copyWith => CopyWith$Query$getLaundryOperatorByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryOperatorByUserId<TRes> {
  factory CopyWith$Query$getLaundryOperatorByUserId(
    Query$getLaundryOperatorByUserId instance,
    TRes Function(Query$getLaundryOperatorByUserId) then,
  ) = _CopyWithImpl$Query$getLaundryOperatorByUserId;

  factory CopyWith$Query$getLaundryOperatorByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperatorByUserId;

  TRes call({
    List<Query$getLaundryOperatorByUserId$laundry_operator>? laundry_operator,
    String? $__typename,
  });
  TRes laundry_operator(
      Iterable<Query$getLaundryOperatorByUserId$laundry_operator> Function(
              Iterable<
                  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<
                      Query$getLaundryOperatorByUserId$laundry_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryOperatorByUserId<TRes>
    implements CopyWith$Query$getLaundryOperatorByUserId<TRes> {
  _CopyWithImpl$Query$getLaundryOperatorByUserId(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperatorByUserId _instance;

  final TRes Function(Query$getLaundryOperatorByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperatorByUserId(
        laundry_operator:
            laundry_operator == _undefined || laundry_operator == null
                ? _instance.laundry_operator
                : (laundry_operator
                    as List<Query$getLaundryOperatorByUserId$laundry_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_operator(
          Iterable<Query$getLaundryOperatorByUserId$laundry_operator> Function(
                  Iterable<
                      CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<
                          Query$getLaundryOperatorByUserId$laundry_operator>>)
              _fn) =>
      call(
          laundry_operator: _fn(_instance.laundry_operator.map(
              (e) => CopyWith$Query$getLaundryOperatorByUserId$laundry_operator(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryOperatorByUserId<TRes>
    implements CopyWith$Query$getLaundryOperatorByUserId<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperatorByUserId(this._res);

  TRes _res;

  call({
    List<Query$getLaundryOperatorByUserId$laundry_operator>? laundry_operator,
    String? $__typename,
  }) =>
      _res;
  laundry_operator(_fn) => _res;
}

const documentNodeQuerygetLaundryOperatorByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryOperatorByUserId'),
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
        name: NameNode(value: 'laundry_operator'),
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
            name: NameNode(value: 'store_id'),
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
Query$getLaundryOperatorByUserId _parserFn$Query$getLaundryOperatorByUserId(
        Map<String, dynamic> data) =>
    Query$getLaundryOperatorByUserId.fromJson(data);

class Options$Query$getLaundryOperatorByUserId
    extends graphql.QueryOptions<Query$getLaundryOperatorByUserId> {
  Options$Query$getLaundryOperatorByUserId({
    String? operationName,
    required Variables$Query$getLaundryOperatorByUserId variables,
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
          document: documentNodeQuerygetLaundryOperatorByUserId,
          parserFn: _parserFn$Query$getLaundryOperatorByUserId,
        );
}

class WatchOptions$Query$getLaundryOperatorByUserId
    extends graphql.WatchQueryOptions<Query$getLaundryOperatorByUserId> {
  WatchOptions$Query$getLaundryOperatorByUserId({
    String? operationName,
    required Variables$Query$getLaundryOperatorByUserId variables,
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
          document: documentNodeQuerygetLaundryOperatorByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryOperatorByUserId,
        );
}

class FetchMoreOptions$Query$getLaundryOperatorByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryOperatorByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryOperatorByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryOperatorByUserId,
        );
}

extension ClientExtension$Query$getLaundryOperatorByUserId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryOperatorByUserId>>
      query$getLaundryOperatorByUserId(
              Options$Query$getLaundryOperatorByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getLaundryOperatorByUserId>
      watchQuery$getLaundryOperatorByUserId(
              WatchOptions$Query$getLaundryOperatorByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getLaundryOperatorByUserId({
    required Query$getLaundryOperatorByUserId data,
    required Variables$Query$getLaundryOperatorByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetLaundryOperatorByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryOperatorByUserId? readQuery$getLaundryOperatorByUserId({
    required Variables$Query$getLaundryOperatorByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetLaundryOperatorByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getLaundryOperatorByUserId.fromJson(result);
  }
}

class Query$getLaundryOperatorByUserId$laundry_operator {
  Query$getLaundryOperatorByUserId$laundry_operator({
    required this.id,
    required this.owner,
    required this.status,
    required this.user_id,
    required this.user,
    required this.store_id,
    required this.$__typename,
  });

  factory Query$getLaundryOperatorByUserId$laundry_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$store_id = json['store_id'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperatorByUserId$laundry_operator(
      id: (l$id as int),
      owner: (l$owner as bool),
      status: (l$status as String),
      user_id: (l$user_id as int),
      user: Query$getLaundryOperatorByUserId$laundry_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      store_id: (l$store_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool owner;

  final String status;

  final int user_id;

  final Query$getLaundryOperatorByUserId$laundry_operator$user user;

  final int store_id;

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
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
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
    final l$store_id = store_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$owner,
      l$status,
      l$user_id,
      l$user,
      l$store_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryOperatorByUserId$laundry_operator) ||
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
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Query$getLaundryOperatorByUserId$laundry_operator
    on Query$getLaundryOperatorByUserId$laundry_operator {
  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<
          Query$getLaundryOperatorByUserId$laundry_operator>
      get copyWith =>
          CopyWith$Query$getLaundryOperatorByUserId$laundry_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<
    TRes> {
  factory CopyWith$Query$getLaundryOperatorByUserId$laundry_operator(
    Query$getLaundryOperatorByUserId$laundry_operator instance,
    TRes Function(Query$getLaundryOperatorByUserId$laundry_operator) then,
  ) = _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator;

  factory CopyWith$Query$getLaundryOperatorByUserId$laundry_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator;

  TRes call({
    int? id,
    bool? owner,
    String? status,
    int? user_id,
    Query$getLaundryOperatorByUserId$laundry_operator$user? user,
    int? store_id,
    String? $__typename,
  });
  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes>
      get user;
}

class _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator<TRes>
    implements
        CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<TRes> {
  _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperatorByUserId$laundry_operator _instance;

  final TRes Function(Query$getLaundryOperatorByUserId$laundry_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? store_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperatorByUserId$laundry_operator(
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
            : (user as Query$getLaundryOperatorByUserId$laundry_operator$user),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator<TRes>
    implements
        CopyWith$Query$getLaundryOperatorByUserId$laundry_operator<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? owner,
    String? status,
    int? user_id,
    Query$getLaundryOperatorByUserId$laundry_operator$user? user,
    int? store_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes>
      get user =>
          CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user.stub(
              _res);
}

class Query$getLaundryOperatorByUserId$laundry_operator$user {
  Query$getLaundryOperatorByUserId$laundry_operator$user({
    required this.firebase_id,
    this.image,
    required this.language_id,
    this.name,
    required this.$__typename,
  });

  factory Query$getLaundryOperatorByUserId$laundry_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperatorByUserId$laundry_operator$user(
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
    if (!(other is Query$getLaundryOperatorByUserId$laundry_operator$user) ||
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

extension UtilityExtension$Query$getLaundryOperatorByUserId$laundry_operator$user
    on Query$getLaundryOperatorByUserId$laundry_operator$user {
  CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<
          Query$getLaundryOperatorByUserId$laundry_operator$user>
      get copyWith =>
          CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<
    TRes> {
  factory CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user(
    Query$getLaundryOperatorByUserId$laundry_operator$user instance,
    TRes Function(Query$getLaundryOperatorByUserId$laundry_operator$user) then,
  ) = _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator$user;

  factory CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator$user;

  TRes call({
    String? firebase_id,
    String? image,
    String? language_id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes>
    implements
        CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes> {
  _CopyWithImpl$Query$getLaundryOperatorByUserId$laundry_operator$user(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperatorByUserId$laundry_operator$user _instance;

  final TRes Function(Query$getLaundryOperatorByUserId$laundry_operator$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperatorByUserId$laundry_operator$user(
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

class _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator$user<
        TRes>
    implements
        CopyWith$Query$getLaundryOperatorByUserId$laundry_operator$user<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperatorByUserId$laundry_operator$user(
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

class Variables$Subscription$laundryOperatorStatusStream {
  factory Variables$Subscription$laundryOperatorStatusStream(
          {required int userId}) =>
      Variables$Subscription$laundryOperatorStatusStream._({
        r'userId': userId,
      });

  Variables$Subscription$laundryOperatorStatusStream._(this._$data);

  factory Variables$Subscription$laundryOperatorStatusStream.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Subscription$laundryOperatorStatusStream._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Subscription$laundryOperatorStatusStream<
          Variables$Subscription$laundryOperatorStatusStream>
      get copyWith =>
          CopyWith$Variables$Subscription$laundryOperatorStatusStream(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$laundryOperatorStatusStream) ||
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

abstract class CopyWith$Variables$Subscription$laundryOperatorStatusStream<
    TRes> {
  factory CopyWith$Variables$Subscription$laundryOperatorStatusStream(
    Variables$Subscription$laundryOperatorStatusStream instance,
    TRes Function(Variables$Subscription$laundryOperatorStatusStream) then,
  ) = _CopyWithImpl$Variables$Subscription$laundryOperatorStatusStream;

  factory CopyWith$Variables$Subscription$laundryOperatorStatusStream.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$laundryOperatorStatusStream;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Subscription$laundryOperatorStatusStream<TRes>
    implements
        CopyWith$Variables$Subscription$laundryOperatorStatusStream<TRes> {
  _CopyWithImpl$Variables$Subscription$laundryOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Variables$Subscription$laundryOperatorStatusStream _instance;

  final TRes Function(Variables$Subscription$laundryOperatorStatusStream) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Subscription$laundryOperatorStatusStream._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$laundryOperatorStatusStream<TRes>
    implements
        CopyWith$Variables$Subscription$laundryOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Variables$Subscription$laundryOperatorStatusStream(
      this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Subscription$laundryOperatorStatusStream {
  Subscription$laundryOperatorStatusStream({
    required this.laundry_operator,
    required this.$__typename,
  });

  factory Subscription$laundryOperatorStatusStream.fromJson(
      Map<String, dynamic> json) {
    final l$laundry_operator = json['laundry_operator'];
    final l$$__typename = json['__typename'];
    return Subscription$laundryOperatorStatusStream(
      laundry_operator: (l$laundry_operator as List<dynamic>)
          .map((e) => Subscription$laundryOperatorStatusStream$laundry_operator
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$laundryOperatorStatusStream$laundry_operator>
      laundry_operator;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_operator = laundry_operator;
    _resultData['laundry_operator'] =
        l$laundry_operator.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_operator = laundry_operator;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_operator.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$laundryOperatorStatusStream) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_operator = laundry_operator;
    final lOther$laundry_operator = other.laundry_operator;
    if (l$laundry_operator.length != lOther$laundry_operator.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_operator.length; i++) {
      final l$laundry_operator$entry = l$laundry_operator[i];
      final lOther$laundry_operator$entry = lOther$laundry_operator[i];
      if (l$laundry_operator$entry != lOther$laundry_operator$entry) {
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

extension UtilityExtension$Subscription$laundryOperatorStatusStream
    on Subscription$laundryOperatorStatusStream {
  CopyWith$Subscription$laundryOperatorStatusStream<
          Subscription$laundryOperatorStatusStream>
      get copyWith => CopyWith$Subscription$laundryOperatorStatusStream(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$laundryOperatorStatusStream<TRes> {
  factory CopyWith$Subscription$laundryOperatorStatusStream(
    Subscription$laundryOperatorStatusStream instance,
    TRes Function(Subscription$laundryOperatorStatusStream) then,
  ) = _CopyWithImpl$Subscription$laundryOperatorStatusStream;

  factory CopyWith$Subscription$laundryOperatorStatusStream.stub(TRes res) =
      _CopyWithStubImpl$Subscription$laundryOperatorStatusStream;

  TRes call({
    List<Subscription$laundryOperatorStatusStream$laundry_operator>?
        laundry_operator,
    String? $__typename,
  });
  TRes laundry_operator(
      Iterable<Subscription$laundryOperatorStatusStream$laundry_operator> Function(
              Iterable<
                  CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
                      Subscription$laundryOperatorStatusStream$laundry_operator>>)
          _fn);
}

class _CopyWithImpl$Subscription$laundryOperatorStatusStream<TRes>
    implements CopyWith$Subscription$laundryOperatorStatusStream<TRes> {
  _CopyWithImpl$Subscription$laundryOperatorStatusStream(
    this._instance,
    this._then,
  );

  final Subscription$laundryOperatorStatusStream _instance;

  final TRes Function(Subscription$laundryOperatorStatusStream) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$laundryOperatorStatusStream(
        laundry_operator:
            laundry_operator == _undefined || laundry_operator == null
                ? _instance.laundry_operator
                : (laundry_operator as List<
                    Subscription$laundryOperatorStatusStream$laundry_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_operator(
          Iterable<Subscription$laundryOperatorStatusStream$laundry_operator> Function(
                  Iterable<
                      CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
                          Subscription$laundryOperatorStatusStream$laundry_operator>>)
              _fn) =>
      call(
          laundry_operator: _fn(_instance.laundry_operator.map((e) =>
              CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$laundryOperatorStatusStream<TRes>
    implements CopyWith$Subscription$laundryOperatorStatusStream<TRes> {
  _CopyWithStubImpl$Subscription$laundryOperatorStatusStream(this._res);

  TRes _res;

  call({
    List<Subscription$laundryOperatorStatusStream$laundry_operator>?
        laundry_operator,
    String? $__typename,
  }) =>
      _res;
  laundry_operator(_fn) => _res;
}

const documentNodeSubscriptionlaundryOperatorStatusStream =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'laundryOperatorStatusStream'),
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
        name: NameNode(value: 'laundry_operator'),
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
Subscription$laundryOperatorStatusStream
    _parserFn$Subscription$laundryOperatorStatusStream(
            Map<String, dynamic> data) =>
        Subscription$laundryOperatorStatusStream.fromJson(data);

class Options$Subscription$laundryOperatorStatusStream extends graphql
    .SubscriptionOptions<Subscription$laundryOperatorStatusStream> {
  Options$Subscription$laundryOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$laundryOperatorStatusStream variables,
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
          document: documentNodeSubscriptionlaundryOperatorStatusStream,
          parserFn: _parserFn$Subscription$laundryOperatorStatusStream,
        );
}

class WatchOptions$Subscription$laundryOperatorStatusStream extends graphql
    .WatchQueryOptions<Subscription$laundryOperatorStatusStream> {
  WatchOptions$Subscription$laundryOperatorStatusStream({
    String? operationName,
    required Variables$Subscription$laundryOperatorStatusStream variables,
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
          document: documentNodeSubscriptionlaundryOperatorStatusStream,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$laundryOperatorStatusStream,
        );
}

class FetchMoreOptions$Subscription$laundryOperatorStatusStream
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$laundryOperatorStatusStream({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$laundryOperatorStatusStream variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlaundryOperatorStatusStream,
        );
}

extension ClientExtension$Subscription$laundryOperatorStatusStream
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$laundryOperatorStatusStream>>
      subscribe$laundryOperatorStatusStream(
              Options$Subscription$laundryOperatorStatusStream options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$laundryOperatorStatusStream>
      watchSubscription$laundryOperatorStatusStream(
              WatchOptions$Subscription$laundryOperatorStatusStream options) =>
          this.watchQuery(options);
}

class Subscription$laundryOperatorStatusStream$laundry_operator {
  Subscription$laundryOperatorStatusStream$laundry_operator({
    required this.status,
    required this.$__typename,
  });

  factory Subscription$laundryOperatorStatusStream$laundry_operator.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$laundryOperatorStatusStream$laundry_operator(
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
    if (!(other is Subscription$laundryOperatorStatusStream$laundry_operator) ||
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

extension UtilityExtension$Subscription$laundryOperatorStatusStream$laundry_operator
    on Subscription$laundryOperatorStatusStream$laundry_operator {
  CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
          Subscription$laundryOperatorStatusStream$laundry_operator>
      get copyWith =>
          CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
    TRes> {
  factory CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator(
    Subscription$laundryOperatorStatusStream$laundry_operator instance,
    TRes Function(Subscription$laundryOperatorStatusStream$laundry_operator)
        then,
  ) = _CopyWithImpl$Subscription$laundryOperatorStatusStream$laundry_operator;

  factory CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$laundryOperatorStatusStream$laundry_operator;

  TRes call({
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$laundryOperatorStatusStream$laundry_operator<
        TRes>
    implements
        CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
            TRes> {
  _CopyWithImpl$Subscription$laundryOperatorStatusStream$laundry_operator(
    this._instance,
    this._then,
  );

  final Subscription$laundryOperatorStatusStream$laundry_operator _instance;

  final TRes Function(Subscription$laundryOperatorStatusStream$laundry_operator)
      _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$laundryOperatorStatusStream$laundry_operator(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$laundryOperatorStatusStream$laundry_operator<
        TRes>
    implements
        CopyWith$Subscription$laundryOperatorStatusStream$laundry_operator<
            TRes> {
  _CopyWithStubImpl$Subscription$laundryOperatorStatusStream$laundry_operator(
      this._res);

  TRes _res;

  call({
    String? status,
    String? $__typename,
  }) =>
      _res;
}
