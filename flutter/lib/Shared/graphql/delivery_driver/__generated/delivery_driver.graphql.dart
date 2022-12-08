import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

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
            name: NameNode(value: 'delivery_driver_type'),
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
    required this.delivery_driver_type,
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
    final l$delivery_driver_type = json['delivery_driver_type'];
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
      delivery_driver_type: (l$delivery_driver_type as String),
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

  final String delivery_driver_type;

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
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
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
    final l$delivery_driver_type = delivery_driver_type;
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
      l$delivery_driver_type,
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
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
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
    String? delivery_driver_type,
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
    Object? delivery_driver_type = _undefined,
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
        delivery_driver_type:
            delivery_driver_type == _undefined || delivery_driver_type == null
                ? _instance.delivery_driver_type
                : (delivery_driver_type as String),
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
    String? delivery_driver_type,
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
    required this.$__typename,
  });

  factory Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
    String? $__typename,
  }) =>
      _res;
}
