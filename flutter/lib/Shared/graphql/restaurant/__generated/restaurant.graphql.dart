import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$getRestaurants {
  Query$getRestaurants({
    required this.restaurant,
    required this.$__typename,
  });

  factory Query$getRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Query$getRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final l$restaurant$entry = l$restaurant[i];
      final lOther$restaurant$entry = lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
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

extension UtilityExtension$Query$getRestaurants on Query$getRestaurants {
  CopyWith$Query$getRestaurants<Query$getRestaurants> get copyWith =>
      CopyWith$Query$getRestaurants(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurants<TRes> {
  factory CopyWith$Query$getRestaurants(
    Query$getRestaurants instance,
    TRes Function(Query$getRestaurants) then,
  ) = _CopyWithImpl$Query$getRestaurants;

  factory CopyWith$Query$getRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants;

  TRes call({
    List<Query$getRestaurants$restaurant>? restaurant,
    String? $__typename,
  });
  TRes restaurant(
      Iterable<Query$getRestaurants$restaurant> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant<
                      Query$getRestaurants$restaurant>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurants<TRes>
    implements CopyWith$Query$getRestaurants<TRes> {
  _CopyWithImpl$Query$getRestaurants(
    this._instance,
    this._then,
  );

  final Query$getRestaurants _instance;

  final TRes Function(Query$getRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant as List<Query$getRestaurants$restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant(
          Iterable<Query$getRestaurants$restaurant> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant<
                          Query$getRestaurants$restaurant>>)
              _fn) =>
      call(
          restaurant: _fn(_instance.restaurant
              .map((e) => CopyWith$Query$getRestaurants$restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants<TRes>
    implements CopyWith$Query$getRestaurants<TRes> {
  _CopyWithStubImpl$Query$getRestaurants(this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant>? restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant(_fn) => _res;
}

const documentNodeQuerygetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurants'),
    variableDefinitions: [],
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
            name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'location_gps'),
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
            name: NameNode(value: 'description'),
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
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'value'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_info_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule_id'),
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
Query$getRestaurants _parserFn$Query$getRestaurants(
        Map<String, dynamic> data) =>
    Query$getRestaurants.fromJson(data);

class Options$Query$getRestaurants
    extends graphql.QueryOptions<Query$getRestaurants> {
  Options$Query$getRestaurants({
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
          document: documentNodeQuerygetRestaurants,
          parserFn: _parserFn$Query$getRestaurants,
        );
}

class WatchOptions$Query$getRestaurants
    extends graphql.WatchQueryOptions<Query$getRestaurants> {
  WatchOptions$Query$getRestaurants({
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
          document: documentNodeQuerygetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurants,
        );
}

class FetchMoreOptions$Query$getRestaurants extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetRestaurants,
        );
}

extension ClientExtension$Query$getRestaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurants>> query$getRestaurants(
          [Options$Query$getRestaurants? options]) async =>
      await this.query(options ?? Options$Query$getRestaurants());
  graphql.ObservableQuery<Query$getRestaurants> watchQuery$getRestaurants(
          [WatchOptions$Query$getRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getRestaurants());
  void writeQuery$getRestaurants({
    required Query$getRestaurants data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetRestaurants)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurants? readQuery$getRestaurants({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurants)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurants.fromJson(result);
  }
}

class Query$getRestaurants$restaurant {
  Query$getRestaurants$restaurant({
    required this.id,
    required this.image,
    required this.language_id,
    required this.location_text,
    required this.name,
    required this.location_gps,
    this.firebase_id,
    this.description,
    required this.status,
    this.payment_info_id,
    required this.schedule_id,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$firebase_id = json['firebase_id'];
    final l$description = json['description'];
    final l$status = json['status'];
    final l$payment_info_id = json['payment_info_id'];
    final l$schedule_id = json['schedule_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant(
      id: (l$id as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_text: (l$location_text as String),
      name: (l$name as String),
      location_gps: GeographyFromJson(l$location_gps),
      firebase_id: (l$firebase_id as String?),
      description: l$description == null
          ? null
          : Query$getRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      status: (l$status as String),
      payment_info_id: (l$payment_info_id as int?),
      schedule_id: (l$schedule_id as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String image;

  final String language_id;

  final String location_text;

  final String name;

  final Geography location_gps;

  final String? firebase_id;

  final Query$getRestaurants$restaurant$description? description;

  final String status;

  final int? payment_info_id;

  final int schedule_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$location_gps);
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$status = status;
    _resultData['status'] = l$status;
    final l$payment_info_id = payment_info_id;
    _resultData['payment_info_id'] = l$payment_info_id;
    final l$schedule_id = schedule_id;
    _resultData['schedule_id'] = l$schedule_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_text = location_text;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$firebase_id = firebase_id;
    final l$description = description;
    final l$status = status;
    final l$payment_info_id = payment_info_id;
    final l$schedule_id = schedule_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$language_id,
      l$location_text,
      l$name,
      l$location_gps,
      l$firebase_id,
      l$description,
      l$status,
      l$payment_info_id,
      l$schedule_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants$restaurant) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$payment_info_id = payment_info_id;
    final lOther$payment_info_id = other.payment_info_id;
    if (l$payment_info_id != lOther$payment_info_id) {
      return false;
    }
    final l$schedule_id = schedule_id;
    final lOther$schedule_id = other.schedule_id;
    if (l$schedule_id != lOther$schedule_id) {
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

extension UtilityExtension$Query$getRestaurants$restaurant
    on Query$getRestaurants$restaurant {
  CopyWith$Query$getRestaurants$restaurant<Query$getRestaurants$restaurant>
      get copyWith => CopyWith$Query$getRestaurants$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant<TRes> {
  factory CopyWith$Query$getRestaurants$restaurant(
    Query$getRestaurants$restaurant instance,
    TRes Function(Query$getRestaurants$restaurant) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant;

  factory CopyWith$Query$getRestaurants$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant;

  TRes call({
    int? id,
    String? image,
    String? language_id,
    String? location_text,
    String? name,
    Geography? location_gps,
    String? firebase_id,
    Query$getRestaurants$restaurant$description? description,
    String? status,
    int? payment_info_id,
    int? schedule_id,
    String? $__typename,
  });
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description;
}

class _CopyWithImpl$Query$getRestaurants$restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant _instance;

  final TRes Function(Query$getRestaurants$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? firebase_id = _undefined,
    Object? description = _undefined,
    Object? status = _undefined,
    Object? payment_info_id = _undefined,
    Object? schedule_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        description: description == _undefined
            ? _instance.description
            : (description as Query$getRestaurants$restaurant$description?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        payment_info_id: payment_info_id == _undefined
            ? _instance.payment_info_id
            : (payment_info_id as int?),
        schedule_id: schedule_id == _undefined || schedule_id == null
            ? _instance.schedule_id
            : (schedule_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurants$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? language_id,
    String? location_text,
    String? name,
    Geography? location_gps,
    String? firebase_id,
    Query$getRestaurants$restaurant$description? description,
    String? status,
    int? payment_info_id,
    int? schedule_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description =>
      CopyWith$Query$getRestaurants$restaurant$description.stub(_res);
}

class Query$getRestaurants$restaurant$description {
  Query$getRestaurants$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurants$restaurant$description$translations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getRestaurants$restaurant$description$translations>
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
    if (!(other is Query$getRestaurants$restaurant$description) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant$description
    on Query$getRestaurants$restaurant$description {
  CopyWith$Query$getRestaurants$restaurant$description<
          Query$getRestaurants$restaurant$description>
      get copyWith => CopyWith$Query$getRestaurants$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  factory CopyWith$Query$getRestaurants$restaurant$description(
    Query$getRestaurants$restaurant$description instance,
    TRes Function(Query$getRestaurants$restaurant$description) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant$description;

  factory CopyWith$Query$getRestaurants$restaurant$description.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant$description;

  TRes call({
    List<Query$getRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurants$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant$description$translations<
                      Query$getRestaurants$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurants$restaurant$description<TRes>
    implements CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant$description _instance;

  final TRes Function(Query$getRestaurants$restaurant$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurants$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurants$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant$description$translations<
                          Query$getRestaurants$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurants$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant$description<TRes>
    implements CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant$description(this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurants$restaurant$description$translations {
  Query$getRestaurants$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant$description$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants$restaurant$description$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$getRestaurants$restaurant$description$translations
    on Query$getRestaurants$restaurant$description$translations {
  CopyWith$Query$getRestaurants$restaurant$description$translations<
          Query$getRestaurants$restaurant$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant$description$translations(
    Query$getRestaurants$restaurant$description$translations instance,
    TRes Function(Query$getRestaurants$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant$description$translations;

  factory CopyWith$Query$getRestaurants$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant$description$translations _instance;

  final TRes Function(Query$getRestaurants$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant$description$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOneRestaurant {
  factory Variables$Query$getOneRestaurant({required int id}) =>
      Variables$Query$getOneRestaurant._({
        r'id': id,
      });

  Variables$Query$getOneRestaurant._(this._$data);

  factory Variables$Query$getOneRestaurant.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getOneRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getOneRestaurant<Variables$Query$getOneRestaurant>
      get copyWith => CopyWith$Variables$Query$getOneRestaurant(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOneRestaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$getOneRestaurant<TRes> {
  factory CopyWith$Variables$Query$getOneRestaurant(
    Variables$Query$getOneRestaurant instance,
    TRes Function(Variables$Query$getOneRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$getOneRestaurant;

  factory CopyWith$Variables$Query$getOneRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOneRestaurant;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getOneRestaurant<TRes>
    implements CopyWith$Variables$Query$getOneRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$getOneRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$getOneRestaurant _instance;

  final TRes Function(Variables$Query$getOneRestaurant) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getOneRestaurant._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOneRestaurant<TRes>
    implements CopyWith$Variables$Query$getOneRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$getOneRestaurant(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getOneRestaurant {
  Query$getOneRestaurant({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getOneRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk;

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
    if (!(other is Query$getOneRestaurant) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getOneRestaurant on Query$getOneRestaurant {
  CopyWith$Query$getOneRestaurant<Query$getOneRestaurant> get copyWith =>
      CopyWith$Query$getOneRestaurant(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOneRestaurant<TRes> {
  factory CopyWith$Query$getOneRestaurant(
    Query$getOneRestaurant instance,
    TRes Function(Query$getOneRestaurant) then,
  ) = _CopyWithImpl$Query$getOneRestaurant;

  factory CopyWith$Query$getOneRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant;

  TRes call({
    Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk;
}

class _CopyWithImpl$Query$getOneRestaurant<TRes>
    implements CopyWith$Query$getOneRestaurant<TRes> {
  _CopyWithImpl$Query$getOneRestaurant(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant _instance;

  final TRes Function(Query$getOneRestaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk as Query$getOneRestaurant$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant<TRes>
    implements CopyWith$Query$getOneRestaurant<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant(this._res);

  TRes _res;

  call({
    Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk =>
      CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetOneRestaurant = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOneRestaurant'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'firebase_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
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
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'value'),
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
            name: NameNode(value: 'location_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'schedule_id'),
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
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$getOneRestaurant _parserFn$Query$getOneRestaurant(
        Map<String, dynamic> data) =>
    Query$getOneRestaurant.fromJson(data);

class Options$Query$getOneRestaurant
    extends graphql.QueryOptions<Query$getOneRestaurant> {
  Options$Query$getOneRestaurant({
    String? operationName,
    required Variables$Query$getOneRestaurant variables,
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
          document: documentNodeQuerygetOneRestaurant,
          parserFn: _parserFn$Query$getOneRestaurant,
        );
}

class WatchOptions$Query$getOneRestaurant
    extends graphql.WatchQueryOptions<Query$getOneRestaurant> {
  WatchOptions$Query$getOneRestaurant({
    String? operationName,
    required Variables$Query$getOneRestaurant variables,
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
          document: documentNodeQuerygetOneRestaurant,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOneRestaurant,
        );
}

class FetchMoreOptions$Query$getOneRestaurant extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOneRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOneRestaurant variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOneRestaurant,
        );
}

extension ClientExtension$Query$getOneRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOneRestaurant>> query$getOneRestaurant(
          Options$Query$getOneRestaurant options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getOneRestaurant> watchQuery$getOneRestaurant(
          WatchOptions$Query$getOneRestaurant options) =>
      this.watchQuery(options);
  void writeQuery$getOneRestaurant({
    required Query$getOneRestaurant data,
    required Variables$Query$getOneRestaurant variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOneRestaurant),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOneRestaurant? readQuery$getOneRestaurant({
    required Variables$Query$getOneRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOneRestaurant),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOneRestaurant.fromJson(result);
  }
}

class Query$getOneRestaurant$restaurant_by_pk {
  Query$getOneRestaurant$restaurant_by_pk({
    required this.id,
    this.firebase_id,
    this.description,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.schedule_id,
    required this.status,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$description = json['description'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$schedule_id = json['schedule_id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      description: l$description == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_gps: GeographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      schedule_id: (l$schedule_id as int),
      status: (l$status as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String? firebase_id;

  final Query$getOneRestaurant$restaurant_by_pk$description? description;

  final String image;

  final String language_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final int schedule_id;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$schedule_id = schedule_id;
    _resultData['schedule_id'] = l$schedule_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$description = description;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$schedule_id = schedule_id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$description,
      l$image,
      l$language_id,
      l$location_gps,
      l$location_text,
      l$name,
      l$schedule_id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOneRestaurant$restaurant_by_pk) ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$schedule_id = schedule_id;
    final lOther$schedule_id = other.schedule_id;
    if (l$schedule_id != lOther$schedule_id) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk
    on Query$getOneRestaurant$restaurant_by_pk {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<
          Query$getOneRestaurant$restaurant_by_pk>
      get copyWith => CopyWith$Query$getOneRestaurant$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk(
    Query$getOneRestaurant$restaurant_by_pk instance,
    TRes Function(Query$getOneRestaurant$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk;

  TRes call({
    int? id,
    String? firebase_id,
    Query$getOneRestaurant$restaurant_by_pk$description? description,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    int? schedule_id,
    String? status,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk<TRes>
    implements CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk _instance;

  final TRes Function(Query$getOneRestaurant$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? schedule_id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getOneRestaurant$restaurant_by_pk$description?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule_id: schedule_id == _undefined || schedule_id == null
            ? _instance.schedule_id
            : (schedule_id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk<TRes>
    implements CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    Query$getOneRestaurant$restaurant_by_pk$description? description,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    int? schedule_id,
    String? status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
              _res);
}

class Query$getOneRestaurant$restaurant_by_pk$description {
  Query$getOneRestaurant$restaurant_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOneRestaurant$restaurant_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
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
    if (!(other is Query$getOneRestaurant$restaurant_by_pk$description) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk$description
    on Query$getOneRestaurant$restaurant_by_pk$description {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<
          Query$getOneRestaurant$restaurant_by_pk$description>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
    Query$getOneRestaurant$restaurant_by_pk$description instance,
    TRes Function(Query$getOneRestaurant$restaurant_by_pk$description) then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description;

  TRes call({
    List<Query$getOneRestaurant$restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getOneRestaurant$restaurant_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
                      Query$getOneRestaurant$restaurant_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk$description _instance;

  final TRes Function(Query$getOneRestaurant$restaurant_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getOneRestaurant$restaurant_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getOneRestaurant$restaurant_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
                          Query$getOneRestaurant$restaurant_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Query$getOneRestaurant$restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getOneRestaurant$restaurant_by_pk$description$translations {
  Query$getOneRestaurant$restaurant_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOneRestaurant$restaurant_by_pk$description$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk$description$translations
    on Query$getOneRestaurant$restaurant_by_pk$description$translations {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
          Query$getOneRestaurant$restaurant_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
    Query$getOneRestaurant$restaurant_by_pk$description$translations instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk$description$translations
      _instance;

  final TRes Function(
      Query$getOneRestaurant$restaurant_by_pk$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk$description$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
