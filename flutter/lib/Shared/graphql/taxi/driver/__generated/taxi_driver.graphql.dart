import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getTaxiDriversByUserId {
  factory Variables$Query$getTaxiDriversByUserId({required int userId}) =>
      Variables$Query$getTaxiDriversByUserId._({
        r'userId': userId,
      });

  Variables$Query$getTaxiDriversByUserId._(this._$data);

  factory Variables$Query$getTaxiDriversByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$getTaxiDriversByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getTaxiDriversByUserId<
          Variables$Query$getTaxiDriversByUserId>
      get copyWith => CopyWith$Variables$Query$getTaxiDriversByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getTaxiDriversByUserId) ||
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

abstract class CopyWith$Variables$Query$getTaxiDriversByUserId<TRes> {
  factory CopyWith$Variables$Query$getTaxiDriversByUserId(
    Variables$Query$getTaxiDriversByUserId instance,
    TRes Function(Variables$Query$getTaxiDriversByUserId) then,
  ) = _CopyWithImpl$Variables$Query$getTaxiDriversByUserId;

  factory CopyWith$Variables$Query$getTaxiDriversByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getTaxiDriversByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$getTaxiDriversByUserId<TRes>
    implements CopyWith$Variables$Query$getTaxiDriversByUserId<TRes> {
  _CopyWithImpl$Variables$Query$getTaxiDriversByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$getTaxiDriversByUserId _instance;

  final TRes Function(Variables$Query$getTaxiDriversByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getTaxiDriversByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getTaxiDriversByUserId<TRes>
    implements CopyWith$Variables$Query$getTaxiDriversByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$getTaxiDriversByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$getTaxiDriversByUserId {
  Query$getTaxiDriversByUserId({
    required this.taxi_driver,
    required this.$__typename,
  });

  factory Query$getTaxiDriversByUserId.fromJson(Map<String, dynamic> json) {
    final l$taxi_driver = json['taxi_driver'];
    final l$$__typename = json['__typename'];
    return Query$getTaxiDriversByUserId(
      taxi_driver: (l$taxi_driver as List<dynamic>)
          .map((e) => Query$getTaxiDriversByUserId$taxi_driver.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getTaxiDriversByUserId$taxi_driver> taxi_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$taxi_driver = taxi_driver;
    _resultData['taxi_driver'] = l$taxi_driver.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$taxi_driver = taxi_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$taxi_driver.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getTaxiDriversByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$taxi_driver = taxi_driver;
    final lOther$taxi_driver = other.taxi_driver;
    if (l$taxi_driver.length != lOther$taxi_driver.length) {
      return false;
    }
    for (int i = 0; i < l$taxi_driver.length; i++) {
      final l$taxi_driver$entry = l$taxi_driver[i];
      final lOther$taxi_driver$entry = lOther$taxi_driver[i];
      if (l$taxi_driver$entry != lOther$taxi_driver$entry) {
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

extension UtilityExtension$Query$getTaxiDriversByUserId
    on Query$getTaxiDriversByUserId {
  CopyWith$Query$getTaxiDriversByUserId<Query$getTaxiDriversByUserId>
      get copyWith => CopyWith$Query$getTaxiDriversByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getTaxiDriversByUserId<TRes> {
  factory CopyWith$Query$getTaxiDriversByUserId(
    Query$getTaxiDriversByUserId instance,
    TRes Function(Query$getTaxiDriversByUserId) then,
  ) = _CopyWithImpl$Query$getTaxiDriversByUserId;

  factory CopyWith$Query$getTaxiDriversByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$getTaxiDriversByUserId;

  TRes call({
    List<Query$getTaxiDriversByUserId$taxi_driver>? taxi_driver,
    String? $__typename,
  });
  TRes taxi_driver(
      Iterable<Query$getTaxiDriversByUserId$taxi_driver> Function(
              Iterable<
                  CopyWith$Query$getTaxiDriversByUserId$taxi_driver<
                      Query$getTaxiDriversByUserId$taxi_driver>>)
          _fn);
}

class _CopyWithImpl$Query$getTaxiDriversByUserId<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId<TRes> {
  _CopyWithImpl$Query$getTaxiDriversByUserId(
    this._instance,
    this._then,
  );

  final Query$getTaxiDriversByUserId _instance;

  final TRes Function(Query$getTaxiDriversByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? taxi_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getTaxiDriversByUserId(
        taxi_driver: taxi_driver == _undefined || taxi_driver == null
            ? _instance.taxi_driver
            : (taxi_driver as List<Query$getTaxiDriversByUserId$taxi_driver>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes taxi_driver(
          Iterable<Query$getTaxiDriversByUserId$taxi_driver> Function(
                  Iterable<
                      CopyWith$Query$getTaxiDriversByUserId$taxi_driver<
                          Query$getTaxiDriversByUserId$taxi_driver>>)
              _fn) =>
      call(
          taxi_driver: _fn(_instance.taxi_driver
              .map((e) => CopyWith$Query$getTaxiDriversByUserId$taxi_driver(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getTaxiDriversByUserId<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId<TRes> {
  _CopyWithStubImpl$Query$getTaxiDriversByUserId(this._res);

  TRes _res;

  call({
    List<Query$getTaxiDriversByUserId$taxi_driver>? taxi_driver,
    String? $__typename,
  }) =>
      _res;
  taxi_driver(_fn) => _res;
}

const documentNodeQuerygetTaxiDriversByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getTaxiDriversByUserId'),
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
        name: NameNode(value: 'taxi_driver'),
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
Query$getTaxiDriversByUserId _parserFn$Query$getTaxiDriversByUserId(
        Map<String, dynamic> data) =>
    Query$getTaxiDriversByUserId.fromJson(data);

class Options$Query$getTaxiDriversByUserId
    extends graphql.QueryOptions<Query$getTaxiDriversByUserId> {
  Options$Query$getTaxiDriversByUserId({
    String? operationName,
    required Variables$Query$getTaxiDriversByUserId variables,
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
          document: documentNodeQuerygetTaxiDriversByUserId,
          parserFn: _parserFn$Query$getTaxiDriversByUserId,
        );
}

class WatchOptions$Query$getTaxiDriversByUserId
    extends graphql.WatchQueryOptions<Query$getTaxiDriversByUserId> {
  WatchOptions$Query$getTaxiDriversByUserId({
    String? operationName,
    required Variables$Query$getTaxiDriversByUserId variables,
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
          document: documentNodeQuerygetTaxiDriversByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getTaxiDriversByUserId,
        );
}

class FetchMoreOptions$Query$getTaxiDriversByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getTaxiDriversByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getTaxiDriversByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetTaxiDriversByUserId,
        );
}

extension ClientExtension$Query$getTaxiDriversByUserId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getTaxiDriversByUserId>>
      query$getTaxiDriversByUserId(
              Options$Query$getTaxiDriversByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getTaxiDriversByUserId>
      watchQuery$getTaxiDriversByUserId(
              WatchOptions$Query$getTaxiDriversByUserId options) =>
          this.watchQuery(options);
  void writeQuery$getTaxiDriversByUserId({
    required Query$getTaxiDriversByUserId data,
    required Variables$Query$getTaxiDriversByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetTaxiDriversByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getTaxiDriversByUserId? readQuery$getTaxiDriversByUserId({
    required Variables$Query$getTaxiDriversByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetTaxiDriversByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getTaxiDriversByUserId.fromJson(result);
  }
}

class Query$getTaxiDriversByUserId$taxi_driver {
  Query$getTaxiDriversByUserId$taxi_driver({
    this.app_version,
    this.current_location,
    this.delivery_company_type,
    this.delivery_company_id,
    this.id,
    this.online,
    this.status,
    this.user,
    required this.$__typename,
  });

  factory Query$getTaxiDriversByUserId$taxi_driver.fromJson(
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
    return Query$getTaxiDriversByUserId$taxi_driver(
      app_version: (l$app_version as String?),
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      delivery_company_type: (l$delivery_company_type as String?),
      delivery_company_id: (l$delivery_company_id as int?),
      id: (l$id as int?),
      online: (l$online as bool?),
      status: (l$status as String?),
      user: l$user == null
          ? null
          : Query$getTaxiDriversByUserId$taxi_driver$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final Geography? current_location;

  final String? delivery_company_type;

  final int? delivery_company_id;

  final int? id;

  final bool? online;

  final String? status;

  final Query$getTaxiDriversByUserId$taxi_driver$user? user;

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
    _resultData['user'] = l$user?.toJson();
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
    if (!(other is Query$getTaxiDriversByUserId$taxi_driver) ||
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

extension UtilityExtension$Query$getTaxiDriversByUserId$taxi_driver
    on Query$getTaxiDriversByUserId$taxi_driver {
  CopyWith$Query$getTaxiDriversByUserId$taxi_driver<
          Query$getTaxiDriversByUserId$taxi_driver>
      get copyWith => CopyWith$Query$getTaxiDriversByUserId$taxi_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getTaxiDriversByUserId$taxi_driver<TRes> {
  factory CopyWith$Query$getTaxiDriversByUserId$taxi_driver(
    Query$getTaxiDriversByUserId$taxi_driver instance,
    TRes Function(Query$getTaxiDriversByUserId$taxi_driver) then,
  ) = _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver;

  factory CopyWith$Query$getTaxiDriversByUserId$taxi_driver.stub(TRes res) =
      _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver;

  TRes call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getTaxiDriversByUserId$taxi_driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> get user;
}

class _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId$taxi_driver<TRes> {
  _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver(
    this._instance,
    this._then,
  );

  final Query$getTaxiDriversByUserId$taxi_driver _instance;

  final TRes Function(Query$getTaxiDriversByUserId$taxi_driver) _then;

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
      _then(Query$getTaxiDriversByUserId$taxi_driver(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        delivery_company_type: delivery_company_type == _undefined
            ? _instance.delivery_company_type
            : (delivery_company_type as String?),
        delivery_company_id: delivery_company_id == _undefined
            ? _instance.delivery_company_id
            : (delivery_company_id as int?),
        id: id == _undefined ? _instance.id : (id as int?),
        online: online == _undefined ? _instance.online : (online as bool?),
        status: status == _undefined ? _instance.status : (status as String?),
        user: user == _undefined
            ? _instance.user
            : (user as Query$getTaxiDriversByUserId$taxi_driver$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user.stub(
            _then(_instance))
        : CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId$taxi_driver<TRes> {
  _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver(this._res);

  TRes _res;

  call({
    String? app_version,
    Geography? current_location,
    String? delivery_company_type,
    int? delivery_company_id,
    int? id,
    bool? online,
    String? status,
    Query$getTaxiDriversByUserId$taxi_driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> get user =>
      CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user.stub(_res);
}

class Query$getTaxiDriversByUserId$taxi_driver$user {
  Query$getTaxiDriversByUserId$taxi_driver$user({
    required this.id,
    this.image,
    this.name,
    required this.firebase_id,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getTaxiDriversByUserId$taxi_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getTaxiDriversByUserId$taxi_driver$user(
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
    if (!(other is Query$getTaxiDriversByUserId$taxi_driver$user) ||
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

extension UtilityExtension$Query$getTaxiDriversByUserId$taxi_driver$user
    on Query$getTaxiDriversByUserId$taxi_driver$user {
  CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<
          Query$getTaxiDriversByUserId$taxi_driver$user>
      get copyWith => CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> {
  factory CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user(
    Query$getTaxiDriversByUserId$taxi_driver$user instance,
    TRes Function(Query$getTaxiDriversByUserId$taxi_driver$user) then,
  ) = _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver$user;

  factory CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver$user<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> {
  _CopyWithImpl$Query$getTaxiDriversByUserId$taxi_driver$user(
    this._instance,
    this._then,
  );

  final Query$getTaxiDriversByUserId$taxi_driver$user _instance;

  final TRes Function(Query$getTaxiDriversByUserId$taxi_driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getTaxiDriversByUserId$taxi_driver$user(
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

class _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver$user<TRes>
    implements CopyWith$Query$getTaxiDriversByUserId$taxi_driver$user<TRes> {
  _CopyWithStubImpl$Query$getTaxiDriversByUserId$taxi_driver$user(this._res);

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
