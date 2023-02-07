import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$getLaundries {
  Query$getLaundries({
    required this.laundry_store,
    required this.$__typename,
  });

  factory Query$getLaundries.fromJson(Map<String, dynamic> json) {
    final l$laundry_store = json['laundry_store'];
    final l$$__typename = json['__typename'];
    return Query$getLaundries(
      laundry_store: (l$laundry_store as List<dynamic>)
          .map((e) => Query$getLaundries$laundry_store.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundries$laundry_store> laundry_store;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_store = laundry_store;
    _resultData['laundry_store'] =
        l$laundry_store.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_store = laundry_store;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_store.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundries) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_store = laundry_store;
    final lOther$laundry_store = other.laundry_store;
    if (l$laundry_store.length != lOther$laundry_store.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_store.length; i++) {
      final l$laundry_store$entry = l$laundry_store[i];
      final lOther$laundry_store$entry = lOther$laundry_store[i];
      if (l$laundry_store$entry != lOther$laundry_store$entry) {
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

extension UtilityExtension$Query$getLaundries on Query$getLaundries {
  CopyWith$Query$getLaundries<Query$getLaundries> get copyWith =>
      CopyWith$Query$getLaundries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getLaundries<TRes> {
  factory CopyWith$Query$getLaundries(
    Query$getLaundries instance,
    TRes Function(Query$getLaundries) then,
  ) = _CopyWithImpl$Query$getLaundries;

  factory CopyWith$Query$getLaundries.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundries;

  TRes call({
    List<Query$getLaundries$laundry_store>? laundry_store,
    String? $__typename,
  });
  TRes laundry_store(
      Iterable<Query$getLaundries$laundry_store> Function(
              Iterable<
                  CopyWith$Query$getLaundries$laundry_store<
                      Query$getLaundries$laundry_store>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundries<TRes>
    implements CopyWith$Query$getLaundries<TRes> {
  _CopyWithImpl$Query$getLaundries(
    this._instance,
    this._then,
  );

  final Query$getLaundries _instance;

  final TRes Function(Query$getLaundries) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_store = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundries(
        laundry_store: laundry_store == _undefined || laundry_store == null
            ? _instance.laundry_store
            : (laundry_store as List<Query$getLaundries$laundry_store>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_store(
          Iterable<Query$getLaundries$laundry_store> Function(
                  Iterable<
                      CopyWith$Query$getLaundries$laundry_store<
                          Query$getLaundries$laundry_store>>)
              _fn) =>
      call(
          laundry_store: _fn(_instance.laundry_store
              .map((e) => CopyWith$Query$getLaundries$laundry_store(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getLaundries<TRes>
    implements CopyWith$Query$getLaundries<TRes> {
  _CopyWithStubImpl$Query$getLaundries(this._res);

  TRes _res;

  call({
    List<Query$getLaundries$laundry_store>? laundry_store,
    String? $__typename,
  }) =>
      _res;
  laundry_store(_fn) => _res;
}

const documentNodeQuerygetLaundries = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundries'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'laundry_store'),
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
            name: NameNode(value: 'normal_delivery_time'),
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
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
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
            name: NameNode(value: 'approved'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule'),
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
            name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'schedule'),
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
Query$getLaundries _parserFn$Query$getLaundries(Map<String, dynamic> data) =>
    Query$getLaundries.fromJson(data);

class Options$Query$getLaundries
    extends graphql.QueryOptions<Query$getLaundries> {
  Options$Query$getLaundries({
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
          document: documentNodeQuerygetLaundries,
          parserFn: _parserFn$Query$getLaundries,
        );
}

class WatchOptions$Query$getLaundries
    extends graphql.WatchQueryOptions<Query$getLaundries> {
  WatchOptions$Query$getLaundries({
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
          document: documentNodeQuerygetLaundries,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundries,
        );
}

class FetchMoreOptions$Query$getLaundries extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundries(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetLaundries,
        );
}

extension ClientExtension$Query$getLaundries on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundries>> query$getLaundries(
          [Options$Query$getLaundries? options]) async =>
      await this.query(options ?? Options$Query$getLaundries());
  graphql.ObservableQuery<Query$getLaundries> watchQuery$getLaundries(
          [WatchOptions$Query$getLaundries? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getLaundries());
  void writeQuery$getLaundries({
    required Query$getLaundries data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetLaundries)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundries? readQuery$getLaundries({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetLaundries)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundries.fromJson(result);
  }
}

class Query$getLaundries$laundry_store {
  Query$getLaundries$laundry_store({
    required this.id,
    required this.image,
    required this.language_id,
    required this.normal_delivery_time,
    required this.name,
    required this.location,
    required this.approved,
    required this.description_id,
    this.schedule,
    required this.description,
    required this.self_delivery,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getLaundries$laundry_store.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$normal_delivery_time = json['normal_delivery_time'];
    final l$name = json['name'];
    final l$location = json['location'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$self_delivery = json['self_delivery'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getLaundries$laundry_store(
      id: (l$id as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      normal_delivery_time: (l$normal_delivery_time as int),
      name: (l$name as String),
      location: Query$getLaundries$laundry_store$location.fromJson(
          (l$location as Map<String, dynamic>)),
      approved: (l$approved as bool),
      description_id: (l$description_id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: Query$getLaundries$laundry_store$description.fromJson(
          (l$description as Map<String, dynamic>)),
      self_delivery: (l$self_delivery as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String image;

  final String language_id;

  final int normal_delivery_time;

  final String name;

  final Query$getLaundries$laundry_store$location location;

  final bool approved;

  final int description_id;

  final dynamic? schedule;

  final Query$getLaundries$laundry_store$description description;

  final bool self_delivery;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$normal_delivery_time = normal_delivery_time;
    _resultData['normal_delivery_time'] = l$normal_delivery_time;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description.toJson();
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$language_id = language_id;
    final l$normal_delivery_time = normal_delivery_time;
    final l$name = name;
    final l$location = location;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$schedule = schedule;
    final l$description = description;
    final l$self_delivery = self_delivery;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$language_id,
      l$normal_delivery_time,
      l$name,
      l$location,
      l$approved,
      l$description_id,
      l$schedule,
      l$description,
      l$self_delivery,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundries$laundry_store) ||
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
    final l$normal_delivery_time = normal_delivery_time;
    final lOther$normal_delivery_time = other.normal_delivery_time;
    if (l$normal_delivery_time != lOther$normal_delivery_time) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Query$getLaundries$laundry_store
    on Query$getLaundries$laundry_store {
  CopyWith$Query$getLaundries$laundry_store<Query$getLaundries$laundry_store>
      get copyWith => CopyWith$Query$getLaundries$laundry_store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundries$laundry_store<TRes> {
  factory CopyWith$Query$getLaundries$laundry_store(
    Query$getLaundries$laundry_store instance,
    TRes Function(Query$getLaundries$laundry_store) then,
  ) = _CopyWithImpl$Query$getLaundries$laundry_store;

  factory CopyWith$Query$getLaundries$laundry_store.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundries$laundry_store;

  TRes call({
    int? id,
    String? image,
    String? language_id,
    int? normal_delivery_time,
    String? name,
    Query$getLaundries$laundry_store$location? location,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getLaundries$laundry_store$description? description,
    bool? self_delivery,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getLaundries$laundry_store$location<TRes> get location;
  CopyWith$Query$getLaundries$laundry_store$description<TRes> get description;
}

class _CopyWithImpl$Query$getLaundries$laundry_store<TRes>
    implements CopyWith$Query$getLaundries$laundry_store<TRes> {
  _CopyWithImpl$Query$getLaundries$laundry_store(
    this._instance,
    this._then,
  );

  final Query$getLaundries$laundry_store _instance;

  final TRes Function(Query$getLaundries$laundry_store) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? normal_delivery_time = _undefined,
    Object? name = _undefined,
    Object? location = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? self_delivery = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundries$laundry_store(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        normal_delivery_time:
            normal_delivery_time == _undefined || normal_delivery_time == null
                ? _instance.normal_delivery_time
                : (normal_delivery_time as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as Query$getLaundries$laundry_store$location),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined || description_id == null
            ? _instance.description_id
            : (description_id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as Query$getLaundries$laundry_store$description),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundries$laundry_store$location<TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getLaundries$laundry_store$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getLaundries$laundry_store$description<TRes> get description {
    final local$description = _instance.description;
    return CopyWith$Query$getLaundries$laundry_store$description(
        local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getLaundries$laundry_store<TRes>
    implements CopyWith$Query$getLaundries$laundry_store<TRes> {
  _CopyWithStubImpl$Query$getLaundries$laundry_store(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? language_id,
    int? normal_delivery_time,
    String? name,
    Query$getLaundries$laundry_store$location? location,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getLaundries$laundry_store$description? description,
    bool? self_delivery,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundries$laundry_store$location<TRes> get location =>
      CopyWith$Query$getLaundries$laundry_store$location.stub(_res);
  CopyWith$Query$getLaundries$laundry_store$description<TRes> get description =>
      CopyWith$Query$getLaundries$laundry_store$description.stub(_res);
}

class Query$getLaundries$laundry_store$location {
  Query$getLaundries$laundry_store$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getLaundries$laundry_store$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getLaundries$laundry_store$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundries$laundry_store$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$getLaundries$laundry_store$location
    on Query$getLaundries$laundry_store$location {
  CopyWith$Query$getLaundries$laundry_store$location<
          Query$getLaundries$laundry_store$location>
      get copyWith => CopyWith$Query$getLaundries$laundry_store$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundries$laundry_store$location<TRes> {
  factory CopyWith$Query$getLaundries$laundry_store$location(
    Query$getLaundries$laundry_store$location instance,
    TRes Function(Query$getLaundries$laundry_store$location) then,
  ) = _CopyWithImpl$Query$getLaundries$laundry_store$location;

  factory CopyWith$Query$getLaundries$laundry_store$location.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundries$laundry_store$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundries$laundry_store$location<TRes>
    implements CopyWith$Query$getLaundries$laundry_store$location<TRes> {
  _CopyWithImpl$Query$getLaundries$laundry_store$location(
    this._instance,
    this._then,
  );

  final Query$getLaundries$laundry_store$location _instance;

  final TRes Function(Query$getLaundries$laundry_store$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundries$laundry_store$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getLaundries$laundry_store$location<TRes>
    implements CopyWith$Query$getLaundries$laundry_store$location<TRes> {
  _CopyWithStubImpl$Query$getLaundries$laundry_store$location(this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getLaundries$laundry_store$description {
  Query$getLaundries$laundry_store$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getLaundries$laundry_store$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getLaundries$laundry_store$description(
      translations: (l$translations as List<dynamic>)
          .map((e) => Query$getLaundries$laundry_store$description$translations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundries$laundry_store$description$translations>
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
    if (!(other is Query$getLaundries$laundry_store$description) ||
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

extension UtilityExtension$Query$getLaundries$laundry_store$description
    on Query$getLaundries$laundry_store$description {
  CopyWith$Query$getLaundries$laundry_store$description<
          Query$getLaundries$laundry_store$description>
      get copyWith => CopyWith$Query$getLaundries$laundry_store$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundries$laundry_store$description<TRes> {
  factory CopyWith$Query$getLaundries$laundry_store$description(
    Query$getLaundries$laundry_store$description instance,
    TRes Function(Query$getLaundries$laundry_store$description) then,
  ) = _CopyWithImpl$Query$getLaundries$laundry_store$description;

  factory CopyWith$Query$getLaundries$laundry_store$description.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundries$laundry_store$description;

  TRes call({
    List<Query$getLaundries$laundry_store$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getLaundries$laundry_store$description$translations> Function(
              Iterable<
                  CopyWith$Query$getLaundries$laundry_store$description$translations<
                      Query$getLaundries$laundry_store$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundries$laundry_store$description<TRes>
    implements CopyWith$Query$getLaundries$laundry_store$description<TRes> {
  _CopyWithImpl$Query$getLaundries$laundry_store$description(
    this._instance,
    this._then,
  );

  final Query$getLaundries$laundry_store$description _instance;

  final TRes Function(Query$getLaundries$laundry_store$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundries$laundry_store$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getLaundries$laundry_store$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getLaundries$laundry_store$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getLaundries$laundry_store$description$translations<
                          Query$getLaundries$laundry_store$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getLaundries$laundry_store$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getLaundries$laundry_store$description<TRes>
    implements CopyWith$Query$getLaundries$laundry_store$description<TRes> {
  _CopyWithStubImpl$Query$getLaundries$laundry_store$description(this._res);

  TRes _res;

  call({
    List<Query$getLaundries$laundry_store$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getLaundries$laundry_store$description$translations {
  Query$getLaundries$laundry_store$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getLaundries$laundry_store$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getLaundries$laundry_store$description$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
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
    if (!(other is Query$getLaundries$laundry_store$description$translations) ||
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

extension UtilityExtension$Query$getLaundries$laundry_store$description$translations
    on Query$getLaundries$laundry_store$description$translations {
  CopyWith$Query$getLaundries$laundry_store$description$translations<
          Query$getLaundries$laundry_store$description$translations>
      get copyWith =>
          CopyWith$Query$getLaundries$laundry_store$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundries$laundry_store$description$translations<
    TRes> {
  factory CopyWith$Query$getLaundries$laundry_store$description$translations(
    Query$getLaundries$laundry_store$description$translations instance,
    TRes Function(Query$getLaundries$laundry_store$description$translations)
        then,
  ) = _CopyWithImpl$Query$getLaundries$laundry_store$description$translations;

  factory CopyWith$Query$getLaundries$laundry_store$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundries$laundry_store$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundries$laundry_store$description$translations<
        TRes>
    implements
        CopyWith$Query$getLaundries$laundry_store$description$translations<
            TRes> {
  _CopyWithImpl$Query$getLaundries$laundry_store$description$translations(
    this._instance,
    this._then,
  );

  final Query$getLaundries$laundry_store$description$translations _instance;

  final TRes Function(Query$getLaundries$laundry_store$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundries$laundry_store$description$translations(
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

class _CopyWithStubImpl$Query$getLaundries$laundry_store$description$translations<
        TRes>
    implements
        CopyWith$Query$getLaundries$laundry_store$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getLaundries$laundry_store$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryStoreById {
  factory Variables$Query$getLaundryStoreById({required int id}) =>
      Variables$Query$getLaundryStoreById._({
        r'id': id,
      });

  Variables$Query$getLaundryStoreById._(this._$data);

  factory Variables$Query$getLaundryStoreById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getLaundryStoreById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryStoreById<
          Variables$Query$getLaundryStoreById>
      get copyWith => CopyWith$Variables$Query$getLaundryStoreById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryStoreById) ||
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

abstract class CopyWith$Variables$Query$getLaundryStoreById<TRes> {
  factory CopyWith$Variables$Query$getLaundryStoreById(
    Variables$Query$getLaundryStoreById instance,
    TRes Function(Variables$Query$getLaundryStoreById) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryStoreById;

  factory CopyWith$Variables$Query$getLaundryStoreById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryStoreById;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getLaundryStoreById<TRes>
    implements CopyWith$Variables$Query$getLaundryStoreById<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryStoreById(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryStoreById _instance;

  final TRes Function(Variables$Query$getLaundryStoreById) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getLaundryStoreById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryStoreById<TRes>
    implements CopyWith$Variables$Query$getLaundryStoreById<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryStoreById(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getLaundryStoreById {
  Query$getLaundryStoreById({
    this.laundry_store_by_pk,
    required this.$__typename,
  });

  factory Query$getLaundryStoreById.fromJson(Map<String, dynamic> json) {
    final l$laundry_store_by_pk = json['laundry_store_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStoreById(
      laundry_store_by_pk: l$laundry_store_by_pk == null
          ? null
          : Query$getLaundryStoreById$laundry_store_by_pk.fromJson(
              (l$laundry_store_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getLaundryStoreById$laundry_store_by_pk? laundry_store_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_store_by_pk = laundry_store_by_pk;
    _resultData['laundry_store_by_pk'] = l$laundry_store_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_store_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryStoreById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final lOther$laundry_store_by_pk = other.laundry_store_by_pk;
    if (l$laundry_store_by_pk != lOther$laundry_store_by_pk) {
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

extension UtilityExtension$Query$getLaundryStoreById
    on Query$getLaundryStoreById {
  CopyWith$Query$getLaundryStoreById<Query$getLaundryStoreById> get copyWith =>
      CopyWith$Query$getLaundryStoreById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getLaundryStoreById<TRes> {
  factory CopyWith$Query$getLaundryStoreById(
    Query$getLaundryStoreById instance,
    TRes Function(Query$getLaundryStoreById) then,
  ) = _CopyWithImpl$Query$getLaundryStoreById;

  factory CopyWith$Query$getLaundryStoreById.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryStoreById;

  TRes call({
    Query$getLaundryStoreById$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes>
      get laundry_store_by_pk;
}

class _CopyWithImpl$Query$getLaundryStoreById<TRes>
    implements CopyWith$Query$getLaundryStoreById<TRes> {
  _CopyWithImpl$Query$getLaundryStoreById(
    this._instance,
    this._then,
  );

  final Query$getLaundryStoreById _instance;

  final TRes Function(Query$getLaundryStoreById) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_store_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStoreById(
        laundry_store_by_pk: laundry_store_by_pk == _undefined
            ? _instance.laundry_store_by_pk
            : (laundry_store_by_pk
                as Query$getLaundryStoreById$laundry_store_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes>
      get laundry_store_by_pk {
    final local$laundry_store_by_pk = _instance.laundry_store_by_pk;
    return local$laundry_store_by_pk == null
        ? CopyWith$Query$getLaundryStoreById$laundry_store_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getLaundryStoreById$laundry_store_by_pk(
            local$laundry_store_by_pk, (e) => call(laundry_store_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryStoreById<TRes>
    implements CopyWith$Query$getLaundryStoreById<TRes> {
  _CopyWithStubImpl$Query$getLaundryStoreById(this._res);

  TRes _res;

  call({
    Query$getLaundryStoreById$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes>
      get laundry_store_by_pk =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk.stub(_res);
}

const documentNodeQuerygetLaundryStoreById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryStoreById'),
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
        name: NameNode(value: 'laundry_store_by_pk'),
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
            name: NameNode(value: 'location_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_details_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'normal_delivery_time'),
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
            name: NameNode(value: 'description_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
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
            name: NameNode(value: 'self_delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accepted_payments'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
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
            name: NameNode(value: 'approved'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule'),
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
Query$getLaundryStoreById _parserFn$Query$getLaundryStoreById(
        Map<String, dynamic> data) =>
    Query$getLaundryStoreById.fromJson(data);

class Options$Query$getLaundryStoreById
    extends graphql.QueryOptions<Query$getLaundryStoreById> {
  Options$Query$getLaundryStoreById({
    String? operationName,
    required Variables$Query$getLaundryStoreById variables,
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
          document: documentNodeQuerygetLaundryStoreById,
          parserFn: _parserFn$Query$getLaundryStoreById,
        );
}

class WatchOptions$Query$getLaundryStoreById
    extends graphql.WatchQueryOptions<Query$getLaundryStoreById> {
  WatchOptions$Query$getLaundryStoreById({
    String? operationName,
    required Variables$Query$getLaundryStoreById variables,
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
          document: documentNodeQuerygetLaundryStoreById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryStoreById,
        );
}

class FetchMoreOptions$Query$getLaundryStoreById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryStoreById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryStoreById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryStoreById,
        );
}

extension ClientExtension$Query$getLaundryStoreById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryStoreById>>
      query$getLaundryStoreById(
              Options$Query$getLaundryStoreById options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getLaundryStoreById>
      watchQuery$getLaundryStoreById(
              WatchOptions$Query$getLaundryStoreById options) =>
          this.watchQuery(options);
  void writeQuery$getLaundryStoreById({
    required Query$getLaundryStoreById data,
    required Variables$Query$getLaundryStoreById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetLaundryStoreById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryStoreById? readQuery$getLaundryStoreById({
    required Variables$Query$getLaundryStoreById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetLaundryStoreById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundryStoreById.fromJson(result);
  }
}

class Query$getLaundryStoreById$laundry_store_by_pk {
  Query$getLaundryStoreById$laundry_store_by_pk({
    required this.id,
    required this.location_id,
    this.delivery_details_id,
    required this.normal_delivery_time,
    required this.image,
    required this.language_id,
    required this.description_id,
    required this.location,
    required this.self_delivery,
    this.accepted_payments,
    this.stripe_info,
    required this.name,
    required this.description,
    required this.approved,
    this.schedule,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getLaundryStoreById$laundry_store_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$location_id = json['location_id'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$normal_delivery_time = json['normal_delivery_time'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$location = json['location'];
    final l$self_delivery = json['self_delivery'];
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$schedule = json['schedule'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStoreById$laundry_store_by_pk(
      id: (l$id as int),
      location_id: (l$location_id as int),
      delivery_details_id: (l$delivery_details_id as int?),
      normal_delivery_time: (l$normal_delivery_time as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int),
      location: Query$getLaundryStoreById$laundry_store_by_pk$location.fromJson(
          (l$location as Map<String, dynamic>)),
      self_delivery: (l$self_delivery as bool),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      name: (l$name as String),
      description:
          Query$getLaundryStoreById$laundry_store_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int location_id;

  final int? delivery_details_id;

  final int normal_delivery_time;

  final String image;

  final String language_id;

  final int description_id;

  final Query$getLaundryStoreById$laundry_store_by_pk$location location;

  final bool self_delivery;

  final dynamic? accepted_payments;

  final dynamic? stripe_info;

  final String name;

  final Query$getLaundryStoreById$laundry_store_by_pk$description description;

  final bool approved;

  final dynamic? schedule;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$normal_delivery_time = normal_delivery_time;
    _resultData['normal_delivery_time'] = l$normal_delivery_time;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$location_id = location_id;
    final l$delivery_details_id = delivery_details_id;
    final l$normal_delivery_time = normal_delivery_time;
    final l$image = image;
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$location = location;
    final l$self_delivery = self_delivery;
    final l$accepted_payments = accepted_payments;
    final l$stripe_info = stripe_info;
    final l$name = name;
    final l$description = description;
    final l$approved = approved;
    final l$schedule = schedule;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$location_id,
      l$delivery_details_id,
      l$normal_delivery_time,
      l$image,
      l$language_id,
      l$description_id,
      l$location,
      l$self_delivery,
      l$accepted_payments,
      l$stripe_info,
      l$name,
      l$description,
      l$approved,
      l$schedule,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryStoreById$laundry_store_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
      return false;
    }
    final l$normal_delivery_time = normal_delivery_time;
    final lOther$normal_delivery_time = other.normal_delivery_time;
    if (l$normal_delivery_time != lOther$normal_delivery_time) {
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
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Query$getLaundryStoreById$laundry_store_by_pk
    on Query$getLaundryStoreById$laundry_store_by_pk {
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<
          Query$getLaundryStoreById$laundry_store_by_pk>
      get copyWith => CopyWith$Query$getLaundryStoreById$laundry_store_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes> {
  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk(
    Query$getLaundryStoreById$laundry_store_by_pk instance,
    TRes Function(Query$getLaundryStoreById$laundry_store_by_pk) then,
  ) = _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk;

  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk;

  TRes call({
    int? id,
    int? location_id,
    int? delivery_details_id,
    int? normal_delivery_time,
    String? image,
    String? language_id,
    int? description_id,
    Query$getLaundryStoreById$laundry_store_by_pk$location? location,
    bool? self_delivery,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    Query$getLaundryStoreById$laundry_store_by_pk$description? description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes>
      get location;
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes> {
  _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk(
    this._instance,
    this._then,
  );

  final Query$getLaundryStoreById$laundry_store_by_pk _instance;

  final TRes Function(Query$getLaundryStoreById$laundry_store_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? location_id = _undefined,
    Object? delivery_details_id = _undefined,
    Object? normal_delivery_time = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? location = _undefined,
    Object? self_delivery = _undefined,
    Object? accepted_payments = _undefined,
    Object? stripe_info = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? schedule = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStoreById$laundry_store_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        delivery_details_id: delivery_details_id == _undefined
            ? _instance.delivery_details_id
            : (delivery_details_id as int?),
        normal_delivery_time:
            normal_delivery_time == _undefined || normal_delivery_time == null
                ? _instance.normal_delivery_time
                : (normal_delivery_time as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        description_id: description_id == _undefined || description_id == null
            ? _instance.description_id
            : (description_id as int),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getLaundryStoreById$laundry_store_by_pk$location),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description
                as Query$getLaundryStoreById$laundry_store_by_pk$description),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description(
        local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryStoreById$laundry_store_by_pk<TRes> {
  _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    int? location_id,
    int? delivery_details_id,
    int? normal_delivery_time,
    String? image,
    String? language_id,
    int? description_id,
    Query$getLaundryStoreById$laundry_store_by_pk$location? location,
    bool? self_delivery,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    Query$getLaundryStoreById$laundry_store_by_pk$description? description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes>
      get location =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location.stub(
              _res);
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description
              .stub(_res);
}

class Query$getLaundryStoreById$laundry_store_by_pk$location {
  Query$getLaundryStoreById$laundry_store_by_pk$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getLaundryStoreById$laundry_store_by_pk$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStoreById$laundry_store_by_pk$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryStoreById$laundry_store_by_pk$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$getLaundryStoreById$laundry_store_by_pk$location
    on Query$getLaundryStoreById$laundry_store_by_pk$location {
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<
          Query$getLaundryStoreById$laundry_store_by_pk$location>
      get copyWith =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<
    TRes> {
  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location(
    Query$getLaundryStoreById$laundry_store_by_pk$location instance,
    TRes Function(Query$getLaundryStoreById$laundry_store_by_pk$location) then,
  ) = _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$location;

  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes> {
  _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$location(
    this._instance,
    this._then,
  );

  final Query$getLaundryStoreById$laundry_store_by_pk$location _instance;

  final TRes Function(Query$getLaundryStoreById$laundry_store_by_pk$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStoreById$laundry_store_by_pk$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$location<
        TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$location<TRes> {
  _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getLaundryStoreById$laundry_store_by_pk$description {
  Query$getLaundryStoreById$laundry_store_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getLaundryStoreById$laundry_store_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStoreById$laundry_store_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getLaundryStoreById$laundry_store_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getLaundryStoreById$laundry_store_by_pk$description$translations>
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
    if (!(other is Query$getLaundryStoreById$laundry_store_by_pk$description) ||
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

extension UtilityExtension$Query$getLaundryStoreById$laundry_store_by_pk$description
    on Query$getLaundryStoreById$laundry_store_by_pk$description {
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<
          Query$getLaundryStoreById$laundry_store_by_pk$description>
      get copyWith =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<
    TRes> {
  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description(
    Query$getLaundryStoreById$laundry_store_by_pk$description instance,
    TRes Function(Query$getLaundryStoreById$laundry_store_by_pk$description)
        then,
  ) = _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description;

  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description;

  TRes call({
    List<Query$getLaundryStoreById$laundry_store_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getLaundryStoreById$laundry_store_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
                      Query$getLaundryStoreById$laundry_store_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<
            TRes> {
  _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getLaundryStoreById$laundry_store_by_pk$description _instance;

  final TRes Function(Query$getLaundryStoreById$laundry_store_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStoreById$laundry_store_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getLaundryStoreById$laundry_store_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getLaundryStoreById$laundry_store_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
                          Query$getLaundryStoreById$laundry_store_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Query$getLaundryStoreById$laundry_store_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getLaundryStoreById$laundry_store_by_pk$description$translations {
  Query$getLaundryStoreById$laundry_store_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getLaundryStoreById$laundry_store_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
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
            is Query$getLaundryStoreById$laundry_store_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getLaundryStoreById$laundry_store_by_pk$description$translations
    on Query$getLaundryStoreById$laundry_store_by_pk$description$translations {
  CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
          Query$getLaundryStoreById$laundry_store_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
    Query$getLaundryStoreById$laundry_store_by_pk$description$translations
        instance,
    TRes Function(
            Query$getLaundryStoreById$laundry_store_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations;

  factory CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getLaundryStoreById$laundry_store_by_pk$description$translations
      _instance;

  final TRes Function(
          Query$getLaundryStoreById$laundry_store_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryStoreById$laundry_store_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getLaundryStoreById$laundry_store_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryStatus {
  factory Variables$Query$getLaundryStatus({required int id}) =>
      Variables$Query$getLaundryStatus._({
        r'id': id,
      });

  Variables$Query$getLaundryStatus._(this._$data);

  factory Variables$Query$getLaundryStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getLaundryStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryStatus<Variables$Query$getLaundryStatus>
      get copyWith => CopyWith$Variables$Query$getLaundryStatus(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryStatus) ||
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

abstract class CopyWith$Variables$Query$getLaundryStatus<TRes> {
  factory CopyWith$Variables$Query$getLaundryStatus(
    Variables$Query$getLaundryStatus instance,
    TRes Function(Variables$Query$getLaundryStatus) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryStatus;

  factory CopyWith$Variables$Query$getLaundryStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryStatus;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getLaundryStatus<TRes>
    implements CopyWith$Variables$Query$getLaundryStatus<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryStatus(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryStatus _instance;

  final TRes Function(Variables$Query$getLaundryStatus) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getLaundryStatus._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryStatus<TRes>
    implements CopyWith$Variables$Query$getLaundryStatus<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryStatus(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getLaundryStatus {
  Query$getLaundryStatus({
    this.laundry_store_by_pk,
    required this.$__typename,
  });

  factory Query$getLaundryStatus.fromJson(Map<String, dynamic> json) {
    final l$laundry_store_by_pk = json['laundry_store_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStatus(
      laundry_store_by_pk: l$laundry_store_by_pk == null
          ? null
          : Query$getLaundryStatus$laundry_store_by_pk.fromJson(
              (l$laundry_store_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getLaundryStatus$laundry_store_by_pk? laundry_store_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_store_by_pk = laundry_store_by_pk;
    _resultData['laundry_store_by_pk'] = l$laundry_store_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_store_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final lOther$laundry_store_by_pk = other.laundry_store_by_pk;
    if (l$laundry_store_by_pk != lOther$laundry_store_by_pk) {
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

extension UtilityExtension$Query$getLaundryStatus on Query$getLaundryStatus {
  CopyWith$Query$getLaundryStatus<Query$getLaundryStatus> get copyWith =>
      CopyWith$Query$getLaundryStatus(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getLaundryStatus<TRes> {
  factory CopyWith$Query$getLaundryStatus(
    Query$getLaundryStatus instance,
    TRes Function(Query$getLaundryStatus) then,
  ) = _CopyWithImpl$Query$getLaundryStatus;

  factory CopyWith$Query$getLaundryStatus.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryStatus;

  TRes call({
    Query$getLaundryStatus$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes>
      get laundry_store_by_pk;
}

class _CopyWithImpl$Query$getLaundryStatus<TRes>
    implements CopyWith$Query$getLaundryStatus<TRes> {
  _CopyWithImpl$Query$getLaundryStatus(
    this._instance,
    this._then,
  );

  final Query$getLaundryStatus _instance;

  final TRes Function(Query$getLaundryStatus) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_store_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStatus(
        laundry_store_by_pk: laundry_store_by_pk == _undefined
            ? _instance.laundry_store_by_pk
            : (laundry_store_by_pk
                as Query$getLaundryStatus$laundry_store_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes>
      get laundry_store_by_pk {
    final local$laundry_store_by_pk = _instance.laundry_store_by_pk;
    return local$laundry_store_by_pk == null
        ? CopyWith$Query$getLaundryStatus$laundry_store_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getLaundryStatus$laundry_store_by_pk(
            local$laundry_store_by_pk, (e) => call(laundry_store_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryStatus<TRes>
    implements CopyWith$Query$getLaundryStatus<TRes> {
  _CopyWithStubImpl$Query$getLaundryStatus(this._res);

  TRes _res;

  call({
    Query$getLaundryStatus$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes>
      get laundry_store_by_pk =>
          CopyWith$Query$getLaundryStatus$laundry_store_by_pk.stub(_res);
}

const documentNodeQuerygetLaundryStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryStatus'),
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
        name: NameNode(value: 'laundry_store_by_pk'),
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
            name: NameNode(value: 'open_status'),
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
Query$getLaundryStatus _parserFn$Query$getLaundryStatus(
        Map<String, dynamic> data) =>
    Query$getLaundryStatus.fromJson(data);

class Options$Query$getLaundryStatus
    extends graphql.QueryOptions<Query$getLaundryStatus> {
  Options$Query$getLaundryStatus({
    String? operationName,
    required Variables$Query$getLaundryStatus variables,
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
          document: documentNodeQuerygetLaundryStatus,
          parserFn: _parserFn$Query$getLaundryStatus,
        );
}

class WatchOptions$Query$getLaundryStatus
    extends graphql.WatchQueryOptions<Query$getLaundryStatus> {
  WatchOptions$Query$getLaundryStatus({
    String? operationName,
    required Variables$Query$getLaundryStatus variables,
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
          document: documentNodeQuerygetLaundryStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryStatus,
        );
}

class FetchMoreOptions$Query$getLaundryStatus extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryStatus({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryStatus variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryStatus,
        );
}

extension ClientExtension$Query$getLaundryStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryStatus>> query$getLaundryStatus(
          Options$Query$getLaundryStatus options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getLaundryStatus> watchQuery$getLaundryStatus(
          WatchOptions$Query$getLaundryStatus options) =>
      this.watchQuery(options);
  void writeQuery$getLaundryStatus({
    required Query$getLaundryStatus data,
    required Variables$Query$getLaundryStatus variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetLaundryStatus),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryStatus? readQuery$getLaundryStatus({
    required Variables$Query$getLaundryStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetLaundryStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundryStatus.fromJson(result);
  }
}

class Query$getLaundryStatus$laundry_store_by_pk {
  Query$getLaundryStatus$laundry_store_by_pk({
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getLaundryStatus$laundry_store_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryStatus$laundry_store_by_pk(
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryStatus$laundry_store_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Query$getLaundryStatus$laundry_store_by_pk
    on Query$getLaundryStatus$laundry_store_by_pk {
  CopyWith$Query$getLaundryStatus$laundry_store_by_pk<
          Query$getLaundryStatus$laundry_store_by_pk>
      get copyWith => CopyWith$Query$getLaundryStatus$laundry_store_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes> {
  factory CopyWith$Query$getLaundryStatus$laundry_store_by_pk(
    Query$getLaundryStatus$laundry_store_by_pk instance,
    TRes Function(Query$getLaundryStatus$laundry_store_by_pk) then,
  ) = _CopyWithImpl$Query$getLaundryStatus$laundry_store_by_pk;

  factory CopyWith$Query$getLaundryStatus$laundry_store_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryStatus$laundry_store_by_pk;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryStatus$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes> {
  _CopyWithImpl$Query$getLaundryStatus$laundry_store_by_pk(
    this._instance,
    this._then,
  );

  final Query$getLaundryStatus$laundry_store_by_pk _instance;

  final TRes Function(Query$getLaundryStatus$laundry_store_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryStatus$laundry_store_by_pk(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getLaundryStatus$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryStatus$laundry_store_by_pk<TRes> {
  _CopyWithStubImpl$Query$getLaundryStatus$laundry_store_by_pk(this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryDays {
  factory Variables$Query$getLaundryDays({required int id}) =>
      Variables$Query$getLaundryDays._({
        r'id': id,
      });

  Variables$Query$getLaundryDays._(this._$data);

  factory Variables$Query$getLaundryDays.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getLaundryDays._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryDays<Variables$Query$getLaundryDays>
      get copyWith => CopyWith$Variables$Query$getLaundryDays(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryDays) ||
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

abstract class CopyWith$Variables$Query$getLaundryDays<TRes> {
  factory CopyWith$Variables$Query$getLaundryDays(
    Variables$Query$getLaundryDays instance,
    TRes Function(Variables$Query$getLaundryDays) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryDays;

  factory CopyWith$Variables$Query$getLaundryDays.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryDays;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getLaundryDays<TRes>
    implements CopyWith$Variables$Query$getLaundryDays<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryDays(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryDays _instance;

  final TRes Function(Variables$Query$getLaundryDays) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getLaundryDays._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryDays<TRes>
    implements CopyWith$Variables$Query$getLaundryDays<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryDays(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getLaundryDays {
  Query$getLaundryDays({
    this.laundry_store_by_pk,
    required this.$__typename,
  });

  factory Query$getLaundryDays.fromJson(Map<String, dynamic> json) {
    final l$laundry_store_by_pk = json['laundry_store_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryDays(
      laundry_store_by_pk: l$laundry_store_by_pk == null
          ? null
          : Query$getLaundryDays$laundry_store_by_pk.fromJson(
              (l$laundry_store_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getLaundryDays$laundry_store_by_pk? laundry_store_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_store_by_pk = laundry_store_by_pk;
    _resultData['laundry_store_by_pk'] = l$laundry_store_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_store_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryDays) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_store_by_pk = laundry_store_by_pk;
    final lOther$laundry_store_by_pk = other.laundry_store_by_pk;
    if (l$laundry_store_by_pk != lOther$laundry_store_by_pk) {
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

extension UtilityExtension$Query$getLaundryDays on Query$getLaundryDays {
  CopyWith$Query$getLaundryDays<Query$getLaundryDays> get copyWith =>
      CopyWith$Query$getLaundryDays(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getLaundryDays<TRes> {
  factory CopyWith$Query$getLaundryDays(
    Query$getLaundryDays instance,
    TRes Function(Query$getLaundryDays) then,
  ) = _CopyWithImpl$Query$getLaundryDays;

  factory CopyWith$Query$getLaundryDays.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryDays;

  TRes call({
    Query$getLaundryDays$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes>
      get laundry_store_by_pk;
}

class _CopyWithImpl$Query$getLaundryDays<TRes>
    implements CopyWith$Query$getLaundryDays<TRes> {
  _CopyWithImpl$Query$getLaundryDays(
    this._instance,
    this._then,
  );

  final Query$getLaundryDays _instance;

  final TRes Function(Query$getLaundryDays) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_store_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryDays(
        laundry_store_by_pk: laundry_store_by_pk == _undefined
            ? _instance.laundry_store_by_pk
            : (laundry_store_by_pk
                as Query$getLaundryDays$laundry_store_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes>
      get laundry_store_by_pk {
    final local$laundry_store_by_pk = _instance.laundry_store_by_pk;
    return local$laundry_store_by_pk == null
        ? CopyWith$Query$getLaundryDays$laundry_store_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getLaundryDays$laundry_store_by_pk(
            local$laundry_store_by_pk, (e) => call(laundry_store_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryDays<TRes>
    implements CopyWith$Query$getLaundryDays<TRes> {
  _CopyWithStubImpl$Query$getLaundryDays(this._res);

  TRes _res;

  call({
    Query$getLaundryDays$laundry_store_by_pk? laundry_store_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes>
      get laundry_store_by_pk =>
          CopyWith$Query$getLaundryDays$laundry_store_by_pk.stub(_res);
}

const documentNodeQuerygetLaundryDays = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryDays'),
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
        name: NameNode(value: 'laundry_store_by_pk'),
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
            name: NameNode(value: 'normal_delivery_time'),
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
Query$getLaundryDays _parserFn$Query$getLaundryDays(
        Map<String, dynamic> data) =>
    Query$getLaundryDays.fromJson(data);

class Options$Query$getLaundryDays
    extends graphql.QueryOptions<Query$getLaundryDays> {
  Options$Query$getLaundryDays({
    String? operationName,
    required Variables$Query$getLaundryDays variables,
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
          document: documentNodeQuerygetLaundryDays,
          parserFn: _parserFn$Query$getLaundryDays,
        );
}

class WatchOptions$Query$getLaundryDays
    extends graphql.WatchQueryOptions<Query$getLaundryDays> {
  WatchOptions$Query$getLaundryDays({
    String? operationName,
    required Variables$Query$getLaundryDays variables,
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
          document: documentNodeQuerygetLaundryDays,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryDays,
        );
}

class FetchMoreOptions$Query$getLaundryDays extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryDays({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryDays variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryDays,
        );
}

extension ClientExtension$Query$getLaundryDays on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryDays>> query$getLaundryDays(
          Options$Query$getLaundryDays options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getLaundryDays> watchQuery$getLaundryDays(
          WatchOptions$Query$getLaundryDays options) =>
      this.watchQuery(options);
  void writeQuery$getLaundryDays({
    required Query$getLaundryDays data,
    required Variables$Query$getLaundryDays variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetLaundryDays),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryDays? readQuery$getLaundryDays({
    required Variables$Query$getLaundryDays variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetLaundryDays),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundryDays.fromJson(result);
  }
}

class Query$getLaundryDays$laundry_store_by_pk {
  Query$getLaundryDays$laundry_store_by_pk({
    required this.normal_delivery_time,
    required this.$__typename,
  });

  factory Query$getLaundryDays$laundry_store_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$normal_delivery_time = json['normal_delivery_time'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryDays$laundry_store_by_pk(
      normal_delivery_time: (l$normal_delivery_time as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int normal_delivery_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$normal_delivery_time = normal_delivery_time;
    _resultData['normal_delivery_time'] = l$normal_delivery_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$normal_delivery_time = normal_delivery_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$normal_delivery_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryDays$laundry_store_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$normal_delivery_time = normal_delivery_time;
    final lOther$normal_delivery_time = other.normal_delivery_time;
    if (l$normal_delivery_time != lOther$normal_delivery_time) {
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

extension UtilityExtension$Query$getLaundryDays$laundry_store_by_pk
    on Query$getLaundryDays$laundry_store_by_pk {
  CopyWith$Query$getLaundryDays$laundry_store_by_pk<
          Query$getLaundryDays$laundry_store_by_pk>
      get copyWith => CopyWith$Query$getLaundryDays$laundry_store_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes> {
  factory CopyWith$Query$getLaundryDays$laundry_store_by_pk(
    Query$getLaundryDays$laundry_store_by_pk instance,
    TRes Function(Query$getLaundryDays$laundry_store_by_pk) then,
  ) = _CopyWithImpl$Query$getLaundryDays$laundry_store_by_pk;

  factory CopyWith$Query$getLaundryDays$laundry_store_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryDays$laundry_store_by_pk;

  TRes call({
    int? normal_delivery_time,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryDays$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes> {
  _CopyWithImpl$Query$getLaundryDays$laundry_store_by_pk(
    this._instance,
    this._then,
  );

  final Query$getLaundryDays$laundry_store_by_pk _instance;

  final TRes Function(Query$getLaundryDays$laundry_store_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? normal_delivery_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryDays$laundry_store_by_pk(
        normal_delivery_time:
            normal_delivery_time == _undefined || normal_delivery_time == null
                ? _instance.normal_delivery_time
                : (normal_delivery_time as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getLaundryDays$laundry_store_by_pk<TRes>
    implements CopyWith$Query$getLaundryDays$laundry_store_by_pk<TRes> {
  _CopyWithStubImpl$Query$getLaundryDays$laundry_store_by_pk(this._res);

  TRes _res;

  call({
    int? normal_delivery_time,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$switchLaundryAvailability {
  factory Variables$Mutation$switchLaundryAvailability({
    required int restauarntId,
    String? value,
  }) =>
      Variables$Mutation$switchLaundryAvailability._({
        r'restauarntId': restauarntId,
        if (value != null) r'value': value,
      });

  Variables$Mutation$switchLaundryAvailability._(this._$data);

  factory Variables$Mutation$switchLaundryAvailability.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restauarntId = data['restauarntId'];
    result$data['restauarntId'] = (l$restauarntId as int);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Variables$Mutation$switchLaundryAvailability._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restauarntId => (_$data['restauarntId'] as int);
  String? get value => (_$data['value'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restauarntId = restauarntId;
    result$data['restauarntId'] = l$restauarntId;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$switchLaundryAvailability<
          Variables$Mutation$switchLaundryAvailability>
      get copyWith => CopyWith$Variables$Mutation$switchLaundryAvailability(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$switchLaundryAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restauarntId = restauarntId;
    final lOther$restauarntId = other.restauarntId;
    if (l$restauarntId != lOther$restauarntId) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restauarntId = restauarntId;
    final l$value = value;
    return Object.hashAll([
      l$restauarntId,
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$switchLaundryAvailability<TRes> {
  factory CopyWith$Variables$Mutation$switchLaundryAvailability(
    Variables$Mutation$switchLaundryAvailability instance,
    TRes Function(Variables$Mutation$switchLaundryAvailability) then,
  ) = _CopyWithImpl$Variables$Mutation$switchLaundryAvailability;

  factory CopyWith$Variables$Mutation$switchLaundryAvailability.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$switchLaundryAvailability;

  TRes call({
    int? restauarntId,
    String? value,
  });
}

class _CopyWithImpl$Variables$Mutation$switchLaundryAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchLaundryAvailability<TRes> {
  _CopyWithImpl$Variables$Mutation$switchLaundryAvailability(
    this._instance,
    this._then,
  );

  final Variables$Mutation$switchLaundryAvailability _instance;

  final TRes Function(Variables$Mutation$switchLaundryAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? restauarntId = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Variables$Mutation$switchLaundryAvailability._({
        ..._instance._$data,
        if (restauarntId != _undefined && restauarntId != null)
          'restauarntId': (restauarntId as int),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$switchLaundryAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchLaundryAvailability<TRes> {
  _CopyWithStubImpl$Variables$Mutation$switchLaundryAvailability(this._res);

  TRes _res;

  call({
    int? restauarntId,
    String? value,
  }) =>
      _res;
}

class Mutation$switchLaundryAvailability {
  Mutation$switchLaundryAvailability({
    this.update_laundry_store_by_pk,
    required this.$__typename,
  });

  factory Mutation$switchLaundryAvailability.fromJson(
      Map<String, dynamic> json) {
    final l$update_laundry_store_by_pk = json['update_laundry_store_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$switchLaundryAvailability(
      update_laundry_store_by_pk: l$update_laundry_store_by_pk == null
          ? null
          : Mutation$switchLaundryAvailability$update_laundry_store_by_pk
              .fromJson((l$update_laundry_store_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$switchLaundryAvailability$update_laundry_store_by_pk?
      update_laundry_store_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    _resultData['update_laundry_store_by_pk'] =
        l$update_laundry_store_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_laundry_store_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$switchLaundryAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    final lOther$update_laundry_store_by_pk = other.update_laundry_store_by_pk;
    if (l$update_laundry_store_by_pk != lOther$update_laundry_store_by_pk) {
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

extension UtilityExtension$Mutation$switchLaundryAvailability
    on Mutation$switchLaundryAvailability {
  CopyWith$Mutation$switchLaundryAvailability<
          Mutation$switchLaundryAvailability>
      get copyWith => CopyWith$Mutation$switchLaundryAvailability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchLaundryAvailability<TRes> {
  factory CopyWith$Mutation$switchLaundryAvailability(
    Mutation$switchLaundryAvailability instance,
    TRes Function(Mutation$switchLaundryAvailability) then,
  ) = _CopyWithImpl$Mutation$switchLaundryAvailability;

  factory CopyWith$Mutation$switchLaundryAvailability.stub(TRes res) =
      _CopyWithStubImpl$Mutation$switchLaundryAvailability;

  TRes call({
    Mutation$switchLaundryAvailability$update_laundry_store_by_pk?
        update_laundry_store_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk;
}

class _CopyWithImpl$Mutation$switchLaundryAvailability<TRes>
    implements CopyWith$Mutation$switchLaundryAvailability<TRes> {
  _CopyWithImpl$Mutation$switchLaundryAvailability(
    this._instance,
    this._then,
  );

  final Mutation$switchLaundryAvailability _instance;

  final TRes Function(Mutation$switchLaundryAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? update_laundry_store_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchLaundryAvailability(
        update_laundry_store_by_pk: update_laundry_store_by_pk == _undefined
            ? _instance.update_laundry_store_by_pk
            : (update_laundry_store_by_pk
                as Mutation$switchLaundryAvailability$update_laundry_store_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk {
    final local$update_laundry_store_by_pk =
        _instance.update_laundry_store_by_pk;
    return local$update_laundry_store_by_pk == null
        ? CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
            local$update_laundry_store_by_pk,
            (e) => call(update_laundry_store_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$switchLaundryAvailability<TRes>
    implements CopyWith$Mutation$switchLaundryAvailability<TRes> {
  _CopyWithStubImpl$Mutation$switchLaundryAvailability(this._res);

  TRes _res;

  call({
    Mutation$switchLaundryAvailability$update_laundry_store_by_pk?
        update_laundry_store_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk =>
          CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk
              .stub(_res);
}

const documentNodeMutationswitchLaundryAvailability =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'switchLaundryAvailability'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restauarntId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'value')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_laundry_store_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'restauarntId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'open_status'),
                value: VariableNode(name: NameNode(value: 'value')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'open_status'),
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
Mutation$switchLaundryAvailability _parserFn$Mutation$switchLaundryAvailability(
        Map<String, dynamic> data) =>
    Mutation$switchLaundryAvailability.fromJson(data);
typedef OnMutationCompleted$Mutation$switchLaundryAvailability = FutureOr<void>
    Function(
  dynamic,
  Mutation$switchLaundryAvailability?,
);

class Options$Mutation$switchLaundryAvailability
    extends graphql.MutationOptions<Mutation$switchLaundryAvailability> {
  Options$Mutation$switchLaundryAvailability({
    String? operationName,
    required Variables$Mutation$switchLaundryAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$switchLaundryAvailability? onCompleted,
    graphql.OnMutationUpdate<Mutation$switchLaundryAvailability>? update,
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
                        : _parserFn$Mutation$switchLaundryAvailability(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationswitchLaundryAvailability,
          parserFn: _parserFn$Mutation$switchLaundryAvailability,
        );

  final OnMutationCompleted$Mutation$switchLaundryAvailability?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$switchLaundryAvailability
    extends graphql.WatchQueryOptions<Mutation$switchLaundryAvailability> {
  WatchOptions$Mutation$switchLaundryAvailability({
    String? operationName,
    required Variables$Mutation$switchLaundryAvailability variables,
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
          document: documentNodeMutationswitchLaundryAvailability,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$switchLaundryAvailability,
        );
}

extension ClientExtension$Mutation$switchLaundryAvailability
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$switchLaundryAvailability>>
      mutate$switchLaundryAvailability(
              Options$Mutation$switchLaundryAvailability options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$switchLaundryAvailability>
      watchMutation$switchLaundryAvailability(
              WatchOptions$Mutation$switchLaundryAvailability options) =>
          this.watchMutation(options);
}

class Mutation$switchLaundryAvailability$update_laundry_store_by_pk {
  Mutation$switchLaundryAvailability$update_laundry_store_by_pk({
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$switchLaundryAvailability$update_laundry_store_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$switchLaundryAvailability$update_laundry_store_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Mutation$switchLaundryAvailability$update_laundry_store_by_pk
    on Mutation$switchLaundryAvailability$update_laundry_store_by_pk {
  CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
          Mutation$switchLaundryAvailability$update_laundry_store_by_pk>
      get copyWith =>
          CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
    TRes> {
  factory CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
    Mutation$switchLaundryAvailability$update_laundry_store_by_pk instance,
    TRes Function(Mutation$switchLaundryAvailability$update_laundry_store_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk;

  factory CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$switchLaundryAvailability$update_laundry_store_by_pk _instance;

  final TRes Function(
      Mutation$switchLaundryAvailability$update_laundry_store_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchLaundryAvailability$update_laundry_store_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$switchLaundryAvailability$update_laundry_store_by_pk(
      this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateLaundryInfo {
  factory Variables$Mutation$updateLaundryInfo({
    required int id,
    required Input$laundry_store_set_input data,
  }) =>
      Variables$Mutation$updateLaundryInfo._({
        r'id': id,
        r'data': data,
      });

  Variables$Mutation$updateLaundryInfo._(this._$data);

  factory Variables$Mutation$updateLaundryInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$data = data['data'];
    result$data['data'] = Input$laundry_store_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateLaundryInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$laundry_store_set_input get data =>
      (_$data['data'] as Input$laundry_store_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateLaundryInfo<
          Variables$Mutation$updateLaundryInfo>
      get copyWith => CopyWith$Variables$Mutation$updateLaundryInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateLaundryInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$data = data;
    return Object.hashAll([
      l$id,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateLaundryInfo<TRes> {
  factory CopyWith$Variables$Mutation$updateLaundryInfo(
    Variables$Mutation$updateLaundryInfo instance,
    TRes Function(Variables$Mutation$updateLaundryInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$updateLaundryInfo;

  factory CopyWith$Variables$Mutation$updateLaundryInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateLaundryInfo;

  TRes call({
    int? id,
    Input$laundry_store_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateLaundryInfo<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$updateLaundryInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateLaundryInfo _instance;

  final TRes Function(Variables$Mutation$updateLaundryInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateLaundryInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined && data != null)
          'data': (data as Input$laundry_store_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateLaundryInfo<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateLaundryInfo(this._res);

  TRes _res;

  call({
    int? id,
    Input$laundry_store_set_input? data,
  }) =>
      _res;
}

class Mutation$updateLaundryInfo {
  Mutation$updateLaundryInfo({
    this.update_laundry_store_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateLaundryInfo.fromJson(Map<String, dynamic> json) {
    final l$update_laundry_store_by_pk = json['update_laundry_store_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryInfo(
      update_laundry_store_by_pk: l$update_laundry_store_by_pk == null
          ? null
          : Mutation$updateLaundryInfo$update_laundry_store_by_pk.fromJson(
              (l$update_laundry_store_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk?
      update_laundry_store_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    _resultData['update_laundry_store_by_pk'] =
        l$update_laundry_store_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_laundry_store_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLaundryInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_laundry_store_by_pk = update_laundry_store_by_pk;
    final lOther$update_laundry_store_by_pk = other.update_laundry_store_by_pk;
    if (l$update_laundry_store_by_pk != lOther$update_laundry_store_by_pk) {
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

extension UtilityExtension$Mutation$updateLaundryInfo
    on Mutation$updateLaundryInfo {
  CopyWith$Mutation$updateLaundryInfo<Mutation$updateLaundryInfo>
      get copyWith => CopyWith$Mutation$updateLaundryInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryInfo<TRes> {
  factory CopyWith$Mutation$updateLaundryInfo(
    Mutation$updateLaundryInfo instance,
    TRes Function(Mutation$updateLaundryInfo) then,
  ) = _CopyWithImpl$Mutation$updateLaundryInfo;

  factory CopyWith$Mutation$updateLaundryInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryInfo;

  TRes call({
    Mutation$updateLaundryInfo$update_laundry_store_by_pk?
        update_laundry_store_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk;
}

class _CopyWithImpl$Mutation$updateLaundryInfo<TRes>
    implements CopyWith$Mutation$updateLaundryInfo<TRes> {
  _CopyWithImpl$Mutation$updateLaundryInfo(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryInfo _instance;

  final TRes Function(Mutation$updateLaundryInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? update_laundry_store_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryInfo(
        update_laundry_store_by_pk: update_laundry_store_by_pk == _undefined
            ? _instance.update_laundry_store_by_pk
            : (update_laundry_store_by_pk
                as Mutation$updateLaundryInfo$update_laundry_store_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk {
    final local$update_laundry_store_by_pk =
        _instance.update_laundry_store_by_pk;
    return local$update_laundry_store_by_pk == null
        ? CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk(
            local$update_laundry_store_by_pk,
            (e) => call(update_laundry_store_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLaundryInfo<TRes>
    implements CopyWith$Mutation$updateLaundryInfo<TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryInfo(this._res);

  TRes _res;

  call({
    Mutation$updateLaundryInfo$update_laundry_store_by_pk?
        update_laundry_store_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes>
      get update_laundry_store_by_pk =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk.stub(
              _res);
}

const documentNodeMutationupdateLaundryInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateLaundryInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
          name: NameNode(value: 'laundry_store_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_laundry_store_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
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
            name: NameNode(value: 'location_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'normal_delivery_time'),
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
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
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
            name: NameNode(value: 'accepted_payments'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
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
            name: NameNode(value: 'schedule'),
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
            name: NameNode(value: 'approved'),
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
            name: NameNode(value: 'schedule'),
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
Mutation$updateLaundryInfo _parserFn$Mutation$updateLaundryInfo(
        Map<String, dynamic> data) =>
    Mutation$updateLaundryInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$updateLaundryInfo = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateLaundryInfo?,
);

class Options$Mutation$updateLaundryInfo
    extends graphql.MutationOptions<Mutation$updateLaundryInfo> {
  Options$Mutation$updateLaundryInfo({
    String? operationName,
    required Variables$Mutation$updateLaundryInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateLaundryInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateLaundryInfo>? update,
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
                        : _parserFn$Mutation$updateLaundryInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateLaundryInfo,
          parserFn: _parserFn$Mutation$updateLaundryInfo,
        );

  final OnMutationCompleted$Mutation$updateLaundryInfo? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateLaundryInfo
    extends graphql.WatchQueryOptions<Mutation$updateLaundryInfo> {
  WatchOptions$Mutation$updateLaundryInfo({
    String? operationName,
    required Variables$Mutation$updateLaundryInfo variables,
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
          document: documentNodeMutationupdateLaundryInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateLaundryInfo,
        );
}

extension ClientExtension$Mutation$updateLaundryInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateLaundryInfo>>
      mutate$updateLaundryInfo(
              Options$Mutation$updateLaundryInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateLaundryInfo>
      watchMutation$updateLaundryInfo(
              WatchOptions$Mutation$updateLaundryInfo options) =>
          this.watchMutation(options);
}

class Mutation$updateLaundryInfo$update_laundry_store_by_pk {
  Mutation$updateLaundryInfo$update_laundry_store_by_pk({
    required this.id,
    required this.location_id,
    required this.normal_delivery_time,
    required this.image,
    required this.language_id,
    required this.location,
    this.accepted_payments,
    this.stripe_info,
    required this.name,
    this.schedule,
    required this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$updateLaundryInfo$update_laundry_store_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$location_id = json['location_id'];
    final l$normal_delivery_time = json['normal_delivery_time'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location = json['location'];
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$name = json['name'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryInfo$update_laundry_store_by_pk(
      id: (l$id as int),
      location_id: (l$location_id as int),
      normal_delivery_time: (l$normal_delivery_time as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location: Mutation$updateLaundryInfo$update_laundry_store_by_pk$location
          .fromJson((l$location as Map<String, dynamic>)),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      name: (l$name as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description:
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int location_id;

  final int normal_delivery_time;

  final String image;

  final String language_id;

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk$location location;

  final dynamic? accepted_payments;

  final dynamic? stripe_info;

  final String name;

  final dynamic? schedule;

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk$description
      description;

  final bool approved;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$normal_delivery_time = normal_delivery_time;
    _resultData['normal_delivery_time'] = l$normal_delivery_time;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$location_id = location_id;
    final l$normal_delivery_time = normal_delivery_time;
    final l$image = image;
    final l$language_id = language_id;
    final l$location = location;
    final l$accepted_payments = accepted_payments;
    final l$stripe_info = stripe_info;
    final l$name = name;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$location_id,
      l$normal_delivery_time,
      l$image,
      l$language_id,
      l$location,
      l$accepted_payments,
      l$stripe_info,
      l$name,
      l$schedule,
      l$description,
      l$approved,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLaundryInfo$update_laundry_store_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$normal_delivery_time = normal_delivery_time;
    final lOther$normal_delivery_time = other.normal_delivery_time;
    if (l$normal_delivery_time != lOther$normal_delivery_time) {
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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

extension UtilityExtension$Mutation$updateLaundryInfo$update_laundry_store_by_pk
    on Mutation$updateLaundryInfo$update_laundry_store_by_pk {
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<
          Mutation$updateLaundryInfo$update_laundry_store_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk(
    Mutation$updateLaundryInfo$update_laundry_store_by_pk instance,
    TRes Function(Mutation$updateLaundryInfo$update_laundry_store_by_pk) then,
  ) = _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk;

  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk;

  TRes call({
    int? id,
    int? location_id,
    int? normal_delivery_time,
    String? image,
    String? language_id,
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$location? location,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    dynamic? schedule,
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<TRes>
      get location;
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes> {
  _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk _instance;

  final TRes Function(Mutation$updateLaundryInfo$update_laundry_store_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? location_id = _undefined,
    Object? normal_delivery_time = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location = _undefined,
    Object? accepted_payments = _undefined,
    Object? stripe_info = _undefined,
    Object? name = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryInfo$update_laundry_store_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        normal_delivery_time:
            normal_delivery_time == _undefined || normal_delivery_time == null
                ? _instance.normal_delivery_time
                : (normal_delivery_time as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Mutation$updateLaundryInfo$update_laundry_store_by_pk$location),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description
                as Mutation$updateLaundryInfo$update_laundry_store_by_pk$description),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
      TRes> get description {
    final local$description = _instance.description;
    return CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
        local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    int? location_id,
    int? normal_delivery_time,
    String? image,
    String? language_id,
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$location? location,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    dynamic? schedule,
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<TRes>
      get location =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location
              .stub(_res);
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description
              .stub(_res);
}

class Mutation$updateLaundryInfo$update_laundry_store_by_pk$location {
  Mutation$updateLaundryInfo$update_laundry_store_by_pk$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Mutation$updateLaundryInfo$update_laundry_store_by_pk$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateLaundryInfo$update_laundry_store_by_pk$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location
    on Mutation$updateLaundryInfo$update_laundry_store_by_pk$location {
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$location>
      get copyWith =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
    TRes> {
  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$location instance,
    TRes Function(
            Mutation$updateLaundryInfo$update_laundry_store_by_pk$location)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location;

  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk$location
      _instance;

  final TRes Function(
      Mutation$updateLaundryInfo$update_laundry_store_by_pk$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateLaundryInfo$update_laundry_store_by_pk$description {
  Mutation$updateLaundryInfo$update_laundry_store_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateLaundryInfo$update_laundry_store_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>
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
            is Mutation$updateLaundryInfo$update_laundry_store_by_pk$description) ||
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

extension UtilityExtension$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description
    on Mutation$updateLaundryInfo$update_laundry_store_by_pk$description {
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description>
      get copyWith =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
    TRes> {
  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$description instance,
    TRes Function(
            Mutation$updateLaundryInfo$update_laundry_store_by_pk$description)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description;

  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description;

  TRes call({
    List<Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
                      Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk$description
      _instance;

  final TRes Function(
      Mutation$updateLaundryInfo$update_laundry_store_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
                          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations {
  Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
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
            is Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations) ||
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

extension UtilityExtension$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations
    on Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations {
  CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
    Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations
        instance,
    TRes Function(
            Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations;

  factory CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations
      _instance;

  final TRes Function(
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
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

class _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryInfo$update_laundry_store_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryOperators {
  factory Variables$Query$getLaundryOperators({required int laundryStoreID}) =>
      Variables$Query$getLaundryOperators._({
        r'laundryStoreID': laundryStoreID,
      });

  Variables$Query$getLaundryOperators._(this._$data);

  factory Variables$Query$getLaundryOperators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$laundryStoreID = data['laundryStoreID'];
    result$data['laundryStoreID'] = (l$laundryStoreID as int);
    return Variables$Query$getLaundryOperators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get laundryStoreID => (_$data['laundryStoreID'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$laundryStoreID = laundryStoreID;
    result$data['laundryStoreID'] = l$laundryStoreID;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryOperators<
          Variables$Query$getLaundryOperators>
      get copyWith => CopyWith$Variables$Query$getLaundryOperators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundryStoreID = laundryStoreID;
    final lOther$laundryStoreID = other.laundryStoreID;
    if (l$laundryStoreID != lOther$laundryStoreID) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$laundryStoreID = laundryStoreID;
    return Object.hashAll([l$laundryStoreID]);
  }
}

abstract class CopyWith$Variables$Query$getLaundryOperators<TRes> {
  factory CopyWith$Variables$Query$getLaundryOperators(
    Variables$Query$getLaundryOperators instance,
    TRes Function(Variables$Query$getLaundryOperators) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryOperators;

  factory CopyWith$Variables$Query$getLaundryOperators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryOperators;

  TRes call({int? laundryStoreID});
}

class _CopyWithImpl$Variables$Query$getLaundryOperators<TRes>
    implements CopyWith$Variables$Query$getLaundryOperators<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryOperators(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryOperators _instance;

  final TRes Function(Variables$Query$getLaundryOperators) _then;

  static const _undefined = {};

  TRes call({Object? laundryStoreID = _undefined}) =>
      _then(Variables$Query$getLaundryOperators._({
        ..._instance._$data,
        if (laundryStoreID != _undefined && laundryStoreID != null)
          'laundryStoreID': (laundryStoreID as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryOperators<TRes>
    implements CopyWith$Variables$Query$getLaundryOperators<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryOperators(this._res);

  TRes _res;

  call({int? laundryStoreID}) => _res;
}

class Query$getLaundryOperators {
  Query$getLaundryOperators({
    required this.laundry_operator,
    required this.$__typename,
  });

  factory Query$getLaundryOperators.fromJson(Map<String, dynamic> json) {
    final l$laundry_operator = json['laundry_operator'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperators(
      laundry_operator: (l$laundry_operator as List<dynamic>)
          .map((e) => Query$getLaundryOperators$laundry_operator.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundryOperators$laundry_operator> laundry_operator;

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
    if (!(other is Query$getLaundryOperators) ||
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

extension UtilityExtension$Query$getLaundryOperators
    on Query$getLaundryOperators {
  CopyWith$Query$getLaundryOperators<Query$getLaundryOperators> get copyWith =>
      CopyWith$Query$getLaundryOperators(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getLaundryOperators<TRes> {
  factory CopyWith$Query$getLaundryOperators(
    Query$getLaundryOperators instance,
    TRes Function(Query$getLaundryOperators) then,
  ) = _CopyWithImpl$Query$getLaundryOperators;

  factory CopyWith$Query$getLaundryOperators.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperators;

  TRes call({
    List<Query$getLaundryOperators$laundry_operator>? laundry_operator,
    String? $__typename,
  });
  TRes laundry_operator(
      Iterable<Query$getLaundryOperators$laundry_operator> Function(
              Iterable<
                  CopyWith$Query$getLaundryOperators$laundry_operator<
                      Query$getLaundryOperators$laundry_operator>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryOperators<TRes>
    implements CopyWith$Query$getLaundryOperators<TRes> {
  _CopyWithImpl$Query$getLaundryOperators(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperators _instance;

  final TRes Function(Query$getLaundryOperators) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_operator = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperators(
        laundry_operator:
            laundry_operator == _undefined || laundry_operator == null
                ? _instance.laundry_operator
                : (laundry_operator
                    as List<Query$getLaundryOperators$laundry_operator>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_operator(
          Iterable<Query$getLaundryOperators$laundry_operator> Function(
                  Iterable<
                      CopyWith$Query$getLaundryOperators$laundry_operator<
                          Query$getLaundryOperators$laundry_operator>>)
              _fn) =>
      call(
          laundry_operator: _fn(_instance.laundry_operator
              .map((e) => CopyWith$Query$getLaundryOperators$laundry_operator(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryOperators<TRes>
    implements CopyWith$Query$getLaundryOperators<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperators(this._res);

  TRes _res;

  call({
    List<Query$getLaundryOperators$laundry_operator>? laundry_operator,
    String? $__typename,
  }) =>
      _res;
  laundry_operator(_fn) => _res;
}

const documentNodeQuerygetLaundryOperators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryOperators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'laundryStoreID')),
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
                name: NameNode(value: 'store_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value:
                        VariableNode(name: NameNode(value: 'laundryStoreID')),
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
            name: NameNode(value: 'current_gps'),
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
            name: NameNode(value: 'store_id'),
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
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'phone'),
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
Query$getLaundryOperators _parserFn$Query$getLaundryOperators(
        Map<String, dynamic> data) =>
    Query$getLaundryOperators.fromJson(data);

class Options$Query$getLaundryOperators
    extends graphql.QueryOptions<Query$getLaundryOperators> {
  Options$Query$getLaundryOperators({
    String? operationName,
    required Variables$Query$getLaundryOperators variables,
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
          document: documentNodeQuerygetLaundryOperators,
          parserFn: _parserFn$Query$getLaundryOperators,
        );
}

class WatchOptions$Query$getLaundryOperators
    extends graphql.WatchQueryOptions<Query$getLaundryOperators> {
  WatchOptions$Query$getLaundryOperators({
    String? operationName,
    required Variables$Query$getLaundryOperators variables,
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
          document: documentNodeQuerygetLaundryOperators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryOperators,
        );
}

class FetchMoreOptions$Query$getLaundryOperators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryOperators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryOperators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryOperators,
        );
}

extension ClientExtension$Query$getLaundryOperators on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryOperators>>
      query$getLaundryOperators(
              Options$Query$getLaundryOperators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getLaundryOperators>
      watchQuery$getLaundryOperators(
              WatchOptions$Query$getLaundryOperators options) =>
          this.watchQuery(options);
  void writeQuery$getLaundryOperators({
    required Query$getLaundryOperators data,
    required Variables$Query$getLaundryOperators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetLaundryOperators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryOperators? readQuery$getLaundryOperators({
    required Variables$Query$getLaundryOperators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetLaundryOperators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundryOperators.fromJson(result);
  }
}

class Query$getLaundryOperators$laundry_operator {
  Query$getLaundryOperators$laundry_operator({
    required this.id,
    this.current_gps,
    required this.status,
    required this.store_id,
    required this.owner,
    required this.user,
    required this.$__typename,
  });

  factory Query$getLaundryOperators$laundry_operator.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$current_gps = json['current_gps'];
    final l$status = json['status'];
    final l$store_id = json['store_id'];
    final l$owner = json['owner'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperators$laundry_operator(
      id: (l$id as int),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      status: (l$status as String),
      store_id: (l$store_id as int),
      owner: (l$owner as bool),
      user: Query$getLaundryOperators$laundry_operator$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography? current_gps;

  final String status;

  final int store_id;

  final bool owner;

  final Query$getLaundryOperators$laundry_operator$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$current_gps = current_gps;
    final l$status = status;
    final l$store_id = store_id;
    final l$owner = owner;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$current_gps,
      l$status,
      l$store_id,
      l$owner,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryOperators$laundry_operator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
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

extension UtilityExtension$Query$getLaundryOperators$laundry_operator
    on Query$getLaundryOperators$laundry_operator {
  CopyWith$Query$getLaundryOperators$laundry_operator<
          Query$getLaundryOperators$laundry_operator>
      get copyWith => CopyWith$Query$getLaundryOperators$laundry_operator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryOperators$laundry_operator<TRes> {
  factory CopyWith$Query$getLaundryOperators$laundry_operator(
    Query$getLaundryOperators$laundry_operator instance,
    TRes Function(Query$getLaundryOperators$laundry_operator) then,
  ) = _CopyWithImpl$Query$getLaundryOperators$laundry_operator;

  factory CopyWith$Query$getLaundryOperators$laundry_operator.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator;

  TRes call({
    int? id,
    Geography? current_gps,
    String? status,
    int? store_id,
    bool? owner,
    Query$getLaundryOperators$laundry_operator$user? user,
    String? $__typename,
  });
  CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> get user;
}

class _CopyWithImpl$Query$getLaundryOperators$laundry_operator<TRes>
    implements CopyWith$Query$getLaundryOperators$laundry_operator<TRes> {
  _CopyWithImpl$Query$getLaundryOperators$laundry_operator(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperators$laundry_operator _instance;

  final TRes Function(Query$getLaundryOperators$laundry_operator) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? current_gps = _undefined,
    Object? status = _undefined,
    Object? store_id = _undefined,
    Object? owner = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperators$laundry_operator(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getLaundryOperators$laundry_operator$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getLaundryOperators$laundry_operator$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator<TRes>
    implements CopyWith$Query$getLaundryOperators$laundry_operator<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator(this._res);

  TRes _res;

  call({
    int? id,
    Geography? current_gps,
    String? status,
    int? store_id,
    bool? owner,
    Query$getLaundryOperators$laundry_operator$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> get user =>
      CopyWith$Query$getLaundryOperators$laundry_operator$user.stub(_res);
}

class Query$getLaundryOperators$laundry_operator$user {
  Query$getLaundryOperators$laundry_operator$user({
    this.phone,
    this.name,
    this.image,
    required this.language_id,
    required this.id,
    required this.$__typename,
  });

  factory Query$getLaundryOperators$laundry_operator$user.fromJson(
      Map<String, dynamic> json) {
    final l$phone = json['phone'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryOperators$laundry_operator$user(
      phone: (l$phone as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? phone;

  final String? name;

  final String? image;

  final String language_id;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$phone = phone;
    final l$name = name;
    final l$image = image;
    final l$language_id = language_id;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$phone,
      l$name,
      l$image,
      l$language_id,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryOperators$laundry_operator$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$getLaundryOperators$laundry_operator$user
    on Query$getLaundryOperators$laundry_operator$user {
  CopyWith$Query$getLaundryOperators$laundry_operator$user<
          Query$getLaundryOperators$laundry_operator$user>
      get copyWith => CopyWith$Query$getLaundryOperators$laundry_operator$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> {
  factory CopyWith$Query$getLaundryOperators$laundry_operator$user(
    Query$getLaundryOperators$laundry_operator$user instance,
    TRes Function(Query$getLaundryOperators$laundry_operator$user) then,
  ) = _CopyWithImpl$Query$getLaundryOperators$laundry_operator$user;

  factory CopyWith$Query$getLaundryOperators$laundry_operator$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator$user;

  TRes call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryOperators$laundry_operator$user<TRes>
    implements CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> {
  _CopyWithImpl$Query$getLaundryOperators$laundry_operator$user(
    this._instance,
    this._then,
  );

  final Query$getLaundryOperators$laundry_operator$user _instance;

  final TRes Function(Query$getLaundryOperators$laundry_operator$user) _then;

  static const _undefined = {};

  TRes call({
    Object? phone = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryOperators$laundry_operator$user(
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator$user<TRes>
    implements CopyWith$Query$getLaundryOperators$laundry_operator$user<TRes> {
  _CopyWithStubImpl$Query$getLaundryOperators$laundry_operator$user(this._res);

  TRes _res;

  call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryCategories {
  factory Variables$Query$getLaundryCategories({required int storeId}) =>
      Variables$Query$getLaundryCategories._({
        r'storeId': storeId,
      });

  Variables$Query$getLaundryCategories._(this._$data);

  factory Variables$Query$getLaundryCategories.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$storeId = data['storeId'];
    result$data['storeId'] = (l$storeId as int);
    return Variables$Query$getLaundryCategories._(result$data);
  }

  Map<String, dynamic> _$data;

  int get storeId => (_$data['storeId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$storeId = storeId;
    result$data['storeId'] = l$storeId;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryCategories<
          Variables$Query$getLaundryCategories>
      get copyWith => CopyWith$Variables$Query$getLaundryCategories(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryCategories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$storeId = storeId;
    final lOther$storeId = other.storeId;
    if (l$storeId != lOther$storeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$storeId = storeId;
    return Object.hashAll([l$storeId]);
  }
}

abstract class CopyWith$Variables$Query$getLaundryCategories<TRes> {
  factory CopyWith$Variables$Query$getLaundryCategories(
    Variables$Query$getLaundryCategories instance,
    TRes Function(Variables$Query$getLaundryCategories) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryCategories;

  factory CopyWith$Variables$Query$getLaundryCategories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryCategories;

  TRes call({int? storeId});
}

class _CopyWithImpl$Variables$Query$getLaundryCategories<TRes>
    implements CopyWith$Variables$Query$getLaundryCategories<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryCategories(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryCategories _instance;

  final TRes Function(Variables$Query$getLaundryCategories) _then;

  static const _undefined = {};

  TRes call({Object? storeId = _undefined}) =>
      _then(Variables$Query$getLaundryCategories._({
        ..._instance._$data,
        if (storeId != _undefined && storeId != null)
          'storeId': (storeId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryCategories<TRes>
    implements CopyWith$Variables$Query$getLaundryCategories<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryCategories(this._res);

  TRes _res;

  call({int? storeId}) => _res;
}

class Query$getLaundryCategories {
  Query$getLaundryCategories({
    required this.laundry_category,
    required this.$__typename,
  });

  factory Query$getLaundryCategories.fromJson(Map<String, dynamic> json) {
    final l$laundry_category = json['laundry_category'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategories(
      laundry_category: (l$laundry_category as List<dynamic>)
          .map((e) => Query$getLaundryCategories$laundry_category.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundryCategories$laundry_category> laundry_category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_category = laundry_category;
    _resultData['laundry_category'] =
        l$laundry_category.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_category = laundry_category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_category.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryCategories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_category = laundry_category;
    final lOther$laundry_category = other.laundry_category;
    if (l$laundry_category.length != lOther$laundry_category.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_category.length; i++) {
      final l$laundry_category$entry = l$laundry_category[i];
      final lOther$laundry_category$entry = lOther$laundry_category[i];
      if (l$laundry_category$entry != lOther$laundry_category$entry) {
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

extension UtilityExtension$Query$getLaundryCategories
    on Query$getLaundryCategories {
  CopyWith$Query$getLaundryCategories<Query$getLaundryCategories>
      get copyWith => CopyWith$Query$getLaundryCategories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategories<TRes> {
  factory CopyWith$Query$getLaundryCategories(
    Query$getLaundryCategories instance,
    TRes Function(Query$getLaundryCategories) then,
  ) = _CopyWithImpl$Query$getLaundryCategories;

  factory CopyWith$Query$getLaundryCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategories;

  TRes call({
    List<Query$getLaundryCategories$laundry_category>? laundry_category,
    String? $__typename,
  });
  TRes laundry_category(
      Iterable<Query$getLaundryCategories$laundry_category> Function(
              Iterable<
                  CopyWith$Query$getLaundryCategories$laundry_category<
                      Query$getLaundryCategories$laundry_category>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryCategories<TRes>
    implements CopyWith$Query$getLaundryCategories<TRes> {
  _CopyWithImpl$Query$getLaundryCategories(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategories _instance;

  final TRes Function(Query$getLaundryCategories) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategories(
        laundry_category:
            laundry_category == _undefined || laundry_category == null
                ? _instance.laundry_category
                : (laundry_category
                    as List<Query$getLaundryCategories$laundry_category>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_category(
          Iterable<Query$getLaundryCategories$laundry_category> Function(
                  Iterable<
                      CopyWith$Query$getLaundryCategories$laundry_category<
                          Query$getLaundryCategories$laundry_category>>)
              _fn) =>
      call(
          laundry_category: _fn(_instance.laundry_category
              .map((e) => CopyWith$Query$getLaundryCategories$laundry_category(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryCategories<TRes>
    implements CopyWith$Query$getLaundryCategories<TRes> {
  _CopyWithStubImpl$Query$getLaundryCategories(this._res);

  TRes _res;

  call({
    List<Query$getLaundryCategories$laundry_category>? laundry_category,
    String? $__typename,
  }) =>
      _res;
  laundry_category(_fn) => _res;
}

const documentNodeQuerygetLaundryCategories = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryCategories'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'storeId')),
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
        name: NameNode(value: 'laundry_category'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'store_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'storeId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cost_by_kilo'),
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
            name: NameNode(value: 'name_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store_id'),
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
Query$getLaundryCategories _parserFn$Query$getLaundryCategories(
        Map<String, dynamic> data) =>
    Query$getLaundryCategories.fromJson(data);

class Options$Query$getLaundryCategories
    extends graphql.QueryOptions<Query$getLaundryCategories> {
  Options$Query$getLaundryCategories({
    String? operationName,
    required Variables$Query$getLaundryCategories variables,
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
          document: documentNodeQuerygetLaundryCategories,
          parserFn: _parserFn$Query$getLaundryCategories,
        );
}

class WatchOptions$Query$getLaundryCategories
    extends graphql.WatchQueryOptions<Query$getLaundryCategories> {
  WatchOptions$Query$getLaundryCategories({
    String? operationName,
    required Variables$Query$getLaundryCategories variables,
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
          document: documentNodeQuerygetLaundryCategories,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryCategories,
        );
}

class FetchMoreOptions$Query$getLaundryCategories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryCategories({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryCategories variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryCategories,
        );
}

extension ClientExtension$Query$getLaundryCategories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryCategories>>
      query$getLaundryCategories(
              Options$Query$getLaundryCategories options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getLaundryCategories>
      watchQuery$getLaundryCategories(
              WatchOptions$Query$getLaundryCategories options) =>
          this.watchQuery(options);
  void writeQuery$getLaundryCategories({
    required Query$getLaundryCategories data,
    required Variables$Query$getLaundryCategories variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetLaundryCategories),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryCategories? readQuery$getLaundryCategories({
    required Variables$Query$getLaundryCategories variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetLaundryCategories),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getLaundryCategories.fromJson(result);
  }
}

class Query$getLaundryCategories$laundry_category {
  Query$getLaundryCategories$laundry_category({
    required this.cost_by_kilo,
    required this.id,
    required this.name_id,
    required this.position,
    required this.store_id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getLaundryCategories$laundry_category.fromJson(
      Map<String, dynamic> json) {
    final l$cost_by_kilo = json['cost_by_kilo'];
    final l$id = json['id'];
    final l$name_id = json['name_id'];
    final l$position = json['position'];
    final l$store_id = json['store_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategories$laundry_category(
      cost_by_kilo: moneyFromJson(l$cost_by_kilo),
      id: (l$id as int),
      name_id: (l$name_id as int),
      position: (l$position as int),
      store_id: (l$store_id as int),
      name: Query$getLaundryCategories$laundry_category$name.fromJson(
          (l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_by_kilo;

  final int id;

  final int name_id;

  final int position;

  final int store_id;

  final Query$getLaundryCategories$laundry_category$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_by_kilo = cost_by_kilo;
    _resultData['cost_by_kilo'] = moneyToJson(l$cost_by_kilo);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_by_kilo = cost_by_kilo;
    final l$id = id;
    final l$name_id = name_id;
    final l$position = position;
    final l$store_id = store_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_by_kilo,
      l$id,
      l$name_id,
      l$position,
      l$store_id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryCategories$laundry_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_by_kilo = cost_by_kilo;
    final lOther$cost_by_kilo = other.cost_by_kilo;
    if (l$cost_by_kilo != lOther$cost_by_kilo) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Query$getLaundryCategories$laundry_category
    on Query$getLaundryCategories$laundry_category {
  CopyWith$Query$getLaundryCategories$laundry_category<
          Query$getLaundryCategories$laundry_category>
      get copyWith => CopyWith$Query$getLaundryCategories$laundry_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategories$laundry_category<TRes> {
  factory CopyWith$Query$getLaundryCategories$laundry_category(
    Query$getLaundryCategories$laundry_category instance,
    TRes Function(Query$getLaundryCategories$laundry_category) then,
  ) = _CopyWithImpl$Query$getLaundryCategories$laundry_category;

  factory CopyWith$Query$getLaundryCategories$laundry_category.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategories$laundry_category;

  TRes call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Query$getLaundryCategories$laundry_category$name? name,
    String? $__typename,
  });
  CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> get name;
}

class _CopyWithImpl$Query$getLaundryCategories$laundry_category<TRes>
    implements CopyWith$Query$getLaundryCategories$laundry_category<TRes> {
  _CopyWithImpl$Query$getLaundryCategories$laundry_category(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategories$laundry_category _instance;

  final TRes Function(Query$getLaundryCategories$laundry_category) _then;

  static const _undefined = {};

  TRes call({
    Object? cost_by_kilo = _undefined,
    Object? id = _undefined,
    Object? name_id = _undefined,
    Object? position = _undefined,
    Object? store_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategories$laundry_category(
        cost_by_kilo: cost_by_kilo == _undefined || cost_by_kilo == null
            ? _instance.cost_by_kilo
            : (cost_by_kilo as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getLaundryCategories$laundry_category$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getLaundryCategories$laundry_category$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryCategories$laundry_category<TRes>
    implements CopyWith$Query$getLaundryCategories$laundry_category<TRes> {
  _CopyWithStubImpl$Query$getLaundryCategories$laundry_category(this._res);

  TRes _res;

  call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Query$getLaundryCategories$laundry_category$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> get name =>
      CopyWith$Query$getLaundryCategories$laundry_category$name.stub(_res);
}

class Query$getLaundryCategories$laundry_category$name {
  Query$getLaundryCategories$laundry_category$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getLaundryCategories$laundry_category$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategories$laundry_category$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getLaundryCategories$laundry_category$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getLaundryCategories$laundry_category$name$translations>
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
    if (!(other is Query$getLaundryCategories$laundry_category$name) ||
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

extension UtilityExtension$Query$getLaundryCategories$laundry_category$name
    on Query$getLaundryCategories$laundry_category$name {
  CopyWith$Query$getLaundryCategories$laundry_category$name<
          Query$getLaundryCategories$laundry_category$name>
      get copyWith => CopyWith$Query$getLaundryCategories$laundry_category$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> {
  factory CopyWith$Query$getLaundryCategories$laundry_category$name(
    Query$getLaundryCategories$laundry_category$name instance,
    TRes Function(Query$getLaundryCategories$laundry_category$name) then,
  ) = _CopyWithImpl$Query$getLaundryCategories$laundry_category$name;

  factory CopyWith$Query$getLaundryCategories$laundry_category$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name;

  TRes call({
    List<Query$getLaundryCategories$laundry_category$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getLaundryCategories$laundry_category$name$translations> Function(
              Iterable<
                  CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
                      Query$getLaundryCategories$laundry_category$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryCategories$laundry_category$name<TRes>
    implements CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> {
  _CopyWithImpl$Query$getLaundryCategories$laundry_category$name(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategories$laundry_category$name _instance;

  final TRes Function(Query$getLaundryCategories$laundry_category$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategories$laundry_category$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getLaundryCategories$laundry_category$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getLaundryCategories$laundry_category$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
                          Query$getLaundryCategories$laundry_category$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getLaundryCategories$laundry_category$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name<TRes>
    implements CopyWith$Query$getLaundryCategories$laundry_category$name<TRes> {
  _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name(this._res);

  TRes _res;

  call({
    List<Query$getLaundryCategories$laundry_category$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getLaundryCategories$laundry_category$name$translations {
  Query$getLaundryCategories$laundry_category$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getLaundryCategories$laundry_category$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategories$laundry_category$name$translations(
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
            is Query$getLaundryCategories$laundry_category$name$translations) ||
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

extension UtilityExtension$Query$getLaundryCategories$laundry_category$name$translations
    on Query$getLaundryCategories$laundry_category$name$translations {
  CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
          Query$getLaundryCategories$laundry_category$name$translations>
      get copyWith =>
          CopyWith$Query$getLaundryCategories$laundry_category$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
    TRes> {
  factory CopyWith$Query$getLaundryCategories$laundry_category$name$translations(
    Query$getLaundryCategories$laundry_category$name$translations instance,
    TRes Function(Query$getLaundryCategories$laundry_category$name$translations)
        then,
  ) = _CopyWithImpl$Query$getLaundryCategories$laundry_category$name$translations;

  factory CopyWith$Query$getLaundryCategories$laundry_category$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryCategories$laundry_category$name$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
            TRes> {
  _CopyWithImpl$Query$getLaundryCategories$laundry_category$name$translations(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategories$laundry_category$name$translations _instance;

  final TRes Function(
      Query$getLaundryCategories$laundry_category$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategories$laundry_category$name$translations(
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

class _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryCategories$laundry_category$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getLaundryCategories$laundry_category$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getLaundryCategoryById {
  factory Variables$Query$getLaundryCategoryById({required int categoryId}) =>
      Variables$Query$getLaundryCategoryById._({
        r'categoryId': categoryId,
      });

  Variables$Query$getLaundryCategoryById._(this._$data);

  factory Variables$Query$getLaundryCategoryById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$categoryId = data['categoryId'];
    result$data['categoryId'] = (l$categoryId as int);
    return Variables$Query$getLaundryCategoryById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get categoryId => (_$data['categoryId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$categoryId = categoryId;
    result$data['categoryId'] = l$categoryId;
    return result$data;
  }

  CopyWith$Variables$Query$getLaundryCategoryById<
          Variables$Query$getLaundryCategoryById>
      get copyWith => CopyWith$Variables$Query$getLaundryCategoryById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getLaundryCategoryById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categoryId = categoryId;
    return Object.hashAll([l$categoryId]);
  }
}

abstract class CopyWith$Variables$Query$getLaundryCategoryById<TRes> {
  factory CopyWith$Variables$Query$getLaundryCategoryById(
    Variables$Query$getLaundryCategoryById instance,
    TRes Function(Variables$Query$getLaundryCategoryById) then,
  ) = _CopyWithImpl$Variables$Query$getLaundryCategoryById;

  factory CopyWith$Variables$Query$getLaundryCategoryById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getLaundryCategoryById;

  TRes call({int? categoryId});
}

class _CopyWithImpl$Variables$Query$getLaundryCategoryById<TRes>
    implements CopyWith$Variables$Query$getLaundryCategoryById<TRes> {
  _CopyWithImpl$Variables$Query$getLaundryCategoryById(
    this._instance,
    this._then,
  );

  final Variables$Query$getLaundryCategoryById _instance;

  final TRes Function(Variables$Query$getLaundryCategoryById) _then;

  static const _undefined = {};

  TRes call({Object? categoryId = _undefined}) =>
      _then(Variables$Query$getLaundryCategoryById._({
        ..._instance._$data,
        if (categoryId != _undefined && categoryId != null)
          'categoryId': (categoryId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getLaundryCategoryById<TRes>
    implements CopyWith$Variables$Query$getLaundryCategoryById<TRes> {
  _CopyWithStubImpl$Variables$Query$getLaundryCategoryById(this._res);

  TRes _res;

  call({int? categoryId}) => _res;
}

class Query$getLaundryCategoryById {
  Query$getLaundryCategoryById({
    this.laundry_category_by_pk,
    required this.$__typename,
  });

  factory Query$getLaundryCategoryById.fromJson(Map<String, dynamic> json) {
    final l$laundry_category_by_pk = json['laundry_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategoryById(
      laundry_category_by_pk: l$laundry_category_by_pk == null
          ? null
          : Query$getLaundryCategoryById$laundry_category_by_pk.fromJson(
              (l$laundry_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getLaundryCategoryById$laundry_category_by_pk?
      laundry_category_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_category_by_pk = laundry_category_by_pk;
    _resultData['laundry_category_by_pk'] = l$laundry_category_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_category_by_pk = laundry_category_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_category_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryCategoryById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_category_by_pk = laundry_category_by_pk;
    final lOther$laundry_category_by_pk = other.laundry_category_by_pk;
    if (l$laundry_category_by_pk != lOther$laundry_category_by_pk) {
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

extension UtilityExtension$Query$getLaundryCategoryById
    on Query$getLaundryCategoryById {
  CopyWith$Query$getLaundryCategoryById<Query$getLaundryCategoryById>
      get copyWith => CopyWith$Query$getLaundryCategoryById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategoryById<TRes> {
  factory CopyWith$Query$getLaundryCategoryById(
    Query$getLaundryCategoryById instance,
    TRes Function(Query$getLaundryCategoryById) then,
  ) = _CopyWithImpl$Query$getLaundryCategoryById;

  factory CopyWith$Query$getLaundryCategoryById.stub(TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategoryById;

  TRes call({
    Query$getLaundryCategoryById$laundry_category_by_pk? laundry_category_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<TRes>
      get laundry_category_by_pk;
}

class _CopyWithImpl$Query$getLaundryCategoryById<TRes>
    implements CopyWith$Query$getLaundryCategoryById<TRes> {
  _CopyWithImpl$Query$getLaundryCategoryById(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategoryById _instance;

  final TRes Function(Query$getLaundryCategoryById) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategoryById(
        laundry_category_by_pk: laundry_category_by_pk == _undefined
            ? _instance.laundry_category_by_pk
            : (laundry_category_by_pk
                as Query$getLaundryCategoryById$laundry_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<TRes>
      get laundry_category_by_pk {
    final local$laundry_category_by_pk = _instance.laundry_category_by_pk;
    return local$laundry_category_by_pk == null
        ? CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk(
            local$laundry_category_by_pk,
            (e) => call(laundry_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryCategoryById<TRes>
    implements CopyWith$Query$getLaundryCategoryById<TRes> {
  _CopyWithStubImpl$Query$getLaundryCategoryById(this._res);

  TRes _res;

  call({
    Query$getLaundryCategoryById$laundry_category_by_pk? laundry_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<TRes>
      get laundry_category_by_pk =>
          CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk.stub(
              _res);
}

const documentNodeQuerygetLaundryCategoryById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLaundryCategoryById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categoryId')),
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
        name: NameNode(value: 'laundry_category_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'categoryId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cost_by_kilo'),
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
            name: NameNode(value: 'name_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store_id'),
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
Query$getLaundryCategoryById _parserFn$Query$getLaundryCategoryById(
        Map<String, dynamic> data) =>
    Query$getLaundryCategoryById.fromJson(data);

class Options$Query$getLaundryCategoryById
    extends graphql.QueryOptions<Query$getLaundryCategoryById> {
  Options$Query$getLaundryCategoryById({
    String? operationName,
    required Variables$Query$getLaundryCategoryById variables,
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
          document: documentNodeQuerygetLaundryCategoryById,
          parserFn: _parserFn$Query$getLaundryCategoryById,
        );
}

class WatchOptions$Query$getLaundryCategoryById
    extends graphql.WatchQueryOptions<Query$getLaundryCategoryById> {
  WatchOptions$Query$getLaundryCategoryById({
    String? operationName,
    required Variables$Query$getLaundryCategoryById variables,
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
          document: documentNodeQuerygetLaundryCategoryById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getLaundryCategoryById,
        );
}

class FetchMoreOptions$Query$getLaundryCategoryById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getLaundryCategoryById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getLaundryCategoryById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetLaundryCategoryById,
        );
}

extension ClientExtension$Query$getLaundryCategoryById
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getLaundryCategoryById>>
      query$getLaundryCategoryById(
              Options$Query$getLaundryCategoryById options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getLaundryCategoryById>
      watchQuery$getLaundryCategoryById(
              WatchOptions$Query$getLaundryCategoryById options) =>
          this.watchQuery(options);
  void writeQuery$getLaundryCategoryById({
    required Query$getLaundryCategoryById data,
    required Variables$Query$getLaundryCategoryById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetLaundryCategoryById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getLaundryCategoryById? readQuery$getLaundryCategoryById({
    required Variables$Query$getLaundryCategoryById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetLaundryCategoryById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getLaundryCategoryById.fromJson(result);
  }
}

class Query$getLaundryCategoryById$laundry_category_by_pk {
  Query$getLaundryCategoryById$laundry_category_by_pk({
    required this.cost_by_kilo,
    required this.id,
    required this.name_id,
    required this.position,
    required this.store_id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getLaundryCategoryById$laundry_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cost_by_kilo = json['cost_by_kilo'];
    final l$id = json['id'];
    final l$name_id = json['name_id'];
    final l$position = json['position'];
    final l$store_id = json['store_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategoryById$laundry_category_by_pk(
      cost_by_kilo: moneyFromJson(l$cost_by_kilo),
      id: (l$id as int),
      name_id: (l$name_id as int),
      position: (l$position as int),
      store_id: (l$store_id as int),
      name: Query$getLaundryCategoryById$laundry_category_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_by_kilo;

  final int id;

  final int name_id;

  final int position;

  final int store_id;

  final Query$getLaundryCategoryById$laundry_category_by_pk$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_by_kilo = cost_by_kilo;
    _resultData['cost_by_kilo'] = moneyToJson(l$cost_by_kilo);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_by_kilo = cost_by_kilo;
    final l$id = id;
    final l$name_id = name_id;
    final l$position = position;
    final l$store_id = store_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_by_kilo,
      l$id,
      l$name_id,
      l$position,
      l$store_id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getLaundryCategoryById$laundry_category_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_by_kilo = cost_by_kilo;
    final lOther$cost_by_kilo = other.cost_by_kilo;
    if (l$cost_by_kilo != lOther$cost_by_kilo) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Query$getLaundryCategoryById$laundry_category_by_pk
    on Query$getLaundryCategoryById$laundry_category_by_pk {
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<
          Query$getLaundryCategoryById$laundry_category_by_pk>
      get copyWith =>
          CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<
    TRes> {
  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk(
    Query$getLaundryCategoryById$laundry_category_by_pk instance,
    TRes Function(Query$getLaundryCategoryById$laundry_category_by_pk) then,
  ) = _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk;

  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk;

  TRes call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Query$getLaundryCategoryById$laundry_category_by_pk$name? name,
    String? $__typename,
  });
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<TRes>
      get name;
}

class _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk<TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<TRes> {
  _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategoryById$laundry_category_by_pk _instance;

  final TRes Function(Query$getLaundryCategoryById$laundry_category_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_by_kilo = _undefined,
    Object? id = _undefined,
    Object? name_id = _undefined,
    Object? position = _undefined,
    Object? store_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategoryById$laundry_category_by_pk(
        cost_by_kilo: cost_by_kilo == _undefined || cost_by_kilo == null
            ? _instance.cost_by_kilo
            : (cost_by_kilo as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getLaundryCategoryById$laundry_category_by_pk$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk<
        TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk<TRes> {
  _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk(
      this._res);

  TRes _res;

  call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Query$getLaundryCategoryById$laundry_category_by_pk$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<TRes>
      get name =>
          CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name
              .stub(_res);
}

class Query$getLaundryCategoryById$laundry_category_by_pk$name {
  Query$getLaundryCategoryById$laundry_category_by_pk$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getLaundryCategoryById$laundry_category_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategoryById$laundry_category_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getLaundryCategoryById$laundry_category_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>
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
    if (!(other is Query$getLaundryCategoryById$laundry_category_by_pk$name) ||
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

extension UtilityExtension$Query$getLaundryCategoryById$laundry_category_by_pk$name
    on Query$getLaundryCategoryById$laundry_category_by_pk$name {
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<
          Query$getLaundryCategoryById$laundry_category_by_pk$name>
      get copyWith =>
          CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<
    TRes> {
  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name(
    Query$getLaundryCategoryById$laundry_category_by_pk$name instance,
    TRes Function(Query$getLaundryCategoryById$laundry_category_by_pk$name)
        then,
  ) = _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name;

  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name;

  TRes call({
    List<Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getLaundryCategoryById$laundry_category_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
                      Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name<
        TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<
            TRes> {
  _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategoryById$laundry_category_by_pk$name _instance;

  final TRes Function(Query$getLaundryCategoryById$laundry_category_by_pk$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getLaundryCategoryById$laundry_category_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getLaundryCategoryById$laundry_category_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
                          Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name<
        TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name<
            TRes> {
  _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name(
      this._res);

  TRes _res;

  call({
    List<Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getLaundryCategoryById$laundry_category_by_pk$name$translations {
  Query$getLaundryCategoryById$laundry_category_by_pk$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getLaundryCategoryById$laundry_category_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
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
            is Query$getLaundryCategoryById$laundry_category_by_pk$name$translations) ||
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

extension UtilityExtension$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations
    on Query$getLaundryCategoryById$laundry_category_by_pk$name$translations {
  CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
          Query$getLaundryCategoryById$laundry_category_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
    Query$getLaundryCategoryById$laundry_category_by_pk$name$translations
        instance,
    TRes Function(
            Query$getLaundryCategoryById$laundry_category_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations;

  factory CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getLaundryCategoryById$laundry_category_by_pk$name$translations
      _instance;

  final TRes Function(
          Query$getLaundryCategoryById$laundry_category_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
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

class _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getLaundryCategoryById$laundry_category_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addLaundryCategory {
  factory Variables$Mutation$addLaundryCategory(
          {required Input$laundry_category_insert_input data}) =>
      Variables$Mutation$addLaundryCategory._({
        r'data': data,
      });

  Variables$Mutation$addLaundryCategory._(this._$data);

  factory Variables$Mutation$addLaundryCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$laundry_category_insert_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$addLaundryCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$laundry_category_insert_input get data =>
      (_$data['data'] as Input$laundry_category_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addLaundryCategory<
          Variables$Mutation$addLaundryCategory>
      get copyWith => CopyWith$Variables$Mutation$addLaundryCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addLaundryCategory) ||
        runtimeType != other.runtimeType) {
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
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$addLaundryCategory<TRes> {
  factory CopyWith$Variables$Mutation$addLaundryCategory(
    Variables$Mutation$addLaundryCategory instance,
    TRes Function(Variables$Mutation$addLaundryCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$addLaundryCategory;

  factory CopyWith$Variables$Mutation$addLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addLaundryCategory;

  TRes call({Input$laundry_category_insert_input? data});
}

class _CopyWithImpl$Variables$Mutation$addLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$addLaundryCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$addLaundryCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addLaundryCategory _instance;

  final TRes Function(Variables$Mutation$addLaundryCategory) _then;

  static const _undefined = {};

  TRes call({Object? data = _undefined}) =>
      _then(Variables$Mutation$addLaundryCategory._({
        ..._instance._$data,
        if (data != _undefined && data != null)
          'data': (data as Input$laundry_category_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$addLaundryCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addLaundryCategory(this._res);

  TRes _res;

  call({Input$laundry_category_insert_input? data}) => _res;
}

class Mutation$addLaundryCategory {
  Mutation$addLaundryCategory({
    this.insert_laundry_category_one,
    required this.$__typename,
  });

  factory Mutation$addLaundryCategory.fromJson(Map<String, dynamic> json) {
    final l$insert_laundry_category_one = json['insert_laundry_category_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addLaundryCategory(
      insert_laundry_category_one: l$insert_laundry_category_one == null
          ? null
          : Mutation$addLaundryCategory$insert_laundry_category_one.fromJson(
              (l$insert_laundry_category_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addLaundryCategory$insert_laundry_category_one?
      insert_laundry_category_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_laundry_category_one = insert_laundry_category_one;
    _resultData['insert_laundry_category_one'] =
        l$insert_laundry_category_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_laundry_category_one = insert_laundry_category_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_laundry_category_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addLaundryCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_laundry_category_one = insert_laundry_category_one;
    final lOther$insert_laundry_category_one =
        other.insert_laundry_category_one;
    if (l$insert_laundry_category_one != lOther$insert_laundry_category_one) {
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

extension UtilityExtension$Mutation$addLaundryCategory
    on Mutation$addLaundryCategory {
  CopyWith$Mutation$addLaundryCategory<Mutation$addLaundryCategory>
      get copyWith => CopyWith$Mutation$addLaundryCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addLaundryCategory<TRes> {
  factory CopyWith$Mutation$addLaundryCategory(
    Mutation$addLaundryCategory instance,
    TRes Function(Mutation$addLaundryCategory) then,
  ) = _CopyWithImpl$Mutation$addLaundryCategory;

  factory CopyWith$Mutation$addLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addLaundryCategory;

  TRes call({
    Mutation$addLaundryCategory$insert_laundry_category_one?
        insert_laundry_category_one,
    String? $__typename,
  });
  CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<TRes>
      get insert_laundry_category_one;
}

class _CopyWithImpl$Mutation$addLaundryCategory<TRes>
    implements CopyWith$Mutation$addLaundryCategory<TRes> {
  _CopyWithImpl$Mutation$addLaundryCategory(
    this._instance,
    this._then,
  );

  final Mutation$addLaundryCategory _instance;

  final TRes Function(Mutation$addLaundryCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_laundry_category_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addLaundryCategory(
        insert_laundry_category_one: insert_laundry_category_one == _undefined
            ? _instance.insert_laundry_category_one
            : (insert_laundry_category_one
                as Mutation$addLaundryCategory$insert_laundry_category_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<TRes>
      get insert_laundry_category_one {
    final local$insert_laundry_category_one =
        _instance.insert_laundry_category_one;
    return local$insert_laundry_category_one == null
        ? CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one(
            local$insert_laundry_category_one,
            (e) => call(insert_laundry_category_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addLaundryCategory<TRes>
    implements CopyWith$Mutation$addLaundryCategory<TRes> {
  _CopyWithStubImpl$Mutation$addLaundryCategory(this._res);

  TRes _res;

  call({
    Mutation$addLaundryCategory$insert_laundry_category_one?
        insert_laundry_category_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<TRes>
      get insert_laundry_category_one =>
          CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one.stub(
              _res);
}

const documentNodeMutationaddLaundryCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addLaundryCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'laundry_category_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_laundry_category_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'data')),
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
Mutation$addLaundryCategory _parserFn$Mutation$addLaundryCategory(
        Map<String, dynamic> data) =>
    Mutation$addLaundryCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$addLaundryCategory = FutureOr<void>
    Function(
  dynamic,
  Mutation$addLaundryCategory?,
);

class Options$Mutation$addLaundryCategory
    extends graphql.MutationOptions<Mutation$addLaundryCategory> {
  Options$Mutation$addLaundryCategory({
    String? operationName,
    required Variables$Mutation$addLaundryCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addLaundryCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$addLaundryCategory>? update,
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
                        : _parserFn$Mutation$addLaundryCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddLaundryCategory,
          parserFn: _parserFn$Mutation$addLaundryCategory,
        );

  final OnMutationCompleted$Mutation$addLaundryCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addLaundryCategory
    extends graphql.WatchQueryOptions<Mutation$addLaundryCategory> {
  WatchOptions$Mutation$addLaundryCategory({
    String? operationName,
    required Variables$Mutation$addLaundryCategory variables,
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
          document: documentNodeMutationaddLaundryCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addLaundryCategory,
        );
}

extension ClientExtension$Mutation$addLaundryCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addLaundryCategory>>
      mutate$addLaundryCategory(
              Options$Mutation$addLaundryCategory options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addLaundryCategory>
      watchMutation$addLaundryCategory(
              WatchOptions$Mutation$addLaundryCategory options) =>
          this.watchMutation(options);
}

class Mutation$addLaundryCategory$insert_laundry_category_one {
  Mutation$addLaundryCategory$insert_laundry_category_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addLaundryCategory$insert_laundry_category_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addLaundryCategory$insert_laundry_category_one(
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
    if (!(other is Mutation$addLaundryCategory$insert_laundry_category_one) ||
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

extension UtilityExtension$Mutation$addLaundryCategory$insert_laundry_category_one
    on Mutation$addLaundryCategory$insert_laundry_category_one {
  CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<
          Mutation$addLaundryCategory$insert_laundry_category_one>
      get copyWith =>
          CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<
    TRes> {
  factory CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one(
    Mutation$addLaundryCategory$insert_laundry_category_one instance,
    TRes Function(Mutation$addLaundryCategory$insert_laundry_category_one) then,
  ) = _CopyWithImpl$Mutation$addLaundryCategory$insert_laundry_category_one;

  factory CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addLaundryCategory$insert_laundry_category_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addLaundryCategory$insert_laundry_category_one<
        TRes>
    implements
        CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<TRes> {
  _CopyWithImpl$Mutation$addLaundryCategory$insert_laundry_category_one(
    this._instance,
    this._then,
  );

  final Mutation$addLaundryCategory$insert_laundry_category_one _instance;

  final TRes Function(Mutation$addLaundryCategory$insert_laundry_category_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addLaundryCategory$insert_laundry_category_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addLaundryCategory$insert_laundry_category_one<
        TRes>
    implements
        CopyWith$Mutation$addLaundryCategory$insert_laundry_category_one<TRes> {
  _CopyWithStubImpl$Mutation$addLaundryCategory$insert_laundry_category_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateLaundryCategory {
  factory Variables$Mutation$updateLaundryCategory({
    required int categoryId,
    required Input$laundry_category_set_input data,
  }) =>
      Variables$Mutation$updateLaundryCategory._({
        r'categoryId': categoryId,
        r'data': data,
      });

  Variables$Mutation$updateLaundryCategory._(this._$data);

  factory Variables$Mutation$updateLaundryCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$categoryId = data['categoryId'];
    result$data['categoryId'] = (l$categoryId as int);
    final l$data = data['data'];
    result$data['data'] = Input$laundry_category_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateLaundryCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get categoryId => (_$data['categoryId'] as int);
  Input$laundry_category_set_input get data =>
      (_$data['data'] as Input$laundry_category_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$categoryId = categoryId;
    result$data['categoryId'] = l$categoryId;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateLaundryCategory<
          Variables$Mutation$updateLaundryCategory>
      get copyWith => CopyWith$Variables$Mutation$updateLaundryCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateLaundryCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$categoryId = categoryId;
    final lOther$categoryId = other.categoryId;
    if (l$categoryId != lOther$categoryId) {
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
    final l$categoryId = categoryId;
    final l$data = data;
    return Object.hashAll([
      l$categoryId,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateLaundryCategory<TRes> {
  factory CopyWith$Variables$Mutation$updateLaundryCategory(
    Variables$Mutation$updateLaundryCategory instance,
    TRes Function(Variables$Mutation$updateLaundryCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$updateLaundryCategory;

  factory CopyWith$Variables$Mutation$updateLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateLaundryCategory;

  TRes call({
    int? categoryId,
    Input$laundry_category_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$updateLaundryCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateLaundryCategory _instance;

  final TRes Function(Variables$Mutation$updateLaundryCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? categoryId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateLaundryCategory._({
        ..._instance._$data,
        if (categoryId != _undefined && categoryId != null)
          'categoryId': (categoryId as int),
        if (data != _undefined && data != null)
          'data': (data as Input$laundry_category_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateLaundryCategory(this._res);

  TRes _res;

  call({
    int? categoryId,
    Input$laundry_category_set_input? data,
  }) =>
      _res;
}

class Mutation$updateLaundryCategory {
  Mutation$updateLaundryCategory({
    this.update_laundry_category_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateLaundryCategory.fromJson(Map<String, dynamic> json) {
    final l$update_laundry_category_by_pk =
        json['update_laundry_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryCategory(
      update_laundry_category_by_pk: l$update_laundry_category_by_pk == null
          ? null
          : Mutation$updateLaundryCategory$update_laundry_category_by_pk
              .fromJson(
                  (l$update_laundry_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateLaundryCategory$update_laundry_category_by_pk?
      update_laundry_category_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_laundry_category_by_pk = update_laundry_category_by_pk;
    _resultData['update_laundry_category_by_pk'] =
        l$update_laundry_category_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_laundry_category_by_pk = update_laundry_category_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_laundry_category_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLaundryCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_laundry_category_by_pk = update_laundry_category_by_pk;
    final lOther$update_laundry_category_by_pk =
        other.update_laundry_category_by_pk;
    if (l$update_laundry_category_by_pk !=
        lOther$update_laundry_category_by_pk) {
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

extension UtilityExtension$Mutation$updateLaundryCategory
    on Mutation$updateLaundryCategory {
  CopyWith$Mutation$updateLaundryCategory<Mutation$updateLaundryCategory>
      get copyWith => CopyWith$Mutation$updateLaundryCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryCategory<TRes> {
  factory CopyWith$Mutation$updateLaundryCategory(
    Mutation$updateLaundryCategory instance,
    TRes Function(Mutation$updateLaundryCategory) then,
  ) = _CopyWithImpl$Mutation$updateLaundryCategory;

  factory CopyWith$Mutation$updateLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryCategory;

  TRes call({
    Mutation$updateLaundryCategory$update_laundry_category_by_pk?
        update_laundry_category_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<TRes>
      get update_laundry_category_by_pk;
}

class _CopyWithImpl$Mutation$updateLaundryCategory<TRes>
    implements CopyWith$Mutation$updateLaundryCategory<TRes> {
  _CopyWithImpl$Mutation$updateLaundryCategory(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryCategory _instance;

  final TRes Function(Mutation$updateLaundryCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? update_laundry_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryCategory(
        update_laundry_category_by_pk: update_laundry_category_by_pk ==
                _undefined
            ? _instance.update_laundry_category_by_pk
            : (update_laundry_category_by_pk
                as Mutation$updateLaundryCategory$update_laundry_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<TRes>
      get update_laundry_category_by_pk {
    final local$update_laundry_category_by_pk =
        _instance.update_laundry_category_by_pk;
    return local$update_laundry_category_by_pk == null
        ? CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk(
            local$update_laundry_category_by_pk,
            (e) => call(update_laundry_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLaundryCategory<TRes>
    implements CopyWith$Mutation$updateLaundryCategory<TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryCategory(this._res);

  TRes _res;

  call({
    Mutation$updateLaundryCategory$update_laundry_category_by_pk?
        update_laundry_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<TRes>
      get update_laundry_category_by_pk =>
          CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk
              .stub(_res);
}

const documentNodeMutationupdateLaundryCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateLaundryCategory'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categoryId')),
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
          name: NameNode(value: 'laundry_category_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_laundry_category_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'categoryId')),
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
            name: NameNode(value: 'cost_by_kilo'),
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
            name: NameNode(value: 'name_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store_id'),
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
Mutation$updateLaundryCategory _parserFn$Mutation$updateLaundryCategory(
        Map<String, dynamic> data) =>
    Mutation$updateLaundryCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$updateLaundryCategory = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateLaundryCategory?,
);

class Options$Mutation$updateLaundryCategory
    extends graphql.MutationOptions<Mutation$updateLaundryCategory> {
  Options$Mutation$updateLaundryCategory({
    String? operationName,
    required Variables$Mutation$updateLaundryCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateLaundryCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateLaundryCategory>? update,
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
                        : _parserFn$Mutation$updateLaundryCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateLaundryCategory,
          parserFn: _parserFn$Mutation$updateLaundryCategory,
        );

  final OnMutationCompleted$Mutation$updateLaundryCategory?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateLaundryCategory
    extends graphql.WatchQueryOptions<Mutation$updateLaundryCategory> {
  WatchOptions$Mutation$updateLaundryCategory({
    String? operationName,
    required Variables$Mutation$updateLaundryCategory variables,
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
          document: documentNodeMutationupdateLaundryCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateLaundryCategory,
        );
}

extension ClientExtension$Mutation$updateLaundryCategory
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateLaundryCategory>>
      mutate$updateLaundryCategory(
              Options$Mutation$updateLaundryCategory options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateLaundryCategory>
      watchMutation$updateLaundryCategory(
              WatchOptions$Mutation$updateLaundryCategory options) =>
          this.watchMutation(options);
}

class Mutation$updateLaundryCategory$update_laundry_category_by_pk {
  Mutation$updateLaundryCategory$update_laundry_category_by_pk({
    required this.cost_by_kilo,
    required this.id,
    required this.name_id,
    required this.position,
    required this.store_id,
    required this.name,
    required this.$__typename,
  });

  factory Mutation$updateLaundryCategory$update_laundry_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cost_by_kilo = json['cost_by_kilo'];
    final l$id = json['id'];
    final l$name_id = json['name_id'];
    final l$position = json['position'];
    final l$store_id = json['store_id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryCategory$update_laundry_category_by_pk(
      cost_by_kilo: moneyFromJson(l$cost_by_kilo),
      id: (l$id as int),
      name_id: (l$name_id as int),
      position: (l$position as int),
      store_id: (l$store_id as int),
      name: Mutation$updateLaundryCategory$update_laundry_category_by_pk$name
          .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_by_kilo;

  final int id;

  final int name_id;

  final int position;

  final int store_id;

  final Mutation$updateLaundryCategory$update_laundry_category_by_pk$name name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_by_kilo = cost_by_kilo;
    _resultData['cost_by_kilo'] = moneyToJson(l$cost_by_kilo);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_by_kilo = cost_by_kilo;
    final l$id = id;
    final l$name_id = name_id;
    final l$position = position;
    final l$store_id = store_id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_by_kilo,
      l$id,
      l$name_id,
      l$position,
      l$store_id,
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
            is Mutation$updateLaundryCategory$update_laundry_category_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_by_kilo = cost_by_kilo;
    final lOther$cost_by_kilo = other.cost_by_kilo;
    if (l$cost_by_kilo != lOther$cost_by_kilo) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Mutation$updateLaundryCategory$update_laundry_category_by_pk
    on Mutation$updateLaundryCategory$update_laundry_category_by_pk {
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
          Mutation$updateLaundryCategory$update_laundry_category_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk(
    Mutation$updateLaundryCategory$update_laundry_category_by_pk instance,
    TRes Function(Mutation$updateLaundryCategory$update_laundry_category_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk;

  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk;

  TRes call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Mutation$updateLaundryCategory$update_laundry_category_by_pk$name? name,
    String? $__typename,
  });
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
      TRes> get name;
}

class _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryCategory$update_laundry_category_by_pk _instance;

  final TRes Function(
      Mutation$updateLaundryCategory$update_laundry_category_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? cost_by_kilo = _undefined,
    Object? id = _undefined,
    Object? name_id = _undefined,
    Object? position = _undefined,
    Object? store_id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryCategory$update_laundry_category_by_pk(
        cost_by_kilo: cost_by_kilo == _undefined || cost_by_kilo == null
            ? _instance.cost_by_kilo
            : (cost_by_kilo as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Mutation$updateLaundryCategory$update_laundry_category_by_pk$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk(
      this._res);

  TRes _res;

  call({
    double? cost_by_kilo,
    int? id,
    int? name_id,
    int? position,
    int? store_id,
    Mutation$updateLaundryCategory$update_laundry_category_by_pk$name? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
          TRes>
      get name =>
          CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name
              .stub(_res);
}

class Mutation$updateLaundryCategory$update_laundry_category_by_pk$name {
  Mutation$updateLaundryCategory$update_laundry_category_by_pk$name({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateLaundryCategory$update_laundry_category_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>
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
            is Mutation$updateLaundryCategory$update_laundry_category_by_pk$name) ||
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

extension UtilityExtension$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name
    on Mutation$updateLaundryCategory$update_laundry_category_by_pk$name {
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name>
      get copyWith =>
          CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
    TRes> {
  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
    Mutation$updateLaundryCategory$update_laundry_category_by_pk$name instance,
    TRes Function(
            Mutation$updateLaundryCategory$update_laundry_category_by_pk$name)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name;

  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name;

  TRes call({
    List<Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
                      Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryCategory$update_laundry_category_by_pk$name
      _instance;

  final TRes Function(
      Mutation$updateLaundryCategory$update_laundry_category_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
                          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations {
  Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations({
    required this.value,
    required this.language_id,
    required this.$__typename,
  });

  factory Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
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
            is Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations) ||
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

extension UtilityExtension$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations
    on Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations {
  CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations>
      get copyWith =>
          CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
    TRes> {
  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
    Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations
        instance,
    TRes Function(
            Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations;

  factory CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations;

  TRes call({
    String? value,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations
      _instance;

  final TRes Function(
          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? value = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
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

class _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryCategory$update_laundry_category_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? value,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteLaundryCategory {
  factory Variables$Mutation$deleteLaundryCategory({required int id}) =>
      Variables$Mutation$deleteLaundryCategory._({
        r'id': id,
      });

  Variables$Mutation$deleteLaundryCategory._(this._$data);

  factory Variables$Mutation$deleteLaundryCategory.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$deleteLaundryCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteLaundryCategory<
          Variables$Mutation$deleteLaundryCategory>
      get copyWith => CopyWith$Variables$Mutation$deleteLaundryCategory(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteLaundryCategory) ||
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

abstract class CopyWith$Variables$Mutation$deleteLaundryCategory<TRes> {
  factory CopyWith$Variables$Mutation$deleteLaundryCategory(
    Variables$Mutation$deleteLaundryCategory instance,
    TRes Function(Variables$Mutation$deleteLaundryCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteLaundryCategory;

  factory CopyWith$Variables$Mutation$deleteLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteLaundryCategory;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$deleteLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$deleteLaundryCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteLaundryCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteLaundryCategory _instance;

  final TRes Function(Variables$Mutation$deleteLaundryCategory) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$deleteLaundryCategory._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteLaundryCategory<TRes>
    implements CopyWith$Variables$Mutation$deleteLaundryCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteLaundryCategory(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$deleteLaundryCategory {
  Mutation$deleteLaundryCategory({
    this.delete_laundry_category_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteLaundryCategory.fromJson(Map<String, dynamic> json) {
    final l$delete_laundry_category_by_pk =
        json['delete_laundry_category_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteLaundryCategory(
      delete_laundry_category_by_pk: l$delete_laundry_category_by_pk == null
          ? null
          : Mutation$deleteLaundryCategory$delete_laundry_category_by_pk
              .fromJson(
                  (l$delete_laundry_category_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteLaundryCategory$delete_laundry_category_by_pk?
      delete_laundry_category_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_laundry_category_by_pk = delete_laundry_category_by_pk;
    _resultData['delete_laundry_category_by_pk'] =
        l$delete_laundry_category_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_laundry_category_by_pk = delete_laundry_category_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_laundry_category_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteLaundryCategory) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_laundry_category_by_pk = delete_laundry_category_by_pk;
    final lOther$delete_laundry_category_by_pk =
        other.delete_laundry_category_by_pk;
    if (l$delete_laundry_category_by_pk !=
        lOther$delete_laundry_category_by_pk) {
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

extension UtilityExtension$Mutation$deleteLaundryCategory
    on Mutation$deleteLaundryCategory {
  CopyWith$Mutation$deleteLaundryCategory<Mutation$deleteLaundryCategory>
      get copyWith => CopyWith$Mutation$deleteLaundryCategory(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteLaundryCategory<TRes> {
  factory CopyWith$Mutation$deleteLaundryCategory(
    Mutation$deleteLaundryCategory instance,
    TRes Function(Mutation$deleteLaundryCategory) then,
  ) = _CopyWithImpl$Mutation$deleteLaundryCategory;

  factory CopyWith$Mutation$deleteLaundryCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteLaundryCategory;

  TRes call({
    Mutation$deleteLaundryCategory$delete_laundry_category_by_pk?
        delete_laundry_category_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<TRes>
      get delete_laundry_category_by_pk;
}

class _CopyWithImpl$Mutation$deleteLaundryCategory<TRes>
    implements CopyWith$Mutation$deleteLaundryCategory<TRes> {
  _CopyWithImpl$Mutation$deleteLaundryCategory(
    this._instance,
    this._then,
  );

  final Mutation$deleteLaundryCategory _instance;

  final TRes Function(Mutation$deleteLaundryCategory) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_laundry_category_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteLaundryCategory(
        delete_laundry_category_by_pk: delete_laundry_category_by_pk ==
                _undefined
            ? _instance.delete_laundry_category_by_pk
            : (delete_laundry_category_by_pk
                as Mutation$deleteLaundryCategory$delete_laundry_category_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<TRes>
      get delete_laundry_category_by_pk {
    final local$delete_laundry_category_by_pk =
        _instance.delete_laundry_category_by_pk;
    return local$delete_laundry_category_by_pk == null
        ? CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
            local$delete_laundry_category_by_pk,
            (e) => call(delete_laundry_category_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteLaundryCategory<TRes>
    implements CopyWith$Mutation$deleteLaundryCategory<TRes> {
  _CopyWithStubImpl$Mutation$deleteLaundryCategory(this._res);

  TRes _res;

  call({
    Mutation$deleteLaundryCategory$delete_laundry_category_by_pk?
        delete_laundry_category_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<TRes>
      get delete_laundry_category_by_pk =>
          CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteLaundryCategory = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteLaundryCategory'),
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
        name: NameNode(value: 'delete_laundry_category_by_pk'),
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
Mutation$deleteLaundryCategory _parserFn$Mutation$deleteLaundryCategory(
        Map<String, dynamic> data) =>
    Mutation$deleteLaundryCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteLaundryCategory = FutureOr<void>
    Function(
  dynamic,
  Mutation$deleteLaundryCategory?,
);

class Options$Mutation$deleteLaundryCategory
    extends graphql.MutationOptions<Mutation$deleteLaundryCategory> {
  Options$Mutation$deleteLaundryCategory({
    String? operationName,
    required Variables$Mutation$deleteLaundryCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteLaundryCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteLaundryCategory>? update,
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
                        : _parserFn$Mutation$deleteLaundryCategory(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteLaundryCategory,
          parserFn: _parserFn$Mutation$deleteLaundryCategory,
        );

  final OnMutationCompleted$Mutation$deleteLaundryCategory?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteLaundryCategory
    extends graphql.WatchQueryOptions<Mutation$deleteLaundryCategory> {
  WatchOptions$Mutation$deleteLaundryCategory({
    String? operationName,
    required Variables$Mutation$deleteLaundryCategory variables,
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
          document: documentNodeMutationdeleteLaundryCategory,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteLaundryCategory,
        );
}

extension ClientExtension$Mutation$deleteLaundryCategory
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteLaundryCategory>>
      mutate$deleteLaundryCategory(
              Options$Mutation$deleteLaundryCategory options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteLaundryCategory>
      watchMutation$deleteLaundryCategory(
              WatchOptions$Mutation$deleteLaundryCategory options) =>
          this.watchMutation(options);
}

class Mutation$deleteLaundryCategory$delete_laundry_category_by_pk {
  Mutation$deleteLaundryCategory$delete_laundry_category_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$deleteLaundryCategory$delete_laundry_category_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
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
            is Mutation$deleteLaundryCategory$delete_laundry_category_by_pk) ||
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

extension UtilityExtension$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk
    on Mutation$deleteLaundryCategory$delete_laundry_category_by_pk {
  CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
          Mutation$deleteLaundryCategory$delete_laundry_category_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
    Mutation$deleteLaundryCategory$delete_laundry_category_by_pk instance,
    TRes Function(Mutation$deleteLaundryCategory$delete_laundry_category_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk;

  factory CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteLaundryCategory$delete_laundry_category_by_pk _instance;

  final TRes Function(
      Mutation$deleteLaundryCategory$delete_laundry_category_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteLaundryCategory$delete_laundry_category_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
