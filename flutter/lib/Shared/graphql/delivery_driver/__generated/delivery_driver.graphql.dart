import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getDriversByUserId {
  factory Variables$Query$getDriversByUserId({required int userId}) =>
      Variables$Query$getDriversByUserId._({
        r'userId': userId,
      });

  Variables$Query$getDriversByUserId._(this._$data);

  factory Variables$Query$getDriversByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getDriversByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getDriversByUserId<
          Variables$Query$getDriversByUserId>
      get copyWith => CopyWith$Variables$Query$getDriversByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDriversByUserId) ||
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

abstract class CopyWith$Variables$Query$getDriversByUserId<TRes> {
  factory CopyWith$Variables$Query$getDriversByUserId(
    Variables$Query$getDriversByUserId instance,
    TRes Function(Variables$Query$getDriversByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getDriversByUserId;

  factory CopyWith$Variables$Query$getDriversByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDriversByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getDriversByUserId<TRes>
    implements CopyWith$Variables$Query$getDriversByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getDriversByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getDriversByUserId _instance;

  final TRes Function(Variables$Query$getDriversByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getDriversByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDriversByUserId<TRes>
    implements CopyWith$Variables$Query$getDriversByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getDriversByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getDriversByUserId {
  Query$getDriversByUserId({
    required this.delivery_driver,
    required this.$__typename,
  });

  factory Query$getDriversByUserId.fromJson(Map<String, dynamic> json) {
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByUserId(
      delivery_driver: (l$delivery_driver as List<dynamic>)
          .map((e) => Query$getDriversByUserId$delivery_driver.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getDriversByUserId$delivery_driver> delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] =
        l$delivery_driver.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_driver.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver.length != lOther$delivery_driver.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_driver.length; i++) {
      final l$delivery_driver$entry = l$delivery_driver[i];
      final lOther$delivery_driver$entry = lOther$delivery_driver[i];
      if (l$delivery_driver$entry != lOther$delivery_driver$entry) {
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

extension UtilityExtension$Query$getDriversByUserId
    on Query$getDriversByUserId {
  CopyWith$Query$getDriversByUserId<Query$getDriversByUserId> get copyWith =>
      CopyWith$Query$getDriversByUserId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getDriversByUserId<TRes> {
  factory CopyWith$Query$getDriversByUserId(
    Query$getDriversByUserId instance,
    TRes Function(Query$getDriversByUserId) then,
  ) = _CopyWithImpl$Query$getDriversByUserId;

  factory CopyWith$Query$getDriversByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getDriversByUserId;

  TRes call({
    List<Query$getDriversByUserId$delivery_driver>? delivery_driver,
    String? $__typename,
  });
  TRes delivery_driver(
      Iterable<Query$getDriversByUserId$delivery_driver> Function(
              Iterable<
                  CopyWith$Query$getDriversByUserId$delivery_driver<
                      Query$getDriversByUserId$delivery_driver>>)
          _fn);
}

class _CopyWithImpl$Query$getDriversByUserId<TRes>
    implements CopyWith$Query$getDriversByUserId<TRes> {
  _CopyWithImpl$Query$getDriversByUserId(
    this._instance,
    this._then,
  );

  final Query$getDriversByUserId _instance;

  final TRes Function(Query$getDriversByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByUserId(
        delivery_driver:
            delivery_driver == _undefined || delivery_driver == null
                ? _instance.delivery_driver
                : (delivery_driver
                    as List<Query$getDriversByUserId$delivery_driver>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_driver(
          Iterable<Query$getDriversByUserId$delivery_driver> Function(
                  Iterable<
                      CopyWith$Query$getDriversByUserId$delivery_driver<
                          Query$getDriversByUserId$delivery_driver>>)
              _fn) =>
      call(
          delivery_driver: _fn(_instance.delivery_driver
              .map((e) => CopyWith$Query$getDriversByUserId$delivery_driver(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getDriversByUserId<TRes>
    implements CopyWith$Query$getDriversByUserId<TRes> {
  _CopyWithStubImpl$Query$getDriversByUserId(this._res);

  TRes _res;

  call({
    List<Query$getDriversByUserId$delivery_driver>? delivery_driver,
    String? $__typename,
  }) =>
      _res;
  delivery_driver(_fn) => _res;
}

const documentNodeQuerygetDriversByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDriversByUserId'),
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
        name: NameNode(value: 'delivery_driver'),
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
            name: NameNode(value: 'app_version'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'current_location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_company_type'),
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
            name: NameNode(value: 'id'),
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
            name: NameNode(value: 'status'),
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
                name: NameNode(value: 'id'),
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
                name: NameNode(value: 'name'),
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
                name: NameNode(value: 'language_id'),
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
Query$getDriversByUserId _parserFn$Query$getDriversByUserId(
        Map<String, dynamic> data) =>
    Query$getDriversByUserId.fromJson(data);

class Options$Query$getDriversByUserId
    extends graphql.QueryOptions<Query$getDriversByUserId> {
  Options$Query$getDriversByUserId({
    String? operationName,
    required Variables$Query$getDriversByUserId variables,
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
          document: documentNodeQuerygetDriversByUserId,
          parserFn: _parserFn$Query$getDriversByUserId,
        );
}

class WatchOptions$Query$getDriversByUserId
    extends graphql.WatchQueryOptions<Query$getDriversByUserId> {
  WatchOptions$Query$getDriversByUserId({
    String? operationName,
    required Variables$Query$getDriversByUserId variables,
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
          document: documentNodeQuerygetDriversByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDriversByUserId,
        );
}

class FetchMoreOptions$Query$getDriversByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDriversByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDriversByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDriversByUserId,
        );
}

extension ClientExtension$Query$getDriversByUserId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDriversByUserId>>
      query$getDriversByUserId(
              Options$Query$getDriversByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDriversByUserId>
      watchQuery$getDriversByUserId(
              WatchOptions$Query$getDriversByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getDriversByUserId({
    required Query$getDriversByUserId data,
    required Variables$Query$getDriversByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetDriversByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDriversByUserId? readQuery$getDriversByUserId({
    required Variables$Query$getDriversByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetDriversByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDriversByUserId.fromJson(result);
  }
}

class Query$getDriversByUserId$delivery_driver {
  Query$getDriversByUserId$delivery_driver({
    this.app_version,
    this.current_location,
    required this.delivery_company_type,
    required this.delivery_company_id,
    required this.id,
    required this.online,
    required this.status,
    required this.user,
    required this.$__typename,
  });

  factory Query$getDriversByUserId$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$current_location = json['current_location'];
    final l$delivery_company_type = json['delivery_company_type'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$id = json['id'];
    final l$online = json['online'];
    final l$status = json['status'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByUserId$delivery_driver(
      app_version: (l$app_version as String?),
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      delivery_company_type: (l$delivery_company_type as String),
      delivery_company_id: (l$delivery_company_id as int),
      id: (l$id as int),
      online: (l$online as bool),
      status: (l$status as String),
      user: Query$getDriversByUserId$delivery_driver$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final Geography? current_location;

  final String delivery_company_type;

  final int delivery_company_id;

  final int id;

  final bool online;

  final String status;

  final Query$getDriversByUserId$delivery_driver$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$delivery_company_type = delivery_company_type;
    _resultData['delivery_company_type'] = l$delivery_company_type;
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$online = online;
    _resultData['online'] = l$online;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$current_location = current_location;
    final l$delivery_company_type = delivery_company_type;
    final l$delivery_company_id = delivery_company_id;
    final l$id = id;
    final l$online = online;
    final l$status = status;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$current_location,
      l$delivery_company_type,
      l$delivery_company_id,
      l$id,
      l$online,
      l$status,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByUserId$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
      return false;
    }
    final l$delivery_company_type = delivery_company_type;
    final lOther$delivery_company_type = other.delivery_company_type;
    if (l$delivery_company_type != lOther$delivery_company_type) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$online = online;
    final lOther$online = other.online;
    if (l$online != lOther$online) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Query$getDriversByUserId$delivery_driver
    on Query$getDriversByUserId$delivery_driver {
  CopyWith$Query$getDriversByUserId$delivery_driver<
          Query$getDriversByUserId$delivery_driver>
      get copyWith => CopyWith$Query$getDriversByUserId$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriversByUserId$delivery_driver<TRes> {
  factory CopyWith$Query$getDriversByUserId$delivery_driver(
    Query$getDriversByUserId$delivery_driver instance,
    TRes Function(Query$getDriversByUserId$delivery_driver) then,
  ) = _CopyWithImpl$Query$getDriversByUserId$delivery_driver;

  factory CopyWith$Query$getDriversByUserId$delivery_driver.stub(TRes res) =
      _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver;

  TRes call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getDriversByUserId$delivery_driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> get user;
}

class _CopyWithImpl$Query$getDriversByUserId$delivery_driver<TRes>
    implements CopyWith$Query$getDriversByUserId$delivery_driver<TRes> {
  _CopyWithImpl$Query$getDriversByUserId$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$getDriversByUserId$delivery_driver _instance;

  final TRes Function(Query$getDriversByUserId$delivery_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? current_location = _undefined,
    Object? delivery_company_type = _undefined,
    Object? delivery_company_id = _undefined,
    Object? id = _undefined,
    Object? online = _undefined,
    Object? status = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByUserId$delivery_driver(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        delivery_company_type:
            delivery_company_type == _undefined || delivery_company_type == null
                ? _instance.delivery_company_type
                : (delivery_company_type as String),
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        online: online == _undefined || online == null
            ? _instance.online
            : (online as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getDriversByUserId$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getDriversByUserId$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver<TRes>
    implements CopyWith$Query$getDriversByUserId$delivery_driver<TRes> {
  _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver(this._res);

  TRes _res;

  call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getDriversByUserId$delivery_driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> get user =>
      CopyWith$Query$getDriversByUserId$delivery_driver$user.stub(_res);
}

class Query$getDriversByUserId$delivery_driver$user {
  Query$getDriversByUserId$delivery_driver$user({
    required this.id,
    this.image,
    this.name,
    required this.firebase_id,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getDriversByUserId$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByUserId$delivery_driver$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String firebase_id;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$firebase_id,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByUserId$delivery_driver$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getDriversByUserId$delivery_driver$user
    on Query$getDriversByUserId$delivery_driver$user {
  CopyWith$Query$getDriversByUserId$delivery_driver$user<
          Query$getDriversByUserId$delivery_driver$user>
      get copyWith => CopyWith$Query$getDriversByUserId$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> {
  factory CopyWith$Query$getDriversByUserId$delivery_driver$user(
    Query$getDriversByUserId$delivery_driver$user instance,
    TRes Function(Query$getDriversByUserId$delivery_driver$user) then,
  ) = _CopyWithImpl$Query$getDriversByUserId$delivery_driver$user;

  factory CopyWith$Query$getDriversByUserId$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDriversByUserId$delivery_driver$user<TRes>
    implements CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> {
  _CopyWithImpl$Query$getDriversByUserId$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Query$getDriversByUserId$delivery_driver$user _instance;

  final TRes Function(Query$getDriversByUserId$delivery_driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByUserId$delivery_driver$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver$user<TRes>
    implements CopyWith$Query$getDriversByUserId$delivery_driver$user<TRes> {
  _CopyWithStubImpl$Query$getDriversByUserId$delivery_driver$user(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getDriversByServiceId {
  factory Variables$Query$getDriversByServiceId({required int serviceId}) =>
      Variables$Query$getDriversByServiceId._({
        r'serviceId': serviceId,
      });

  Variables$Query$getDriversByServiceId._(this._$data);

  factory Variables$Query$getDriversByServiceId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as int);
    return Variables$Query$getDriversByServiceId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceId => (_$data['serviceId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    return result$data;
  }

  CopyWith$Variables$Query$getDriversByServiceId<
          Variables$Query$getDriversByServiceId>
      get copyWith => CopyWith$Variables$Query$getDriversByServiceId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDriversByServiceId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    return Object.hashAll([l$serviceId]);
  }
}

abstract class CopyWith$Variables$Query$getDriversByServiceId<TRes> {
  factory CopyWith$Variables$Query$getDriversByServiceId(
    Variables$Query$getDriversByServiceId instance,
    TRes Function(Variables$Query$getDriversByServiceId) then,
  ) = _CopyWithImpl$Variables$Query$getDriversByServiceId;

  factory CopyWith$Variables$Query$getDriversByServiceId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDriversByServiceId;

  TRes call({int? serviceId});
}

class _CopyWithImpl$Variables$Query$getDriversByServiceId<TRes>
    implements CopyWith$Variables$Query$getDriversByServiceId<TRes> {
  _CopyWithImpl$Variables$Query$getDriversByServiceId(
    this._instance,
    this._then,
  );

  final Variables$Query$getDriversByServiceId _instance;

  final TRes Function(Variables$Query$getDriversByServiceId) _then;

  static const _undefined = {};

  TRes call({Object? serviceId = _undefined}) =>
      _then(Variables$Query$getDriversByServiceId._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDriversByServiceId<TRes>
    implements CopyWith$Variables$Query$getDriversByServiceId<TRes> {
  _CopyWithStubImpl$Variables$Query$getDriversByServiceId(this._res);

  TRes _res;

  call({int? serviceId}) => _res;
}

class Query$getDriversByServiceId {
  Query$getDriversByServiceId({
    required this.delivery_driver,
    required this.$__typename,
  });

  factory Query$getDriversByServiceId.fromJson(Map<String, dynamic> json) {
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByServiceId(
      delivery_driver: (l$delivery_driver as List<dynamic>)
          .map((e) => Query$getDriversByServiceId$delivery_driver.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getDriversByServiceId$delivery_driver> delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] =
        l$delivery_driver.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_driver.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByServiceId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver.length != lOther$delivery_driver.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_driver.length; i++) {
      final l$delivery_driver$entry = l$delivery_driver[i];
      final lOther$delivery_driver$entry = lOther$delivery_driver[i];
      if (l$delivery_driver$entry != lOther$delivery_driver$entry) {
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

extension UtilityExtension$Query$getDriversByServiceId
    on Query$getDriversByServiceId {
  CopyWith$Query$getDriversByServiceId<Query$getDriversByServiceId>
      get copyWith => CopyWith$Query$getDriversByServiceId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriversByServiceId<TRes> {
  factory CopyWith$Query$getDriversByServiceId(
    Query$getDriversByServiceId instance,
    TRes Function(Query$getDriversByServiceId) then,
  ) = _CopyWithImpl$Query$getDriversByServiceId;

  factory CopyWith$Query$getDriversByServiceId.stub(TRes res) =
      _CopyWithStubImpl$Query$getDriversByServiceId;

  TRes call({
    List<Query$getDriversByServiceId$delivery_driver>? delivery_driver,
    String? $__typename,
  });
  TRes delivery_driver(
      Iterable<Query$getDriversByServiceId$delivery_driver> Function(
              Iterable<
                  CopyWith$Query$getDriversByServiceId$delivery_driver<
                      Query$getDriversByServiceId$delivery_driver>>)
          _fn);
}

class _CopyWithImpl$Query$getDriversByServiceId<TRes>
    implements CopyWith$Query$getDriversByServiceId<TRes> {
  _CopyWithImpl$Query$getDriversByServiceId(
    this._instance,
    this._then,
  );

  final Query$getDriversByServiceId _instance;

  final TRes Function(Query$getDriversByServiceId) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByServiceId(
        delivery_driver:
            delivery_driver == _undefined || delivery_driver == null
                ? _instance.delivery_driver
                : (delivery_driver
                    as List<Query$getDriversByServiceId$delivery_driver>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_driver(
          Iterable<Query$getDriversByServiceId$delivery_driver> Function(
                  Iterable<
                      CopyWith$Query$getDriversByServiceId$delivery_driver<
                          Query$getDriversByServiceId$delivery_driver>>)
              _fn) =>
      call(
          delivery_driver: _fn(_instance.delivery_driver
              .map((e) => CopyWith$Query$getDriversByServiceId$delivery_driver(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getDriversByServiceId<TRes>
    implements CopyWith$Query$getDriversByServiceId<TRes> {
  _CopyWithStubImpl$Query$getDriversByServiceId(this._res);

  TRes _res;

  call({
    List<Query$getDriversByServiceId$delivery_driver>? delivery_driver,
    String? $__typename,
  }) =>
      _res;
  delivery_driver(_fn) => _res;
}

const documentNodeQuerygetDriversByServiceId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDriversByServiceId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceId')),
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
        name: NameNode(value: 'delivery_driver'),
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
                    value: VariableNode(name: NameNode(value: 'serviceId')),
                  )
                ]),
              )
            ]),
          )
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
            name: NameNode(value: 'current_location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_company_type'),
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
            name: NameNode(value: 'id'),
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
            name: NameNode(value: 'status'),
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
                name: NameNode(value: 'id'),
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
                name: NameNode(value: 'name'),
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
                name: NameNode(value: 'language_id'),
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
Query$getDriversByServiceId _parserFn$Query$getDriversByServiceId(
        Map<String, dynamic> data) =>
    Query$getDriversByServiceId.fromJson(data);

class Options$Query$getDriversByServiceId
    extends graphql.QueryOptions<Query$getDriversByServiceId> {
  Options$Query$getDriversByServiceId({
    String? operationName,
    required Variables$Query$getDriversByServiceId variables,
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
          document: documentNodeQuerygetDriversByServiceId,
          parserFn: _parserFn$Query$getDriversByServiceId,
        );
}

class WatchOptions$Query$getDriversByServiceId
    extends graphql.WatchQueryOptions<Query$getDriversByServiceId> {
  WatchOptions$Query$getDriversByServiceId({
    String? operationName,
    required Variables$Query$getDriversByServiceId variables,
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
          document: documentNodeQuerygetDriversByServiceId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDriversByServiceId,
        );
}

class FetchMoreOptions$Query$getDriversByServiceId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDriversByServiceId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDriversByServiceId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDriversByServiceId,
        );
}

extension ClientExtension$Query$getDriversByServiceId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDriversByServiceId>>
      query$getDriversByServiceId(
              Options$Query$getDriversByServiceId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDriversByServiceId>
      watchQuery$getDriversByServiceId(
              WatchOptions$Query$getDriversByServiceId options) =>
          this.watchQuery(options);
  void writeQuery$getDriversByServiceId({
    required Query$getDriversByServiceId data,
    required Variables$Query$getDriversByServiceId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDriversByServiceId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDriversByServiceId? readQuery$getDriversByServiceId({
    required Variables$Query$getDriversByServiceId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetDriversByServiceId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDriversByServiceId.fromJson(result);
  }
}

class Query$getDriversByServiceId$delivery_driver {
  Query$getDriversByServiceId$delivery_driver({
    this.app_version,
    this.current_location,
    required this.delivery_company_type,
    required this.delivery_company_id,
    required this.id,
    required this.online,
    required this.status,
    required this.user,
    required this.$__typename,
  });

  factory Query$getDriversByServiceId$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$current_location = json['current_location'];
    final l$delivery_company_type = json['delivery_company_type'];
    final l$delivery_company_id = json['delivery_company_id'];
    final l$id = json['id'];
    final l$online = json['online'];
    final l$status = json['status'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByServiceId$delivery_driver(
      app_version: (l$app_version as String?),
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      delivery_company_type: (l$delivery_company_type as String),
      delivery_company_id: (l$delivery_company_id as int),
      id: (l$id as int),
      online: (l$online as bool),
      status: (l$status as String),
      user: Query$getDriversByServiceId$delivery_driver$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final Geography? current_location;

  final String delivery_company_type;

  final int delivery_company_id;

  final int id;

  final bool online;

  final String status;

  final Query$getDriversByServiceId$delivery_driver$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$delivery_company_type = delivery_company_type;
    _resultData['delivery_company_type'] = l$delivery_company_type;
    final l$delivery_company_id = delivery_company_id;
    _resultData['delivery_company_id'] = l$delivery_company_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$online = online;
    _resultData['online'] = l$online;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$current_location = current_location;
    final l$delivery_company_type = delivery_company_type;
    final l$delivery_company_id = delivery_company_id;
    final l$id = id;
    final l$online = online;
    final l$status = status;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$current_location,
      l$delivery_company_type,
      l$delivery_company_id,
      l$id,
      l$online,
      l$status,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByServiceId$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
      return false;
    }
    final l$delivery_company_type = delivery_company_type;
    final lOther$delivery_company_type = other.delivery_company_type;
    if (l$delivery_company_type != lOther$delivery_company_type) {
      return false;
    }
    final l$delivery_company_id = delivery_company_id;
    final lOther$delivery_company_id = other.delivery_company_id;
    if (l$delivery_company_id != lOther$delivery_company_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$online = online;
    final lOther$online = other.online;
    if (l$online != lOther$online) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Query$getDriversByServiceId$delivery_driver
    on Query$getDriversByServiceId$delivery_driver {
  CopyWith$Query$getDriversByServiceId$delivery_driver<
          Query$getDriversByServiceId$delivery_driver>
      get copyWith => CopyWith$Query$getDriversByServiceId$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriversByServiceId$delivery_driver<TRes> {
  factory CopyWith$Query$getDriversByServiceId$delivery_driver(
    Query$getDriversByServiceId$delivery_driver instance,
    TRes Function(Query$getDriversByServiceId$delivery_driver) then,
  ) = _CopyWithImpl$Query$getDriversByServiceId$delivery_driver;

  factory CopyWith$Query$getDriversByServiceId$delivery_driver.stub(TRes res) =
      _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver;

  TRes call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getDriversByServiceId$delivery_driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> get user;
}

class _CopyWithImpl$Query$getDriversByServiceId$delivery_driver<TRes>
    implements CopyWith$Query$getDriversByServiceId$delivery_driver<TRes> {
  _CopyWithImpl$Query$getDriversByServiceId$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$getDriversByServiceId$delivery_driver _instance;

  final TRes Function(Query$getDriversByServiceId$delivery_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? current_location = _undefined,
    Object? delivery_company_type = _undefined,
    Object? delivery_company_id = _undefined,
    Object? id = _undefined,
    Object? online = _undefined,
    Object? status = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByServiceId$delivery_driver(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        delivery_company_type:
            delivery_company_type == _undefined || delivery_company_type == null
                ? _instance.delivery_company_type
                : (delivery_company_type as String),
        delivery_company_id:
            delivery_company_id == _undefined || delivery_company_id == null
                ? _instance.delivery_company_id
                : (delivery_company_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        online: online == _undefined || online == null
            ? _instance.online
            : (online as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getDriversByServiceId$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getDriversByServiceId$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver<TRes>
    implements CopyWith$Query$getDriversByServiceId$delivery_driver<TRes> {
  _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver(this._res);

  TRes _res;

  call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getDriversByServiceId$delivery_driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> get user =>
      CopyWith$Query$getDriversByServiceId$delivery_driver$user.stub(_res);
}

class Query$getDriversByServiceId$delivery_driver$user {
  Query$getDriversByServiceId$delivery_driver$user({
    required this.id,
    this.image,
    this.name,
    required this.firebase_id,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getDriversByServiceId$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getDriversByServiceId$delivery_driver$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String firebase_id;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$firebase_id,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriversByServiceId$delivery_driver$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getDriversByServiceId$delivery_driver$user
    on Query$getDriversByServiceId$delivery_driver$user {
  CopyWith$Query$getDriversByServiceId$delivery_driver$user<
          Query$getDriversByServiceId$delivery_driver$user>
      get copyWith => CopyWith$Query$getDriversByServiceId$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> {
  factory CopyWith$Query$getDriversByServiceId$delivery_driver$user(
    Query$getDriversByServiceId$delivery_driver$user instance,
    TRes Function(Query$getDriversByServiceId$delivery_driver$user) then,
  ) = _CopyWithImpl$Query$getDriversByServiceId$delivery_driver$user;

  factory CopyWith$Query$getDriversByServiceId$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDriversByServiceId$delivery_driver$user<TRes>
    implements CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> {
  _CopyWithImpl$Query$getDriversByServiceId$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Query$getDriversByServiceId$delivery_driver$user _instance;

  final TRes Function(Query$getDriversByServiceId$delivery_driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriversByServiceId$delivery_driver$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver$user<TRes>
    implements CopyWith$Query$getDriversByServiceId$delivery_driver$user<TRes> {
  _CopyWithStubImpl$Query$getDriversByServiceId$delivery_driver$user(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDeliveryDriverById {
  factory Variables$Mutation$updateDeliveryDriverById({
    required int driverId,
    Input$delivery_driver_set_input? driverData,
  }) =>
      Variables$Mutation$updateDeliveryDriverById._({
        r'driverId': driverId,
        if (driverData != null) r'driverData': driverData,
      });

  Variables$Mutation$updateDeliveryDriverById._(this._$data);

  factory Variables$Mutation$updateDeliveryDriverById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    if (data.containsKey('driverData')) {
      final l$driverData = data['driverData'];
      result$data['driverData'] = l$driverData == null
          ? null
          : Input$delivery_driver_set_input.fromJson(
              (l$driverData as Map<String, dynamic>));
    }
    return Variables$Mutation$updateDeliveryDriverById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Input$delivery_driver_set_input? get driverData =>
      (_$data['driverData'] as Input$delivery_driver_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    if (_$data.containsKey('driverData')) {
      final l$driverData = driverData;
      result$data['driverData'] = l$driverData?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDeliveryDriverById<
          Variables$Mutation$updateDeliveryDriverById>
      get copyWith => CopyWith$Variables$Mutation$updateDeliveryDriverById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDeliveryDriverById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    final l$driverData = driverData;
    final lOther$driverData = other.driverData;
    if (_$data.containsKey('driverData') !=
        other._$data.containsKey('driverData')) {
      return false;
    }
    if (l$driverData != lOther$driverData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    final l$driverData = driverData;
    return Object.hashAll([
      l$driverId,
      _$data.containsKey('driverData') ? l$driverData : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDeliveryDriverById<TRes> {
  factory CopyWith$Variables$Mutation$updateDeliveryDriverById(
    Variables$Mutation$updateDeliveryDriverById instance,
    TRes Function(Variables$Mutation$updateDeliveryDriverById) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDeliveryDriverById;

  factory CopyWith$Variables$Mutation$updateDeliveryDriverById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDeliveryDriverById;

  TRes call({
    int? driverId,
    Input$delivery_driver_set_input? driverData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDeliveryDriverById<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryDriverById<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDeliveryDriverById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDeliveryDriverById _instance;

  final TRes Function(Variables$Mutation$updateDeliveryDriverById) _then;

  static const _undefined = {};

  TRes call({
    Object? driverId = _undefined,
    Object? driverData = _undefined,
  }) =>
      _then(Variables$Mutation$updateDeliveryDriverById._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
        if (driverData != _undefined)
          'driverData': (driverData as Input$delivery_driver_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDeliveryDriverById<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryDriverById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDeliveryDriverById(this._res);

  TRes _res;

  call({
    int? driverId,
    Input$delivery_driver_set_input? driverData,
  }) =>
      _res;
}

class Mutation$updateDeliveryDriverById {
  Mutation$updateDeliveryDriverById({
    this.update_delivery_driver_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryDriverById.fromJson(
      Map<String, dynamic> json) {
    final l$update_delivery_driver_by_pk = json['update_delivery_driver_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryDriverById(
      update_delivery_driver_by_pk: l$update_delivery_driver_by_pk == null
          ? null
          : Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk
              .fromJson(
                  (l$update_delivery_driver_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk?
      update_delivery_driver_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    _resultData['update_delivery_driver_by_pk'] =
        l$update_delivery_driver_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_driver_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryDriverById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    final lOther$update_delivery_driver_by_pk =
        other.update_delivery_driver_by_pk;
    if (l$update_delivery_driver_by_pk != lOther$update_delivery_driver_by_pk) {
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

extension UtilityExtension$Mutation$updateDeliveryDriverById
    on Mutation$updateDeliveryDriverById {
  CopyWith$Mutation$updateDeliveryDriverById<Mutation$updateDeliveryDriverById>
      get copyWith => CopyWith$Mutation$updateDeliveryDriverById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryDriverById<TRes> {
  factory CopyWith$Mutation$updateDeliveryDriverById(
    Mutation$updateDeliveryDriverById instance,
    TRes Function(Mutation$updateDeliveryDriverById) then,
  ) = _CopyWithImpl$Mutation$updateDeliveryDriverById;

  factory CopyWith$Mutation$updateDeliveryDriverById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryDriverById;

  TRes call({
    Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk?
        update_delivery_driver_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk;
}

class _CopyWithImpl$Mutation$updateDeliveryDriverById<TRes>
    implements CopyWith$Mutation$updateDeliveryDriverById<TRes> {
  _CopyWithImpl$Mutation$updateDeliveryDriverById(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryDriverById _instance;

  final TRes Function(Mutation$updateDeliveryDriverById) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_driver_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryDriverById(
        update_delivery_driver_by_pk: update_delivery_driver_by_pk == _undefined
            ? _instance.update_delivery_driver_by_pk
            : (update_delivery_driver_by_pk
                as Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk {
    final local$update_delivery_driver_by_pk =
        _instance.update_delivery_driver_by_pk;
    return local$update_delivery_driver_by_pk == null
        ? CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
            local$update_delivery_driver_by_pk,
            (e) => call(update_delivery_driver_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryDriverById<TRes>
    implements CopyWith$Mutation$updateDeliveryDriverById<TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryDriverById(this._res);

  TRes _res;

  call({
    Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk?
        update_delivery_driver_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk =>
          CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDeliveryDriverById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDeliveryDriverById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverData')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_driver_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_driver_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'driverData')),
          ),
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
      
    ]),
  ),
]);
Mutation$updateDeliveryDriverById _parserFn$Mutation$updateDeliveryDriverById(
        Map<String, dynamic> data) =>
    Mutation$updateDeliveryDriverById.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDeliveryDriverById = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDeliveryDriverById?,
);

class Options$Mutation$updateDeliveryDriverById
    extends graphql.MutationOptions<Mutation$updateDeliveryDriverById> {
  Options$Mutation$updateDeliveryDriverById({
    String? operationName,
    required Variables$Mutation$updateDeliveryDriverById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDeliveryDriverById? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDeliveryDriverById>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateDeliveryDriverById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDeliveryDriverById,
          parserFn: _parserFn$Mutation$updateDeliveryDriverById,
        );

  final OnMutationCompleted$Mutation$updateDeliveryDriverById?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDeliveryDriverById
    extends graphql.WatchQueryOptions<Mutation$updateDeliveryDriverById> {
  WatchOptions$Mutation$updateDeliveryDriverById({
    String? operationName,
    required Variables$Mutation$updateDeliveryDriverById variables,
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
          document: documentNodeMutationupdateDeliveryDriverById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDeliveryDriverById,
        );
}

extension ClientExtension$Mutation$updateDeliveryDriverById
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDeliveryDriverById>>
      mutate$updateDeliveryDriverById(
              Options$Mutation$updateDeliveryDriverById options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDeliveryDriverById>
      watchMutation$updateDeliveryDriverById(
              WatchOptions$Mutation$updateDeliveryDriverById options) =>
          this.watchMutation(options);
}

class Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk {
  Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk({
    required this.id,
    required this.online,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$online = json['online'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
      id: (l$id as int),
      online: (l$online as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool online;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$online = online;
    _resultData['online'] = l$online;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$online = online;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk
    on Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk {
  CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
          Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
    Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk instance,
    TRes Function(
            Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk;

  factory CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk;

  TRes call({
    int? id,
    bool? online,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk
      _instance;

  final TRes Function(
      Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? online = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        online: online == _undefined || online == null
            ? _instance.online
            : (online as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? online,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getDriverOnlineStatus {
  factory Variables$Query$getDriverOnlineStatus({required int driverId}) =>
      Variables$Query$getDriverOnlineStatus._({
        r'driverId': driverId,
      });

  Variables$Query$getDriverOnlineStatus._(this._$data);

  factory Variables$Query$getDriverOnlineStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Query$getDriverOnlineStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Query$getDriverOnlineStatus<
          Variables$Query$getDriverOnlineStatus>
      get copyWith => CopyWith$Variables$Query$getDriverOnlineStatus(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDriverOnlineStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Query$getDriverOnlineStatus<TRes> {
  factory CopyWith$Variables$Query$getDriverOnlineStatus(
    Variables$Query$getDriverOnlineStatus instance,
    TRes Function(Variables$Query$getDriverOnlineStatus) then,
  ) = _CopyWithImpl$Variables$Query$getDriverOnlineStatus;

  factory CopyWith$Variables$Query$getDriverOnlineStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDriverOnlineStatus;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Query$getDriverOnlineStatus<TRes>
    implements CopyWith$Variables$Query$getDriverOnlineStatus<TRes> {
  _CopyWithImpl$Variables$Query$getDriverOnlineStatus(
    this._instance,
    this._then,
  );

  final Variables$Query$getDriverOnlineStatus _instance;

  final TRes Function(Variables$Query$getDriverOnlineStatus) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Query$getDriverOnlineStatus._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDriverOnlineStatus<TRes>
    implements CopyWith$Variables$Query$getDriverOnlineStatus<TRes> {
  _CopyWithStubImpl$Variables$Query$getDriverOnlineStatus(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Query$getDriverOnlineStatus {
  Query$getDriverOnlineStatus({
    this.delivery_driver_by_pk,
    required this.$__typename,
  });

  factory Query$getDriverOnlineStatus.fromJson(Map<String, dynamic> json) {
    final l$delivery_driver_by_pk = json['delivery_driver_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getDriverOnlineStatus(
      delivery_driver_by_pk: l$delivery_driver_by_pk == null
          ? null
          : Query$getDriverOnlineStatus$delivery_driver_by_pk.fromJson(
              (l$delivery_driver_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getDriverOnlineStatus$delivery_driver_by_pk?
      delivery_driver_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_driver_by_pk = delivery_driver_by_pk;
    _resultData['delivery_driver_by_pk'] = l$delivery_driver_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_driver_by_pk = delivery_driver_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_driver_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriverOnlineStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_driver_by_pk = delivery_driver_by_pk;
    final lOther$delivery_driver_by_pk = other.delivery_driver_by_pk;
    if (l$delivery_driver_by_pk != lOther$delivery_driver_by_pk) {
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

extension UtilityExtension$Query$getDriverOnlineStatus
    on Query$getDriverOnlineStatus {
  CopyWith$Query$getDriverOnlineStatus<Query$getDriverOnlineStatus>
      get copyWith => CopyWith$Query$getDriverOnlineStatus(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriverOnlineStatus<TRes> {
  factory CopyWith$Query$getDriverOnlineStatus(
    Query$getDriverOnlineStatus instance,
    TRes Function(Query$getDriverOnlineStatus) then,
  ) = _CopyWithImpl$Query$getDriverOnlineStatus;

  factory CopyWith$Query$getDriverOnlineStatus.stub(TRes res) =
      _CopyWithStubImpl$Query$getDriverOnlineStatus;

  TRes call({
    Query$getDriverOnlineStatus$delivery_driver_by_pk? delivery_driver_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes>
      get delivery_driver_by_pk;
}

class _CopyWithImpl$Query$getDriverOnlineStatus<TRes>
    implements CopyWith$Query$getDriverOnlineStatus<TRes> {
  _CopyWithImpl$Query$getDriverOnlineStatus(
    this._instance,
    this._then,
  );

  final Query$getDriverOnlineStatus _instance;

  final TRes Function(Query$getDriverOnlineStatus) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_driver_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriverOnlineStatus(
        delivery_driver_by_pk: delivery_driver_by_pk == _undefined
            ? _instance.delivery_driver_by_pk
            : (delivery_driver_by_pk
                as Query$getDriverOnlineStatus$delivery_driver_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes>
      get delivery_driver_by_pk {
    final local$delivery_driver_by_pk = _instance.delivery_driver_by_pk;
    return local$delivery_driver_by_pk == null
        ? CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk(
            local$delivery_driver_by_pk, (e) => call(delivery_driver_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getDriverOnlineStatus<TRes>
    implements CopyWith$Query$getDriverOnlineStatus<TRes> {
  _CopyWithStubImpl$Query$getDriverOnlineStatus(this._res);

  TRes _res;

  call({
    Query$getDriverOnlineStatus$delivery_driver_by_pk? delivery_driver_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes>
      get delivery_driver_by_pk =>
          CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk.stub(_res);
}

const documentNodeQuerygetDriverOnlineStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDriverOnlineStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
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
        name: NameNode(value: 'delivery_driver_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '10'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
      
    ]),
  ),
]);
Query$getDriverOnlineStatus _parserFn$Query$getDriverOnlineStatus(
        Map<String, dynamic> data) =>
    Query$getDriverOnlineStatus.fromJson(data);

class Options$Query$getDriverOnlineStatus
    extends graphql.QueryOptions<Query$getDriverOnlineStatus> {
  Options$Query$getDriverOnlineStatus({
    String? operationName,
    required Variables$Query$getDriverOnlineStatus variables,
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
          document: documentNodeQuerygetDriverOnlineStatus,
          parserFn: _parserFn$Query$getDriverOnlineStatus,
        );
}

class WatchOptions$Query$getDriverOnlineStatus
    extends graphql.WatchQueryOptions<Query$getDriverOnlineStatus> {
  WatchOptions$Query$getDriverOnlineStatus({
    String? operationName,
    required Variables$Query$getDriverOnlineStatus variables,
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
          document: documentNodeQuerygetDriverOnlineStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDriverOnlineStatus,
        );
}

class FetchMoreOptions$Query$getDriverOnlineStatus
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDriverOnlineStatus({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDriverOnlineStatus variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDriverOnlineStatus,
        );
}

extension ClientExtension$Query$getDriverOnlineStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDriverOnlineStatus>>
      query$getDriverOnlineStatus(
              Options$Query$getDriverOnlineStatus options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDriverOnlineStatus>
      watchQuery$getDriverOnlineStatus(
              WatchOptions$Query$getDriverOnlineStatus options) =>
          this.watchQuery(options);
  void writeQuery$getDriverOnlineStatus({
    required Query$getDriverOnlineStatus data,
    required Variables$Query$getDriverOnlineStatus variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDriverOnlineStatus),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDriverOnlineStatus? readQuery$getDriverOnlineStatus({
    required Variables$Query$getDriverOnlineStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetDriverOnlineStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDriverOnlineStatus.fromJson(result);
  }
}

class Query$getDriverOnlineStatus$delivery_driver_by_pk {
  Query$getDriverOnlineStatus$delivery_driver_by_pk({
    required this.online,
    required this.$__typename,
  });

  factory Query$getDriverOnlineStatus$delivery_driver_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$online = json['online'];
    final l$$__typename = json['__typename'];
    return Query$getDriverOnlineStatus$delivery_driver_by_pk(
      online: (l$online as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool online;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$online = online;
    _resultData['online'] = l$online;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$online = online;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$online,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDriverOnlineStatus$delivery_driver_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getDriverOnlineStatus$delivery_driver_by_pk
    on Query$getDriverOnlineStatus$delivery_driver_by_pk {
  CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<
          Query$getDriverOnlineStatus$delivery_driver_by_pk>
      get copyWith =>
          CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<
    TRes> {
  factory CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk(
    Query$getDriverOnlineStatus$delivery_driver_by_pk instance,
    TRes Function(Query$getDriverOnlineStatus$delivery_driver_by_pk) then,
  ) = _CopyWithImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk;

  factory CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk;

  TRes call({
    bool? online,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes>
    implements
        CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes> {
  _CopyWithImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk(
    this._instance,
    this._then,
  );

  final Query$getDriverOnlineStatus$delivery_driver_by_pk _instance;

  final TRes Function(Query$getDriverOnlineStatus$delivery_driver_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? online = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDriverOnlineStatus$delivery_driver_by_pk(
        online: online == _undefined || online == null
            ? _instance.online
            : (online as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes>
    implements
        CopyWith$Query$getDriverOnlineStatus$delivery_driver_by_pk<TRes> {
  _CopyWithStubImpl$Query$getDriverOnlineStatus$delivery_driver_by_pk(
      this._res);

  TRes _res;

  call({
    bool? online,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteDriverById {
  factory Variables$Mutation$deleteDriverById({required int driverId}) =>
      Variables$Mutation$deleteDriverById._({
        r'driverId': driverId,
      });

  Variables$Mutation$deleteDriverById._(this._$data);

  factory Variables$Mutation$deleteDriverById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Mutation$deleteDriverById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteDriverById<
          Variables$Mutation$deleteDriverById>
      get copyWith => CopyWith$Variables$Mutation$deleteDriverById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteDriverById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteDriverById<TRes> {
  factory CopyWith$Variables$Mutation$deleteDriverById(
    Variables$Mutation$deleteDriverById instance,
    TRes Function(Variables$Mutation$deleteDriverById) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteDriverById;

  factory CopyWith$Variables$Mutation$deleteDriverById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteDriverById;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Mutation$deleteDriverById<TRes>
    implements CopyWith$Variables$Mutation$deleteDriverById<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteDriverById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteDriverById _instance;

  final TRes Function(Variables$Mutation$deleteDriverById) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Mutation$deleteDriverById._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteDriverById<TRes>
    implements CopyWith$Variables$Mutation$deleteDriverById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteDriverById(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Mutation$deleteDriverById {
  Mutation$deleteDriverById({
    this.delete_delivery_driver_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteDriverById.fromJson(Map<String, dynamic> json) {
    final l$delete_delivery_driver_by_pk = json['delete_delivery_driver_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteDriverById(
      delete_delivery_driver_by_pk: l$delete_delivery_driver_by_pk == null
          ? null
          : Mutation$deleteDriverById$delete_delivery_driver_by_pk.fromJson(
              (l$delete_delivery_driver_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteDriverById$delete_delivery_driver_by_pk?
      delete_delivery_driver_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_delivery_driver_by_pk = delete_delivery_driver_by_pk;
    _resultData['delete_delivery_driver_by_pk'] =
        l$delete_delivery_driver_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_delivery_driver_by_pk = delete_delivery_driver_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_delivery_driver_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteDriverById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_delivery_driver_by_pk = delete_delivery_driver_by_pk;
    final lOther$delete_delivery_driver_by_pk =
        other.delete_delivery_driver_by_pk;
    if (l$delete_delivery_driver_by_pk != lOther$delete_delivery_driver_by_pk) {
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

extension UtilityExtension$Mutation$deleteDriverById
    on Mutation$deleteDriverById {
  CopyWith$Mutation$deleteDriverById<Mutation$deleteDriverById> get copyWith =>
      CopyWith$Mutation$deleteDriverById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteDriverById<TRes> {
  factory CopyWith$Mutation$deleteDriverById(
    Mutation$deleteDriverById instance,
    TRes Function(Mutation$deleteDriverById) then,
  ) = _CopyWithImpl$Mutation$deleteDriverById;

  factory CopyWith$Mutation$deleteDriverById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteDriverById;

  TRes call({
    Mutation$deleteDriverById$delete_delivery_driver_by_pk?
        delete_delivery_driver_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes>
      get delete_delivery_driver_by_pk;
}

class _CopyWithImpl$Mutation$deleteDriverById<TRes>
    implements CopyWith$Mutation$deleteDriverById<TRes> {
  _CopyWithImpl$Mutation$deleteDriverById(
    this._instance,
    this._then,
  );

  final Mutation$deleteDriverById _instance;

  final TRes Function(Mutation$deleteDriverById) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_delivery_driver_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteDriverById(
        delete_delivery_driver_by_pk: delete_delivery_driver_by_pk == _undefined
            ? _instance.delete_delivery_driver_by_pk
            : (delete_delivery_driver_by_pk
                as Mutation$deleteDriverById$delete_delivery_driver_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes>
      get delete_delivery_driver_by_pk {
    final local$delete_delivery_driver_by_pk =
        _instance.delete_delivery_driver_by_pk;
    return local$delete_delivery_driver_by_pk == null
        ? CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk(
            local$delete_delivery_driver_by_pk,
            (e) => call(delete_delivery_driver_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteDriverById<TRes>
    implements CopyWith$Mutation$deleteDriverById<TRes> {
  _CopyWithStubImpl$Mutation$deleteDriverById(this._res);

  TRes _res;

  call({
    Mutation$deleteDriverById$delete_delivery_driver_by_pk?
        delete_delivery_driver_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes>
      get delete_delivery_driver_by_pk =>
          CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk.stub(
              _res);
}

const documentNodeMutationdeleteDriverById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteDriverById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
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
        name: NameNode(value: 'delete_delivery_driver_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'driverId')),
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
            name: NameNode(value: 'user'),
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
                name: NameNode(value: 'image'),
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
Mutation$deleteDriverById _parserFn$Mutation$deleteDriverById(
        Map<String, dynamic> data) =>
    Mutation$deleteDriverById.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteDriverById = FutureOr<void> Function(
  dynamic,
  Mutation$deleteDriverById?,
);

class Options$Mutation$deleteDriverById
    extends graphql.MutationOptions<Mutation$deleteDriverById> {
  Options$Mutation$deleteDriverById({
    String? operationName,
    required Variables$Mutation$deleteDriverById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteDriverById? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteDriverById>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$deleteDriverById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteDriverById,
          parserFn: _parserFn$Mutation$deleteDriverById,
        );

  final OnMutationCompleted$Mutation$deleteDriverById? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteDriverById
    extends graphql.WatchQueryOptions<Mutation$deleteDriverById> {
  WatchOptions$Mutation$deleteDriverById({
    String? operationName,
    required Variables$Mutation$deleteDriverById variables,
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
          document: documentNodeMutationdeleteDriverById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteDriverById,
        );
}

extension ClientExtension$Mutation$deleteDriverById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteDriverById>>
      mutate$deleteDriverById(
              Options$Mutation$deleteDriverById options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteDriverById>
      watchMutation$deleteDriverById(
              WatchOptions$Mutation$deleteDriverById options) =>
          this.watchMutation(options);
}

class Mutation$deleteDriverById$delete_delivery_driver_by_pk {
  Mutation$deleteDriverById$delete_delivery_driver_by_pk({
    required this.id,
    required this.user,
    required this.$__typename,
  });

  factory Mutation$deleteDriverById$delete_delivery_driver_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteDriverById$delete_delivery_driver_by_pk(
      id: (l$id as int),
      user:
          Mutation$deleteDriverById$delete_delivery_driver_by_pk$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Mutation$deleteDriverById$delete_delivery_driver_by_pk$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteDriverById$delete_delivery_driver_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$deleteDriverById$delete_delivery_driver_by_pk
    on Mutation$deleteDriverById$delete_delivery_driver_by_pk {
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<
          Mutation$deleteDriverById$delete_delivery_driver_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk(
    Mutation$deleteDriverById$delete_delivery_driver_by_pk instance,
    TRes Function(Mutation$deleteDriverById$delete_delivery_driver_by_pk) then,
  ) = _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk;

  factory CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk;

  TRes call({
    int? id,
    Mutation$deleteDriverById$delete_delivery_driver_by_pk$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<TRes>
      get user;
}

class _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes>
    implements
        CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes> {
  _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteDriverById$delete_delivery_driver_by_pk _instance;

  final TRes Function(Mutation$deleteDriverById$delete_delivery_driver_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteDriverById$delete_delivery_driver_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Mutation$deleteDriverById$delete_delivery_driver_by_pk$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    Mutation$deleteDriverById$delete_delivery_driver_by_pk$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<TRes>
      get user =>
          CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user
              .stub(_res);
}

class Mutation$deleteDriverById$delete_delivery_driver_by_pk$user {
  Mutation$deleteDriverById$delete_delivery_driver_by_pk$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Mutation$deleteDriverById$delete_delivery_driver_by_pk$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$deleteDriverById$delete_delivery_driver_by_pk$user) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user
    on Mutation$deleteDriverById$delete_delivery_driver_by_pk$user {
  CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
          Mutation$deleteDriverById$delete_delivery_driver_by_pk$user>
      get copyWith =>
          CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
    TRes> {
  factory CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
    Mutation$deleteDriverById$delete_delivery_driver_by_pk$user instance,
    TRes Function(Mutation$deleteDriverById$delete_delivery_driver_by_pk$user)
        then,
  ) = _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user;

  factory CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
        TRes>
    implements
        CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
            TRes> {
  _CopyWithImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
    this._instance,
    this._then,
  );

  final Mutation$deleteDriverById$delete_delivery_driver_by_pk$user _instance;

  final TRes Function(
      Mutation$deleteDriverById$delete_delivery_driver_by_pk$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
        TRes>
    implements
        CopyWith$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteDriverById$delete_delivery_driver_by_pk$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$driverStatusStream {
  factory Variables$Subscription$driverStatusStream({required int userId}) =>
      Variables$Subscription$driverStatusStream._({
        r'userId': userId,
      });

  Variables$Subscription$driverStatusStream._(this._$data);

  factory Variables$Subscription$driverStatusStream.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Subscription$driverStatusStream._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Subscription$driverStatusStream<
          Variables$Subscription$driverStatusStream>
      get copyWith => CopyWith$Variables$Subscription$driverStatusStream(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$driverStatusStream) ||
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

abstract class CopyWith$Variables$Subscription$driverStatusStream<TRes> {
  factory CopyWith$Variables$Subscription$driverStatusStream(
    Variables$Subscription$driverStatusStream instance,
    TRes Function(Variables$Subscription$driverStatusStream) then,
  ) = _CopyWithImpl$Variables$Subscription$driverStatusStream;

  factory CopyWith$Variables$Subscription$driverStatusStream.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$driverStatusStream;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Subscription$driverStatusStream<TRes>
    implements CopyWith$Variables$Subscription$driverStatusStream<TRes> {
  _CopyWithImpl$Variables$Subscription$driverStatusStream(
    this._instance,
    this._then,
  );

  final Variables$Subscription$driverStatusStream _instance;

  final TRes Function(Variables$Subscription$driverStatusStream) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Subscription$driverStatusStream._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$driverStatusStream<TRes>
    implements CopyWith$Variables$Subscription$driverStatusStream<TRes> {
  _CopyWithStubImpl$Variables$Subscription$driverStatusStream(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Subscription$driverStatusStream {
  Subscription$driverStatusStream({
    required this.delivery_driver,
    required this.$__typename,
  });

  factory Subscription$driverStatusStream.fromJson(Map<String, dynamic> json) {
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Subscription$driverStatusStream(
      delivery_driver: (l$delivery_driver as List<dynamic>)
          .map((e) => Subscription$driverStatusStream$delivery_driver.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$driverStatusStream$delivery_driver> delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] =
        l$delivery_driver.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_driver.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$driverStatusStream) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver.length != lOther$delivery_driver.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_driver.length; i++) {
      final l$delivery_driver$entry = l$delivery_driver[i];
      final lOther$delivery_driver$entry = lOther$delivery_driver[i];
      if (l$delivery_driver$entry != lOther$delivery_driver$entry) {
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

extension UtilityExtension$Subscription$driverStatusStream
    on Subscription$driverStatusStream {
  CopyWith$Subscription$driverStatusStream<Subscription$driverStatusStream>
      get copyWith => CopyWith$Subscription$driverStatusStream(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$driverStatusStream<TRes> {
  factory CopyWith$Subscription$driverStatusStream(
    Subscription$driverStatusStream instance,
    TRes Function(Subscription$driverStatusStream) then,
  ) = _CopyWithImpl$Subscription$driverStatusStream;

  factory CopyWith$Subscription$driverStatusStream.stub(TRes res) =
      _CopyWithStubImpl$Subscription$driverStatusStream;

  TRes call({
    List<Subscription$driverStatusStream$delivery_driver>? delivery_driver,
    String? $__typename,
  });
  TRes delivery_driver(
      Iterable<Subscription$driverStatusStream$delivery_driver> Function(
              Iterable<
                  CopyWith$Subscription$driverStatusStream$delivery_driver<
                      Subscription$driverStatusStream$delivery_driver>>)
          _fn);
}

class _CopyWithImpl$Subscription$driverStatusStream<TRes>
    implements CopyWith$Subscription$driverStatusStream<TRes> {
  _CopyWithImpl$Subscription$driverStatusStream(
    this._instance,
    this._then,
  );

  final Subscription$driverStatusStream _instance;

  final TRes Function(Subscription$driverStatusStream) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$driverStatusStream(
        delivery_driver:
            delivery_driver == _undefined || delivery_driver == null
                ? _instance.delivery_driver
                : (delivery_driver
                    as List<Subscription$driverStatusStream$delivery_driver>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_driver(
          Iterable<Subscription$driverStatusStream$delivery_driver> Function(
                  Iterable<
                      CopyWith$Subscription$driverStatusStream$delivery_driver<
                          Subscription$driverStatusStream$delivery_driver>>)
              _fn) =>
      call(
          delivery_driver: _fn(_instance.delivery_driver.map(
              (e) => CopyWith$Subscription$driverStatusStream$delivery_driver(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$driverStatusStream<TRes>
    implements CopyWith$Subscription$driverStatusStream<TRes> {
  _CopyWithStubImpl$Subscription$driverStatusStream(this._res);

  TRes _res;

  call({
    List<Subscription$driverStatusStream$delivery_driver>? delivery_driver,
    String? $__typename,
  }) =>
      _res;
  delivery_driver(_fn) => _res;
}

const documentNodeSubscriptiondriverStatusStream = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'driverStatusStream'),
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
        name: NameNode(value: 'delivery_driver'),
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
Subscription$driverStatusStream _parserFn$Subscription$driverStatusStream(
        Map<String, dynamic> data) =>
    Subscription$driverStatusStream.fromJson(data);

class Options$Subscription$driverStatusStream
    extends graphql.SubscriptionOptions<Subscription$driverStatusStream> {
  Options$Subscription$driverStatusStream({
    String? operationName,
    required Variables$Subscription$driverStatusStream variables,
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
          document: documentNodeSubscriptiondriverStatusStream,
          parserFn: _parserFn$Subscription$driverStatusStream,
        );
}

class WatchOptions$Subscription$driverStatusStream
    extends graphql.WatchQueryOptions<Subscription$driverStatusStream> {
  WatchOptions$Subscription$driverStatusStream({
    String? operationName,
    required Variables$Subscription$driverStatusStream variables,
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
          document: documentNodeSubscriptiondriverStatusStream,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$driverStatusStream,
        );
}

class FetchMoreOptions$Subscription$driverStatusStream
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$driverStatusStream({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$driverStatusStream variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptiondriverStatusStream,
        );
}

extension ClientExtension$Subscription$driverStatusStream
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$driverStatusStream>>
      subscribe$driverStatusStream(
              Options$Subscription$driverStatusStream options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$driverStatusStream>
      watchSubscription$driverStatusStream(
              WatchOptions$Subscription$driverStatusStream options) =>
          this.watchQuery(options);
}

class Subscription$driverStatusStream$delivery_driver {
  Subscription$driverStatusStream$delivery_driver({
    required this.status,
    required this.$__typename,
  });

  factory Subscription$driverStatusStream$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Subscription$driverStatusStream$delivery_driver(
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
    if (!(other is Subscription$driverStatusStream$delivery_driver) ||
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

extension UtilityExtension$Subscription$driverStatusStream$delivery_driver
    on Subscription$driverStatusStream$delivery_driver {
  CopyWith$Subscription$driverStatusStream$delivery_driver<
          Subscription$driverStatusStream$delivery_driver>
      get copyWith => CopyWith$Subscription$driverStatusStream$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$driverStatusStream$delivery_driver<TRes> {
  factory CopyWith$Subscription$driverStatusStream$delivery_driver(
    Subscription$driverStatusStream$delivery_driver instance,
    TRes Function(Subscription$driverStatusStream$delivery_driver) then,
  ) = _CopyWithImpl$Subscription$driverStatusStream$delivery_driver;

  factory CopyWith$Subscription$driverStatusStream$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$driverStatusStream$delivery_driver;

  TRes call({
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$driverStatusStream$delivery_driver<TRes>
    implements CopyWith$Subscription$driverStatusStream$delivery_driver<TRes> {
  _CopyWithImpl$Subscription$driverStatusStream$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$driverStatusStream$delivery_driver _instance;

  final TRes Function(Subscription$driverStatusStream$delivery_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$driverStatusStream$delivery_driver(
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$driverStatusStream$delivery_driver<TRes>
    implements CopyWith$Subscription$driverStatusStream$delivery_driver<TRes> {
  _CopyWithStubImpl$Subscription$driverStatusStream$delivery_driver(this._res);

  TRes _res;

  call({
    String? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDriverLocation {
  factory Variables$Mutation$updateDriverLocation({
    required int driverId,
    required Input$delivery_driver_set_input data,
  }) =>
      Variables$Mutation$updateDriverLocation._({
        r'driverId': driverId,
        r'data': data,
      });

  Variables$Mutation$updateDriverLocation._(this._$data);

  factory Variables$Mutation$updateDriverLocation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    final l$data = data['data'];
    result$data['data'] = Input$delivery_driver_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateDriverLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Input$delivery_driver_set_input get data =>
      (_$data['data'] as Input$delivery_driver_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDriverLocation<
          Variables$Mutation$updateDriverLocation>
      get copyWith => CopyWith$Variables$Mutation$updateDriverLocation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDriverLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    final l$data = data;
    return Object.hashAll([
      l$driverId,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDriverLocation<TRes> {
  factory CopyWith$Variables$Mutation$updateDriverLocation(
    Variables$Mutation$updateDriverLocation instance,
    TRes Function(Variables$Mutation$updateDriverLocation) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDriverLocation;

  factory CopyWith$Variables$Mutation$updateDriverLocation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDriverLocation;

  TRes call({
    int? driverId,
    Input$delivery_driver_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDriverLocation<TRes>
    implements CopyWith$Variables$Mutation$updateDriverLocation<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDriverLocation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDriverLocation _instance;

  final TRes Function(Variables$Mutation$updateDriverLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? driverId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateDriverLocation._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
        if (data != _undefined && data != null)
          'data': (data as Input$delivery_driver_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDriverLocation<TRes>
    implements CopyWith$Variables$Mutation$updateDriverLocation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDriverLocation(this._res);

  TRes _res;

  call({
    int? driverId,
    Input$delivery_driver_set_input? data,
  }) =>
      _res;
}

class Mutation$updateDriverLocation {
  Mutation$updateDriverLocation({
    this.update_delivery_driver_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDriverLocation.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_driver_by_pk = json['update_delivery_driver_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDriverLocation(
      update_delivery_driver_by_pk: l$update_delivery_driver_by_pk == null
          ? null
          : Mutation$updateDriverLocation$update_delivery_driver_by_pk.fromJson(
              (l$update_delivery_driver_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDriverLocation$update_delivery_driver_by_pk?
      update_delivery_driver_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    _resultData['update_delivery_driver_by_pk'] =
        l$update_delivery_driver_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_driver_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDriverLocation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_driver_by_pk = update_delivery_driver_by_pk;
    final lOther$update_delivery_driver_by_pk =
        other.update_delivery_driver_by_pk;
    if (l$update_delivery_driver_by_pk != lOther$update_delivery_driver_by_pk) {
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

extension UtilityExtension$Mutation$updateDriverLocation
    on Mutation$updateDriverLocation {
  CopyWith$Mutation$updateDriverLocation<Mutation$updateDriverLocation>
      get copyWith => CopyWith$Mutation$updateDriverLocation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDriverLocation<TRes> {
  factory CopyWith$Mutation$updateDriverLocation(
    Mutation$updateDriverLocation instance,
    TRes Function(Mutation$updateDriverLocation) then,
  ) = _CopyWithImpl$Mutation$updateDriverLocation;

  factory CopyWith$Mutation$updateDriverLocation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDriverLocation;

  TRes call({
    Mutation$updateDriverLocation$update_delivery_driver_by_pk?
        update_delivery_driver_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk;
}

class _CopyWithImpl$Mutation$updateDriverLocation<TRes>
    implements CopyWith$Mutation$updateDriverLocation<TRes> {
  _CopyWithImpl$Mutation$updateDriverLocation(
    this._instance,
    this._then,
  );

  final Mutation$updateDriverLocation _instance;

  final TRes Function(Mutation$updateDriverLocation) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_driver_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDriverLocation(
        update_delivery_driver_by_pk: update_delivery_driver_by_pk == _undefined
            ? _instance.update_delivery_driver_by_pk
            : (update_delivery_driver_by_pk
                as Mutation$updateDriverLocation$update_delivery_driver_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk {
    final local$update_delivery_driver_by_pk =
        _instance.update_delivery_driver_by_pk;
    return local$update_delivery_driver_by_pk == null
        ? CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk(
            local$update_delivery_driver_by_pk,
            (e) => call(update_delivery_driver_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDriverLocation<TRes>
    implements CopyWith$Mutation$updateDriverLocation<TRes> {
  _CopyWithStubImpl$Mutation$updateDriverLocation(this._res);

  TRes _res;

  call({
    Mutation$updateDriverLocation$update_delivery_driver_by_pk?
        update_delivery_driver_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<TRes>
      get update_delivery_driver_by_pk =>
          CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDriverLocation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDriverLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_driver_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_driver_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'current_location'),
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
Mutation$updateDriverLocation _parserFn$Mutation$updateDriverLocation(
        Map<String, dynamic> data) =>
    Mutation$updateDriverLocation.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDriverLocation = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDriverLocation?,
);

class Options$Mutation$updateDriverLocation
    extends graphql.MutationOptions<Mutation$updateDriverLocation> {
  Options$Mutation$updateDriverLocation({
    String? operationName,
    required Variables$Mutation$updateDriverLocation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDriverLocation? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDriverLocation>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateDriverLocation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDriverLocation,
          parserFn: _parserFn$Mutation$updateDriverLocation,
        );

  final OnMutationCompleted$Mutation$updateDriverLocation?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDriverLocation
    extends graphql.WatchQueryOptions<Mutation$updateDriverLocation> {
  WatchOptions$Mutation$updateDriverLocation({
    String? operationName,
    required Variables$Mutation$updateDriverLocation variables,
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
          document: documentNodeMutationupdateDriverLocation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDriverLocation,
        );
}

extension ClientExtension$Mutation$updateDriverLocation
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDriverLocation>>
      mutate$updateDriverLocation(
              Options$Mutation$updateDriverLocation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDriverLocation>
      watchMutation$updateDriverLocation(
              WatchOptions$Mutation$updateDriverLocation options) =>
          this.watchMutation(options);
}

class Mutation$updateDriverLocation$update_delivery_driver_by_pk {
  Mutation$updateDriverLocation$update_delivery_driver_by_pk({
    this.current_location,
    required this.$__typename,
  });

  factory Mutation$updateDriverLocation$update_delivery_driver_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$current_location = json['current_location'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDriverLocation$update_delivery_driver_by_pk(
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography? current_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$current_location = current_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$current_location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateDriverLocation$update_delivery_driver_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
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

extension UtilityExtension$Mutation$updateDriverLocation$update_delivery_driver_by_pk
    on Mutation$updateDriverLocation$update_delivery_driver_by_pk {
  CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
          Mutation$updateDriverLocation$update_delivery_driver_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk(
    Mutation$updateDriverLocation$update_delivery_driver_by_pk instance,
    TRes Function(Mutation$updateDriverLocation$update_delivery_driver_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk;

  factory CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk;

  TRes call({
    Geography? current_location,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDriverLocation$update_delivery_driver_by_pk _instance;

  final TRes Function(
      Mutation$updateDriverLocation$update_delivery_driver_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? current_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDriverLocation$update_delivery_driver_by_pk(
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDriverLocation$update_delivery_driver_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDriverLocation$update_delivery_driver_by_pk(
      this._res);

  TRes _res;

  call({
    Geography? current_location,
    String? $__typename,
  }) =>
      _res;
}
