import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$GetRestaurants {
  Query$GetRestaurants({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$GetRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$GetRestaurants$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurants$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRestaurants) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$GetRestaurants on Query$GetRestaurants {
  CopyWith$Query$GetRestaurants<Query$GetRestaurants> get copyWith =>
      CopyWith$Query$GetRestaurants(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurants<TRes> {
  factory CopyWith$Query$GetRestaurants(
    Query$GetRestaurants instance,
    TRes Function(Query$GetRestaurants) then,
  ) = _CopyWithImpl$Query$GetRestaurants;

  factory CopyWith$Query$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants;

  TRes call({
    Query$GetRestaurants$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> get restaurant_by_pk;
}

class _CopyWithImpl$Query$GetRestaurants<TRes>
    implements CopyWith$Query$GetRestaurants<TRes> {
  _CopyWithImpl$Query$GetRestaurants(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants _instance;

  final TRes Function(Query$GetRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRestaurants(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk as Query$GetRestaurants$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$GetRestaurants$restaurant_by_pk.stub(_then(_instance))
        : CopyWith$Query$GetRestaurants$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$GetRestaurants<TRes>
    implements CopyWith$Query$GetRestaurants<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants(this._res);

  TRes _res;

  call({
    Query$GetRestaurants$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> get restaurant_by_pk =>
      CopyWith$Query$GetRestaurants$restaurant_by_pk.stub(_res);
}

const documentNodeQueryGetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRestaurants'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '1'),
          )
        ],
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
]);
Query$GetRestaurants _parserFn$Query$GetRestaurants(
        Map<String, dynamic> data) =>
    Query$GetRestaurants.fromJson(data);

class Options$Query$GetRestaurants
    extends graphql.QueryOptions<Query$GetRestaurants> {
  Options$Query$GetRestaurants({
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
          document: documentNodeQueryGetRestaurants,
          parserFn: _parserFn$Query$GetRestaurants,
        );
}

class WatchOptions$Query$GetRestaurants
    extends graphql.WatchQueryOptions<Query$GetRestaurants> {
  WatchOptions$Query$GetRestaurants({
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
          document: documentNodeQueryGetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetRestaurants,
        );
}

class FetchMoreOptions$Query$GetRestaurants extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetRestaurants,
        );
}

extension ClientExtension$Query$GetRestaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRestaurants>> query$GetRestaurants(
          [Options$Query$GetRestaurants? options]) async =>
      await this.query(options ?? Options$Query$GetRestaurants());
  graphql.ObservableQuery<Query$GetRestaurants> watchQuery$GetRestaurants(
          [WatchOptions$Query$GetRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetRestaurants());
  void writeQuery$GetRestaurants({
    required Query$GetRestaurants data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetRestaurants)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetRestaurants? readQuery$GetRestaurants({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetRestaurants)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRestaurants.fromJson(result);
  }
}

class Query$GetRestaurants$restaurant_by_pk {
  Query$GetRestaurants$restaurant_by_pk({
    required this.image,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$GetRestaurants$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurant_by_pk(
      image: (l$image as String),
      language_id: (l$language_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String image;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRestaurants$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetRestaurants$restaurant_by_pk
    on Query$GetRestaurants$restaurant_by_pk {
  CopyWith$Query$GetRestaurants$restaurant_by_pk<
          Query$GetRestaurants$restaurant_by_pk>
      get copyWith => CopyWith$Query$GetRestaurants$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> {
  factory CopyWith$Query$GetRestaurants$restaurant_by_pk(
    Query$GetRestaurants$restaurant_by_pk instance,
    TRes Function(Query$GetRestaurants$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurant_by_pk;

  factory CopyWith$Query$GetRestaurants$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants$restaurant_by_pk;

  TRes call({
    String? image,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRestaurants$restaurant_by_pk<TRes>
    implements CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$GetRestaurants$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurant_by_pk _instance;

  final TRes Function(Query$GetRestaurants$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRestaurants$restaurant_by_pk(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurant_by_pk<TRes>
    implements CopyWith$Query$GetRestaurants$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants$restaurant_by_pk(this._res);

  TRes _res;

  call({
    String? image,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}
