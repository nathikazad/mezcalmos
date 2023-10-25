import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$GetInfluencerByUserId {
  factory Variables$Query$GetInfluencerByUserId({required int userId}) =>
      Variables$Query$GetInfluencerByUserId._({
        r'userId': userId,
      });

  Variables$Query$GetInfluencerByUserId._(this._$data);

  factory Variables$Query$GetInfluencerByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as int);
    return Variables$Query$GetInfluencerByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get userId => (_$data['userId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$GetInfluencerByUserId<
          Variables$Query$GetInfluencerByUserId>
      get copyWith => CopyWith$Variables$Query$GetInfluencerByUserId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetInfluencerByUserId) ||
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

abstract class CopyWith$Variables$Query$GetInfluencerByUserId<TRes> {
  factory CopyWith$Variables$Query$GetInfluencerByUserId(
    Variables$Query$GetInfluencerByUserId instance,
    TRes Function(Variables$Query$GetInfluencerByUserId) then,
  ) = _CopyWithImpl$Variables$Query$GetInfluencerByUserId;

  factory CopyWith$Variables$Query$GetInfluencerByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetInfluencerByUserId;

  TRes call({int? userId});
}

class _CopyWithImpl$Variables$Query$GetInfluencerByUserId<TRes>
    implements CopyWith$Variables$Query$GetInfluencerByUserId<TRes> {
  _CopyWithImpl$Variables$Query$GetInfluencerByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$GetInfluencerByUserId _instance;

  final TRes Function(Variables$Query$GetInfluencerByUserId) _then;

  static const _undefined = {};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$GetInfluencerByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null) 'userId': (userId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetInfluencerByUserId<TRes>
    implements CopyWith$Variables$Query$GetInfluencerByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$GetInfluencerByUserId(this._res);

  TRes _res;

  call({int? userId}) => _res;
}

class Query$GetInfluencerByUserId {
  Query$GetInfluencerByUserId({
    required this.service_provider_influencer,
    required this.$__typename,
  });

  factory Query$GetInfluencerByUserId.fromJson(Map<String, dynamic> json) {
    final l$service_provider_influencer = json['service_provider_influencer'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerByUserId(
      service_provider_influencer: (l$service_provider_influencer
              as List<dynamic>)
          .map((e) =>
              Query$GetInfluencerByUserId$service_provider_influencer.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetInfluencerByUserId$service_provider_influencer>
      service_provider_influencer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer = service_provider_influencer;
    _resultData['service_provider_influencer'] =
        l$service_provider_influencer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer = service_provider_influencer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_influencer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfluencerByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer = service_provider_influencer;
    final lOther$service_provider_influencer =
        other.service_provider_influencer;
    if (l$service_provider_influencer.length !=
        lOther$service_provider_influencer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_influencer.length; i++) {
      final l$service_provider_influencer$entry =
          l$service_provider_influencer[i];
      final lOther$service_provider_influencer$entry =
          lOther$service_provider_influencer[i];
      if (l$service_provider_influencer$entry !=
          lOther$service_provider_influencer$entry) {
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

extension UtilityExtension$Query$GetInfluencerByUserId
    on Query$GetInfluencerByUserId {
  CopyWith$Query$GetInfluencerByUserId<Query$GetInfluencerByUserId>
      get copyWith => CopyWith$Query$GetInfluencerByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerByUserId<TRes> {
  factory CopyWith$Query$GetInfluencerByUserId(
    Query$GetInfluencerByUserId instance,
    TRes Function(Query$GetInfluencerByUserId) then,
  ) = _CopyWithImpl$Query$GetInfluencerByUserId;

  factory CopyWith$Query$GetInfluencerByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerByUserId;

  TRes call({
    List<Query$GetInfluencerByUserId$service_provider_influencer>?
        service_provider_influencer,
    String? $__typename,
  });
  TRes service_provider_influencer(
      Iterable<Query$GetInfluencerByUserId$service_provider_influencer> Function(
              Iterable<
                  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<
                      Query$GetInfluencerByUserId$service_provider_influencer>>)
          _fn);
}

class _CopyWithImpl$Query$GetInfluencerByUserId<TRes>
    implements CopyWith$Query$GetInfluencerByUserId<TRes> {
  _CopyWithImpl$Query$GetInfluencerByUserId(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerByUserId _instance;

  final TRes Function(Query$GetInfluencerByUserId) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfluencerByUserId(
        service_provider_influencer:
            service_provider_influencer == _undefined ||
                    service_provider_influencer == null
                ? _instance.service_provider_influencer
                : (service_provider_influencer as List<
                    Query$GetInfluencerByUserId$service_provider_influencer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_influencer(
          Iterable<Query$GetInfluencerByUserId$service_provider_influencer> Function(
                  Iterable<
                      CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<
                          Query$GetInfluencerByUserId$service_provider_influencer>>)
              _fn) =>
      call(
          service_provider_influencer: _fn(_instance.service_provider_influencer
              .map((e) =>
                  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetInfluencerByUserId<TRes>
    implements CopyWith$Query$GetInfluencerByUserId<TRes> {
  _CopyWithStubImpl$Query$GetInfluencerByUserId(this._res);

  TRes _res;

  call({
    List<Query$GetInfluencerByUserId$service_provider_influencer>?
        service_provider_influencer,
    String? $__typename,
  }) =>
      _res;
  service_provider_influencer(_fn) => _res;
}

const documentNodeQueryGetInfluencerByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetInfluencerByUserId'),
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
        name: NameNode(value: 'service_provider_influencer'),
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
            name: NameNode(value: 'tag'),
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
Query$GetInfluencerByUserId _parserFn$Query$GetInfluencerByUserId(
        Map<String, dynamic> data) =>
    Query$GetInfluencerByUserId.fromJson(data);

class Options$Query$GetInfluencerByUserId
    extends graphql.QueryOptions<Query$GetInfluencerByUserId> {
  Options$Query$GetInfluencerByUserId({
    String? operationName,
    required Variables$Query$GetInfluencerByUserId variables,
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
          document: documentNodeQueryGetInfluencerByUserId,
          parserFn: _parserFn$Query$GetInfluencerByUserId,
        );
}

class WatchOptions$Query$GetInfluencerByUserId
    extends graphql.WatchQueryOptions<Query$GetInfluencerByUserId> {
  WatchOptions$Query$GetInfluencerByUserId({
    String? operationName,
    required Variables$Query$GetInfluencerByUserId variables,
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
          document: documentNodeQueryGetInfluencerByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetInfluencerByUserId,
        );
}

class FetchMoreOptions$Query$GetInfluencerByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetInfluencerByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetInfluencerByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetInfluencerByUserId,
        );
}

extension ClientExtension$Query$GetInfluencerByUserId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetInfluencerByUserId>>
      query$GetInfluencerByUserId(
              Options$Query$GetInfluencerByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetInfluencerByUserId>
      watchQuery$GetInfluencerByUserId(
              WatchOptions$Query$GetInfluencerByUserId options) =>
          this.watchQuery(options);
  void writeQuery$GetInfluencerByUserId({
    required Query$GetInfluencerByUserId data,
    required Variables$Query$GetInfluencerByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetInfluencerByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetInfluencerByUserId? readQuery$GetInfluencerByUserId({
    required Variables$Query$GetInfluencerByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetInfluencerByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetInfluencerByUserId.fromJson(result);
  }
}

class Query$GetInfluencerByUserId$service_provider_influencer {
  Query$GetInfluencerByUserId$service_provider_influencer({
    required this.id,
    required this.tag,
    required this.user_id,
    this.user,
    required this.$__typename,
  });

  factory Query$GetInfluencerByUserId$service_provider_influencer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$tag = json['tag'];
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerByUserId$service_provider_influencer(
      id: (l$id as int),
      tag: (l$tag as String),
      user_id: (l$user_id as int),
      user: l$user == null
          ? null
          : Query$GetInfluencerByUserId$service_provider_influencer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String tag;

  final int user_id;

  final Query$GetInfluencerByUserId$service_provider_influencer$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$tag = tag;
    _resultData['tag'] = l$tag;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$tag = tag;
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$tag,
      l$user_id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfluencerByUserId$service_provider_influencer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$tag = tag;
    final lOther$tag = other.tag;
    if (l$tag != lOther$tag) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetInfluencerByUserId$service_provider_influencer
    on Query$GetInfluencerByUserId$service_provider_influencer {
  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<
          Query$GetInfluencerByUserId$service_provider_influencer>
      get copyWith =>
          CopyWith$Query$GetInfluencerByUserId$service_provider_influencer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<
    TRes> {
  factory CopyWith$Query$GetInfluencerByUserId$service_provider_influencer(
    Query$GetInfluencerByUserId$service_provider_influencer instance,
    TRes Function(Query$GetInfluencerByUserId$service_provider_influencer) then,
  ) = _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer;

  factory CopyWith$Query$GetInfluencerByUserId$service_provider_influencer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer;

  TRes call({
    int? id,
    String? tag,
    int? user_id,
    Query$GetInfluencerByUserId$service_provider_influencer$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer<
        TRes>
    implements
        CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<TRes> {
  _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerByUserId$service_provider_influencer _instance;

  final TRes Function(Query$GetInfluencerByUserId$service_provider_influencer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? tag = _undefined,
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfluencerByUserId$service_provider_influencer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        tag: tag == _undefined || tag == null ? _instance.tag : (tag as String),
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined
            ? _instance.user
            : (user
                as Query$GetInfluencerByUserId$service_provider_influencer$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<TRes>
      get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user
            .stub(_then(_instance))
        : CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer<
        TRes>
    implements
        CopyWith$Query$GetInfluencerByUserId$service_provider_influencer<TRes> {
  _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer(
      this._res);

  TRes _res;

  call({
    int? id,
    String? tag,
    int? user_id,
    Query$GetInfluencerByUserId$service_provider_influencer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<TRes>
      get user =>
          CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user
              .stub(_res);
}

class Query$GetInfluencerByUserId$service_provider_influencer$user {
  Query$GetInfluencerByUserId$service_provider_influencer$user({
    required this.id,
    required this.firebase_id,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$GetInfluencerByUserId$service_provider_influencer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetInfluencerByUserId$service_provider_influencer$user(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String firebase_id;

  final String? image;

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
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
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
            is Query$GetInfluencerByUserId$service_provider_influencer$user) ||
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

extension UtilityExtension$Query$GetInfluencerByUserId$service_provider_influencer$user
    on Query$GetInfluencerByUserId$service_provider_influencer$user {
  CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<
          Query$GetInfluencerByUserId$service_provider_influencer$user>
      get copyWith =>
          CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<
    TRes> {
  factory CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user(
    Query$GetInfluencerByUserId$service_provider_influencer$user instance,
    TRes Function(Query$GetInfluencerByUserId$service_provider_influencer$user)
        then,
  ) = _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer$user;

  factory CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer$user;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer$user<
        TRes>
    implements
        CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<
            TRes> {
  _CopyWithImpl$Query$GetInfluencerByUserId$service_provider_influencer$user(
    this._instance,
    this._then,
  );

  final Query$GetInfluencerByUserId$service_provider_influencer$user _instance;

  final TRes Function(
      Query$GetInfluencerByUserId$service_provider_influencer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfluencerByUserId$service_provider_influencer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer$user<
        TRes>
    implements
        CopyWith$Query$GetInfluencerByUserId$service_provider_influencer$user<
            TRes> {
  _CopyWithStubImpl$Query$GetInfluencerByUserId$service_provider_influencer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetInfOpenOffers {
  Query$GetInfOpenOffers({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) => Query$GetInfOpenOffers$service_provider_offer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetInfOpenOffers$service_provider_offer>
      service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfOpenOffers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$GetInfOpenOffers on Query$GetInfOpenOffers {
  CopyWith$Query$GetInfOpenOffers<Query$GetInfOpenOffers> get copyWith =>
      CopyWith$Query$GetInfOpenOffers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetInfOpenOffers<TRes> {
  factory CopyWith$Query$GetInfOpenOffers(
    Query$GetInfOpenOffers instance,
    TRes Function(Query$GetInfOpenOffers) then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers;

  factory CopyWith$Query$GetInfOpenOffers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers;

  TRes call({
    List<Query$GetInfOpenOffers$service_provider_offer>? service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$GetInfOpenOffers$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$GetInfOpenOffers$service_provider_offer<
                      Query$GetInfOpenOffers$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$GetInfOpenOffers<TRes>
    implements CopyWith$Query$GetInfOpenOffers<TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers _instance;

  final TRes Function(Query$GetInfOpenOffers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer
                as List<Query$GetInfOpenOffers$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$GetInfOpenOffers$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$GetInfOpenOffers$service_provider_offer<
                          Query$GetInfOpenOffers$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer.map(
              (e) => CopyWith$Query$GetInfOpenOffers$service_provider_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetInfOpenOffers<TRes>
    implements CopyWith$Query$GetInfOpenOffers<TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers(this._res);

  TRes _res;

  call({
    List<Query$GetInfOpenOffers$service_provider_offer>? service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryGetInfOpenOffers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetInfOpenOffers'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_details'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_is_null'),
                    value: BooleanValueNode(value: false),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'active',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
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
            name: NameNode(value: 'name_id'),
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
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'translations'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'value'),
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
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'coupon_code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_type'),
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
            name: NameNode(value: 'influencer_details'),
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
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
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
                    name: NameNode(value: 'image'),
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
Query$GetInfOpenOffers _parserFn$Query$GetInfOpenOffers(
        Map<String, dynamic> data) =>
    Query$GetInfOpenOffers.fromJson(data);

class Options$Query$GetInfOpenOffers
    extends graphql.QueryOptions<Query$GetInfOpenOffers> {
  Options$Query$GetInfOpenOffers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryGetInfOpenOffers,
          parserFn: _parserFn$Query$GetInfOpenOffers,
        );
}

class WatchOptions$Query$GetInfOpenOffers
    extends graphql.WatchQueryOptions<Query$GetInfOpenOffers> {
  WatchOptions$Query$GetInfOpenOffers({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryGetInfOpenOffers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetInfOpenOffers,
        );
}

class FetchMoreOptions$Query$GetInfOpenOffers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetInfOpenOffers(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetInfOpenOffers,
        );
}

extension ClientExtension$Query$GetInfOpenOffers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetInfOpenOffers>> query$GetInfOpenOffers(
          [Options$Query$GetInfOpenOffers? options]) async =>
      await this.query(options ?? Options$Query$GetInfOpenOffers());
  graphql.ObservableQuery<Query$GetInfOpenOffers> watchQuery$GetInfOpenOffers(
          [WatchOptions$Query$GetInfOpenOffers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetInfOpenOffers());
  void writeQuery$GetInfOpenOffers({
    required Query$GetInfOpenOffers data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetInfOpenOffers)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetInfOpenOffers? readQuery$GetInfOpenOffers({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetInfOpenOffers)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetInfOpenOffers.fromJson(result);
  }
}

class Query$GetInfOpenOffers$service_provider_offer {
  Query$GetInfOpenOffers$service_provider_offer({
    required this.id,
    required this.name_id,
    required this.name,
    required this.service_provider_id,
    this.coupon_code,
    required this.offer_type,
    required this.service_provider_type,
    required this.status,
    this.influencer_details,
    required this.details,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name_id = json['name_id'];
    final l$name = json['name'];
    final l$service_provider_id = json['service_provider_id'];
    final l$coupon_code = json['coupon_code'];
    final l$offer_type = json['offer_type'];
    final l$service_provider_type = json['service_provider_type'];
    final l$status = json['status'];
    final l$influencer_details = json['influencer_details'];
    final l$details = json['details'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers$service_provider_offer(
      id: (l$id as int),
      name_id: (l$name_id as int),
      name: Query$GetInfOpenOffers$service_provider_offer$name.fromJson(
          (l$name as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      coupon_code: (l$coupon_code as String?),
      offer_type: (l$offer_type as String),
      service_provider_type: (l$service_provider_type as String),
      status: (l$status as String),
      influencer_details: l$influencer_details == null
          ? null
          : mapFromJson(l$influencer_details),
      details: mapFromJson(l$details),
      restaurant: l$restaurant == null
          ? null
          : Query$GetInfOpenOffers$service_provider_offer$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int name_id;

  final Query$GetInfOpenOffers$service_provider_offer$name name;

  final int service_provider_id;

  final String? coupon_code;

  final String offer_type;

  final String service_provider_type;

  final String status;

  final dynamic? influencer_details;

  final dynamic details;

  final Query$GetInfOpenOffers$service_provider_offer$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$coupon_code = coupon_code;
    _resultData['coupon_code'] = l$coupon_code;
    final l$offer_type = offer_type;
    _resultData['offer_type'] = l$offer_type;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$influencer_details = influencer_details;
    _resultData['influencer_details'] =
        l$influencer_details == null ? null : mapToJson(l$influencer_details);
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name_id = name_id;
    final l$name = name;
    final l$service_provider_id = service_provider_id;
    final l$coupon_code = coupon_code;
    final l$offer_type = offer_type;
    final l$service_provider_type = service_provider_type;
    final l$status = status;
    final l$influencer_details = influencer_details;
    final l$details = details;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name_id,
      l$name,
      l$service_provider_id,
      l$coupon_code,
      l$offer_type,
      l$service_provider_type,
      l$status,
      l$influencer_details,
      l$details,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfOpenOffers$service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$offer_type = offer_type;
    final lOther$offer_type = other.offer_type;
    if (l$offer_type != lOther$offer_type) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$influencer_details = influencer_details;
    final lOther$influencer_details = other.influencer_details;
    if (l$influencer_details != lOther$influencer_details) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$GetInfOpenOffers$service_provider_offer
    on Query$GetInfOpenOffers$service_provider_offer {
  CopyWith$Query$GetInfOpenOffers$service_provider_offer<
          Query$GetInfOpenOffers$service_provider_offer>
      get copyWith => CopyWith$Query$GetInfOpenOffers$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfOpenOffers$service_provider_offer<TRes> {
  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer(
    Query$GetInfOpenOffers$service_provider_offer instance,
    TRes Function(Query$GetInfOpenOffers$service_provider_offer) then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer;

  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer;

  TRes call({
    int? id,
    int? name_id,
    Query$GetInfOpenOffers$service_provider_offer$name? name,
    int? service_provider_id,
    String? coupon_code,
    String? offer_type,
    String? service_provider_type,
    String? status,
    dynamic? influencer_details,
    dynamic? details,
    Query$GetInfOpenOffers$service_provider_offer$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<TRes> get name;
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer<TRes>
    implements CopyWith$Query$GetInfOpenOffers$service_provider_offer<TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers$service_provider_offer _instance;

  final TRes Function(Query$GetInfOpenOffers$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name_id = _undefined,
    Object? name = _undefined,
    Object? service_provider_id = _undefined,
    Object? coupon_code = _undefined,
    Object? offer_type = _undefined,
    Object? service_provider_type = _undefined,
    Object? status = _undefined,
    Object? influencer_details = _undefined,
    Object? details = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$GetInfOpenOffers$service_provider_offer$name),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        coupon_code: coupon_code == _undefined
            ? _instance.coupon_code
            : (coupon_code as String?),
        offer_type: offer_type == _undefined || offer_type == null
            ? _instance.offer_type
            : (offer_type as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        influencer_details: influencer_details == _undefined
            ? _instance.influencer_details
            : (influencer_details as dynamic?),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$GetInfOpenOffers$service_provider_offer$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$GetInfOpenOffers$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer<TRes>
    implements CopyWith$Query$GetInfOpenOffers$service_provider_offer<TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer(this._res);

  TRes _res;

  call({
    int? id,
    int? name_id,
    Query$GetInfOpenOffers$service_provider_offer$name? name,
    int? service_provider_id,
    String? coupon_code,
    String? offer_type,
    String? service_provider_type,
    String? status,
    dynamic? influencer_details,
    dynamic? details,
    Query$GetInfOpenOffers$service_provider_offer$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<TRes> get name =>
      CopyWith$Query$GetInfOpenOffers$service_provider_offer$name.stub(_res);
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant
              .stub(_res);
}

class Query$GetInfOpenOffers$service_provider_offer$name {
  Query$GetInfOpenOffers$service_provider_offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers$service_provider_offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$GetInfOpenOffers$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetInfOpenOffers$service_provider_offer$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetInfOpenOffers$service_provider_offer$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$GetInfOpenOffers$service_provider_offer$name
    on Query$GetInfOpenOffers$service_provider_offer$name {
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<
          Query$GetInfOpenOffers$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$name(
    Query$GetInfOpenOffers$service_provider_offer$name instance,
    TRes Function(Query$GetInfOpenOffers$service_provider_offer$name) then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name;

  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name;

  TRes call({
    List<Query$GetInfOpenOffers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$GetInfOpenOffers$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
                      Query$GetInfOpenOffers$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers$service_provider_offer$name _instance;

  final TRes Function(Query$GetInfOpenOffers$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers$service_provider_offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$GetInfOpenOffers$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$GetInfOpenOffers$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
                          Query$GetInfOpenOffers$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$name<TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$GetInfOpenOffers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$GetInfOpenOffers$service_provider_offer$name$translations {
  Query$GetInfOpenOffers$service_provider_offer$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers$service_provider_offer$name$translations(
      value: (l$value as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String value;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$value,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetInfOpenOffers$service_provider_offer$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$GetInfOpenOffers$service_provider_offer$name$translations
    on Query$GetInfOpenOffers$service_provider_offer$name$translations {
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
          Query$GetInfOpenOffers$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations(
    Query$GetInfOpenOffers$service_provider_offer$name$translations instance,
    TRes Function(
            Query$GetInfOpenOffers$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations;

  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers$service_provider_offer$name$translations
      _instance;

  final TRes Function(
      Query$GetInfOpenOffers$service_provider_offer$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers$service_provider_offer$name$translations(
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetInfOpenOffers$service_provider_offer$restaurant {
  Query$GetInfOpenOffers$service_provider_offer$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers$service_provider_offer$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers$service_provider_offer$restaurant(
      details: l$details == null
          ? null
          : Query$GetInfOpenOffers$service_provider_offer$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetInfOpenOffers$service_provider_offer$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
    if (!(other is Query$GetInfOpenOffers$service_provider_offer$restaurant) ||
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

extension UtilityExtension$Query$GetInfOpenOffers$service_provider_offer$restaurant
    on Query$GetInfOpenOffers$service_provider_offer$restaurant {
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<
          Query$GetInfOpenOffers$service_provider_offer$restaurant>
      get copyWith =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<
    TRes> {
  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant(
    Query$GetInfOpenOffers$service_provider_offer$restaurant instance,
    TRes Function(Query$GetInfOpenOffers$service_provider_offer$restaurant)
        then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant;

  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant;

  TRes call({
    Query$GetInfOpenOffers$service_provider_offer$restaurant$details? details,
    String? $__typename,
  });
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<
            TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers$service_provider_offer$restaurant _instance;

  final TRes Function(Query$GetInfOpenOffers$service_provider_offer$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers$service_provider_offer$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$GetInfOpenOffers$service_provider_offer$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant(
      this._res);

  TRes _res;

  call({
    Query$GetInfOpenOffers$service_provider_offer$restaurant$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details
              .stub(_res);
}

class Query$GetInfOpenOffers$service_provider_offer$restaurant$details {
  Query$GetInfOpenOffers$service_provider_offer$restaurant$details({
    required this.image,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$GetInfOpenOffers$service_provider_offer$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
      image: (l$image as String),
      id: (l$id as int),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final int id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$id,
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
            is Query$GetInfOpenOffers$service_provider_offer$restaurant$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetInfOpenOffers$service_provider_offer$restaurant$details
    on Query$GetInfOpenOffers$service_provider_offer$restaurant$details {
  CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
          Query$GetInfOpenOffers$service_provider_offer$restaurant$details>
      get copyWith =>
          CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
    TRes> {
  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
    Query$GetInfOpenOffers$service_provider_offer$restaurant$details instance,
    TRes Function(
            Query$GetInfOpenOffers$service_provider_offer$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details;

  factory CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details;

  TRes call({
    String? image,
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$GetInfOpenOffers$service_provider_offer$restaurant$details
      _instance;

  final TRes Function(
      Query$GetInfOpenOffers$service_provider_offer$restaurant$details) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$GetInfOpenOffers$service_provider_offer$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$GetInfOpenOffers$service_provider_offer$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInfOffers {
  factory Variables$Query$getInfOffers({
    int? inf_id,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$getInfOffers._({
        if (inf_id != null) r'inf_id': inf_id,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$getInfOffers._(this._$data);

  factory Variables$Query$getInfOffers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('inf_id')) {
      final l$inf_id = data['inf_id'];
      result$data['inf_id'] = (l$inf_id as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$getInfOffers._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get inf_id => (_$data['inf_id'] as int?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('inf_id')) {
      final l$inf_id = inf_id;
      result$data['inf_id'] = l$inf_id;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getInfOffers<Variables$Query$getInfOffers>
      get copyWith => CopyWith$Variables$Query$getInfOffers(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInfOffers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inf_id = inf_id;
    final lOther$inf_id = other.inf_id;
    if (_$data.containsKey('inf_id') != other._$data.containsKey('inf_id')) {
      return false;
    }
    if (l$inf_id != lOther$inf_id) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inf_id = inf_id;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('inf_id') ? l$inf_id : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getInfOffers<TRes> {
  factory CopyWith$Variables$Query$getInfOffers(
    Variables$Query$getInfOffers instance,
    TRes Function(Variables$Query$getInfOffers) then,
  ) = _CopyWithImpl$Variables$Query$getInfOffers;

  factory CopyWith$Variables$Query$getInfOffers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInfOffers;

  TRes call({
    int? inf_id,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$getInfOffers<TRes>
    implements CopyWith$Variables$Query$getInfOffers<TRes> {
  _CopyWithImpl$Variables$Query$getInfOffers(
    this._instance,
    this._then,
  );

  final Variables$Query$getInfOffers _instance;

  final TRes Function(Variables$Query$getInfOffers) _then;

  static const _undefined = {};

  TRes call({
    Object? inf_id = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$getInfOffers._({
        ..._instance._$data,
        if (inf_id != _undefined) 'inf_id': (inf_id as int?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInfOffers<TRes>
    implements CopyWith$Variables$Query$getInfOffers<TRes> {
  _CopyWithStubImpl$Variables$Query$getInfOffers(this._res);

  TRes _res;

  call({
    int? inf_id,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$getInfOffers {
  Query$getInfOffers({
    required this.service_provider_influencer_offer,
    required this.$__typename,
  });

  factory Query$getInfOffers.fromJson(Map<String, dynamic> json) {
    final l$service_provider_influencer_offer =
        json['service_provider_influencer_offer'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers(
      service_provider_influencer_offer:
          (l$service_provider_influencer_offer as List<dynamic>)
              .map((e) =>
                  Query$getInfOffers$service_provider_influencer_offer.fromJson(
                      (e as Map<String, dynamic>)))
              .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getInfOffers$service_provider_influencer_offer>
      service_provider_influencer_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_influencer_offer =
        service_provider_influencer_offer;
    _resultData['service_provider_influencer_offer'] =
        l$service_provider_influencer_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_influencer_offer =
        service_provider_influencer_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_influencer_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfOffers) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_influencer_offer =
        service_provider_influencer_offer;
    final lOther$service_provider_influencer_offer =
        other.service_provider_influencer_offer;
    if (l$service_provider_influencer_offer.length !=
        lOther$service_provider_influencer_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_influencer_offer.length; i++) {
      final l$service_provider_influencer_offer$entry =
          l$service_provider_influencer_offer[i];
      final lOther$service_provider_influencer_offer$entry =
          lOther$service_provider_influencer_offer[i];
      if (l$service_provider_influencer_offer$entry !=
          lOther$service_provider_influencer_offer$entry) {
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

extension UtilityExtension$Query$getInfOffers on Query$getInfOffers {
  CopyWith$Query$getInfOffers<Query$getInfOffers> get copyWith =>
      CopyWith$Query$getInfOffers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getInfOffers<TRes> {
  factory CopyWith$Query$getInfOffers(
    Query$getInfOffers instance,
    TRes Function(Query$getInfOffers) then,
  ) = _CopyWithImpl$Query$getInfOffers;

  factory CopyWith$Query$getInfOffers.stub(TRes res) =
      _CopyWithStubImpl$Query$getInfOffers;

  TRes call({
    List<Query$getInfOffers$service_provider_influencer_offer>?
        service_provider_influencer_offer,
    String? $__typename,
  });
  TRes service_provider_influencer_offer(
      Iterable<Query$getInfOffers$service_provider_influencer_offer> Function(
              Iterable<
                  CopyWith$Query$getInfOffers$service_provider_influencer_offer<
                      Query$getInfOffers$service_provider_influencer_offer>>)
          _fn);
}

class _CopyWithImpl$Query$getInfOffers<TRes>
    implements CopyWith$Query$getInfOffers<TRes> {
  _CopyWithImpl$Query$getInfOffers(
    this._instance,
    this._then,
  );

  final Query$getInfOffers _instance;

  final TRes Function(Query$getInfOffers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_influencer_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfOffers(
        service_provider_influencer_offer: service_provider_influencer_offer ==
                    _undefined ||
                service_provider_influencer_offer == null
            ? _instance.service_provider_influencer_offer
            : (service_provider_influencer_offer
                as List<Query$getInfOffers$service_provider_influencer_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_influencer_offer(
          Iterable<Query$getInfOffers$service_provider_influencer_offer> Function(
                  Iterable<
                      CopyWith$Query$getInfOffers$service_provider_influencer_offer<
                          Query$getInfOffers$service_provider_influencer_offer>>)
              _fn) =>
      call(
          service_provider_influencer_offer: _fn(
              _instance.service_provider_influencer_offer.map((e) =>
                  CopyWith$Query$getInfOffers$service_provider_influencer_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getInfOffers<TRes>
    implements CopyWith$Query$getInfOffers<TRes> {
  _CopyWithStubImpl$Query$getInfOffers(this._res);

  TRes _res;

  call({
    List<Query$getInfOffers$service_provider_influencer_offer>?
        service_provider_influencer_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_influencer_offer(_fn) => _res;
}

const documentNodeQuerygetInfOffers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInfOffers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inf_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_influencer_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inf_id')),
                  )
                ]),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'offer'),
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
                name: NameNode(value: 'name_id'),
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
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'translations'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'value'),
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
              FieldNode(
                name: NameNode(value: 'service_provider_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'coupon_code'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offer_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'service_provider_type'),
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
                name: NameNode(value: 'influencer_details'),
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
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'restaurant'),
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
                        name: NameNode(value: 'image'),
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
Query$getInfOffers _parserFn$Query$getInfOffers(Map<String, dynamic> data) =>
    Query$getInfOffers.fromJson(data);

class Options$Query$getInfOffers
    extends graphql.QueryOptions<Query$getInfOffers> {
  Options$Query$getInfOffers({
    String? operationName,
    Variables$Query$getInfOffers? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetInfOffers,
          parserFn: _parserFn$Query$getInfOffers,
        );
}

class WatchOptions$Query$getInfOffers
    extends graphql.WatchQueryOptions<Query$getInfOffers> {
  WatchOptions$Query$getInfOffers({
    String? operationName,
    Variables$Query$getInfOffers? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetInfOffers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInfOffers,
        );
}

class FetchMoreOptions$Query$getInfOffers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInfOffers({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getInfOffers? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetInfOffers,
        );
}

extension ClientExtension$Query$getInfOffers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInfOffers>> query$getInfOffers(
          [Options$Query$getInfOffers? options]) async =>
      await this.query(options ?? Options$Query$getInfOffers());
  graphql.ObservableQuery<Query$getInfOffers> watchQuery$getInfOffers(
          [WatchOptions$Query$getInfOffers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getInfOffers());
  void writeQuery$getInfOffers({
    required Query$getInfOffers data,
    Variables$Query$getInfOffers? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetInfOffers),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInfOffers? readQuery$getInfOffers({
    Variables$Query$getInfOffers? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetInfOffers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getInfOffers.fromJson(result);
  }
}

class Query$getInfOffers$service_provider_influencer_offer {
  Query$getInfOffers$service_provider_influencer_offer({
    this.offer,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer.fromJson(
      Map<String, dynamic> json) {
    final l$offer = json['offer'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer(
      offer: l$offer == null
          ? null
          : Query$getInfOffers$service_provider_influencer_offer$offer.fromJson(
              (l$offer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfOffers$service_provider_influencer_offer$offer? offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offer = offer;
    _resultData['offer'] = l$offer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offer = offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfOffers$service_provider_influencer_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer = offer;
    final lOther$offer = other.offer;
    if (l$offer != lOther$offer) {
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer
    on Query$getInfOffers$service_provider_influencer_offer {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer<
          Query$getInfOffers$service_provider_influencer_offer>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer(
    Query$getInfOffers$service_provider_influencer_offer instance,
    TRes Function(Query$getInfOffers$service_provider_influencer_offer) then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer;

  TRes call({
    Query$getInfOffers$service_provider_influencer_offer$offer? offer,
    String? $__typename,
  });
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<TRes>
      get offer;
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer<TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer<TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer _instance;

  final TRes Function(Query$getInfOffers$service_provider_influencer_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfOffers$service_provider_influencer_offer(
        offer: offer == _undefined
            ? _instance.offer
            : (offer
                as Query$getInfOffers$service_provider_influencer_offer$offer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<TRes>
      get offer {
    final local$offer = _instance.offer;
    return local$offer == null
        ? CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer
            .stub(_then(_instance))
        : CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer(
            local$offer, (e) => call(offer: e));
  }
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer<TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer(
      this._res);

  TRes _res;

  call({
    Query$getInfOffers$service_provider_influencer_offer$offer? offer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<TRes>
      get offer =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer
              .stub(_res);
}

class Query$getInfOffers$service_provider_influencer_offer$offer {
  Query$getInfOffers$service_provider_influencer_offer$offer({
    required this.id,
    required this.name_id,
    required this.name,
    required this.service_provider_id,
    this.coupon_code,
    required this.offer_type,
    required this.service_provider_type,
    required this.status,
    this.influencer_details,
    required this.details,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer$offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name_id = json['name_id'];
    final l$name = json['name'];
    final l$service_provider_id = json['service_provider_id'];
    final l$coupon_code = json['coupon_code'];
    final l$offer_type = json['offer_type'];
    final l$service_provider_type = json['service_provider_type'];
    final l$status = json['status'];
    final l$influencer_details = json['influencer_details'];
    final l$details = json['details'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer$offer(
      id: (l$id as int),
      name_id: (l$name_id as int),
      name: Query$getInfOffers$service_provider_influencer_offer$offer$name
          .fromJson((l$name as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      coupon_code: (l$coupon_code as String?),
      offer_type: (l$offer_type as String),
      service_provider_type: (l$service_provider_type as String),
      status: (l$status as String),
      influencer_details: l$influencer_details == null
          ? null
          : mapFromJson(l$influencer_details),
      details: mapFromJson(l$details),
      restaurant: l$restaurant == null
          ? null
          : Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int name_id;

  final Query$getInfOffers$service_provider_influencer_offer$offer$name name;

  final int service_provider_id;

  final String? coupon_code;

  final String offer_type;

  final String service_provider_type;

  final String status;

  final dynamic? influencer_details;

  final dynamic details;

  final Query$getInfOffers$service_provider_influencer_offer$offer$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$coupon_code = coupon_code;
    _resultData['coupon_code'] = l$coupon_code;
    final l$offer_type = offer_type;
    _resultData['offer_type'] = l$offer_type;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$influencer_details = influencer_details;
    _resultData['influencer_details'] =
        l$influencer_details == null ? null : mapToJson(l$influencer_details);
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name_id = name_id;
    final l$name = name;
    final l$service_provider_id = service_provider_id;
    final l$coupon_code = coupon_code;
    final l$offer_type = offer_type;
    final l$service_provider_type = service_provider_type;
    final l$status = status;
    final l$influencer_details = influencer_details;
    final l$details = details;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name_id,
      l$name,
      l$service_provider_id,
      l$coupon_code,
      l$offer_type,
      l$service_provider_type,
      l$status,
      l$influencer_details,
      l$details,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfOffers$service_provider_influencer_offer$offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$offer_type = offer_type;
    final lOther$offer_type = other.offer_type;
    if (l$offer_type != lOther$offer_type) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$influencer_details = influencer_details;
    final lOther$influencer_details = other.influencer_details;
    if (l$influencer_details != lOther$influencer_details) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer$offer
    on Query$getInfOffers$service_provider_influencer_offer$offer {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<
          Query$getInfOffers$service_provider_influencer_offer$offer>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer(
    Query$getInfOffers$service_provider_influencer_offer$offer instance,
    TRes Function(Query$getInfOffers$service_provider_influencer_offer$offer)
        then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer;

  TRes call({
    int? id,
    int? name_id,
    Query$getInfOffers$service_provider_influencer_offer$offer$name? name,
    int? service_provider_id,
    String? coupon_code,
    String? offer_type,
    String? service_provider_type,
    String? status,
    dynamic? influencer_details,
    dynamic? details,
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<TRes>
      get name;
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<
            TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer$offer _instance;

  final TRes Function(
      Query$getInfOffers$service_provider_influencer_offer$offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name_id = _undefined,
    Object? name = _undefined,
    Object? service_provider_id = _undefined,
    Object? coupon_code = _undefined,
    Object? offer_type = _undefined,
    Object? service_provider_type = _undefined,
    Object? status = _undefined,
    Object? influencer_details = _undefined,
    Object? details = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfOffers$service_provider_influencer_offer$offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getInfOffers$service_provider_influencer_offer$offer$name),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        coupon_code: coupon_code == _undefined
            ? _instance.coupon_code
            : (coupon_code as String?),
        offer_type: offer_type == _undefined || offer_type == null
            ? _instance.offer_type
            : (offer_type as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        influencer_details: influencer_details == _undefined
            ? _instance.influencer_details
            : (influencer_details as dynamic?),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$getInfOffers$service_provider_influencer_offer$offer$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer<
            TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer(
      this._res);

  TRes _res;

  call({
    int? id,
    int? name_id,
    Query$getInfOffers$service_provider_influencer_offer$offer$name? name,
    int? service_provider_id,
    String? coupon_code,
    String? offer_type,
    String? service_provider_type,
    String? status,
    dynamic? influencer_details,
    dynamic? details,
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<TRes>
      get name =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name
              .stub(_res);
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
              .stub(_res);
}

class Query$getInfOffers$service_provider_influencer_offer$offer$name {
  Query$getInfOffers$service_provider_influencer_offer$offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer$offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer$offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getInfOffers$service_provider_influencer_offer$offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfOffers$service_provider_influencer_offer$offer$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer$offer$name
    on Query$getInfOffers$service_provider_influencer_offer$offer$name {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<
          Query$getInfOffers$service_provider_influencer_offer$offer$name>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name(
    Query$getInfOffers$service_provider_influencer_offer$offer$name instance,
    TRes Function(
            Query$getInfOffers$service_provider_influencer_offer$offer$name)
        then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name;

  TRes call({
    List<Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getInfOffers$service_provider_influencer_offer$offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
                      Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<
            TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer$offer$name
      _instance;

  final TRes Function(
      Query$getInfOffers$service_provider_influencer_offer$offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfOffers$service_provider_influencer_offer$offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getInfOffers$service_provider_influencer_offer$offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
                          Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name<
            TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getInfOffers$service_provider_influencer_offer$offer$name$translations {
  Query$getInfOffers$service_provider_influencer_offer$offer$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer$offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
      value: (l$value as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String value;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$value,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfOffers$service_provider_influencer_offer$offer$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations
    on Query$getInfOffers$service_provider_influencer_offer$offer$name$translations {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
          Query$getInfOffers$service_provider_influencer_offer$offer$name$translations>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
    Query$getInfOffers$service_provider_influencer_offer$offer$name$translations
        instance,
    TRes Function(
            Query$getInfOffers$service_provider_influencer_offer$offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer$offer$name$translations
      _instance;

  final TRes Function(
          Query$getInfOffers$service_provider_influencer_offer$offer$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getInfOffers$service_provider_influencer_offer$offer$restaurant {
  Query$getInfOffers$service_provider_influencer_offer$offer$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer$offer$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
      details: l$details == null
          ? null
          : Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
            is Query$getInfOffers$service_provider_influencer_offer$offer$restaurant) ||
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
    on Query$getInfOffers$service_provider_influencer_offer$offer$restaurant {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
        instance,
    TRes Function(
            Query$getInfOffers$service_provider_influencer_offer$offer$restaurant)
        then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant;

  TRes call({
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
            TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer$offer$restaurant
      _instance;

  final TRes Function(
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant(
      this._res);

  TRes _res;

  call({
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
              .stub(_res);
}

class Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details {
  Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details({
    required this.image,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
      image: (l$image as String),
      id: (l$id as int),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final int id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$id,
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
            is Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
    on Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details {
  CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details>
      get copyWith =>
          CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
    TRes> {
  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
    Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
        instance,
    TRes Function(
            Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details;

  factory CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details;

  TRes call({
    String? image,
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details
      _instance;

  final TRes Function(
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getInfOffers$service_provider_influencer_offer$offer$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteInfluencerOffer {
  factory Variables$Mutation$DeleteInfluencerOffer({
    required int influencer_id,
    required int offer_id,
  }) =>
      Variables$Mutation$DeleteInfluencerOffer._({
        r'influencer_id': influencer_id,
        r'offer_id': offer_id,
      });

  Variables$Mutation$DeleteInfluencerOffer._(this._$data);

  factory Variables$Mutation$DeleteInfluencerOffer.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$influencer_id = data['influencer_id'];
    result$data['influencer_id'] = (l$influencer_id as int);
    final l$offer_id = data['offer_id'];
    result$data['offer_id'] = (l$offer_id as int);
    return Variables$Mutation$DeleteInfluencerOffer._(result$data);
  }

  Map<String, dynamic> _$data;

  int get influencer_id => (_$data['influencer_id'] as int);
  int get offer_id => (_$data['offer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$influencer_id = influencer_id;
    result$data['influencer_id'] = l$influencer_id;
    final l$offer_id = offer_id;
    result$data['offer_id'] = l$offer_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteInfluencerOffer<
          Variables$Mutation$DeleteInfluencerOffer>
      get copyWith => CopyWith$Variables$Mutation$DeleteInfluencerOffer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteInfluencerOffer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$influencer_id = influencer_id;
    final l$offer_id = offer_id;
    return Object.hashAll([
      l$influencer_id,
      l$offer_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteInfluencerOffer<TRes> {
  factory CopyWith$Variables$Mutation$DeleteInfluencerOffer(
    Variables$Mutation$DeleteInfluencerOffer instance,
    TRes Function(Variables$Mutation$DeleteInfluencerOffer) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteInfluencerOffer;

  factory CopyWith$Variables$Mutation$DeleteInfluencerOffer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteInfluencerOffer;

  TRes call({
    int? influencer_id,
    int? offer_id,
  });
}

class _CopyWithImpl$Variables$Mutation$DeleteInfluencerOffer<TRes>
    implements CopyWith$Variables$Mutation$DeleteInfluencerOffer<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteInfluencerOffer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteInfluencerOffer _instance;

  final TRes Function(Variables$Mutation$DeleteInfluencerOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? influencer_id = _undefined,
    Object? offer_id = _undefined,
  }) =>
      _then(Variables$Mutation$DeleteInfluencerOffer._({
        ..._instance._$data,
        if (influencer_id != _undefined && influencer_id != null)
          'influencer_id': (influencer_id as int),
        if (offer_id != _undefined && offer_id != null)
          'offer_id': (offer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteInfluencerOffer<TRes>
    implements CopyWith$Variables$Mutation$DeleteInfluencerOffer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteInfluencerOffer(this._res);

  TRes _res;

  call({
    int? influencer_id,
    int? offer_id,
  }) =>
      _res;
}

class Mutation$DeleteInfluencerOffer {
  Mutation$DeleteInfluencerOffer({
    this.delete_service_provider_influencer_offer,
    required this.$__typename,
  });

  factory Mutation$DeleteInfluencerOffer.fromJson(Map<String, dynamic> json) {
    final l$delete_service_provider_influencer_offer =
        json['delete_service_provider_influencer_offer'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteInfluencerOffer(
      delete_service_provider_influencer_offer:
          l$delete_service_provider_influencer_offer == null
              ? null
              : Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
                  .fromJson((l$delete_service_provider_influencer_offer
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer?
      delete_service_provider_influencer_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_service_provider_influencer_offer =
        delete_service_provider_influencer_offer;
    _resultData['delete_service_provider_influencer_offer'] =
        l$delete_service_provider_influencer_offer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_service_provider_influencer_offer =
        delete_service_provider_influencer_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_service_provider_influencer_offer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteInfluencerOffer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_service_provider_influencer_offer =
        delete_service_provider_influencer_offer;
    final lOther$delete_service_provider_influencer_offer =
        other.delete_service_provider_influencer_offer;
    if (l$delete_service_provider_influencer_offer !=
        lOther$delete_service_provider_influencer_offer) {
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

extension UtilityExtension$Mutation$DeleteInfluencerOffer
    on Mutation$DeleteInfluencerOffer {
  CopyWith$Mutation$DeleteInfluencerOffer<Mutation$DeleteInfluencerOffer>
      get copyWith => CopyWith$Mutation$DeleteInfluencerOffer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteInfluencerOffer<TRes> {
  factory CopyWith$Mutation$DeleteInfluencerOffer(
    Mutation$DeleteInfluencerOffer instance,
    TRes Function(Mutation$DeleteInfluencerOffer) then,
  ) = _CopyWithImpl$Mutation$DeleteInfluencerOffer;

  factory CopyWith$Mutation$DeleteInfluencerOffer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteInfluencerOffer;

  TRes call({
    Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer?
        delete_service_provider_influencer_offer,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
      TRes> get delete_service_provider_influencer_offer;
}

class _CopyWithImpl$Mutation$DeleteInfluencerOffer<TRes>
    implements CopyWith$Mutation$DeleteInfluencerOffer<TRes> {
  _CopyWithImpl$Mutation$DeleteInfluencerOffer(
    this._instance,
    this._then,
  );

  final Mutation$DeleteInfluencerOffer _instance;

  final TRes Function(Mutation$DeleteInfluencerOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_service_provider_influencer_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteInfluencerOffer(
        delete_service_provider_influencer_offer:
            delete_service_provider_influencer_offer == _undefined
                ? _instance.delete_service_provider_influencer_offer
                : (delete_service_provider_influencer_offer
                    as Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
      TRes> get delete_service_provider_influencer_offer {
    final local$delete_service_provider_influencer_offer =
        _instance.delete_service_provider_influencer_offer;
    return local$delete_service_provider_influencer_offer == null
        ? CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
            .stub(_then(_instance))
        : CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
            local$delete_service_provider_influencer_offer,
            (e) => call(delete_service_provider_influencer_offer: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteInfluencerOffer<TRes>
    implements CopyWith$Mutation$DeleteInfluencerOffer<TRes> {
  _CopyWithStubImpl$Mutation$DeleteInfluencerOffer(this._res);

  TRes _res;

  call({
    Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer?
        delete_service_provider_influencer_offer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
          TRes>
      get delete_service_provider_influencer_offer =>
          CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
              .stub(_res);
}

const documentNodeMutationDeleteInfluencerOffer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteInfluencerOffer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delete_service_provider_influencer_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencer_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'offer_id')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'affected_rows'),
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
Mutation$DeleteInfluencerOffer _parserFn$Mutation$DeleteInfluencerOffer(
        Map<String, dynamic> data) =>
    Mutation$DeleteInfluencerOffer.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteInfluencerOffer = FutureOr<void>
    Function(
  dynamic,
  Mutation$DeleteInfluencerOffer?,
);

class Options$Mutation$DeleteInfluencerOffer
    extends graphql.MutationOptions<Mutation$DeleteInfluencerOffer> {
  Options$Mutation$DeleteInfluencerOffer({
    String? operationName,
    required Variables$Mutation$DeleteInfluencerOffer variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteInfluencerOffer? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteInfluencerOffer>? update,
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
                        : _parserFn$Mutation$DeleteInfluencerOffer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteInfluencerOffer,
          parserFn: _parserFn$Mutation$DeleteInfluencerOffer,
        );

  final OnMutationCompleted$Mutation$DeleteInfluencerOffer?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteInfluencerOffer
    extends graphql.WatchQueryOptions<Mutation$DeleteInfluencerOffer> {
  WatchOptions$Mutation$DeleteInfluencerOffer({
    String? operationName,
    required Variables$Mutation$DeleteInfluencerOffer variables,
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
          document: documentNodeMutationDeleteInfluencerOffer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteInfluencerOffer,
        );
}

extension ClientExtension$Mutation$DeleteInfluencerOffer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteInfluencerOffer>>
      mutate$DeleteInfluencerOffer(
              Options$Mutation$DeleteInfluencerOffer options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteInfluencerOffer>
      watchMutation$DeleteInfluencerOffer(
              WatchOptions$Mutation$DeleteInfluencerOffer options) =>
          this.watchMutation(options);
}

class Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer {
  Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
    on Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer {
  CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
          Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer>
      get copyWith =>
          CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
    TRes> {
  factory CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
    Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
        instance,
    TRes Function(
            Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer)
        then,
  ) = _CopyWithImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer;

  factory CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
        TRes>
    implements
        CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
            TRes> {
  _CopyWithImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
    this._instance,
    this._then,
  );

  final Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer
      _instance;

  final TRes Function(
          Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
        TRes>
    implements
        CopyWith$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer<
            TRes> {
  _CopyWithStubImpl$Mutation$DeleteInfluencerOffer$delete_service_provider_influencer_offer(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$InsertInfluencerOffer {
  factory Variables$Mutation$InsertInfluencerOffer({
    int? influencer_id,
    int? offer_id,
  }) =>
      Variables$Mutation$InsertInfluencerOffer._({
        if (influencer_id != null) r'influencer_id': influencer_id,
        if (offer_id != null) r'offer_id': offer_id,
      });

  Variables$Mutation$InsertInfluencerOffer._(this._$data);

  factory Variables$Mutation$InsertInfluencerOffer.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('influencer_id')) {
      final l$influencer_id = data['influencer_id'];
      result$data['influencer_id'] = (l$influencer_id as int?);
    }
    if (data.containsKey('offer_id')) {
      final l$offer_id = data['offer_id'];
      result$data['offer_id'] = (l$offer_id as int?);
    }
    return Variables$Mutation$InsertInfluencerOffer._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get influencer_id => (_$data['influencer_id'] as int?);
  int? get offer_id => (_$data['offer_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('influencer_id')) {
      final l$influencer_id = influencer_id;
      result$data['influencer_id'] = l$influencer_id;
    }
    if (_$data.containsKey('offer_id')) {
      final l$offer_id = offer_id;
      result$data['offer_id'] = l$offer_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$InsertInfluencerOffer<
          Variables$Mutation$InsertInfluencerOffer>
      get copyWith => CopyWith$Variables$Mutation$InsertInfluencerOffer(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$InsertInfluencerOffer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (_$data.containsKey('influencer_id') !=
        other._$data.containsKey('influencer_id')) {
      return false;
    }
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (_$data.containsKey('offer_id') !=
        other._$data.containsKey('offer_id')) {
      return false;
    }
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$influencer_id = influencer_id;
    final l$offer_id = offer_id;
    return Object.hashAll([
      _$data.containsKey('influencer_id') ? l$influencer_id : const {},
      _$data.containsKey('offer_id') ? l$offer_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InsertInfluencerOffer<TRes> {
  factory CopyWith$Variables$Mutation$InsertInfluencerOffer(
    Variables$Mutation$InsertInfluencerOffer instance,
    TRes Function(Variables$Mutation$InsertInfluencerOffer) then,
  ) = _CopyWithImpl$Variables$Mutation$InsertInfluencerOffer;

  factory CopyWith$Variables$Mutation$InsertInfluencerOffer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InsertInfluencerOffer;

  TRes call({
    int? influencer_id,
    int? offer_id,
  });
}

class _CopyWithImpl$Variables$Mutation$InsertInfluencerOffer<TRes>
    implements CopyWith$Variables$Mutation$InsertInfluencerOffer<TRes> {
  _CopyWithImpl$Variables$Mutation$InsertInfluencerOffer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InsertInfluencerOffer _instance;

  final TRes Function(Variables$Mutation$InsertInfluencerOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? influencer_id = _undefined,
    Object? offer_id = _undefined,
  }) =>
      _then(Variables$Mutation$InsertInfluencerOffer._({
        ..._instance._$data,
        if (influencer_id != _undefined)
          'influencer_id': (influencer_id as int?),
        if (offer_id != _undefined) 'offer_id': (offer_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$InsertInfluencerOffer<TRes>
    implements CopyWith$Variables$Mutation$InsertInfluencerOffer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InsertInfluencerOffer(this._res);

  TRes _res;

  call({
    int? influencer_id,
    int? offer_id,
  }) =>
      _res;
}

class Mutation$InsertInfluencerOffer {
  Mutation$InsertInfluencerOffer({
    this.insert_service_provider_influencer_offer,
    required this.$__typename,
  });

  factory Mutation$InsertInfluencerOffer.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_influencer_offer =
        json['insert_service_provider_influencer_offer'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertInfluencerOffer(
      insert_service_provider_influencer_offer:
          l$insert_service_provider_influencer_offer == null
              ? null
              : Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
                  .fromJson((l$insert_service_provider_influencer_offer
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer?
      insert_service_provider_influencer_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_influencer_offer =
        insert_service_provider_influencer_offer;
    _resultData['insert_service_provider_influencer_offer'] =
        l$insert_service_provider_influencer_offer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_influencer_offer =
        insert_service_provider_influencer_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_influencer_offer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$InsertInfluencerOffer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_influencer_offer =
        insert_service_provider_influencer_offer;
    final lOther$insert_service_provider_influencer_offer =
        other.insert_service_provider_influencer_offer;
    if (l$insert_service_provider_influencer_offer !=
        lOther$insert_service_provider_influencer_offer) {
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

extension UtilityExtension$Mutation$InsertInfluencerOffer
    on Mutation$InsertInfluencerOffer {
  CopyWith$Mutation$InsertInfluencerOffer<Mutation$InsertInfluencerOffer>
      get copyWith => CopyWith$Mutation$InsertInfluencerOffer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertInfluencerOffer<TRes> {
  factory CopyWith$Mutation$InsertInfluencerOffer(
    Mutation$InsertInfluencerOffer instance,
    TRes Function(Mutation$InsertInfluencerOffer) then,
  ) = _CopyWithImpl$Mutation$InsertInfluencerOffer;

  factory CopyWith$Mutation$InsertInfluencerOffer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InsertInfluencerOffer;

  TRes call({
    Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer?
        insert_service_provider_influencer_offer,
    String? $__typename,
  });
  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
      TRes> get insert_service_provider_influencer_offer;
}

class _CopyWithImpl$Mutation$InsertInfluencerOffer<TRes>
    implements CopyWith$Mutation$InsertInfluencerOffer<TRes> {
  _CopyWithImpl$Mutation$InsertInfluencerOffer(
    this._instance,
    this._then,
  );

  final Mutation$InsertInfluencerOffer _instance;

  final TRes Function(Mutation$InsertInfluencerOffer) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_influencer_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InsertInfluencerOffer(
        insert_service_provider_influencer_offer:
            insert_service_provider_influencer_offer == _undefined
                ? _instance.insert_service_provider_influencer_offer
                : (insert_service_provider_influencer_offer
                    as Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
      TRes> get insert_service_provider_influencer_offer {
    final local$insert_service_provider_influencer_offer =
        _instance.insert_service_provider_influencer_offer;
    return local$insert_service_provider_influencer_offer == null
        ? CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
            .stub(_then(_instance))
        : CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
            local$insert_service_provider_influencer_offer,
            (e) => call(insert_service_provider_influencer_offer: e));
  }
}

class _CopyWithStubImpl$Mutation$InsertInfluencerOffer<TRes>
    implements CopyWith$Mutation$InsertInfluencerOffer<TRes> {
  _CopyWithStubImpl$Mutation$InsertInfluencerOffer(this._res);

  TRes _res;

  call({
    Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer?
        insert_service_provider_influencer_offer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
          TRes>
      get insert_service_provider_influencer_offer =>
          CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
              .stub(_res);
}

const documentNodeMutationInsertInfluencerOffer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InsertInfluencerOffer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_influencer_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'objects'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: VariableNode(name: NameNode(value: 'influencer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_id'),
                value: VariableNode(name: NameNode(value: 'offer_id')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'affected_rows'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'returning'),
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
                name: NameNode(value: 'influencer_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offer_id'),
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
Mutation$InsertInfluencerOffer _parserFn$Mutation$InsertInfluencerOffer(
        Map<String, dynamic> data) =>
    Mutation$InsertInfluencerOffer.fromJson(data);
typedef OnMutationCompleted$Mutation$InsertInfluencerOffer = FutureOr<void>
    Function(
  dynamic,
  Mutation$InsertInfluencerOffer?,
);

class Options$Mutation$InsertInfluencerOffer
    extends graphql.MutationOptions<Mutation$InsertInfluencerOffer> {
  Options$Mutation$InsertInfluencerOffer({
    String? operationName,
    Variables$Mutation$InsertInfluencerOffer? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InsertInfluencerOffer? onCompleted,
    graphql.OnMutationUpdate<Mutation$InsertInfluencerOffer>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$InsertInfluencerOffer(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInsertInfluencerOffer,
          parserFn: _parserFn$Mutation$InsertInfluencerOffer,
        );

  final OnMutationCompleted$Mutation$InsertInfluencerOffer?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InsertInfluencerOffer
    extends graphql.WatchQueryOptions<Mutation$InsertInfluencerOffer> {
  WatchOptions$Mutation$InsertInfluencerOffer({
    String? operationName,
    Variables$Mutation$InsertInfluencerOffer? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationInsertInfluencerOffer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InsertInfluencerOffer,
        );
}

extension ClientExtension$Mutation$InsertInfluencerOffer
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InsertInfluencerOffer>>
      mutate$InsertInfluencerOffer(
              [Options$Mutation$InsertInfluencerOffer? options]) async =>
          await this
              .mutate(options ?? Options$Mutation$InsertInfluencerOffer());
  graphql.ObservableQuery<Mutation$InsertInfluencerOffer>
      watchMutation$InsertInfluencerOffer(
              [WatchOptions$Mutation$InsertInfluencerOffer? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$InsertInfluencerOffer());
}

class Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer {
  Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer({
    required this.affected_rows,
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
      affected_rows: (l$affected_rows as int),
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final List<
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>
      returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
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

extension UtilityExtension$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
    on Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer {
  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer>
      get copyWith =>
          CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
    TRes> {
  factory CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
    Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
        instance,
    TRes Function(
            Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer)
        then,
  ) = _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer;

  factory CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer;

  TRes call({
    int? affected_rows,
    List<Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning> Function(
              Iterable<
                  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
                      Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
        TRes>
    implements
        CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
            TRes> {
  _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
    this._instance,
    this._then,
  );

  final Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer
      _instance;

  final TRes Function(
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning> Function(
                  Iterable<
                      CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
                          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
        TRes>
    implements
        CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer<
            TRes> {
  _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    List<Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning {
  Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning({
    required this.id,
    required this.influencer_id,
    required this.offer_id,
    required this.$__typename,
  });

  factory Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$offer_id = json['offer_id'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
      id: (l$id as int),
      influencer_id: (l$influencer_id as int),
      offer_id: (l$offer_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int influencer_id;

  final int offer_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$offer_id = offer_id;
    _resultData['offer_id'] = l$offer_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$offer_id = offer_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$influencer_id,
      l$offer_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
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

extension UtilityExtension$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning
    on Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning {
  CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning>
      get copyWith =>
          CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
    TRes> {
  factory CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
    Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning
        instance,
    TRes Function(
            Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning)
        then,
  ) = _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning;

  factory CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning;

  TRes call({
    int? id,
    int? influencer_id,
    int? offer_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
        TRes>
    implements
        CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
            TRes> {
  _CopyWithImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
    this._instance,
    this._then,
  );

  final Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning
      _instance;

  final TRes Function(
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? offer_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined || influencer_id == null
            ? _instance.influencer_id
            : (influencer_id as int),
        offer_id: offer_id == _undefined || offer_id == null
            ? _instance.offer_id
            : (offer_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
        TRes>
    implements
        CopyWith$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$InsertInfluencerOffer$insert_service_provider_influencer_offer$returning(
      this._res);

  TRes _res;

  call({
    int? id,
    int? influencer_id,
    int? offer_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInfluencerTotalComissions {
  factory Variables$Query$getInfluencerTotalComissions(
          {required int influencer_id}) =>
      Variables$Query$getInfluencerTotalComissions._({
        r'influencer_id': influencer_id,
      });

  Variables$Query$getInfluencerTotalComissions._(this._$data);

  factory Variables$Query$getInfluencerTotalComissions.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$influencer_id = data['influencer_id'];
    result$data['influencer_id'] = (l$influencer_id as int);
    return Variables$Query$getInfluencerTotalComissions._(result$data);
  }

  Map<String, dynamic> _$data;

  int get influencer_id => (_$data['influencer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$influencer_id = influencer_id;
    result$data['influencer_id'] = l$influencer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getInfluencerTotalComissions<
          Variables$Query$getInfluencerTotalComissions>
      get copyWith => CopyWith$Variables$Query$getInfluencerTotalComissions(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInfluencerTotalComissions) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$influencer_id = influencer_id;
    return Object.hashAll([l$influencer_id]);
  }
}

abstract class CopyWith$Variables$Query$getInfluencerTotalComissions<TRes> {
  factory CopyWith$Variables$Query$getInfluencerTotalComissions(
    Variables$Query$getInfluencerTotalComissions instance,
    TRes Function(Variables$Query$getInfluencerTotalComissions) then,
  ) = _CopyWithImpl$Variables$Query$getInfluencerTotalComissions;

  factory CopyWith$Variables$Query$getInfluencerTotalComissions.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInfluencerTotalComissions;

  TRes call({int? influencer_id});
}

class _CopyWithImpl$Variables$Query$getInfluencerTotalComissions<TRes>
    implements CopyWith$Variables$Query$getInfluencerTotalComissions<TRes> {
  _CopyWithImpl$Variables$Query$getInfluencerTotalComissions(
    this._instance,
    this._then,
  );

  final Variables$Query$getInfluencerTotalComissions _instance;

  final TRes Function(Variables$Query$getInfluencerTotalComissions) _then;

  static const _undefined = {};

  TRes call({Object? influencer_id = _undefined}) =>
      _then(Variables$Query$getInfluencerTotalComissions._({
        ..._instance._$data,
        if (influencer_id != _undefined && influencer_id != null)
          'influencer_id': (influencer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInfluencerTotalComissions<TRes>
    implements CopyWith$Variables$Query$getInfluencerTotalComissions<TRes> {
  _CopyWithStubImpl$Variables$Query$getInfluencerTotalComissions(this._res);

  TRes _res;

  call({int? influencer_id}) => _res;
}

class Query$getInfluencerTotalComissions {
  Query$getInfluencerTotalComissions({
    required this.service_provider_offer_applied_aggregate,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalComissions.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer_applied_aggregate =
        json['service_provider_offer_applied_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalComissions(
      service_provider_offer_applied_aggregate:
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
              .fromJson((l$service_provider_offer_applied_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
      service_provider_offer_applied_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    _resultData['service_provider_offer_applied_aggregate'] =
        l$service_provider_offer_applied_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_offer_applied_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfluencerTotalComissions) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final lOther$service_provider_offer_applied_aggregate =
        other.service_provider_offer_applied_aggregate;
    if (l$service_provider_offer_applied_aggregate !=
        lOther$service_provider_offer_applied_aggregate) {
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

extension UtilityExtension$Query$getInfluencerTotalComissions
    on Query$getInfluencerTotalComissions {
  CopyWith$Query$getInfluencerTotalComissions<
          Query$getInfluencerTotalComissions>
      get copyWith => CopyWith$Query$getInfluencerTotalComissions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalComissions<TRes> {
  factory CopyWith$Query$getInfluencerTotalComissions(
    Query$getInfluencerTotalComissions instance,
    TRes Function(Query$getInfluencerTotalComissions) then,
  ) = _CopyWithImpl$Query$getInfluencerTotalComissions;

  factory CopyWith$Query$getInfluencerTotalComissions.stub(TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalComissions;

  TRes call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate;
}

class _CopyWithImpl$Query$getInfluencerTotalComissions<TRes>
    implements CopyWith$Query$getInfluencerTotalComissions<TRes> {
  _CopyWithImpl$Query$getInfluencerTotalComissions(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalComissions _instance;

  final TRes Function(Query$getInfluencerTotalComissions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerTotalComissions(
        service_provider_offer_applied_aggregate:
            service_provider_offer_applied_aggregate == _undefined ||
                    service_provider_offer_applied_aggregate == null
                ? _instance.service_provider_offer_applied_aggregate
                : (service_provider_offer_applied_aggregate
                    as Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate {
    final local$service_provider_offer_applied_aggregate =
        _instance.service_provider_offer_applied_aggregate;
    return CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
        local$service_provider_offer_applied_aggregate,
        (e) => call(service_provider_offer_applied_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalComissions<TRes>
    implements CopyWith$Query$getInfluencerTotalComissions<TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalComissions(this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
          TRes>
      get service_provider_offer_applied_aggregate =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
              .stub(_res);
}

const documentNodeQuerygetInfluencerTotalComissions =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInfluencerTotalComissions'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencer_id')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'comission'),
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
Query$getInfluencerTotalComissions _parserFn$Query$getInfluencerTotalComissions(
        Map<String, dynamic> data) =>
    Query$getInfluencerTotalComissions.fromJson(data);

class Options$Query$getInfluencerTotalComissions
    extends graphql.QueryOptions<Query$getInfluencerTotalComissions> {
  Options$Query$getInfluencerTotalComissions({
    String? operationName,
    required Variables$Query$getInfluencerTotalComissions variables,
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
          document: documentNodeQuerygetInfluencerTotalComissions,
          parserFn: _parserFn$Query$getInfluencerTotalComissions,
        );
}

class WatchOptions$Query$getInfluencerTotalComissions
    extends graphql.WatchQueryOptions<Query$getInfluencerTotalComissions> {
  WatchOptions$Query$getInfluencerTotalComissions({
    String? operationName,
    required Variables$Query$getInfluencerTotalComissions variables,
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
          document: documentNodeQuerygetInfluencerTotalComissions,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInfluencerTotalComissions,
        );
}

class FetchMoreOptions$Query$getInfluencerTotalComissions
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInfluencerTotalComissions({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getInfluencerTotalComissions variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetInfluencerTotalComissions,
        );
}

extension ClientExtension$Query$getInfluencerTotalComissions
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInfluencerTotalComissions>>
      query$getInfluencerTotalComissions(
              Options$Query$getInfluencerTotalComissions options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getInfluencerTotalComissions>
      watchQuery$getInfluencerTotalComissions(
              WatchOptions$Query$getInfluencerTotalComissions options) =>
          this.watchQuery(options);
  void writeQuery$getInfluencerTotalComissions({
    required Query$getInfluencerTotalComissions data,
    required Variables$Query$getInfluencerTotalComissions variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetInfluencerTotalComissions),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInfluencerTotalComissions? readQuery$getInfluencerTotalComissions({
    required Variables$Query$getInfluencerTotalComissions variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetInfluencerTotalComissions),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getInfluencerTotalComissions.fromJson(result);
  }
}

class Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate {
  Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate?
      aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
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

extension UtilityExtension$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
    on Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate {
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
        instance,
    TRes Function(
            Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate;

  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate;

  TRes call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate
      _instance;

  final TRes Function(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
              .stub(_res);
}

class Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate {
  Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
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

extension UtilityExtension$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
    on Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate {
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
        instance,
    TRes Function(
            Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate;

  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate;

  TRes call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
              .stub(_res);
}

class Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum {
  Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum({
    this.comission,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$comission = json['comission'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
      comission: l$comission == null ? null : moneyFromJson(l$comission),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? comission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comission = comission;
    _resultData['comission'] =
        l$comission == null ? null : moneyToJson(l$comission);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comission = comission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$comission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comission = comission;
    final lOther$comission = other.comission;
    if (l$comission != lOther$comission) {
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

extension UtilityExtension$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
    on Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum {
  CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
    Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
        instance,
    TRes Function(
            Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum;

  factory CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum;

  TRes call({
    double? comission,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? comission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
        comission: comission == _undefined
            ? _instance.comission
            : (comission as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalComissions$service_provider_offer_applied_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? comission,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInfluencerTotalDiscounts {
  factory Variables$Query$getInfluencerTotalDiscounts(
          {required int influencer_id}) =>
      Variables$Query$getInfluencerTotalDiscounts._({
        r'influencer_id': influencer_id,
      });

  Variables$Query$getInfluencerTotalDiscounts._(this._$data);

  factory Variables$Query$getInfluencerTotalDiscounts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$influencer_id = data['influencer_id'];
    result$data['influencer_id'] = (l$influencer_id as int);
    return Variables$Query$getInfluencerTotalDiscounts._(result$data);
  }

  Map<String, dynamic> _$data;

  int get influencer_id => (_$data['influencer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$influencer_id = influencer_id;
    result$data['influencer_id'] = l$influencer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getInfluencerTotalDiscounts<
          Variables$Query$getInfluencerTotalDiscounts>
      get copyWith => CopyWith$Variables$Query$getInfluencerTotalDiscounts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInfluencerTotalDiscounts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$influencer_id = influencer_id;
    return Object.hashAll([l$influencer_id]);
  }
}

abstract class CopyWith$Variables$Query$getInfluencerTotalDiscounts<TRes> {
  factory CopyWith$Variables$Query$getInfluencerTotalDiscounts(
    Variables$Query$getInfluencerTotalDiscounts instance,
    TRes Function(Variables$Query$getInfluencerTotalDiscounts) then,
  ) = _CopyWithImpl$Variables$Query$getInfluencerTotalDiscounts;

  factory CopyWith$Variables$Query$getInfluencerTotalDiscounts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInfluencerTotalDiscounts;

  TRes call({int? influencer_id});
}

class _CopyWithImpl$Variables$Query$getInfluencerTotalDiscounts<TRes>
    implements CopyWith$Variables$Query$getInfluencerTotalDiscounts<TRes> {
  _CopyWithImpl$Variables$Query$getInfluencerTotalDiscounts(
    this._instance,
    this._then,
  );

  final Variables$Query$getInfluencerTotalDiscounts _instance;

  final TRes Function(Variables$Query$getInfluencerTotalDiscounts) _then;

  static const _undefined = {};

  TRes call({Object? influencer_id = _undefined}) =>
      _then(Variables$Query$getInfluencerTotalDiscounts._({
        ..._instance._$data,
        if (influencer_id != _undefined && influencer_id != null)
          'influencer_id': (influencer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInfluencerTotalDiscounts<TRes>
    implements CopyWith$Variables$Query$getInfluencerTotalDiscounts<TRes> {
  _CopyWithStubImpl$Variables$Query$getInfluencerTotalDiscounts(this._res);

  TRes _res;

  call({int? influencer_id}) => _res;
}

class Query$getInfluencerTotalDiscounts {
  Query$getInfluencerTotalDiscounts({
    required this.service_provider_offer_applied_aggregate,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalDiscounts.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer_applied_aggregate =
        json['service_provider_offer_applied_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalDiscounts(
      service_provider_offer_applied_aggregate:
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
              .fromJson((l$service_provider_offer_applied_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
      service_provider_offer_applied_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    _resultData['service_provider_offer_applied_aggregate'] =
        l$service_provider_offer_applied_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_offer_applied_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfluencerTotalDiscounts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied_aggregate =
        service_provider_offer_applied_aggregate;
    final lOther$service_provider_offer_applied_aggregate =
        other.service_provider_offer_applied_aggregate;
    if (l$service_provider_offer_applied_aggregate !=
        lOther$service_provider_offer_applied_aggregate) {
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

extension UtilityExtension$Query$getInfluencerTotalDiscounts
    on Query$getInfluencerTotalDiscounts {
  CopyWith$Query$getInfluencerTotalDiscounts<Query$getInfluencerTotalDiscounts>
      get copyWith => CopyWith$Query$getInfluencerTotalDiscounts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalDiscounts<TRes> {
  factory CopyWith$Query$getInfluencerTotalDiscounts(
    Query$getInfluencerTotalDiscounts instance,
    TRes Function(Query$getInfluencerTotalDiscounts) then,
  ) = _CopyWithImpl$Query$getInfluencerTotalDiscounts;

  factory CopyWith$Query$getInfluencerTotalDiscounts.stub(TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalDiscounts;

  TRes call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate;
}

class _CopyWithImpl$Query$getInfluencerTotalDiscounts<TRes>
    implements CopyWith$Query$getInfluencerTotalDiscounts<TRes> {
  _CopyWithImpl$Query$getInfluencerTotalDiscounts(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalDiscounts _instance;

  final TRes Function(Query$getInfluencerTotalDiscounts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerTotalDiscounts(
        service_provider_offer_applied_aggregate:
            service_provider_offer_applied_aggregate == _undefined ||
                    service_provider_offer_applied_aggregate == null
                ? _instance.service_provider_offer_applied_aggregate
                : (service_provider_offer_applied_aggregate
                    as Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
      TRes> get service_provider_offer_applied_aggregate {
    final local$service_provider_offer_applied_aggregate =
        _instance.service_provider_offer_applied_aggregate;
    return CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
        local$service_provider_offer_applied_aggregate,
        (e) => call(service_provider_offer_applied_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalDiscounts<TRes>
    implements CopyWith$Query$getInfluencerTotalDiscounts<TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalDiscounts(this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate?
        service_provider_offer_applied_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
          TRes>
      get service_provider_offer_applied_aggregate =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
              .stub(_res);
}

const documentNodeQuerygetInfluencerTotalDiscounts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInfluencerTotalDiscounts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencer_id')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'discount'),
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
Query$getInfluencerTotalDiscounts _parserFn$Query$getInfluencerTotalDiscounts(
        Map<String, dynamic> data) =>
    Query$getInfluencerTotalDiscounts.fromJson(data);

class Options$Query$getInfluencerTotalDiscounts
    extends graphql.QueryOptions<Query$getInfluencerTotalDiscounts> {
  Options$Query$getInfluencerTotalDiscounts({
    String? operationName,
    required Variables$Query$getInfluencerTotalDiscounts variables,
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
          document: documentNodeQuerygetInfluencerTotalDiscounts,
          parserFn: _parserFn$Query$getInfluencerTotalDiscounts,
        );
}

class WatchOptions$Query$getInfluencerTotalDiscounts
    extends graphql.WatchQueryOptions<Query$getInfluencerTotalDiscounts> {
  WatchOptions$Query$getInfluencerTotalDiscounts({
    String? operationName,
    required Variables$Query$getInfluencerTotalDiscounts variables,
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
          document: documentNodeQuerygetInfluencerTotalDiscounts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInfluencerTotalDiscounts,
        );
}

class FetchMoreOptions$Query$getInfluencerTotalDiscounts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInfluencerTotalDiscounts({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getInfluencerTotalDiscounts variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetInfluencerTotalDiscounts,
        );
}

extension ClientExtension$Query$getInfluencerTotalDiscounts
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInfluencerTotalDiscounts>>
      query$getInfluencerTotalDiscounts(
              Options$Query$getInfluencerTotalDiscounts options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getInfluencerTotalDiscounts>
      watchQuery$getInfluencerTotalDiscounts(
              WatchOptions$Query$getInfluencerTotalDiscounts options) =>
          this.watchQuery(options);
  void writeQuery$getInfluencerTotalDiscounts({
    required Query$getInfluencerTotalDiscounts data,
    required Variables$Query$getInfluencerTotalDiscounts variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetInfluencerTotalDiscounts),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInfluencerTotalDiscounts? readQuery$getInfluencerTotalDiscounts({
    required Variables$Query$getInfluencerTotalDiscounts variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetInfluencerTotalDiscounts),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getInfluencerTotalDiscounts.fromJson(result);
  }
}

class Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate {
  Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate?
      aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
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

extension UtilityExtension$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
    on Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate {
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
        instance,
    TRes Function(
            Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate;

  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate;

  TRes call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate
      _instance;

  final TRes Function(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
              .stub(_res);
}

class Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate {
  Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate({
    this.sum,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$sum = json['sum'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
      sum: l$sum == null
          ? null
          : Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
              .fromJson((l$sum as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum?
      sum;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sum = sum;
    _resultData['sum'] = l$sum?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sum = sum;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sum,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sum = sum;
    final lOther$sum = other.sum;
    if (l$sum != lOther$sum) {
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

extension UtilityExtension$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
    on Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate {
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
        instance,
    TRes Function(
            Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate;

  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate;

  TRes call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum;
}

class _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? sum = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
        sum: sum == _undefined
            ? _instance.sum
            : (sum
                as Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
      TRes> get sum {
    final local$sum = _instance.sum;
    return local$sum == null
        ? CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
            local$sum, (e) => call(sum: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum?
        sum,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
          TRes>
      get sum =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
              .stub(_res);
}

class Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum {
  Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum({
    this.discount,
    required this.$__typename,
  });

  factory Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum.fromJson(
      Map<String, dynamic> json) {
    final l$discount = json['discount'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
      discount: l$discount == null ? null : moneyFromJson(l$discount),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? discount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$discount = discount;
    _resultData['discount'] =
        l$discount == null ? null : moneyToJson(l$discount);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$discount = discount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$discount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$discount = discount;
    final lOther$discount = other.discount;
    if (l$discount != lOther$discount) {
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

extension UtilityExtension$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
    on Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum {
  CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum>
      get copyWith =>
          CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
    TRes> {
  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
    Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
        instance,
    TRes Function(
            Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum)
        then,
  ) = _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum;

  factory CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum;

  TRes call({
    double? discount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
    this._instance,
    this._then,
  );

  final Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum
      _instance;

  final TRes Function(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum)
      _then;

  static const _undefined = {};

  TRes call({
    Object? discount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
        discount:
            discount == _undefined ? _instance.discount : (discount as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
        TRes>
    implements
        CopyWith$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerTotalDiscounts$service_provider_offer_applied_aggregate$aggregate$sum(
      this._res);

  TRes _res;

  call({
    double? discount,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInfluencerEarnings {
  factory Variables$Query$getInfluencerEarnings({required int influencer_id}) =>
      Variables$Query$getInfluencerEarnings._({
        r'influencer_id': influencer_id,
      });

  Variables$Query$getInfluencerEarnings._(this._$data);

  factory Variables$Query$getInfluencerEarnings.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$influencer_id = data['influencer_id'];
    result$data['influencer_id'] = (l$influencer_id as int);
    return Variables$Query$getInfluencerEarnings._(result$data);
  }

  Map<String, dynamic> _$data;

  int get influencer_id => (_$data['influencer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$influencer_id = influencer_id;
    result$data['influencer_id'] = l$influencer_id;
    return result$data;
  }

  CopyWith$Variables$Query$getInfluencerEarnings<
          Variables$Query$getInfluencerEarnings>
      get copyWith => CopyWith$Variables$Query$getInfluencerEarnings(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInfluencerEarnings) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$influencer_id = influencer_id;
    return Object.hashAll([l$influencer_id]);
  }
}

abstract class CopyWith$Variables$Query$getInfluencerEarnings<TRes> {
  factory CopyWith$Variables$Query$getInfluencerEarnings(
    Variables$Query$getInfluencerEarnings instance,
    TRes Function(Variables$Query$getInfluencerEarnings) then,
  ) = _CopyWithImpl$Variables$Query$getInfluencerEarnings;

  factory CopyWith$Variables$Query$getInfluencerEarnings.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInfluencerEarnings;

  TRes call({int? influencer_id});
}

class _CopyWithImpl$Variables$Query$getInfluencerEarnings<TRes>
    implements CopyWith$Variables$Query$getInfluencerEarnings<TRes> {
  _CopyWithImpl$Variables$Query$getInfluencerEarnings(
    this._instance,
    this._then,
  );

  final Variables$Query$getInfluencerEarnings _instance;

  final TRes Function(Variables$Query$getInfluencerEarnings) _then;

  static const _undefined = {};

  TRes call({Object? influencer_id = _undefined}) =>
      _then(Variables$Query$getInfluencerEarnings._({
        ..._instance._$data,
        if (influencer_id != _undefined && influencer_id != null)
          'influencer_id': (influencer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInfluencerEarnings<TRes>
    implements CopyWith$Variables$Query$getInfluencerEarnings<TRes> {
  _CopyWithStubImpl$Variables$Query$getInfluencerEarnings(this._res);

  TRes _res;

  call({int? influencer_id}) => _res;
}

class Query$getInfluencerEarnings {
  Query$getInfluencerEarnings({
    required this.service_provider_offer_applied,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied =
        json['service_provider_offer_applied'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings(
      service_provider_offer_applied: (l$service_provider_offer_applied
              as List<dynamic>)
          .map((e) => Query$getInfluencerEarnings$service_provider_offer_applied
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getInfluencerEarnings$service_provider_offer_applied>
      service_provider_offer_applied;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied = service_provider_offer_applied;
    _resultData['service_provider_offer_applied'] =
        l$service_provider_offer_applied.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer_applied.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInfluencerEarnings) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final lOther$service_provider_offer_applied =
        other.service_provider_offer_applied;
    if (l$service_provider_offer_applied.length !=
        lOther$service_provider_offer_applied.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer_applied.length; i++) {
      final l$service_provider_offer_applied$entry =
          l$service_provider_offer_applied[i];
      final lOther$service_provider_offer_applied$entry =
          lOther$service_provider_offer_applied[i];
      if (l$service_provider_offer_applied$entry !=
          lOther$service_provider_offer_applied$entry) {
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

extension UtilityExtension$Query$getInfluencerEarnings
    on Query$getInfluencerEarnings {
  CopyWith$Query$getInfluencerEarnings<Query$getInfluencerEarnings>
      get copyWith => CopyWith$Query$getInfluencerEarnings(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings<TRes> {
  factory CopyWith$Query$getInfluencerEarnings(
    Query$getInfluencerEarnings instance,
    TRes Function(Query$getInfluencerEarnings) then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings;

  factory CopyWith$Query$getInfluencerEarnings.stub(TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings;

  TRes call({
    List<Query$getInfluencerEarnings$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  });
  TRes service_provider_offer_applied(
      Iterable<Query$getInfluencerEarnings$service_provider_offer_applied> Function(
              Iterable<
                  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
                      Query$getInfluencerEarnings$service_provider_offer_applied>>)
          _fn);
}

class _CopyWithImpl$Query$getInfluencerEarnings<TRes>
    implements CopyWith$Query$getInfluencerEarnings<TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings _instance;

  final TRes Function(Query$getInfluencerEarnings) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerEarnings(
        service_provider_offer_applied: service_provider_offer_applied ==
                    _undefined ||
                service_provider_offer_applied == null
            ? _instance.service_provider_offer_applied
            : (service_provider_offer_applied as List<
                Query$getInfluencerEarnings$service_provider_offer_applied>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer_applied(
          Iterable<Query$getInfluencerEarnings$service_provider_offer_applied> Function(
                  Iterable<
                      CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
                          Query$getInfluencerEarnings$service_provider_offer_applied>>)
              _fn) =>
      call(
          service_provider_offer_applied: _fn(
              _instance.service_provider_offer_applied.map((e) =>
                  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getInfluencerEarnings<TRes>
    implements CopyWith$Query$getInfluencerEarnings<TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings(this._res);

  TRes _res;

  call({
    List<Query$getInfluencerEarnings$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer_applied(_fn) => _res;
}

const documentNodeQuerygetInfluencerEarnings = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInfluencerEarnings'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'influencer_id')),
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
        name: NameNode(value: 'service_provider_offer_applied'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'influencer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'influencer_id')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'comission'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discount'),
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
            name: NameNode(value: 'influencer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'loss'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_total'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant'),
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
                    name: NameNode(value: 'details'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
Query$getInfluencerEarnings _parserFn$Query$getInfluencerEarnings(
        Map<String, dynamic> data) =>
    Query$getInfluencerEarnings.fromJson(data);

class Options$Query$getInfluencerEarnings
    extends graphql.QueryOptions<Query$getInfluencerEarnings> {
  Options$Query$getInfluencerEarnings({
    String? operationName,
    required Variables$Query$getInfluencerEarnings variables,
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
          document: documentNodeQuerygetInfluencerEarnings,
          parserFn: _parserFn$Query$getInfluencerEarnings,
        );
}

class WatchOptions$Query$getInfluencerEarnings
    extends graphql.WatchQueryOptions<Query$getInfluencerEarnings> {
  WatchOptions$Query$getInfluencerEarnings({
    String? operationName,
    required Variables$Query$getInfluencerEarnings variables,
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
          document: documentNodeQuerygetInfluencerEarnings,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInfluencerEarnings,
        );
}

class FetchMoreOptions$Query$getInfluencerEarnings
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInfluencerEarnings({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getInfluencerEarnings variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetInfluencerEarnings,
        );
}

extension ClientExtension$Query$getInfluencerEarnings on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInfluencerEarnings>>
      query$getInfluencerEarnings(
              Options$Query$getInfluencerEarnings options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getInfluencerEarnings>
      watchQuery$getInfluencerEarnings(
              WatchOptions$Query$getInfluencerEarnings options) =>
          this.watchQuery(options);
  void writeQuery$getInfluencerEarnings({
    required Query$getInfluencerEarnings data,
    required Variables$Query$getInfluencerEarnings variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetInfluencerEarnings),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInfluencerEarnings? readQuery$getInfluencerEarnings({
    required Variables$Query$getInfluencerEarnings variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetInfluencerEarnings),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getInfluencerEarnings.fromJson(result);
  }
}

class Query$getInfluencerEarnings$service_provider_offer_applied {
  Query$getInfluencerEarnings$service_provider_offer_applied({
    this.comission,
    required this.discount,
    required this.id,
    this.influencer_id,
    this.loss,
    required this.offer_id,
    this.order_id,
    this.order_total,
    required this.order_type,
    this.restaurant_order,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied.fromJson(
      Map<String, dynamic> json) {
    final l$comission = json['comission'];
    final l$discount = json['discount'];
    final l$id = json['id'];
    final l$influencer_id = json['influencer_id'];
    final l$loss = json['loss'];
    final l$offer_id = json['offer_id'];
    final l$order_id = json['order_id'];
    final l$order_total = json['order_total'];
    final l$order_type = json['order_type'];
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied(
      comission: l$comission == null ? null : moneyFromJson(l$comission),
      discount: moneyFromJson(l$discount),
      id: (l$id as int),
      influencer_id: (l$influencer_id as int?),
      loss: l$loss == null ? null : moneyFromJson(l$loss),
      offer_id: (l$offer_id as int),
      order_id: (l$order_id as int?),
      order_total: l$order_total == null ? null : moneyFromJson(l$order_total),
      order_type: (l$order_type as String),
      restaurant_order: l$restaurant_order == null
          ? null
          : Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? comission;

  final double discount;

  final int id;

  final int? influencer_id;

  final double? loss;

  final int offer_id;

  final int? order_id;

  final double? order_total;

  final String order_type;

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order?
      restaurant_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comission = comission;
    _resultData['comission'] =
        l$comission == null ? null : moneyToJson(l$comission);
    final l$discount = discount;
    _resultData['discount'] = moneyToJson(l$discount);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$influencer_id = influencer_id;
    _resultData['influencer_id'] = l$influencer_id;
    final l$loss = loss;
    _resultData['loss'] = l$loss == null ? null : moneyToJson(l$loss);
    final l$offer_id = offer_id;
    _resultData['offer_id'] = l$offer_id;
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$order_total = order_total;
    _resultData['order_total'] =
        l$order_total == null ? null : moneyToJson(l$order_total);
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comission = comission;
    final l$discount = discount;
    final l$id = id;
    final l$influencer_id = influencer_id;
    final l$loss = loss;
    final l$offer_id = offer_id;
    final l$order_id = order_id;
    final l$order_total = order_total;
    final l$order_type = order_type;
    final l$restaurant_order = restaurant_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$comission,
      l$discount,
      l$id,
      l$influencer_id,
      l$loss,
      l$offer_id,
      l$order_id,
      l$order_total,
      l$order_type,
      l$restaurant_order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerEarnings$service_provider_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comission = comission;
    final lOther$comission = other.comission;
    if (l$comission != lOther$comission) {
      return false;
    }
    final l$discount = discount;
    final lOther$discount = other.discount;
    if (l$discount != lOther$discount) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$influencer_id = influencer_id;
    final lOther$influencer_id = other.influencer_id;
    if (l$influencer_id != lOther$influencer_id) {
      return false;
    }
    final l$loss = loss;
    final lOther$loss = other.loss;
    if (l$loss != lOther$loss) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (l$offer_id != lOther$offer_id) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    final l$order_total = order_total;
    final lOther$order_total = other.order_total;
    if (l$order_total != lOther$order_total) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
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

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied
    on Query$getInfluencerEarnings$service_provider_offer_applied {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
          Query$getInfluencerEarnings$service_provider_offer_applied>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied(
    Query$getInfluencerEarnings$service_provider_offer_applied instance,
    TRes Function(Query$getInfluencerEarnings$service_provider_offer_applied)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied;

  TRes call({
    double? comission,
    double? discount,
    int? id,
    int? influencer_id,
    double? loss,
    int? offer_id,
    int? order_id,
    double? order_total,
    String? order_type,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order?
        restaurant_order,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
      TRes> get restaurant_order;
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied _instance;

  final TRes Function(
      Query$getInfluencerEarnings$service_provider_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? comission = _undefined,
    Object? discount = _undefined,
    Object? id = _undefined,
    Object? influencer_id = _undefined,
    Object? loss = _undefined,
    Object? offer_id = _undefined,
    Object? order_id = _undefined,
    Object? order_total = _undefined,
    Object? order_type = _undefined,
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInfluencerEarnings$service_provider_offer_applied(
        comission: comission == _undefined
            ? _instance.comission
            : (comission as double?),
        discount: discount == _undefined || discount == null
            ? _instance.discount
            : (discount as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        influencer_id: influencer_id == _undefined
            ? _instance.influencer_id
            : (influencer_id as int?),
        loss: loss == _undefined ? _instance.loss : (loss as double?),
        offer_id: offer_id == _undefined || offer_id == null
            ? _instance.offer_id
            : (offer_id as int),
        order_id:
            order_id == _undefined ? _instance.order_id : (order_id as int?),
        order_total: order_total == _undefined
            ? _instance.order_total
            : (order_total as double?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
      TRes> get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied(
      this._res);

  TRes _res;

  call({
    double? comission,
    double? discount,
    int? id,
    int? influencer_id,
    double? loss,
    int? offer_id,
    int? order_id,
    double? order_total,
    String? order_type,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
          TRes>
      get restaurant_order =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
              .stub(_res);
}

class Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order {
  Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order({
    required this.restaurant,
    required this.customer,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
      restaurant:
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      customer:
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
      restaurant;

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
    on Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
        instance,
    TRes Function(
            Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order;

  TRes call({
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant?
        restaurant,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
      TRes> get restaurant;
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
      TRes> get customer;
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order
      _instance;

  final TRes Function(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant?
        restaurant,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
              .stub(_res);
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
              .stub(_res);
}

class Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant {
  Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
    on Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
        instance,
    TRes Function(
            Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant;

  TRes call({
    int? id,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
              .stub(_res);
}

class Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details {
  Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details({
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
      image: (l$image as String),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
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
            is Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
    on Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
        instance,
    TRes Function(
            Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details;

  TRes call({
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details
      _instance;

  final TRes Function(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer {
  Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
      user:
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
    on Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
        instance,
    TRes Function(
            Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer;

  TRes call({
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer
      _instance;

  final TRes Function(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
              .stub(_res);
}

class Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user {
  Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
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
            is Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
    on Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user {
  CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
    Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
        instance,
    TRes Function(
            Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user;

  factory CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user
      _instance;

  final TRes Function(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$getInfluencerEarnings$service_provider_offer_applied$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
