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
    final l$$Typename = json['__typename'];
    return Query$getRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Query$getRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$Typename as String),
    );
  }

  final List<Query$getRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final List<Query$getRestaurants$restaurant> l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant
        .map((Query$getRestaurants$restaurant e) => e.toJson())
        .toList();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final List<Query$getRestaurants$restaurant> l$restaurant = restaurant;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      Object.hashAll(
          l$restaurant.map((Query$getRestaurants$restaurant v) => v)),
      l$$Typename,
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
    final List<Query$getRestaurants$restaurant> l$restaurant = restaurant;
    final List<Query$getRestaurants$restaurant> lOther$restaurant =
        other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final Query$getRestaurants$restaurant l$restaurant$entry =
          l$restaurant[i];
      final Query$getRestaurants$restaurant lOther$restaurant$entry =
          lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
        return false;
      }
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRestaurants on Query$getRestaurants {
  CopyWith$Query$getRestaurants<Query$getRestaurants> get copyWith =>
      CopyWith$Query$getRestaurants(
        this,
        (Query$getRestaurants i) => i,
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

  static const Map _undefined = {};

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
          restaurant: _fn(_instance.restaurant.map(
              (Query$getRestaurants$restaurant e) =>
                  CopyWith$Query$getRestaurants$restaurant(
                    e,
                    (Query$getRestaurants$restaurant i) => i,
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

const DocumentNode documentNodeQuerygetRestaurants = DocumentNode(definitions: [
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
      await query(options ?? Options$Query$getRestaurants());
  graphql.ObservableQuery<Query$getRestaurants> watchQuery$getRestaurants(
          [WatchOptions$Query$getRestaurants? options]) =>
      watchQuery(options ?? WatchOptions$Query$getRestaurants());
  void writeQuery$getRestaurants({
    required Query$getRestaurants data,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetRestaurants)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurants? readQuery$getRestaurants({bool optimistic = true}) {
    final Map<String, dynamic>? result = readQuery(
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
    final l$languageId = json['language_id'];
    final l$locationText = json['location_text'];
    final l$name = json['name'];
    final l$locationGps = json['location_gps'];
    final l$firebaseId = json['firebase_id'];
    final l$description = json['description'];
    final l$status = json['status'];
    final l$paymentInfoId = json['payment_info_id'];
    final l$scheduleId = json['schedule_id'];
    final l$$Typename = json['__typename'];
    return Query$getRestaurants$restaurant(
      id: (l$id as int),
      image: (l$image as String),
      language_id: (l$languageId as String),
      location_text: (l$locationText as String),
      name: (l$name as String),
      location_gps: GeographyFromJson(l$locationGps),
      firebase_id: (l$firebaseId as String?),
      description: l$description == null
          ? null
          : Query$getRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      status: (l$status as String),
      payment_info_id: (l$paymentInfoId as int?),
      schedule_id: (l$scheduleId as int),
      $__typename: (l$$Typename as String),
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
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final int l$id = id;
    _resultData['id'] = l$id;
    final String l$image = image;
    _resultData['image'] = l$image;
    final String l$languageId = language_id;
    _resultData['language_id'] = l$languageId;
    final String l$locationText = location_text;
    _resultData['location_text'] = l$locationText;
    final String l$name = name;
    _resultData['name'] = l$name;
    final Geography l$locationGps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$locationGps);
    final String? l$firebaseId = firebase_id;
    _resultData['firebase_id'] = l$firebaseId;
    final Query$getRestaurants$restaurant$description? l$description =
        description;
    _resultData['description'] = l$description?.toJson();
    final String l$status = status;
    _resultData['status'] = l$status;
    final int? l$paymentInfoId = payment_info_id;
    _resultData['payment_info_id'] = l$paymentInfoId;
    final int l$scheduleId = schedule_id;
    _resultData['schedule_id'] = l$scheduleId;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final int l$id = id;
    final String l$image = image;
    final String l$languageId = language_id;
    final String l$locationText = location_text;
    final String l$name = name;
    final Geography l$locationGps = location_gps;
    final String? l$firebaseId = firebase_id;
    final Query$getRestaurants$restaurant$description? l$description =
        description;
    final String l$status = status;
    final int? l$paymentInfoId = payment_info_id;
    final int l$scheduleId = schedule_id;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$languageId,
      l$locationText,
      l$name,
      l$locationGps,
      l$firebaseId,
      l$description,
      l$status,
      l$paymentInfoId,
      l$scheduleId,
      l$$Typename,
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
    final int l$id = id;
    final int lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final String l$image = image;
    final String lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final String l$languageId = language_id;
    final String lOther$languageId = other.language_id;
    if (l$languageId != lOther$languageId) {
      return false;
    }
    final String l$locationText = location_text;
    final String lOther$locationText = other.location_text;
    if (l$locationText != lOther$locationText) {
      return false;
    }
    final String l$name = name;
    final String lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final Geography l$locationGps = location_gps;
    final Geography lOther$locationGps = other.location_gps;
    if (l$locationGps != lOther$locationGps) {
      return false;
    }
    final String? l$firebaseId = firebase_id;
    final String? lOther$firebaseId = other.firebase_id;
    if (l$firebaseId != lOther$firebaseId) {
      return false;
    }
    final Query$getRestaurants$restaurant$description? l$description =
        description;
    final Query$getRestaurants$restaurant$description? lOther$description =
        other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final String l$status = status;
    final String lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final int? l$paymentInfoId = payment_info_id;
    final int? lOther$paymentInfoId = other.payment_info_id;
    if (l$paymentInfoId != lOther$paymentInfoId) {
      return false;
    }
    final int l$scheduleId = schedule_id;
    final int lOther$scheduleId = other.schedule_id;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getRestaurants$restaurant i) => i,
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

  static const Map _undefined = {};

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
    final Query$getRestaurants$restaurant$description? local$description =
        _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurants$restaurant$description(
            local$description,
            (Query$getRestaurants$restaurant$description e) =>
                call(description: e));
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
    final l$$Typename = json['__typename'];
    return Query$getRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurants$restaurant$description$translations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$Typename as String),
    );
  }

  final List<Query$getRestaurants$restaurant$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final List<Query$getRestaurants$restaurant$description$translations>
        l$translations = translations;
    _resultData['translations'] = l$translations
        .map((Query$getRestaurants$restaurant$description$translations e) =>
            e.toJson())
        .toList();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final List<Query$getRestaurants$restaurant$description$translations>
        l$translations = translations;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map(
          (Query$getRestaurants$restaurant$description$translations v) => v)),
      l$$Typename,
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
    final List<Query$getRestaurants$restaurant$description$translations>
        l$translations = translations;
    final List<Query$getRestaurants$restaurant$description$translations>
        lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final Query$getRestaurants$restaurant$description$translations
          l$translations$entry = l$translations[i];
      final Query$getRestaurants$restaurant$description$translations
          lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
        return false;
      }
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getRestaurants$restaurant$description i) => i,
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

  static const Map _undefined = {};

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
          translations: _fn(_instance.translations.map(
              (Query$getRestaurants$restaurant$description$translations e) =>
                  CopyWith$Query$getRestaurants$restaurant$description$translations(
                    e,
                    (Query$getRestaurants$restaurant$description$translations
                            i) =>
                        i,
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
    final l$languageId = json['language_id'];
    final l$value = json['value'];
    final l$$Typename = json['__typename'];
    return Query$getRestaurants$restaurant$description$translations(
      language_id: (l$languageId as String),
      value: (l$value as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final String l$languageId = language_id;
    _resultData['language_id'] = l$languageId;
    final String l$value = value;
    _resultData['value'] = l$value;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final String l$languageId = language_id;
    final String l$value = value;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$languageId,
      l$value,
      l$$Typename,
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
    final String l$languageId = language_id;
    final String lOther$languageId = other.language_id;
    if (l$languageId != lOther$languageId) {
      return false;
    }
    final String l$value = value;
    final String lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getRestaurants$restaurant$description$translations i) => i,
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

  static const Map _undefined = {};

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
    final Map<String, dynamic> result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getOneRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result$data = <String, dynamic>{};
    final int l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getOneRestaurant<Variables$Query$getOneRestaurant>
      get copyWith => CopyWith$Variables$Query$getOneRestaurant(
            this,
            (Variables$Query$getOneRestaurant i) => i,
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
    final int l$id = id;
    final int lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final int l$id = id;
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

  static const Map _undefined = {};

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
    final l$restaurantByPk = json['restaurant_by_pk'];
    final l$$Typename = json['__typename'];
    return Query$getOneRestaurant(
      restaurant_by_pk: l$restaurantByPk == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk.fromJson(
              (l$restaurantByPk as Map<String, dynamic>)),
      $__typename: (l$$Typename as String),
    );
  }

  final Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final Query$getOneRestaurant$restaurant_by_pk? l$restaurantByPk =
        restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurantByPk?.toJson();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final Query$getOneRestaurant$restaurant_by_pk? l$restaurantByPk =
        restaurant_by_pk;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$restaurantByPk,
      l$$Typename,
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
    final Query$getOneRestaurant$restaurant_by_pk? l$restaurantByPk =
        restaurant_by_pk;
    final Query$getOneRestaurant$restaurant_by_pk? lOther$restaurantByPk =
        other.restaurant_by_pk;
    if (l$restaurantByPk != lOther$restaurantByPk) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getOneRestaurant on Query$getOneRestaurant {
  CopyWith$Query$getOneRestaurant<Query$getOneRestaurant> get copyWith =>
      CopyWith$Query$getOneRestaurant(
        this,
        (Query$getOneRestaurant i) => i,
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

  static const Map _undefined = {};

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
    final Query$getOneRestaurant$restaurant_by_pk? local$restaurantByPk =
        _instance.restaurant_by_pk;
    return local$restaurantByPk == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk(
            local$restaurantByPk,
            (Query$getOneRestaurant$restaurant_by_pk e) =>
                call(restaurant_by_pk: e));
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

const DocumentNode documentNodeQuerygetOneRestaurant =
    DocumentNode(definitions: [
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
      await query(options);
  graphql.ObservableQuery<Query$getOneRestaurant> watchQuery$getOneRestaurant(
          WatchOptions$Query$getOneRestaurant options) =>
      watchQuery(options);
  void writeQuery$getOneRestaurant({
    required Query$getOneRestaurant data,
    required Variables$Query$getOneRestaurant variables,
    bool broadcast = true,
  }) =>
      writeQuery(
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
    final Map<String, dynamic>? result = readQuery(
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
    final l$firebaseId = json['firebase_id'];
    final l$description = json['description'];
    final l$image = json['image'];
    final l$languageId = json['language_id'];
    final l$locationGps = json['location_gps'];
    final l$locationText = json['location_text'];
    final l$name = json['name'];
    final l$scheduleId = json['schedule_id'];
    final l$status = json['status'];
    final l$$Typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk(
      id: (l$id as int),
      firebase_id: (l$firebaseId as String?),
      description: l$description == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      image: (l$image as String),
      language_id: (l$languageId as String),
      location_gps: GeographyFromJson(l$locationGps),
      location_text: (l$locationText as String),
      name: (l$name as String),
      schedule_id: (l$scheduleId as int),
      status: (l$status as String),
      $__typename: (l$$Typename as String),
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
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final int l$id = id;
    _resultData['id'] = l$id;
    final String? l$firebaseId = firebase_id;
    _resultData['firebase_id'] = l$firebaseId;
    final Query$getOneRestaurant$restaurant_by_pk$description? l$description =
        description;
    _resultData['description'] = l$description?.toJson();
    final String l$image = image;
    _resultData['image'] = l$image;
    final String l$languageId = language_id;
    _resultData['language_id'] = l$languageId;
    final Geography l$locationGps = location_gps;
    _resultData['location_gps'] = GeographyToJson(l$locationGps);
    final String l$locationText = location_text;
    _resultData['location_text'] = l$locationText;
    final String l$name = name;
    _resultData['name'] = l$name;
    final int l$scheduleId = schedule_id;
    _resultData['schedule_id'] = l$scheduleId;
    final String l$status = status;
    _resultData['status'] = l$status;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final int l$id = id;
    final String? l$firebaseId = firebase_id;
    final Query$getOneRestaurant$restaurant_by_pk$description? l$description =
        description;
    final String l$image = image;
    final String l$languageId = language_id;
    final Geography l$locationGps = location_gps;
    final String l$locationText = location_text;
    final String l$name = name;
    final int l$scheduleId = schedule_id;
    final String l$status = status;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebaseId,
      l$description,
      l$image,
      l$languageId,
      l$locationGps,
      l$locationText,
      l$name,
      l$scheduleId,
      l$status,
      l$$Typename,
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
    final int l$id = id;
    final int lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final String? l$firebaseId = firebase_id;
    final String? lOther$firebaseId = other.firebase_id;
    if (l$firebaseId != lOther$firebaseId) {
      return false;
    }
    final Query$getOneRestaurant$restaurant_by_pk$description? l$description =
        description;
    final Query$getOneRestaurant$restaurant_by_pk$description?
        lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final String l$image = image;
    final String lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final String l$languageId = language_id;
    final String lOther$languageId = other.language_id;
    if (l$languageId != lOther$languageId) {
      return false;
    }
    final Geography l$locationGps = location_gps;
    final Geography lOther$locationGps = other.location_gps;
    if (l$locationGps != lOther$locationGps) {
      return false;
    }
    final String l$locationText = location_text;
    final String lOther$locationText = other.location_text;
    if (l$locationText != lOther$locationText) {
      return false;
    }
    final String l$name = name;
    final String lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final int l$scheduleId = schedule_id;
    final int lOther$scheduleId = other.schedule_id;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    final String l$status = status;
    final String lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getOneRestaurant$restaurant_by_pk i) => i,
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

  static const Map _undefined = {};

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
    final Query$getOneRestaurant$restaurant_by_pk$description?
        local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
            local$description,
            (Query$getOneRestaurant$restaurant_by_pk$description e) =>
                call(description: e));
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
    final l$$Typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOneRestaurant$restaurant_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$Typename as String),
    );
  }

  final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
        l$translations = translations;
    _resultData['translations'] = l$translations
        .map((Query$getOneRestaurant$restaurant_by_pk$description$translations
                e) =>
            e.toJson())
        .toList();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
        l$translations = translations;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map(
          (Query$getOneRestaurant$restaurant_by_pk$description$translations
                  v) =>
              v)),
      l$$Typename,
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
    final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
        l$translations = translations;
    final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
        lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final Query$getOneRestaurant$restaurant_by_pk$description$translations
          l$translations$entry = l$translations[i];
      final Query$getOneRestaurant$restaurant_by_pk$description$translations
          lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
        return false;
      }
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getOneRestaurant$restaurant_by_pk$description i) => i,
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

  static const Map _undefined = {};

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
          translations: _fn(_instance.translations.map(
              (Query$getOneRestaurant$restaurant_by_pk$description$translations
                      e) =>
                  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
                    e,
                    (Query$getOneRestaurant$restaurant_by_pk$description$translations
                            i) =>
                        i,
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
    final l$languageId = json['language_id'];
    final l$value = json['value'];
    final l$$Typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description$translations(
      language_id: (l$languageId as String),
      value: (l$value as String),
      $__typename: (l$$Typename as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final String l$languageId = language_id;
    _resultData['language_id'] = l$languageId;
    final String l$value = value;
    _resultData['value'] = l$value;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final String l$languageId = language_id;
    final String l$value = value;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$languageId,
      l$value,
      l$$Typename,
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
    final String l$languageId = language_id;
    final String lOther$languageId = other.language_id;
    if (l$languageId != lOther$languageId) {
      return false;
    }
    final String l$value = value;
    final String lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
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
            (Query$getOneRestaurant$restaurant_by_pk$description$translations
                    i) =>
                i,
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

  static const Map _undefined = {};

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

class Subscription$GetRestaurants {
  Subscription$GetRestaurants({
    required this.restaurant,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$Typename = json['__typename'];
    return Subscription$GetRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Subscription$GetRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$Typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final List<Subscription$GetRestaurants$restaurant> l$restaurant =
        restaurant;
    _resultData['restaurant'] = l$restaurant
        .map((Subscription$GetRestaurants$restaurant e) => e.toJson())
        .toList();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final List<Subscription$GetRestaurants$restaurant> l$restaurant =
        restaurant;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      Object.hashAll(
          l$restaurant.map((Subscription$GetRestaurants$restaurant v) => v)),
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final List<Subscription$GetRestaurants$restaurant> l$restaurant =
        restaurant;
    final List<Subscription$GetRestaurants$restaurant> lOther$restaurant =
        other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final Subscription$GetRestaurants$restaurant l$restaurant$entry =
          l$restaurant[i];
      final Subscription$GetRestaurants$restaurant lOther$restaurant$entry =
          lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
        return false;
      }
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants
    on Subscription$GetRestaurants {
  CopyWith$Subscription$GetRestaurants<Subscription$GetRestaurants>
      get copyWith => CopyWith$Subscription$GetRestaurants(
            this,
            (Subscription$GetRestaurants i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants<TRes> {
  factory CopyWith$Subscription$GetRestaurants(
    Subscription$GetRestaurants instance,
    TRes Function(Subscription$GetRestaurants) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants;

  factory CopyWith$Subscription$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants;

  TRes call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  });
  TRes restaurant(
      Iterable<Subscription$GetRestaurants$restaurant> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant<
                      Subscription$GetRestaurants$restaurant>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants _instance;

  final TRes Function(Subscription$GetRestaurants) _then;

  static const Map _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant as List<Subscription$GetRestaurants$restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant(
          Iterable<Subscription$GetRestaurants$restaurant> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant<
                          Subscription$GetRestaurants$restaurant>>)
              _fn) =>
      call(
          restaurant: _fn(_instance.restaurant.map(
              (Subscription$GetRestaurants$restaurant e) =>
                  CopyWith$Subscription$GetRestaurants$restaurant(
                    e,
                    (Subscription$GetRestaurants$restaurant i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants(this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant(_fn) => _res;
}

const DocumentNode documentNodeSubscriptionGetRestaurants =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetRestaurants'),
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'open_status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'approved'),
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
            name: NameNode(value: 'payment_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bank_transfer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'card'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cash'),
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
Subscription$GetRestaurants _parserFn$Subscription$GetRestaurants(
        Map<String, dynamic> data) =>
    Subscription$GetRestaurants.fromJson(data);

class Options$Subscription$GetRestaurants
    extends graphql.SubscriptionOptions<Subscription$GetRestaurants> {
  Options$Subscription$GetRestaurants({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionGetRestaurants,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class WatchOptions$Subscription$GetRestaurants
    extends graphql.WatchQueryOptions<Subscription$GetRestaurants> {
  WatchOptions$Subscription$GetRestaurants({
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
          document: documentNodeSubscriptionGetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class FetchMoreOptions$Subscription$GetRestaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionGetRestaurants,
        );
}

extension ClientExtension$Subscription$GetRestaurants on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetRestaurants>>
      subscribe$GetRestaurants(
              [Options$Subscription$GetRestaurants? options]) =>
          subscribe(options ?? Options$Subscription$GetRestaurants());
  graphql.ObservableQuery<Subscription$GetRestaurants>
      watchSubscription$GetRestaurants(
              [WatchOptions$Subscription$GetRestaurants? options]) =>
          watchQuery(options ?? WatchOptions$Subscription$GetRestaurants());
}

class Subscription$GetRestaurants$restaurant {
  Subscription$GetRestaurants$restaurant({
    required this.id,
    required this.name,
    required this.location_text,
    required this.open_status,
    required this.approved,
    required this.image,
    this.description,
    this.payment_info,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$locationText = json['location_text'];
    final l$openStatus = json['open_status'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$description = json['description'];
    final l$paymentInfo = json['payment_info'];
    final l$$Typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant(
      id: (l$id as int),
      name: (l$name as String),
      location_text: (l$locationText as String),
      open_status: (l$openStatus as String),
      approved: (l$approved as bool),
      image: (l$image as String),
      description: l$description == null
          ? null
          : Subscription$GetRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      payment_info: l$paymentInfo == null
          ? null
          : Subscription$GetRestaurants$restaurant$payment_info.fromJson(
              (l$paymentInfo as Map<String, dynamic>)),
      $__typename: ((l$$Typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String location_text;

  final String open_status;

  final bool approved;

  final String image;

  final Subscription$GetRestaurants$restaurant$description? description;

  final Subscription$GetRestaurants$restaurant$payment_info? payment_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final int l$id = id;
    _resultData['id'] = l$id;
    final String l$name = name;
    _resultData['name'] = l$name;
    final String l$locationText = location_text;
    _resultData['location_text'] = l$locationText;
    final String l$openStatus = open_status;
    _resultData['open_status'] = l$openStatus;
    final bool l$approved = approved;
    _resultData['approved'] = l$approved;
    final String l$image = image;
    _resultData['image'] = l$image;
    final Subscription$GetRestaurants$restaurant$description? l$description =
        description;
    _resultData['description'] = l$description?.toJson();
    final Subscription$GetRestaurants$restaurant$payment_info? l$paymentInfo =
        payment_info;
    _resultData['payment_info'] = l$paymentInfo?.toJson();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final int l$id = id;
    final String l$name = name;
    final String l$locationText = location_text;
    final String l$openStatus = open_status;
    final bool l$approved = approved;
    final String l$image = image;
    final Subscription$GetRestaurants$restaurant$description? l$description =
        description;
    final Subscription$GetRestaurants$restaurant$payment_info? l$paymentInfo =
        payment_info;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$locationText,
      l$openStatus,
      l$approved,
      l$image,
      l$description,
      l$paymentInfo,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final int l$id = id;
    final int lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final String l$name = name;
    final String lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final String l$locationText = location_text;
    final String lOther$locationText = other.location_text;
    if (l$locationText != lOther$locationText) {
      return false;
    }
    final String l$openStatus = open_status;
    final String lOther$openStatus = other.open_status;
    if (l$openStatus != lOther$openStatus) {
      return false;
    }
    final bool l$approved = approved;
    final bool lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final String l$image = image;
    final String lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final Subscription$GetRestaurants$restaurant$description? l$description =
        description;
    final Subscription$GetRestaurants$restaurant$description?
        lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final Subscription$GetRestaurants$restaurant$payment_info? l$paymentInfo =
        payment_info;
    final Subscription$GetRestaurants$restaurant$payment_info?
        lOther$paymentInfo = other.payment_info;
    if (l$paymentInfo != lOther$paymentInfo) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant
    on Subscription$GetRestaurants$restaurant {
  CopyWith$Subscription$GetRestaurants$restaurant<
          Subscription$GetRestaurants$restaurant>
      get copyWith => CopyWith$Subscription$GetRestaurants$restaurant(
            this,
            (Subscription$GetRestaurants$restaurant i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant(
    Subscription$GetRestaurants$restaurant instance,
    TRes Function(Subscription$GetRestaurants$restaurant) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant;

  factory CopyWith$Subscription$GetRestaurants$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant;

  TRes call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    Subscription$GetRestaurants$restaurant$description? description,
    Subscription$GetRestaurants$restaurant$payment_info? payment_info,
    String? $__typename,
  });
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description;
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info;
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant) _then;

  static const Map _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_text = _undefined,
    Object? open_status = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? description = _undefined,
    Object? payment_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$GetRestaurants$restaurant$description?),
        payment_info: payment_info == _undefined
            ? _instance.payment_info
            : (payment_info
                as Subscription$GetRestaurants$restaurant$payment_info?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description {
    final Subscription$GetRestaurants$restaurant$description?
        local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Subscription$GetRestaurants$restaurant$description(
            local$description,
            (Subscription$GetRestaurants$restaurant$description e) =>
                call(description: e));
  }

  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info {
    final Subscription$GetRestaurants$restaurant$payment_info?
        local$paymentInfo = _instance.payment_info;
    return local$paymentInfo == null
        ? CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
            _then(_instance))
        : CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
            local$paymentInfo,
            (Subscription$GetRestaurants$restaurant$payment_info e) =>
                call(payment_info: e));
  }
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    Subscription$GetRestaurants$restaurant$description? description,
    Subscription$GetRestaurants$restaurant$payment_info? payment_info,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description =>
          CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
              _res);
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes>
      get payment_info =>
          CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
              _res);
}

class Subscription$GetRestaurants$restaurant$description {
  Subscription$GetRestaurants$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$Typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$GetRestaurants$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$Typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final List<Subscription$GetRestaurants$restaurant$description$translations>
        l$translations = translations;
    _resultData['translations'] = l$translations
        .map((Subscription$GetRestaurants$restaurant$description$translations
                e) =>
            e.toJson())
        .toList();
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final List<Subscription$GetRestaurants$restaurant$description$translations>
        l$translations = translations;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map(
          (Subscription$GetRestaurants$restaurant$description$translations v) =>
              v)),
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final List<Subscription$GetRestaurants$restaurant$description$translations>
        l$translations = translations;
    final List<Subscription$GetRestaurants$restaurant$description$translations>
        lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final Subscription$GetRestaurants$restaurant$description$translations
          l$translations$entry = l$translations[i];
      final Subscription$GetRestaurants$restaurant$description$translations
          lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
        return false;
      }
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description
    on Subscription$GetRestaurants$restaurant$description {
  CopyWith$Subscription$GetRestaurants$restaurant$description<
          Subscription$GetRestaurants$restaurant$description>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description(
            this,
            (Subscription$GetRestaurants$restaurant$description i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description(
    Subscription$GetRestaurants$restaurant$description instance,
    TRes Function(Subscription$GetRestaurants$restaurant$description) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description;

  TRes call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                      Subscription$GetRestaurants$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant$description) _then;

  static const Map _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$GetRestaurants$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                          Subscription$GetRestaurants$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map(
              (Subscription$GetRestaurants$restaurant$description$translations
                      e) =>
                  CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
                    e,
                    (Subscription$GetRestaurants$restaurant$description$translations
                            i) =>
                        i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$GetRestaurants$restaurant$description$translations {
  Subscription$GetRestaurants$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$languageId = json['language_id'];
    final l$value = json['value'];
    final l$$Typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description$translations(
      language_id: (l$languageId as String),
      value: (l$value as String),
      $__typename: ((l$$Typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final String l$languageId = language_id;
    _resultData['language_id'] = l$languageId;
    final String l$value = value;
    _resultData['value'] = l$value;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final String l$languageId = language_id;
    final String l$value = value;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$languageId,
      l$value,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$GetRestaurants$restaurant$description$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final String l$languageId = language_id;
    final String lOther$languageId = other.language_id;
    if (l$languageId != lOther$languageId) {
      return false;
    }
    final String l$value = value;
    final String lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description$translations
    on Subscription$GetRestaurants$restaurant$description$translations {
  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
          Subscription$GetRestaurants$restaurant$description$translations>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
            this,
            (Subscription$GetRestaurants$restaurant$description$translations
                    i) =>
                i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
    Subscription$GetRestaurants$restaurant$description$translations instance,
    TRes Function(
            Subscription$GetRestaurants$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description$translations
      _instance;

  final TRes Function(
      Subscription$GetRestaurants$restaurant$description$translations) _then;

  static const Map _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description$translations(
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

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetRestaurants$restaurant$payment_info {
  Subscription$GetRestaurants$restaurant$payment_info({
    required this.bank_transfer,
    required this.card,
    required this.cash,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$payment_info.fromJson(
      Map<String, dynamic> json) {
    final l$bankTransfer = json['bank_transfer'];
    final l$card = json['card'];
    final l$cash = json['cash'];
    final l$$Typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$payment_info(
      bank_transfer: (l$bankTransfer as bool),
      card: (l$card as bool),
      cash: (l$cash as bool),
      $__typename: ((l$$Typename ?? "none") as String),
    );
  }

  final bool bank_transfer;

  final bool card;

  final bool cash;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _resultData = <String, dynamic>{};
    final bool l$bankTransfer = bank_transfer;
    _resultData['bank_transfer'] = l$bankTransfer;
    final bool l$card = card;
    _resultData['card'] = l$card;
    final bool l$cash = cash;
    _resultData['cash'] = l$cash;
    final String l$$Typename = $__typename;
    _resultData['__typename'] = l$$Typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final bool l$bankTransfer = bank_transfer;
    final bool l$card = card;
    final bool l$cash = cash;
    final String l$$Typename = $__typename;
    return Object.hashAll([
      l$bankTransfer,
      l$card,
      l$cash,
      l$$Typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant$payment_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final bool l$bankTransfer = bank_transfer;
    final bool lOther$bankTransfer = other.bank_transfer;
    if (l$bankTransfer != lOther$bankTransfer) {
      return false;
    }
    final bool l$card = card;
    final bool lOther$card = other.card;
    if (l$card != lOther$card) {
      return false;
    }
    final bool l$cash = cash;
    final bool lOther$cash = other.cash;
    if (l$cash != lOther$cash) {
      return false;
    }
    final String l$$Typename = $__typename;
    final String lOther$$Typename = other.$__typename;
    if (l$$Typename != lOther$$Typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetRestaurants$restaurant$payment_info
    on Subscription$GetRestaurants$restaurant$payment_info {
  CopyWith$Subscription$GetRestaurants$restaurant$payment_info<
          Subscription$GetRestaurants$restaurant$payment_info>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
            this,
            (Subscription$GetRestaurants$restaurant$payment_info i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$payment_info<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$payment_info(
    Subscription$GetRestaurants$restaurant$payment_info instance,
    TRes Function(Subscription$GetRestaurants$restaurant$payment_info) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info;

  factory CopyWith$Subscription$GetRestaurants$restaurant$payment_info.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info;

  TRes call({
    bool? bank_transfer,
    bool? card,
    bool? cash,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$payment_info(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$payment_info _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant$payment_info)
      _then;

  static const Map _undefined = {};

  TRes call({
    Object? bank_transfer = _undefined,
    Object? card = _undefined,
    Object? cash = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$payment_info(
        bank_transfer: bank_transfer == _undefined || bank_transfer == null
            ? _instance.bank_transfer
            : (bank_transfer as bool),
        card: card == _undefined || card == null
            ? _instance.card
            : (card as bool),
        cash: cash == _undefined || cash == null
            ? _instance.cash
            : (cash as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$payment_info<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$payment_info(
      this._res);

  TRes _res;

  call({
    bool? bank_transfer,
    bool? card,
    bool? cash,
    String? $__typename,
  }) =>
      _res;
}
