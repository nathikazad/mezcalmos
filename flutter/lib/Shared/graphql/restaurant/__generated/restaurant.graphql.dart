import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$getRestaurants {
  Query$getRestaurants({
    required this.restaurant_restaurant,
    required this.$__typename,
  });

  factory Query$getRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant = json['restaurant_restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants(
      restaurant_restaurant: (l$restaurant_restaurant as List<dynamic>)
          .map((e) => Query$getRestaurants$restaurant_restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurants$restaurant_restaurant> restaurant_restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant = restaurant_restaurant;
    _resultData['restaurant_restaurant'] =
        l$restaurant_restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant = restaurant_restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_restaurant.map((v) => v)),
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
    final l$restaurant_restaurant = restaurant_restaurant;
    final lOther$restaurant_restaurant = other.restaurant_restaurant;
    if (l$restaurant_restaurant.length != lOther$restaurant_restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_restaurant.length; i++) {
      final l$restaurant_restaurant$entry = l$restaurant_restaurant[i];
      final lOther$restaurant_restaurant$entry =
          lOther$restaurant_restaurant[i];
      if (l$restaurant_restaurant$entry != lOther$restaurant_restaurant$entry) {
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
    List<Query$getRestaurants$restaurant_restaurant>? restaurant_restaurant,
    String? $__typename,
  });
  TRes restaurant_restaurant(
      Iterable<Query$getRestaurants$restaurant_restaurant> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant_restaurant<
                      Query$getRestaurants$restaurant_restaurant>>)
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
    Object? restaurant_restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants(
        restaurant_restaurant:
            restaurant_restaurant == _undefined || restaurant_restaurant == null
                ? _instance.restaurant_restaurant
                : (restaurant_restaurant
                    as List<Query$getRestaurants$restaurant_restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_restaurant(
          Iterable<Query$getRestaurants$restaurant_restaurant> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant_restaurant<
                          Query$getRestaurants$restaurant_restaurant>>)
              _fn) =>
      call(
          restaurant_restaurant: _fn(_instance.restaurant_restaurant
              .map((e) => CopyWith$Query$getRestaurants$restaurant_restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants<TRes>
    implements CopyWith$Query$getRestaurants<TRes> {
  _CopyWithStubImpl$Query$getRestaurants(this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant_restaurant>? restaurant_restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant_restaurant(_fn) => _res;
}

const documentNodeQuerygetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurants'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_restaurant'),
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
            name: NameNode(value: 'delivery_details_of_deliverer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'firebase_id'),
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

class Query$getRestaurants$restaurant_restaurant {
  Query$getRestaurants$restaurant_restaurant({
    required this.id,
    this.delivery_details_of_deliverer,
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details_of_deliverer =
        json['delivery_details_of_deliverer'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant(
      id: (l$id as int),
      delivery_details_of_deliverer: (l$delivery_details_of_deliverer
              as List<dynamic>?)
          ?.map((e) =>
              Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      details: l$details == null
          ? null
          : Query$getRestaurants$restaurant_restaurant$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>?
      delivery_details_of_deliverer;

  final Query$getRestaurants$restaurant_restaurant$details? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    _resultData['delivery_details_of_deliverer'] =
        l$delivery_details_of_deliverer?.map((e) => e.toJson()).toList();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details_of_deliverer == null
          ? null
          : Object.hashAll(l$delivery_details_of_deliverer.map((v) => v)),
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants$restaurant_restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final lOther$delivery_details_of_deliverer =
        other.delivery_details_of_deliverer;
    if (l$delivery_details_of_deliverer != null &&
        lOther$delivery_details_of_deliverer != null) {
      if (l$delivery_details_of_deliverer.length !=
          lOther$delivery_details_of_deliverer.length) {
        return false;
      }
      for (int i = 0; i < l$delivery_details_of_deliverer.length; i++) {
        final l$delivery_details_of_deliverer$entry =
            l$delivery_details_of_deliverer[i];
        final lOther$delivery_details_of_deliverer$entry =
            lOther$delivery_details_of_deliverer[i];
        if (l$delivery_details_of_deliverer$entry !=
            lOther$delivery_details_of_deliverer$entry) {
          return false;
        }
      }
    } else if (l$delivery_details_of_deliverer !=
        lOther$delivery_details_of_deliverer) {
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant
    on Query$getRestaurants$restaurant_restaurant {
  CopyWith$Query$getRestaurants$restaurant_restaurant<
          Query$getRestaurants$restaurant_restaurant>
      get copyWith => CopyWith$Query$getRestaurants$restaurant_restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant<TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant(
    Query$getRestaurants$restaurant_restaurant instance,
    TRes Function(Query$getRestaurants$restaurant_restaurant) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant;

  TRes call({
    int? id,
    List<Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    Query$getRestaurants$restaurant_restaurant$details? details,
    String? $__typename,
  });
  TRes delivery_details_of_deliverer(
      Iterable<Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>? Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
                      Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>>?)
          _fn);
  CopyWith$Query$getRestaurants$restaurant_restaurant$details<TRes> get details;
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant_restaurant<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant _instance;

  final TRes Function(Query$getRestaurants$restaurant_restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details_of_deliverer = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant_restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details_of_deliverer: delivery_details_of_deliverer ==
                _undefined
            ? _instance.delivery_details_of_deliverer
            : (delivery_details_of_deliverer as List<
                Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>?),
        details: details == _undefined
            ? _instance.details
            : (details as Query$getRestaurants$restaurant_restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details_of_deliverer(
          Iterable<Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>? Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
                          Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>>?)
              _fn) =>
      call(
          delivery_details_of_deliverer: _fn(
              _instance.delivery_details_of_deliverer?.map((e) =>
                  CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Query$getRestaurants$restaurant_restaurant$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurants$restaurant_restaurant$details.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurants$restaurant_restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant_restaurant<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant(this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    Query$getRestaurants$restaurant_restaurant$details? details,
    String? $__typename,
  }) =>
      _res;
  delivery_details_of_deliverer(_fn) => _res;
  CopyWith$Query$getRestaurants$restaurant_restaurant$details<TRes>
      get details =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details.stub(
              _res);
}

class Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer {
  Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.radius,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$radius = json['radius'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      radius: (l$radius as int),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int radius;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$minimum_cost = minimum_cost;
    final l$radius = radius;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
      l$radius,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer
    on Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer {
  CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
          Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
    Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer
        instance,
    TRes Function(
            Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer
      _instance;

  final TRes Function(
          Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? radius = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$delivery_details_of_deliverer(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurants$restaurant_restaurant$details {
  Query$getRestaurants$restaurant_restaurant$details({
    required this.id,
    required this.image,
    required this.language,
    required this.name,
    required this.location,
    this.firebase_id,
    required this.approved,
    this.description_id,
    this.schedule,
    this.description,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$name = json['name'];
    final l$location = json['location'];
    final l$firebase_id = json['firebase_id'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant$details(
      id: (l$id as int),
      image: (l$image as String),
      language: mapFromJson(l$language),
      name: (l$name as String),
      location:
          Query$getRestaurants$restaurant_restaurant$details$location.fromJson(
              (l$location as Map<String, dynamic>)),
      firebase_id: (l$firebase_id as String?),
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Query$getRestaurants$restaurant_restaurant$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String image;

  final dynamic language;

  final String name;

  final Query$getRestaurants$restaurant_restaurant$details$location location;

  final String? firebase_id;

  final bool approved;

  final int? description_id;

  final dynamic? schedule;

  final Query$getRestaurants$restaurant_restaurant$details$description?
      description;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
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
    final l$language = language;
    final l$name = name;
    final l$location = location;
    final l$firebase_id = firebase_id;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$schedule = schedule;
    final l$description = description;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$language,
      l$name,
      l$location,
      l$firebase_id,
      l$approved,
      l$description_id,
      l$schedule,
      l$description,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants$restaurant_restaurant$details) ||
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant$details
    on Query$getRestaurants$restaurant_restaurant$details {
  CopyWith$Query$getRestaurants$restaurant_restaurant$details<
          Query$getRestaurants$restaurant_restaurant$details>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant$details<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details(
    Query$getRestaurants$restaurant_restaurant$details instance,
    TRes Function(Query$getRestaurants$restaurant_restaurant$details) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details;

  TRes call({
    int? id,
    String? image,
    dynamic? language,
    String? name,
    Query$getRestaurants$restaurant_restaurant$details$location? location,
    String? firebase_id,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getRestaurants$restaurant_restaurant$details$description? description,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<TRes>
      get location;
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details<TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant$details _instance;

  final TRes Function(Query$getRestaurants$restaurant_restaurant$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? name = _undefined,
    Object? location = _undefined,
    Object? firebase_id = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant_restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getRestaurants$restaurant_restaurant$details$location),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getRestaurants$restaurant_restaurant$details$description?),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$getRestaurants$restaurant_restaurant$details$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurants$restaurant_restaurant$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurants$restaurant_restaurant$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details<TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    dynamic? language,
    String? name,
    Query$getRestaurants$restaurant_restaurant$details$location? location,
    String? firebase_id,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getRestaurants$restaurant_restaurant$details$description? description,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<TRes>
      get location =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details$location
              .stub(_res);
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<TRes>
      get description =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details$description
              .stub(_res);
}

class Query$getRestaurants$restaurant_restaurant$details$location {
  Query$getRestaurants$restaurant_restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant$details$location(
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
            is Query$getRestaurants$restaurant_restaurant$details$location) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant$details$location
    on Query$getRestaurants$restaurant_restaurant$details$location {
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<
          Query$getRestaurants$restaurant_restaurant$details$location>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$location(
    Query$getRestaurants$restaurant_restaurant$details$location instance,
    TRes Function(Query$getRestaurants$restaurant_restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$location;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant$details$location _instance;

  final TRes Function(
      Query$getRestaurants$restaurant_restaurant$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant_restaurant$details$location(
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

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurants$restaurant_restaurant$details$description {
  Query$getRestaurants$restaurant_restaurant$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurants$restaurant_restaurant$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getRestaurants$restaurant_restaurant$details$description$translations>
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
            is Query$getRestaurants$restaurant_restaurant$details$description) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant$details$description
    on Query$getRestaurants$restaurant_restaurant$details$description {
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<
          Query$getRestaurants$restaurant_restaurant$details$description>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$description(
    Query$getRestaurants$restaurant_restaurant$details$description instance,
    TRes Function(
            Query$getRestaurants$restaurant_restaurant$details$description)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description;

  TRes call({
    List<Query$getRestaurants$restaurant_restaurant$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurants$restaurant_restaurant$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
                      Query$getRestaurants$restaurant_restaurant$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant$details$description
      _instance;

  final TRes Function(
      Query$getRestaurants$restaurant_restaurant$details$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant_restaurant$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurants$restaurant_restaurant$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurants$restaurant_restaurant$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
                          Query$getRestaurants$restaurant_restaurant$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant_restaurant$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurants$restaurant_restaurant$details$description$translations {
  Query$getRestaurants$restaurant_restaurant$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant_restaurant$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant_restaurant$details$description$translations(
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
            is Query$getRestaurants$restaurant_restaurant$details$description$translations) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant_restaurant$details$description$translations
    on Query$getRestaurants$restaurant_restaurant$details$description$translations {
  CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
          Query$getRestaurants$restaurant_restaurant$details$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations(
    Query$getRestaurants$restaurant_restaurant$details$description$translations
        instance,
    TRes Function(
            Query$getRestaurants$restaurant_restaurant$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations;

  factory CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant_restaurant$details$description$translations
      _instance;

  final TRes Function(
          Query$getRestaurants$restaurant_restaurant$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurants$restaurant_restaurant$details$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant_restaurant$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant_restaurant$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_desc_by_pk {
  factory Variables$Query$get_restaurant_desc_by_pk({required int desc_id}) =>
      Variables$Query$get_restaurant_desc_by_pk._({
        r'desc_id': desc_id,
      });

  Variables$Query$get_restaurant_desc_by_pk._(this._$data);

  factory Variables$Query$get_restaurant_desc_by_pk.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$desc_id = data['desc_id'];
    result$data['desc_id'] = (l$desc_id as int);
    return Variables$Query$get_restaurant_desc_by_pk._(result$data);
  }

  Map<String, dynamic> _$data;

  int get desc_id => (_$data['desc_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$desc_id = desc_id;
    result$data['desc_id'] = l$desc_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_desc_by_pk<
          Variables$Query$get_restaurant_desc_by_pk>
      get copyWith => CopyWith$Variables$Query$get_restaurant_desc_by_pk(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_desc_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$desc_id = desc_id;
    final lOther$desc_id = other.desc_id;
    if (l$desc_id != lOther$desc_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$desc_id = desc_id;
    return Object.hashAll([l$desc_id]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_desc_by_pk(
    Variables$Query$get_restaurant_desc_by_pk instance,
    TRes Function(Variables$Query$get_restaurant_desc_by_pk) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk;

  factory CopyWith$Variables$Query$get_restaurant_desc_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk;

  TRes call({int? desc_id});
}

class _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_desc_by_pk _instance;

  final TRes Function(Variables$Query$get_restaurant_desc_by_pk) _then;

  static const _undefined = {};

  TRes call({Object? desc_id = _undefined}) =>
      _then(Variables$Query$get_restaurant_desc_by_pk._({
        ..._instance._$data,
        if (desc_id != _undefined && desc_id != null)
          'desc_id': (desc_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk(this._res);

  TRes _res;

  call({int? desc_id}) => _res;
}

class Query$get_restaurant_desc_by_pk {
  Query$get_restaurant_desc_by_pk({
    this.translation_by_pk,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk.fromJson(Map<String, dynamic> json) {
    final l$translation_by_pk = json['translation_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk(
      translation_by_pk: l$translation_by_pk == null
          ? null
          : Query$get_restaurant_desc_by_pk$translation_by_pk.fromJson(
              (l$translation_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translation_by_pk = translation_by_pk;
    _resultData['translation_by_pk'] = l$translation_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translation_by_pk = translation_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$translation_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_desc_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translation_by_pk = translation_by_pk;
    final lOther$translation_by_pk = other.translation_by_pk;
    if (l$translation_by_pk != lOther$translation_by_pk) {
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk
    on Query$get_restaurant_desc_by_pk {
  CopyWith$Query$get_restaurant_desc_by_pk<Query$get_restaurant_desc_by_pk>
      get copyWith => CopyWith$Query$get_restaurant_desc_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk(
    Query$get_restaurant_desc_by_pk instance,
    TRes Function(Query$get_restaurant_desc_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk;

  factory CopyWith$Query$get_restaurant_desc_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk;

  TRes call({
    Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk;
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk _instance;

  final TRes Function(Query$get_restaurant_desc_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? translation_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk(
        translation_by_pk: translation_by_pk == _undefined
            ? _instance.translation_by_pk
            : (translation_by_pk
                as Query$get_restaurant_desc_by_pk$translation_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk {
    final local$translation_by_pk = _instance.translation_by_pk;
    return local$translation_by_pk == null
        ? CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
            local$translation_by_pk, (e) => call(translation_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk(this._res);

  TRes _res;

  call({
    Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(_res);
}

const documentNodeQueryget_restaurant_desc_by_pk = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_desc_by_pk'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'desc_id')),
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
        name: NameNode(value: 'translation_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'desc_id')),
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
      
    ]),
  ),
]);
Query$get_restaurant_desc_by_pk _parserFn$Query$get_restaurant_desc_by_pk(
        Map<String, dynamic> data) =>
    Query$get_restaurant_desc_by_pk.fromJson(data);

class Options$Query$get_restaurant_desc_by_pk
    extends graphql.QueryOptions<Query$get_restaurant_desc_by_pk> {
  Options$Query$get_restaurant_desc_by_pk({
    String? operationName,
    required Variables$Query$get_restaurant_desc_by_pk variables,
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
          document: documentNodeQueryget_restaurant_desc_by_pk,
          parserFn: _parserFn$Query$get_restaurant_desc_by_pk,
        );
}

class WatchOptions$Query$get_restaurant_desc_by_pk
    extends graphql.WatchQueryOptions<Query$get_restaurant_desc_by_pk> {
  WatchOptions$Query$get_restaurant_desc_by_pk({
    String? operationName,
    required Variables$Query$get_restaurant_desc_by_pk variables,
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
          document: documentNodeQueryget_restaurant_desc_by_pk,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_desc_by_pk,
        );
}

class FetchMoreOptions$Query$get_restaurant_desc_by_pk
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_desc_by_pk({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_desc_by_pk variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_desc_by_pk,
        );
}

extension ClientExtension$Query$get_restaurant_desc_by_pk
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_desc_by_pk>>
      query$get_restaurant_desc_by_pk(
              Options$Query$get_restaurant_desc_by_pk options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_desc_by_pk>
      watchQuery$get_restaurant_desc_by_pk(
              WatchOptions$Query$get_restaurant_desc_by_pk options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_desc_by_pk({
    required Query$get_restaurant_desc_by_pk data,
    required Variables$Query$get_restaurant_desc_by_pk variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_desc_by_pk),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_desc_by_pk? readQuery$get_restaurant_desc_by_pk({
    required Variables$Query$get_restaurant_desc_by_pk variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_desc_by_pk),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_desc_by_pk.fromJson(result);
  }
}

class Query$get_restaurant_desc_by_pk$translation_by_pk {
  Query$get_restaurant_desc_by_pk$translation_by_pk({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk$translation_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk$translation_by_pk(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_desc_by_pk$translation_by_pk$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_desc_by_pk$translation_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk$translation_by_pk
    on Query$get_restaurant_desc_by_pk$translation_by_pk {
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<
          Query$get_restaurant_desc_by_pk$translation_by_pk>
      get copyWith =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<
    TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
    Query$get_restaurant_desc_by_pk$translation_by_pk instance,
    TRes Function(Query$get_restaurant_desc_by_pk$translation_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk;

  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk;

  TRes call({
    int? id,
    List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_restaurant_desc_by_pk$translation_by_pk$translations> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
                      Query$get_restaurant_desc_by_pk$translation_by_pk$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk$translation_by_pk _instance;

  final TRes Function(Query$get_restaurant_desc_by_pk$translation_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk$translation_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_restaurant_desc_by_pk$translation_by_pk$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_restaurant_desc_by_pk$translation_by_pk$translations> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
                          Query$get_restaurant_desc_by_pk$translation_by_pk$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_restaurant_desc_by_pk$translation_by_pk$translations {
  Query$get_restaurant_desc_by_pk$translation_by_pk$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk$translation_by_pk$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
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
            is Query$get_restaurant_desc_by_pk$translation_by_pk$translations) ||
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk$translation_by_pk$translations
    on Query$get_restaurant_desc_by_pk$translation_by_pk$translations {
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
          Query$get_restaurant_desc_by_pk$translation_by_pk$translations>
      get copyWith =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
    TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
    Query$get_restaurant_desc_by_pk$translation_by_pk$translations instance,
    TRes Function(
            Query$get_restaurant_desc_by_pk$translation_by_pk$translations)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations;

  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk$translation_by_pk$translations
      _instance;

  final TRes Function(
      Query$get_restaurant_desc_by_pk$translation_by_pk$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
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

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
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
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getOneRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getOneRestaurant$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOneRestaurant$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
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
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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
    Query$getOneRestaurant$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
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
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getOneRestaurant$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant<TRes>
    implements CopyWith$Query$getOneRestaurant<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant(this._res);

  TRes _res;

  call({
    Query$getOneRestaurant$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk.stub(
              _res);
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'delivery_details_of_deliverer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'delivery_details_id'),
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
                name: NameNode(value: 'location_id'),
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
                name: NameNode(value: 'language'),
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
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'stripe_id'),
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
                    name: NameNode(value: 'requirements'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'payouts_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'details_submitted'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charges_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charge_fees_on_customer'),
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

class Query$getOneRestaurant$restaurant_restaurant_by_pk {
  Query$getOneRestaurant$restaurant_restaurant_by_pk({
    required this.id,
    this.delivery_details_of_deliverer,
    required this.delivery_details_id,
    this.details,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details_of_deliverer =
        json['delivery_details_of_deliverer'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk(
      id: (l$id as int),
      delivery_details_of_deliverer: (l$delivery_details_of_deliverer
              as List<dynamic>?)
          ?.map((e) =>
              Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      delivery_details_id: (l$delivery_details_id as int),
      details: l$details == null
          ? null
          : Query$getOneRestaurant$restaurant_restaurant_by_pk$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
      delivery_details_of_deliverer;

  final int delivery_details_id;

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    _resultData['delivery_details_of_deliverer'] =
        l$delivery_details_of_deliverer?.map((e) => e.toJson()).toList();
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final l$delivery_details_id = delivery_details_id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details_of_deliverer == null
          ? null
          : Object.hashAll(l$delivery_details_of_deliverer.map((v) => v)),
      l$delivery_details_id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOneRestaurant$restaurant_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final lOther$delivery_details_of_deliverer =
        other.delivery_details_of_deliverer;
    if (l$delivery_details_of_deliverer != null &&
        lOther$delivery_details_of_deliverer != null) {
      if (l$delivery_details_of_deliverer.length !=
          lOther$delivery_details_of_deliverer.length) {
        return false;
      }
      for (int i = 0; i < l$delivery_details_of_deliverer.length; i++) {
        final l$delivery_details_of_deliverer$entry =
            l$delivery_details_of_deliverer[i];
        final lOther$delivery_details_of_deliverer$entry =
            lOther$delivery_details_of_deliverer[i];
        if (l$delivery_details_of_deliverer$entry !=
            lOther$delivery_details_of_deliverer$entry) {
          return false;
        }
      }
    } else if (l$delivery_details_of_deliverer !=
        lOther$delivery_details_of_deliverer) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk
    on Query$getOneRestaurant$restaurant_restaurant_by_pk {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<
          Query$getOneRestaurant$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk(
    Query$getOneRestaurant$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getOneRestaurant$restaurant_restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk;

  TRes call({
    int? id,
    List<Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    int? delivery_details_id,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  TRes delivery_details_of_deliverer(
      Iterable<Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>? Function(
              Iterable<
                  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
                      Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>>?)
          _fn);
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getOneRestaurant$restaurant_restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details_of_deliverer = _undefined,
    Object? delivery_details_id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details_of_deliverer: delivery_details_of_deliverer ==
                _undefined
            ? _instance.delivery_details_of_deliverer
            : (delivery_details_of_deliverer as List<
                Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getOneRestaurant$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details_of_deliverer(
          Iterable<Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>? Function(
                  Iterable<
                      CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
                          Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>>?)
              _fn) =>
      call(
          delivery_details_of_deliverer: _fn(
              _instance.delivery_details_of_deliverer?.map((e) =>
                  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    int? delivery_details_id,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  delivery_details_of_deliverer(_fn) => _res;
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.radius,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$radius = json['radius'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      radius: (l$radius as int),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int radius;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$minimum_cost = minimum_cost;
    final l$radius = radius;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
      l$radius,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer
        instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer
      _instance;

  final TRes Function(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? radius = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$delivery_details_of_deliverer(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$details {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$details({
    required this.id,
    this.firebase_id,
    required this.location_id,
    required this.image,
    required this.language,
    this.description_id,
    required this.location,
    required this.accepted_payments,
    this.stripe_info,
    required this.name,
    this.description,
    required this.approved,
    this.schedule,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$location_id = json['location_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$description_id = json['description_id'];
    final l$location = json['location'];
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$schedule = json['schedule'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      location_id: (l$location_id as int),
      image: (l$image as String),
      language: mapFromJson(l$language),
      description_id: (l$description_id as int?),
      location:
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      accepted_payments: mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null
          ? null
          : Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      name: (l$name as String),
      description: l$description == null
          ? null
          : Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final int location_id;

  final String image;

  final dynamic language;

  final int? description_id;

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
      location;

  final dynamic accepted_payments;

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info?
      stripe_info;

  final String name;

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description?
      description;

  final bool approved;

  final dynamic? schedule;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
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
    final l$firebase_id = firebase_id;
    final l$location_id = location_id;
    final l$image = image;
    final l$language = language;
    final l$description_id = description_id;
    final l$location = location;
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
      l$firebase_id,
      l$location_id,
      l$image,
      l$language,
      l$description_id,
      l$location,
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
    if (!(other
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$details) ||
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
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$details
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details instance,
    TRes Function(Query$getOneRestaurant$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    String? firebase_id,
    int? location_id,
    String? image,
    dynamic? language,
    int? description_id,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location?
        location,
    dynamic? accepted_payments,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    String? name,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description?
        description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
      TRes> get location;
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info;
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
      TRes> get description;
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details _instance;

  final TRes Function(
      Query$getOneRestaurant$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? location_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? description_id = _undefined,
    Object? location = _undefined,
    Object? accepted_payments = _undefined,
    Object? stripe_info = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? schedule = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description?),
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
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
            .stub(_then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }

  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    int? location_id,
    String? image,
    dynamic? language,
    int? description_id,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location?
        location,
    dynamic? accepted_payments,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    String? name,
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description?
        description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
          TRes>
      get location =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
              .stub(_res);
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
              .stub(_res);
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
          TRes>
      get description =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
              .stub(_res);
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
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
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
        instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location
      _instance;

  final TRes Function(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
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

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info({
    required this.id,
    required this.stripe_id,
    required this.status,
    this.requirements,
    required this.payouts_enabled,
    this.email,
    required this.details_submitted,
    required this.charges_enabled,
    this.charge_fees_on_customer,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_id = json['stripe_id'];
    final l$status = json['status'];
    final l$requirements = json['requirements'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$email = json['email'];
    final l$details_submitted = json['details_submitted'];
    final l$charges_enabled = json['charges_enabled'];
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
      id: (l$id as int),
      stripe_id: (l$stripe_id as String),
      status: (l$status as String),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      payouts_enabled: (l$payouts_enabled as bool),
      email: (l$email as String?),
      details_submitted: (l$details_submitted as bool),
      charges_enabled: (l$charges_enabled as bool),
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String stripe_id;

  final String status;

  final dynamic? requirements;

  final bool payouts_enabled;

  final String? email;

  final bool details_submitted;

  final bool charges_enabled;

  final bool? charge_fees_on_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_id = stripe_id;
    final l$status = status;
    final l$requirements = requirements;
    final l$payouts_enabled = payouts_enabled;
    final l$email = email;
    final l$details_submitted = details_submitted;
    final l$charges_enabled = charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_id,
      l$status,
      l$requirements,
      l$payouts_enabled,
      l$email,
      l$details_submitted,
      l$charges_enabled,
      l$charge_fees_on_customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
        instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info;

  TRes call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info
      _instance;

  final TRes Function(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_id = _undefined,
    Object? status = _undefined,
    Object? requirements = _undefined,
    Object? payouts_enabled = _undefined,
    Object? email = _undefined,
    Object? details_submitted = _undefined,
    Object? charges_enabled = _undefined,
    Object? charge_fees_on_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$stripe_info(
      this._res);

  TRes _res;

  call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>
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
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
        instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description;

  TRes call({
    List<Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
                      Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description
      _instance;

  final TRes Function(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
                          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations {
  Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
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
            is Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations
    on Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations {
  CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
    Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations
        instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations;

  factory CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_restaurant_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantStatus {
  factory Variables$Query$getRestaurantStatus({required int id}) =>
      Variables$Query$getRestaurantStatus._({
        r'id': id,
      });

  Variables$Query$getRestaurantStatus._(this._$data);

  factory Variables$Query$getRestaurantStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantStatus<
          Variables$Query$getRestaurantStatus>
      get copyWith => CopyWith$Variables$Query$getRestaurantStatus(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantStatus) ||
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

abstract class CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  factory CopyWith$Variables$Query$getRestaurantStatus(
    Variables$Query$getRestaurantStatus instance,
    TRes Function(Variables$Query$getRestaurantStatus) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantStatus;

  factory CopyWith$Variables$Query$getRestaurantStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantStatus;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantStatus<TRes>
    implements CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantStatus(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantStatus _instance;

  final TRes Function(Variables$Query$getRestaurantStatus) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantStatus._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantStatus<TRes>
    implements CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantStatus(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantStatus {
  Query$getRestaurantStatus({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantStatus.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantStatus(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantStatus$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantStatus$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantStatus
    on Query$getRestaurantStatus {
  CopyWith$Query$getRestaurantStatus<Query$getRestaurantStatus> get copyWith =>
      CopyWith$Query$getRestaurantStatus(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantStatus<TRes> {
  factory CopyWith$Query$getRestaurantStatus(
    Query$getRestaurantStatus instance,
    TRes Function(Query$getRestaurantStatus) then,
  ) = _CopyWithImpl$Query$getRestaurantStatus;

  factory CopyWith$Query$getRestaurantStatus.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantStatus;

  TRes call({
    Query$getRestaurantStatus$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantStatus<TRes>
    implements CopyWith$Query$getRestaurantStatus<TRes> {
  _CopyWithImpl$Query$getRestaurantStatus(
    this._instance,
    this._then,
  );

  final Query$getRestaurantStatus _instance;

  final TRes Function(Query$getRestaurantStatus) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantStatus(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantStatus$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantStatus<TRes>
    implements CopyWith$Query$getRestaurantStatus<TRes> {
  _CopyWithStubImpl$Query$getRestaurantStatus(this._res);

  TRes _res;

  call({
    Query$getRestaurantStatus$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk.stub(
              _res);
}

const documentNodeQuerygetRestaurantStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantStatus'),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'details'),
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
Query$getRestaurantStatus _parserFn$Query$getRestaurantStatus(
        Map<String, dynamic> data) =>
    Query$getRestaurantStatus.fromJson(data);

class Options$Query$getRestaurantStatus
    extends graphql.QueryOptions<Query$getRestaurantStatus> {
  Options$Query$getRestaurantStatus({
    String? operationName,
    required Variables$Query$getRestaurantStatus variables,
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
          document: documentNodeQuerygetRestaurantStatus,
          parserFn: _parserFn$Query$getRestaurantStatus,
        );
}

class WatchOptions$Query$getRestaurantStatus
    extends graphql.WatchQueryOptions<Query$getRestaurantStatus> {
  WatchOptions$Query$getRestaurantStatus({
    String? operationName,
    required Variables$Query$getRestaurantStatus variables,
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
          document: documentNodeQuerygetRestaurantStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantStatus,
        );
}

class FetchMoreOptions$Query$getRestaurantStatus
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantStatus({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantStatus variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantStatus,
        );
}

extension ClientExtension$Query$getRestaurantStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantStatus>>
      query$getRestaurantStatus(
              Options$Query$getRestaurantStatus options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantStatus>
      watchQuery$getRestaurantStatus(
              WatchOptions$Query$getRestaurantStatus options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantStatus({
    required Query$getRestaurantStatus data,
    required Variables$Query$getRestaurantStatus variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantStatus),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantStatus? readQuery$getRestaurantStatus({
    required Variables$Query$getRestaurantStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantStatus.fromJson(result);
  }
}

class Query$getRestaurantStatus$restaurant_restaurant_by_pk {
  Query$getRestaurantStatus$restaurant_restaurant_by_pk({
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurantStatus$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantStatus$restaurant_restaurant_by_pk(
      details: l$details == null
          ? null
          : Query$getRestaurantStatus$restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantStatus$restaurant_restaurant_by_pk$details? details;

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
    if (!(other is Query$getRestaurantStatus$restaurant_restaurant_by_pk) ||
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

extension UtilityExtension$Query$getRestaurantStatus$restaurant_restaurant_by_pk
    on Query$getRestaurantStatus$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<
          Query$getRestaurantStatus$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk(
    Query$getRestaurantStatus$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantStatus$restaurant_restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk;

  TRes call({
    Query$getRestaurantStatus$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes>
    implements
        CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantStatus$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantStatus$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantStatus$restaurant_restaurant_by_pk(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantStatus$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$getRestaurantStatus$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getRestaurantStatus$restaurant_restaurant_by_pk$details {
  Query$getRestaurantStatus$restaurant_restaurant_by_pk$details({
    required this.id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getRestaurantStatus$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRestaurantStatus$restaurant_restaurant_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details
    on Query$getRestaurantStatus$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
          Query$getRestaurantStatus$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
    Query$getRestaurantStatus$restaurant_restaurant_by_pk$details instance,
    TRes Function(Query$getRestaurantStatus$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantStatus$restaurant_restaurant_by_pk$details _instance;

  final TRes Function(
      Query$getRestaurantStatus$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantSchedule {
  factory Variables$Query$getRestaurantSchedule({required int id}) =>
      Variables$Query$getRestaurantSchedule._({
        r'id': id,
      });

  Variables$Query$getRestaurantSchedule._(this._$data);

  factory Variables$Query$getRestaurantSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantSchedule<
          Variables$Query$getRestaurantSchedule>
      get copyWith => CopyWith$Variables$Query$getRestaurantSchedule(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantSchedule) ||
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

abstract class CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  factory CopyWith$Variables$Query$getRestaurantSchedule(
    Variables$Query$getRestaurantSchedule instance,
    TRes Function(Variables$Query$getRestaurantSchedule) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantSchedule;

  factory CopyWith$Variables$Query$getRestaurantSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantSchedule;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantSchedule(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantSchedule _instance;

  final TRes Function(Variables$Query$getRestaurantSchedule) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantSchedule._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantSchedule(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantSchedule {
  Query$getRestaurantSchedule({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantSchedule.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantSchedule(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantSchedule$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantSchedule$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantSchedule
    on Query$getRestaurantSchedule {
  CopyWith$Query$getRestaurantSchedule<Query$getRestaurantSchedule>
      get copyWith => CopyWith$Query$getRestaurantSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantSchedule<TRes> {
  factory CopyWith$Query$getRestaurantSchedule(
    Query$getRestaurantSchedule instance,
    TRes Function(Query$getRestaurantSchedule) then,
  ) = _CopyWithImpl$Query$getRestaurantSchedule;

  factory CopyWith$Query$getRestaurantSchedule.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantSchedule;

  TRes call({
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Query$getRestaurantSchedule<TRes> {
  _CopyWithImpl$Query$getRestaurantSchedule(
    this._instance,
    this._then,
  );

  final Query$getRestaurantSchedule _instance;

  final TRes Function(Query$getRestaurantSchedule) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantSchedule(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantSchedule$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Query$getRestaurantSchedule<TRes> {
  _CopyWithStubImpl$Query$getRestaurantSchedule(this._res);

  TRes _res;

  call({
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk.stub(
              _res);
}

const documentNodeQuerygetRestaurantSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantSchedule'),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'details'),
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
Query$getRestaurantSchedule _parserFn$Query$getRestaurantSchedule(
        Map<String, dynamic> data) =>
    Query$getRestaurantSchedule.fromJson(data);

class Options$Query$getRestaurantSchedule
    extends graphql.QueryOptions<Query$getRestaurantSchedule> {
  Options$Query$getRestaurantSchedule({
    String? operationName,
    required Variables$Query$getRestaurantSchedule variables,
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
          document: documentNodeQuerygetRestaurantSchedule,
          parserFn: _parserFn$Query$getRestaurantSchedule,
        );
}

class WatchOptions$Query$getRestaurantSchedule
    extends graphql.WatchQueryOptions<Query$getRestaurantSchedule> {
  WatchOptions$Query$getRestaurantSchedule({
    String? operationName,
    required Variables$Query$getRestaurantSchedule variables,
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
          document: documentNodeQuerygetRestaurantSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantSchedule,
        );
}

class FetchMoreOptions$Query$getRestaurantSchedule
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantSchedule({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantSchedule variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantSchedule,
        );
}

extension ClientExtension$Query$getRestaurantSchedule on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantSchedule>>
      query$getRestaurantSchedule(
              Options$Query$getRestaurantSchedule options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantSchedule>
      watchQuery$getRestaurantSchedule(
              WatchOptions$Query$getRestaurantSchedule options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantSchedule({
    required Query$getRestaurantSchedule data,
    required Variables$Query$getRestaurantSchedule variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantSchedule),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantSchedule? readQuery$getRestaurantSchedule({
    required Variables$Query$getRestaurantSchedule variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantSchedule),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantSchedule.fromJson(result);
  }
}

class Query$getRestaurantSchedule$restaurant_restaurant_by_pk {
  Query$getRestaurantSchedule$restaurant_restaurant_by_pk({
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurantSchedule$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
      details: l$details == null
          ? null
          : Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details?
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
    if (!(other is Query$getRestaurantSchedule$restaurant_restaurant_by_pk) ||
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

extension UtilityExtension$Query$getRestaurantSchedule$restaurant_restaurant_by_pk
    on Query$getRestaurantSchedule$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<
          Query$getRestaurantSchedule$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantSchedule$restaurant_restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk;

  TRes call({
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantSchedule$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantSchedule$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details {
  Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details({
    required this.id,
    this.schedule,
    required this.$__typename,
  });

  factory Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$schedule = json['schedule'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic? schedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$schedule = schedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$schedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
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

extension UtilityExtension$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details
    on Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
          Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
    Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details instance,
    TRes Function(
            Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    dynamic? schedule,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details
      _instance;

  final TRes Function(
      Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? schedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? schedule,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantAprroved {
  factory Variables$Query$getRestaurantAprroved({required int id}) =>
      Variables$Query$getRestaurantAprroved._({
        r'id': id,
      });

  Variables$Query$getRestaurantAprroved._(this._$data);

  factory Variables$Query$getRestaurantAprroved.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantAprroved._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantAprroved<
          Variables$Query$getRestaurantAprroved>
      get copyWith => CopyWith$Variables$Query$getRestaurantAprroved(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantAprroved) ||
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

abstract class CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  factory CopyWith$Variables$Query$getRestaurantAprroved(
    Variables$Query$getRestaurantAprroved instance,
    TRes Function(Variables$Query$getRestaurantAprroved) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantAprroved;

  factory CopyWith$Variables$Query$getRestaurantAprroved.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantAprroved;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantAprroved(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantAprroved _instance;

  final TRes Function(Variables$Query$getRestaurantAprroved) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantAprroved._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantAprroved(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantAprroved {
  Query$getRestaurantAprroved({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantAprroved.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantAprroved(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantAprroved$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantAprroved$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantAprroved) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantAprroved
    on Query$getRestaurantAprroved {
  CopyWith$Query$getRestaurantAprroved<Query$getRestaurantAprroved>
      get copyWith => CopyWith$Query$getRestaurantAprroved(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantAprroved<TRes> {
  factory CopyWith$Query$getRestaurantAprroved(
    Query$getRestaurantAprroved instance,
    TRes Function(Query$getRestaurantAprroved) then,
  ) = _CopyWithImpl$Query$getRestaurantAprroved;

  factory CopyWith$Query$getRestaurantAprroved.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantAprroved;

  TRes call({
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Query$getRestaurantAprroved<TRes> {
  _CopyWithImpl$Query$getRestaurantAprroved(
    this._instance,
    this._then,
  );

  final Query$getRestaurantAprroved _instance;

  final TRes Function(Query$getRestaurantAprroved) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantAprroved(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantAprroved$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Query$getRestaurantAprroved<TRes> {
  _CopyWithStubImpl$Query$getRestaurantAprroved(this._res);

  TRes _res;

  call({
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk.stub(
              _res);
}

const documentNodeQuerygetRestaurantAprroved = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantAprroved'),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'approved'),
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
Query$getRestaurantAprroved _parserFn$Query$getRestaurantAprroved(
        Map<String, dynamic> data) =>
    Query$getRestaurantAprroved.fromJson(data);

class Options$Query$getRestaurantAprroved
    extends graphql.QueryOptions<Query$getRestaurantAprroved> {
  Options$Query$getRestaurantAprroved({
    String? operationName,
    required Variables$Query$getRestaurantAprroved variables,
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
          document: documentNodeQuerygetRestaurantAprroved,
          parserFn: _parserFn$Query$getRestaurantAprroved,
        );
}

class WatchOptions$Query$getRestaurantAprroved
    extends graphql.WatchQueryOptions<Query$getRestaurantAprroved> {
  WatchOptions$Query$getRestaurantAprroved({
    String? operationName,
    required Variables$Query$getRestaurantAprroved variables,
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
          document: documentNodeQuerygetRestaurantAprroved,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantAprroved,
        );
}

class FetchMoreOptions$Query$getRestaurantAprroved
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantAprroved({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantAprroved variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantAprroved,
        );
}

extension ClientExtension$Query$getRestaurantAprroved on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantAprroved>>
      query$getRestaurantAprroved(
              Options$Query$getRestaurantAprroved options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantAprroved>
      watchQuery$getRestaurantAprroved(
              WatchOptions$Query$getRestaurantAprroved options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantAprroved({
    required Query$getRestaurantAprroved data,
    required Variables$Query$getRestaurantAprroved variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantAprroved),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantAprroved? readQuery$getRestaurantAprroved({
    required Variables$Query$getRestaurantAprroved variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantAprroved),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantAprroved.fromJson(result);
  }
}

class Query$getRestaurantAprroved$restaurant_restaurant_by_pk {
  Query$getRestaurantAprroved$restaurant_restaurant_by_pk({
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurantAprroved$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
      details: l$details == null
          ? null
          : Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details?
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
    if (!(other is Query$getRestaurantAprroved$restaurant_restaurant_by_pk) ||
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

extension UtilityExtension$Query$getRestaurantAprroved$restaurant_restaurant_by_pk
    on Query$getRestaurantAprroved$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<
          Query$getRestaurantAprroved$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantAprroved$restaurant_restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk;

  TRes call({
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantAprroved$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantAprroved$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details {
  Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details({
    required this.id,
    required this.approved,
    required this.$__typename,
  });

  factory Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$approved = json['approved'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      approved: (l$approved as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool approved;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$approved = approved;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$approved,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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

extension UtilityExtension$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details
    on Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
          Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
    Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details instance,
    TRes Function(
            Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    bool? approved,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details
      _instance;

  final TRes Function(
      Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? approved = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? approved,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantPaymentInfo {
  factory Variables$Query$getRestaurantPaymentInfo({required int id}) =>
      Variables$Query$getRestaurantPaymentInfo._({
        r'id': id,
      });

  Variables$Query$getRestaurantPaymentInfo._(this._$data);

  factory Variables$Query$getRestaurantPaymentInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantPaymentInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantPaymentInfo<
          Variables$Query$getRestaurantPaymentInfo>
      get copyWith => CopyWith$Variables$Query$getRestaurantPaymentInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantPaymentInfo) ||
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

abstract class CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  factory CopyWith$Variables$Query$getRestaurantPaymentInfo(
    Variables$Query$getRestaurantPaymentInfo instance,
    TRes Function(Variables$Query$getRestaurantPaymentInfo) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo;

  factory CopyWith$Variables$Query$getRestaurantPaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantPaymentInfo _instance;

  final TRes Function(Variables$Query$getRestaurantPaymentInfo) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantPaymentInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantPaymentInfo {
  Query$getRestaurantPaymentInfo({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantPaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantPaymentInfo
    on Query$getRestaurantPaymentInfo {
  CopyWith$Query$getRestaurantPaymentInfo<Query$getRestaurantPaymentInfo>
      get copyWith => CopyWith$Query$getRestaurantPaymentInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo(
    Query$getRestaurantPaymentInfo instance,
    TRes Function(Query$getRestaurantPaymentInfo) then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo;

  factory CopyWith$Query$getRestaurantPaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo;

  TRes call({
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo _instance;

  final TRes Function(Query$getRestaurantPaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantPaymentInfo(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo(this._res);

  TRes _res;

  call({
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk
              .stub(_res);
}

const documentNodeQuerygetRestaurantPaymentInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantPaymentInfo'),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'stripe_info'),
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
                    name: NameNode(value: 'stripe_id'),
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
                    name: NameNode(value: 'requirements'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'payouts_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'details_submitted'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charges_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charge_fees_on_customer'),
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
Query$getRestaurantPaymentInfo _parserFn$Query$getRestaurantPaymentInfo(
        Map<String, dynamic> data) =>
    Query$getRestaurantPaymentInfo.fromJson(data);

class Options$Query$getRestaurantPaymentInfo
    extends graphql.QueryOptions<Query$getRestaurantPaymentInfo> {
  Options$Query$getRestaurantPaymentInfo({
    String? operationName,
    required Variables$Query$getRestaurantPaymentInfo variables,
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
          document: documentNodeQuerygetRestaurantPaymentInfo,
          parserFn: _parserFn$Query$getRestaurantPaymentInfo,
        );
}

class WatchOptions$Query$getRestaurantPaymentInfo
    extends graphql.WatchQueryOptions<Query$getRestaurantPaymentInfo> {
  WatchOptions$Query$getRestaurantPaymentInfo({
    String? operationName,
    required Variables$Query$getRestaurantPaymentInfo variables,
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
          document: documentNodeQuerygetRestaurantPaymentInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantPaymentInfo,
        );
}

class FetchMoreOptions$Query$getRestaurantPaymentInfo
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantPaymentInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantPaymentInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantPaymentInfo,
        );
}

extension ClientExtension$Query$getRestaurantPaymentInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantPaymentInfo>>
      query$getRestaurantPaymentInfo(
              Options$Query$getRestaurantPaymentInfo options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantPaymentInfo>
      watchQuery$getRestaurantPaymentInfo(
              WatchOptions$Query$getRestaurantPaymentInfo options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantPaymentInfo({
    required Query$getRestaurantPaymentInfo data,
    required Variables$Query$getRestaurantPaymentInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantPaymentInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantPaymentInfo? readQuery$getRestaurantPaymentInfo({
    required Variables$Query$getRestaurantPaymentInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantPaymentInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantPaymentInfo.fromJson(result);
  }
}

class Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk {
  Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk({
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
      details: l$details == null
          ? null
          : Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details?
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
            is Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk) ||
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

extension UtilityExtension$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk
    on Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
          Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk;

  TRes call({
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk _instance;

  final TRes Function(
      Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
          TRes>
      get details =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details {
  Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details({
    required this.id,
    this.stripe_info,
    required this.accepted_payments,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_info = json['stripe_info'];
    final l$accepted_payments = json['accepted_payments'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      stripe_info: l$stripe_info == null
          ? null
          : Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      accepted_payments: mapFromJson(l$accepted_payments),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info?
      stripe_info;

  final dynamic accepted_payments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_info = stripe_info;
    final l$accepted_payments = accepted_payments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_info,
      l$accepted_payments,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details
    on Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
          Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details instance,
    TRes Function(
            Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    dynamic? accepted_payments,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info;
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details
      _instance;

  final TRes Function(
      Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_info = _undefined,
    Object? accepted_payments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info?),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    dynamic? accepted_payments,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
              .stub(_res);
}

class Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info {
  Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info({
    required this.id,
    required this.stripe_id,
    required this.status,
    this.requirements,
    required this.payouts_enabled,
    this.email,
    required this.details_submitted,
    required this.charges_enabled,
    this.charge_fees_on_customer,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_id = json['stripe_id'];
    final l$status = json['status'];
    final l$requirements = json['requirements'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$email = json['email'];
    final l$details_submitted = json['details_submitted'];
    final l$charges_enabled = json['charges_enabled'];
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
      id: (l$id as int),
      stripe_id: (l$stripe_id as String),
      status: (l$status as String),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      payouts_enabled: (l$payouts_enabled as bool),
      email: (l$email as String?),
      details_submitted: (l$details_submitted as bool),
      charges_enabled: (l$charges_enabled as bool),
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String stripe_id;

  final String status;

  final dynamic? requirements;

  final bool payouts_enabled;

  final String? email;

  final bool details_submitted;

  final bool charges_enabled;

  final bool? charge_fees_on_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_id = stripe_id;
    final l$status = status;
    final l$requirements = requirements;
    final l$payouts_enabled = payouts_enabled;
    final l$email = email;
    final l$details_submitted = details_submitted;
    final l$charges_enabled = charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_id,
      l$status,
      l$requirements,
      l$payouts_enabled,
      l$email,
      l$details_submitted,
      l$charges_enabled,
      l$charge_fees_on_customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
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

extension UtilityExtension$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
    on Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info {
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
          Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info>
      get copyWith =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
    TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
    Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
        instance,
    TRes Function(
            Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info)
        then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info;

  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info;

  TRes call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info
      _instance;

  final TRes Function(
          Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_id = _undefined,
    Object? status = _undefined,
    Object? requirements = _undefined,
    Object? payouts_enabled = _undefined,
    Object? email = _undefined,
    Object? details_submitted = _undefined,
    Object? charges_enabled = _undefined,
    Object? charge_fees_on_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk$details$stripe_info(
      this._res);

  TRes _res;

  call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$switchRestaurantAvailability {
  factory Variables$Mutation$switchRestaurantAvailability({
    required int restauarntId,
    String? value,
  }) =>
      Variables$Mutation$switchRestaurantAvailability._({
        r'restauarntId': restauarntId,
        if (value != null) r'value': value,
      });

  Variables$Mutation$switchRestaurantAvailability._(this._$data);

  factory Variables$Mutation$switchRestaurantAvailability.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restauarntId = data['restauarntId'];
    result$data['restauarntId'] = (l$restauarntId as int);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Variables$Mutation$switchRestaurantAvailability._(result$data);
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

  CopyWith$Variables$Mutation$switchRestaurantAvailability<
          Variables$Mutation$switchRestaurantAvailability>
      get copyWith => CopyWith$Variables$Mutation$switchRestaurantAvailability(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$switchRestaurantAvailability) ||
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

abstract class CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  factory CopyWith$Variables$Mutation$switchRestaurantAvailability(
    Variables$Mutation$switchRestaurantAvailability instance,
    TRes Function(Variables$Mutation$switchRestaurantAvailability) then,
  ) = _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability;

  factory CopyWith$Variables$Mutation$switchRestaurantAvailability.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability;

  TRes call({
    int? restauarntId,
    String? value,
  });
}

class _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability(
    this._instance,
    this._then,
  );

  final Variables$Mutation$switchRestaurantAvailability _instance;

  final TRes Function(Variables$Mutation$switchRestaurantAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? restauarntId = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Variables$Mutation$switchRestaurantAvailability._({
        ..._instance._$data,
        if (restauarntId != _undefined && restauarntId != null)
          'restauarntId': (restauarntId as int),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability(this._res);

  TRes _res;

  call({
    int? restauarntId,
    String? value,
  }) =>
      _res;
}

class Mutation$switchRestaurantAvailability {
  Mutation$switchRestaurantAvailability({
    this.update_service_provider_details_by_pk,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantAvailability.fromJson(
      Map<String, dynamic> json) {
    final l$update_service_provider_details_by_pk =
        json['update_service_provider_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantAvailability(
      update_service_provider_details_by_pk:
          l$update_service_provider_details_by_pk == null
              ? null
              : Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
                  .fromJson((l$update_service_provider_details_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk?
      update_service_provider_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    _resultData['update_service_provider_details_by_pk'] =
        l$update_service_provider_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$switchRestaurantAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_details_by_pk =
        update_service_provider_details_by_pk;
    final lOther$update_service_provider_details_by_pk =
        other.update_service_provider_details_by_pk;
    if (l$update_service_provider_details_by_pk !=
        lOther$update_service_provider_details_by_pk) {
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

extension UtilityExtension$Mutation$switchRestaurantAvailability
    on Mutation$switchRestaurantAvailability {
  CopyWith$Mutation$switchRestaurantAvailability<
          Mutation$switchRestaurantAvailability>
      get copyWith => CopyWith$Mutation$switchRestaurantAvailability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  factory CopyWith$Mutation$switchRestaurantAvailability(
    Mutation$switchRestaurantAvailability instance,
    TRes Function(Mutation$switchRestaurantAvailability) then,
  ) = _CopyWithImpl$Mutation$switchRestaurantAvailability;

  factory CopyWith$Mutation$switchRestaurantAvailability.stub(TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantAvailability;

  TRes call({
    Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk;
}

class _CopyWithImpl$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithImpl$Mutation$switchRestaurantAvailability(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantAvailability _instance;

  final TRes Function(Mutation$switchRestaurantAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchRestaurantAvailability(
        update_service_provider_details_by_pk:
            update_service_provider_details_by_pk == _undefined
                ? _instance.update_service_provider_details_by_pk
                : (update_service_provider_details_by_pk
                    as Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
      TRes> get update_service_provider_details_by_pk {
    final local$update_service_provider_details_by_pk =
        _instance.update_service_provider_details_by_pk;
    return local$update_service_provider_details_by_pk == null
        ? CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
            local$update_service_provider_details_by_pk,
            (e) => call(update_service_provider_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantAvailability(this._res);

  TRes _res;

  call({
    Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk?
        update_service_provider_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
          TRes>
      get update_service_provider_details_by_pk =>
          CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
              .stub(_res);
}

const documentNodeMutationswitchRestaurantAvailability =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'switchRestaurantAvailability'),
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
        name: NameNode(value: 'update_service_provider_details_by_pk'),
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
Mutation$switchRestaurantAvailability
    _parserFn$Mutation$switchRestaurantAvailability(
            Map<String, dynamic> data) =>
        Mutation$switchRestaurantAvailability.fromJson(data);
typedef OnMutationCompleted$Mutation$switchRestaurantAvailability
    = FutureOr<void> Function(
  dynamic,
  Mutation$switchRestaurantAvailability?,
);

class Options$Mutation$switchRestaurantAvailability
    extends graphql.MutationOptions<Mutation$switchRestaurantAvailability> {
  Options$Mutation$switchRestaurantAvailability({
    String? operationName,
    required Variables$Mutation$switchRestaurantAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$switchRestaurantAvailability? onCompleted,
    graphql.OnMutationUpdate<Mutation$switchRestaurantAvailability>? update,
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
                        : _parserFn$Mutation$switchRestaurantAvailability(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationswitchRestaurantAvailability,
          parserFn: _parserFn$Mutation$switchRestaurantAvailability,
        );

  final OnMutationCompleted$Mutation$switchRestaurantAvailability?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$switchRestaurantAvailability
    extends graphql.WatchQueryOptions<Mutation$switchRestaurantAvailability> {
  WatchOptions$Mutation$switchRestaurantAvailability({
    String? operationName,
    required Variables$Mutation$switchRestaurantAvailability variables,
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
          document: documentNodeMutationswitchRestaurantAvailability,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$switchRestaurantAvailability,
        );
}

extension ClientExtension$Mutation$switchRestaurantAvailability
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$switchRestaurantAvailability>>
      mutate$switchRestaurantAvailability(
              Options$Mutation$switchRestaurantAvailability options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$switchRestaurantAvailability>
      watchMutation$switchRestaurantAvailability(
              WatchOptions$Mutation$switchRestaurantAvailability options) =>
          this.watchMutation(options);
}

class Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk {
  Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk({
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
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
            is Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk) ||
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

extension UtilityExtension$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
    on Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk {
  CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
          Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk>
      get copyWith =>
          CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
    TRes> {
  factory CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
    Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
        instance,
    TRes Function(
            Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk;

  factory CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk
      _instance;

  final TRes Function(
          Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_service_provider_details_by_pk(
      this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateRestaurantInfo {
  factory Variables$Mutation$updateRestaurantInfo({
    required int id,
    required Input$restaurant_restaurant_set_input data,
  }) =>
      Variables$Mutation$updateRestaurantInfo._({
        r'id': id,
        r'data': data,
      });

  Variables$Mutation$updateRestaurantInfo._(this._$data);

  factory Variables$Mutation$updateRestaurantInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$data = data['data'];
    result$data['data'] = Input$restaurant_restaurant_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateRestaurantInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$restaurant_restaurant_set_input get data =>
      (_$data['data'] as Input$restaurant_restaurant_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateRestaurantInfo<
          Variables$Mutation$updateRestaurantInfo>
      get copyWith => CopyWith$Variables$Mutation$updateRestaurantInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateRestaurantInfo) ||
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

abstract class CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  factory CopyWith$Variables$Mutation$updateRestaurantInfo(
    Variables$Mutation$updateRestaurantInfo instance,
    TRes Function(Variables$Mutation$updateRestaurantInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$updateRestaurantInfo;

  factory CopyWith$Variables$Mutation$updateRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo;

  TRes call({
    int? id,
    Input$restaurant_restaurant_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$updateRestaurantInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateRestaurantInfo _instance;

  final TRes Function(Variables$Mutation$updateRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateRestaurantInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined && data != null)
          'data': (data as Input$restaurant_restaurant_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo(this._res);

  TRes _res;

  call({
    int? id,
    Input$restaurant_restaurant_set_input? data,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo {
  Mutation$updateRestaurantInfo({
    this.update_restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_restaurant_by_pk =
        json['update_restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo(
      update_restaurant_restaurant_by_pk:
          l$update_restaurant_restaurant_by_pk == null
              ? null
              : Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
                  .fromJson((l$update_restaurant_restaurant_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk?
      update_restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_restaurant_by_pk =
        update_restaurant_restaurant_by_pk;
    _resultData['update_restaurant_restaurant_by_pk'] =
        l$update_restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_restaurant_by_pk =
        update_restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateRestaurantInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_restaurant_by_pk =
        update_restaurant_restaurant_by_pk;
    final lOther$update_restaurant_restaurant_by_pk =
        other.update_restaurant_restaurant_by_pk;
    if (l$update_restaurant_restaurant_by_pk !=
        lOther$update_restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo
    on Mutation$updateRestaurantInfo {
  CopyWith$Mutation$updateRestaurantInfo<Mutation$updateRestaurantInfo>
      get copyWith => CopyWith$Mutation$updateRestaurantInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo<TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo(
    Mutation$updateRestaurantInfo instance,
    TRes Function(Mutation$updateRestaurantInfo) then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo;

  factory CopyWith$Mutation$updateRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo;

  TRes call({
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk?
        update_restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
      TRes> get update_restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo _instance;

  final TRes Function(Mutation$updateRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantInfo(
        update_restaurant_restaurant_by_pk: update_restaurant_restaurant_by_pk ==
                _undefined
            ? _instance.update_restaurant_restaurant_by_pk
            : (update_restaurant_restaurant_by_pk
                as Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
      TRes> get update_restaurant_restaurant_by_pk {
    final local$update_restaurant_restaurant_by_pk =
        _instance.update_restaurant_restaurant_by_pk;
    return local$update_restaurant_restaurant_by_pk == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
            local$update_restaurant_restaurant_by_pk,
            (e) => call(update_restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo(this._res);

  TRes _res;

  call({
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk?
        update_restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
          TRes>
      get update_restaurant_restaurant_by_pk =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
              .stub(_res);
}

const documentNodeMutationupdateRestaurantInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateRestaurantInfo'),
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
          name: NameNode(value: 'restaurant_restaurant_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'delivery_details_of_deliverer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'radius'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'location_id'),
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
                name: NameNode(value: 'language'),
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
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'stripe_id'),
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
                    name: NameNode(value: 'requirements'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'payouts_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'details_submitted'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charges_enabled'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'charge_fees_on_customer'),
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
Mutation$updateRestaurantInfo _parserFn$Mutation$updateRestaurantInfo(
        Map<String, dynamic> data) =>
    Mutation$updateRestaurantInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$updateRestaurantInfo = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateRestaurantInfo?,
);

class Options$Mutation$updateRestaurantInfo
    extends graphql.MutationOptions<Mutation$updateRestaurantInfo> {
  Options$Mutation$updateRestaurantInfo({
    String? operationName,
    required Variables$Mutation$updateRestaurantInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateRestaurantInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateRestaurantInfo>? update,
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
                        : _parserFn$Mutation$updateRestaurantInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateRestaurantInfo,
          parserFn: _parserFn$Mutation$updateRestaurantInfo,
        );

  final OnMutationCompleted$Mutation$updateRestaurantInfo?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateRestaurantInfo
    extends graphql.WatchQueryOptions<Mutation$updateRestaurantInfo> {
  WatchOptions$Mutation$updateRestaurantInfo({
    String? operationName,
    required Variables$Mutation$updateRestaurantInfo variables,
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
          document: documentNodeMutationupdateRestaurantInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateRestaurantInfo,
        );
}

extension ClientExtension$Mutation$updateRestaurantInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateRestaurantInfo>>
      mutate$updateRestaurantInfo(
              Options$Mutation$updateRestaurantInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateRestaurantInfo>
      watchMutation$updateRestaurantInfo(
              WatchOptions$Mutation$updateRestaurantInfo options) =>
          this.watchMutation(options);
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk({
    required this.id,
    this.delivery_details_of_deliverer,
    this.details,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details_of_deliverer =
        json['delivery_details_of_deliverer'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
      id: (l$id as int),
      delivery_details_of_deliverer: (l$delivery_details_of_deliverer
              as List<dynamic>?)
          ?.map((e) =>
              Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      details: l$details == null
          ? null
          : Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
      delivery_details_of_deliverer;

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    _resultData['delivery_details_of_deliverer'] =
        l$delivery_details_of_deliverer?.map((e) => e.toJson()).toList();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details_of_deliverer == null
          ? null
          : Object.hashAll(l$delivery_details_of_deliverer.map((v) => v)),
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
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details_of_deliverer = delivery_details_of_deliverer;
    final lOther$delivery_details_of_deliverer =
        other.delivery_details_of_deliverer;
    if (l$delivery_details_of_deliverer != null &&
        lOther$delivery_details_of_deliverer != null) {
      if (l$delivery_details_of_deliverer.length !=
          lOther$delivery_details_of_deliverer.length) {
        return false;
      }
      for (int i = 0; i < l$delivery_details_of_deliverer.length; i++) {
        final l$delivery_details_of_deliverer$entry =
            l$delivery_details_of_deliverer[i];
        final lOther$delivery_details_of_deliverer$entry =
            lOther$delivery_details_of_deliverer[i];
        if (l$delivery_details_of_deliverer$entry !=
            lOther$delivery_details_of_deliverer$entry) {
          return false;
        }
      }
    } else if (l$delivery_details_of_deliverer !=
        lOther$delivery_details_of_deliverer) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk;

  TRes call({
    int? id,
    List<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details?
        details,
    String? $__typename,
  });
  TRes delivery_details_of_deliverer(
      Iterable<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>? Function(
              Iterable<
                  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
                      Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>>?)
          _fn);
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
      TRes> get details;
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
      _instance;

  final TRes Function(
      Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details_of_deliverer = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details_of_deliverer: delivery_details_of_deliverer ==
                _undefined
            ? _instance.delivery_details_of_deliverer
            : (delivery_details_of_deliverer as List<
                Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>?),
        details: details == _undefined
            ? _instance.details
            : (details
                as Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details_of_deliverer(
          Iterable<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>? Function(
                  Iterable<
                      CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
                          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>>?)
              _fn) =>
      call(
          delivery_details_of_deliverer: _fn(
              _instance.delivery_details_of_deliverer?.map((e) =>
                  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>?
        delivery_details_of_deliverer,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details?
        details,
    String? $__typename,
  }) =>
      _res;
  delivery_details_of_deliverer(_fn) => _res;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
          TRes>
      get details =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.radius,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$radius = json['radius'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      radius: (l$radius as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int radius;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$minimum_cost = minimum_cost;
    final l$radius = radius;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
      l$radius,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? radius = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$delivery_details_of_deliverer(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? radius,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details({
    required this.id,
    this.firebase_id,
    required this.location_id,
    required this.image,
    required this.language,
    required this.location,
    required this.accepted_payments,
    this.stripe_info,
    required this.name,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$location_id = json['location_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$location = json['location'];
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$name = json['name'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      location_id: (l$location_id as int),
      image: (l$image as String),
      language: mapFromJson(l$language),
      location:
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      accepted_payments: mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null
          ? null
          : Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
              .fromJson((l$stripe_info as Map<String, dynamic>)),
      name: (l$name as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final int location_id;

  final String image;

  final dynamic language;

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
      location;

  final dynamic accepted_payments;

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info?
      stripe_info;

  final String name;

  final dynamic? schedule;

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description?
      description;

  final bool approved;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$location_id = location_id;
    _resultData['location_id'] = l$location_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] = l$stripe_info?.toJson();
    final l$name = name;
    _resultData['name'] = l$name;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
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
    final l$firebase_id = firebase_id;
    final l$location_id = location_id;
    final l$image = image;
    final l$language = language;
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
      l$firebase_id,
      l$location_id,
      l$image,
      l$language,
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
    if (!(other
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details) ||
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
    final l$location_id = location_id;
    final lOther$location_id = other.location_id;
    if (l$location_id != lOther$location_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    String? firebase_id,
    int? location_id,
    String? image,
    dynamic? language,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location?
        location,
    dynamic? accepted_payments,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    String? name,
    dynamic? schedule,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
      TRes> get location;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? location_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
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
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        location_id: location_id == _undefined || location_id == null
            ? _instance.location_id
            : (location_id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info
                as Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description?),
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
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
        local$location, (e) => call(location: e));
  }

  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
      TRes> get stripe_info {
    final local$stripe_info = _instance.stripe_info;
    return local$stripe_info == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
            local$stripe_info, (e) => call(stripe_info: e));
  }

  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    int? location_id,
    String? image,
    dynamic? language,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location?
        location,
    dynamic? accepted_payments,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info?
        stripe_info,
    String? name,
    dynamic? schedule,
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description?
        description,
    bool? approved,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
          TRes>
      get location =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
              .stub(_res);
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
          TRes>
      get stripe_info =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
              .stub(_res);
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
              .stub(_res);
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
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
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location) ||
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
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

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info({
    required this.id,
    required this.stripe_id,
    required this.status,
    this.requirements,
    required this.payouts_enabled,
    this.email,
    required this.details_submitted,
    required this.charges_enabled,
    this.charge_fees_on_customer,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_id = json['stripe_id'];
    final l$status = json['status'];
    final l$requirements = json['requirements'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$email = json['email'];
    final l$details_submitted = json['details_submitted'];
    final l$charges_enabled = json['charges_enabled'];
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
      id: (l$id as int),
      stripe_id: (l$stripe_id as String),
      status: (l$status as String),
      requirements: l$requirements == null ? null : mapFromJson(l$requirements),
      payouts_enabled: (l$payouts_enabled as bool),
      email: (l$email as String?),
      details_submitted: (l$details_submitted as bool),
      charges_enabled: (l$charges_enabled as bool),
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String stripe_id;

  final String status;

  final dynamic? requirements;

  final bool payouts_enabled;

  final String? email;

  final bool details_submitted;

  final bool charges_enabled;

  final bool? charge_fees_on_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$requirements = requirements;
    _resultData['requirements'] =
        l$requirements == null ? null : mapToJson(l$requirements);
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_id = stripe_id;
    final l$status = status;
    final l$requirements = requirements;
    final l$payouts_enabled = payouts_enabled;
    final l$email = email;
    final l$details_submitted = details_submitted;
    final l$charges_enabled = charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_id,
      l$status,
      l$requirements,
      l$payouts_enabled,
      l$email,
      l$details_submitted,
      l$charges_enabled,
      l$charge_fees_on_customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info;

  TRes call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_id = _undefined,
    Object? status = _undefined,
    Object? requirements = _undefined,
    Object? payouts_enabled = _undefined,
    Object? email = _undefined,
    Object? details_submitted = _undefined,
    Object? charges_enabled = _undefined,
    Object? charge_fees_on_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as dynamic?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$stripe_info(
      this._res);

  TRes _res;

  call({
    int? id,
    String? stripe_id,
    String? status,
    dynamic? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>
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
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description) ||
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description;

  TRes call({
    List<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
                      Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
                          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations {
  Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
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
            is Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations) ||
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations
    on Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
    Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantLang {
  factory Variables$Query$getRestaurantLang({required int id}) =>
      Variables$Query$getRestaurantLang._({
        r'id': id,
      });

  Variables$Query$getRestaurantLang._(this._$data);

  factory Variables$Query$getRestaurantLang.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantLang._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantLang<Variables$Query$getRestaurantLang>
      get copyWith => CopyWith$Variables$Query$getRestaurantLang(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantLang) ||
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

abstract class CopyWith$Variables$Query$getRestaurantLang<TRes> {
  factory CopyWith$Variables$Query$getRestaurantLang(
    Variables$Query$getRestaurantLang instance,
    TRes Function(Variables$Query$getRestaurantLang) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantLang;

  factory CopyWith$Variables$Query$getRestaurantLang.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantLang;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantLang<TRes>
    implements CopyWith$Variables$Query$getRestaurantLang<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantLang(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantLang _instance;

  final TRes Function(Variables$Query$getRestaurantLang) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantLang._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantLang<TRes>
    implements CopyWith$Variables$Query$getRestaurantLang<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantLang(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantLang {
  Query$getRestaurantLang({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantLang.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantLang(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantLang$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantLang$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantLang) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantLang on Query$getRestaurantLang {
  CopyWith$Query$getRestaurantLang<Query$getRestaurantLang> get copyWith =>
      CopyWith$Query$getRestaurantLang(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantLang<TRes> {
  factory CopyWith$Query$getRestaurantLang(
    Query$getRestaurantLang instance,
    TRes Function(Query$getRestaurantLang) then,
  ) = _CopyWithImpl$Query$getRestaurantLang;

  factory CopyWith$Query$getRestaurantLang.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantLang;

  TRes call({
    Query$getRestaurantLang$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantLang<TRes>
    implements CopyWith$Query$getRestaurantLang<TRes> {
  _CopyWithImpl$Query$getRestaurantLang(
    this._instance,
    this._then,
  );

  final Query$getRestaurantLang _instance;

  final TRes Function(Query$getRestaurantLang) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantLang(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantLang$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantLang<TRes>
    implements CopyWith$Query$getRestaurantLang<TRes> {
  _CopyWithStubImpl$Query$getRestaurantLang(this._res);

  TRes _res;

  call({
    Query$getRestaurantLang$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk.stub(
              _res);
}

const documentNodeQuerygetRestaurantLang = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantLang'),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'language'),
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
Query$getRestaurantLang _parserFn$Query$getRestaurantLang(
        Map<String, dynamic> data) =>
    Query$getRestaurantLang.fromJson(data);

class Options$Query$getRestaurantLang
    extends graphql.QueryOptions<Query$getRestaurantLang> {
  Options$Query$getRestaurantLang({
    String? operationName,
    required Variables$Query$getRestaurantLang variables,
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
          document: documentNodeQuerygetRestaurantLang,
          parserFn: _parserFn$Query$getRestaurantLang,
        );
}

class WatchOptions$Query$getRestaurantLang
    extends graphql.WatchQueryOptions<Query$getRestaurantLang> {
  WatchOptions$Query$getRestaurantLang({
    String? operationName,
    required Variables$Query$getRestaurantLang variables,
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
          document: documentNodeQuerygetRestaurantLang,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantLang,
        );
}

class FetchMoreOptions$Query$getRestaurantLang
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantLang({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantLang variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantLang,
        );
}

extension ClientExtension$Query$getRestaurantLang on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantLang>> query$getRestaurantLang(
          Options$Query$getRestaurantLang options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantLang> watchQuery$getRestaurantLang(
          WatchOptions$Query$getRestaurantLang options) =>
      this.watchQuery(options);
  void writeQuery$getRestaurantLang({
    required Query$getRestaurantLang data,
    required Variables$Query$getRestaurantLang variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantLang),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantLang? readQuery$getRestaurantLang({
    required Variables$Query$getRestaurantLang variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantLang),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantLang.fromJson(result);
  }
}

class Query$getRestaurantLang$restaurant_restaurant_by_pk {
  Query$getRestaurantLang$restaurant_restaurant_by_pk({
    this.details,
    required this.$__typename,
  });

  factory Query$getRestaurantLang$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantLang$restaurant_restaurant_by_pk(
      details: l$details == null
          ? null
          : Query$getRestaurantLang$restaurant_restaurant_by_pk$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantLang$restaurant_restaurant_by_pk$details? details;

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
    if (!(other is Query$getRestaurantLang$restaurant_restaurant_by_pk) ||
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

extension UtilityExtension$Query$getRestaurantLang$restaurant_restaurant_by_pk
    on Query$getRestaurantLang$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<
          Query$getRestaurantLang$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk(
    Query$getRestaurantLang$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantLang$restaurant_restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk;

  TRes call({
    Query$getRestaurantLang$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<TRes>
      get details;
}

class _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes>
    implements
        CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantLang$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantLang$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantLang$restaurant_restaurant_by_pk(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$getRestaurantLang$restaurant_restaurant_by_pk$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$getRestaurantLang$restaurant_restaurant_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<TRes>
      get details =>
          CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details
              .stub(_res);
}

class Query$getRestaurantLang$restaurant_restaurant_by_pk$details {
  Query$getRestaurantLang$restaurant_restaurant_by_pk$details({
    required this.id,
    required this.language,
    required this.$__typename,
  });

  factory Query$getRestaurantLang$restaurant_restaurant_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$language = json['language'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
      id: (l$id as int),
      language: mapFromJson(l$language),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic language;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$language = language;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$language,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantLang$restaurant_restaurant_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Query$getRestaurantLang$restaurant_restaurant_by_pk$details
    on Query$getRestaurantLang$restaurant_restaurant_by_pk$details {
  CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
          Query$getRestaurantLang$restaurant_restaurant_by_pk$details>
      get copyWith =>
          CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
    TRes> {
  factory CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
    Query$getRestaurantLang$restaurant_restaurant_by_pk$details instance,
    TRes Function(Query$getRestaurantLang$restaurant_restaurant_by_pk$details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details;

  factory CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details;

  TRes call({
    int? id,
    dynamic? language,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantLang$restaurant_restaurant_by_pk$details _instance;

  final TRes Function(
      Query$getRestaurantLang$restaurant_restaurant_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? language = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
        TRes>
    implements
        CopyWith$Query$getRestaurantLang$restaurant_restaurant_by_pk$details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantLang$restaurant_restaurant_by_pk$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? language,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantItems {
  factory Variables$Query$getRestaurantItems({required int restaurant_id}) =>
      Variables$Query$getRestaurantItems._({
        r'restaurant_id': restaurant_id,
      });

  Variables$Query$getRestaurantItems._(this._$data);

  factory Variables$Query$getRestaurantItems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = data['restaurant_id'];
    result$data['restaurant_id'] = (l$restaurant_id as int);
    return Variables$Query$getRestaurantItems._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurant_id => (_$data['restaurant_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    result$data['restaurant_id'] = l$restaurant_id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantItems<
          Variables$Query$getRestaurantItems>
      get copyWith => CopyWith$Variables$Query$getRestaurantItems(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    return Object.hashAll([l$restaurant_id]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantItems<TRes> {
  factory CopyWith$Variables$Query$getRestaurantItems(
    Variables$Query$getRestaurantItems instance,
    TRes Function(Variables$Query$getRestaurantItems) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantItems;

  factory CopyWith$Variables$Query$getRestaurantItems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantItems;

  TRes call({int? restaurant_id});
}

class _CopyWithImpl$Variables$Query$getRestaurantItems<TRes>
    implements CopyWith$Variables$Query$getRestaurantItems<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantItems(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantItems _instance;

  final TRes Function(Variables$Query$getRestaurantItems) _then;

  static const _undefined = {};

  TRes call({Object? restaurant_id = _undefined}) =>
      _then(Variables$Query$getRestaurantItems._({
        ..._instance._$data,
        if (restaurant_id != _undefined && restaurant_id != null)
          'restaurant_id': (restaurant_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantItems<TRes>
    implements CopyWith$Variables$Query$getRestaurantItems<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantItems(this._res);

  TRes _res;

  call({int? restaurant_id}) => _res;
}

class Query$getRestaurantItems {
  Query$getRestaurantItems({
    required this.restaurant_item,
    required this.$__typename,
  });

  factory Query$getRestaurantItems.fromJson(Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems(
      restaurant_item: (l$restaurant_item as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item> restaurant_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] =
        l$restaurant_item.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_item.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item.length != lOther$restaurant_item.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_item.length; i++) {
      final l$restaurant_item$entry = l$restaurant_item[i];
      final lOther$restaurant_item$entry = lOther$restaurant_item[i];
      if (l$restaurant_item$entry != lOther$restaurant_item$entry) {
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

extension UtilityExtension$Query$getRestaurantItems
    on Query$getRestaurantItems {
  CopyWith$Query$getRestaurantItems<Query$getRestaurantItems> get copyWith =>
      CopyWith$Query$getRestaurantItems(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantItems<TRes> {
  factory CopyWith$Query$getRestaurantItems(
    Query$getRestaurantItems instance,
    TRes Function(Query$getRestaurantItems) then,
  ) = _CopyWithImpl$Query$getRestaurantItems;

  factory CopyWith$Query$getRestaurantItems.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item>? restaurant_item,
    String? $__typename,
  });
  TRes restaurant_item(
      Iterable<Query$getRestaurantItems$restaurant_item> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item<
                      Query$getRestaurantItems$restaurant_item>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems<TRes>
    implements CopyWith$Query$getRestaurantItems<TRes> {
  _CopyWithImpl$Query$getRestaurantItems(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems _instance;

  final TRes Function(Query$getRestaurantItems) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems(
        restaurant_item:
            restaurant_item == _undefined || restaurant_item == null
                ? _instance.restaurant_item
                : (restaurant_item
                    as List<Query$getRestaurantItems$restaurant_item>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_item(
          Iterable<Query$getRestaurantItems$restaurant_item> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item<
                          Query$getRestaurantItems$restaurant_item>>)
              _fn) =>
      call(
          restaurant_item: _fn(_instance.restaurant_item
              .map((e) => CopyWith$Query$getRestaurantItems$restaurant_item(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems<TRes>
    implements CopyWith$Query$getRestaurantItems<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item>? restaurant_item,
    String? $__typename,
  }) =>
      _res;
  restaurant_item(_fn) => _res;
}

const documentNodeQuerygetRestaurantItems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantItems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
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
        name: NameNode(value: 'restaurant_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'restaurant_id')),
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
            name: NameNode(value: 'description'),
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
            name: NameNode(value: 'cost'),
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
            name: NameNode(value: 'category_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'item_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'available'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'special_period_end'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'special_period_start'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'options'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'item_options'),
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
                    name: NameNode(value: 'free_choice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'cost_per_extra'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'option_type'),
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
                    name: NameNode(value: 'maximum_choice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'minimum_choice'),
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
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
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
                    name: NameNode(value: 'choices'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'option_choices'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'available'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'cost'),
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
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
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
Query$getRestaurantItems _parserFn$Query$getRestaurantItems(
        Map<String, dynamic> data) =>
    Query$getRestaurantItems.fromJson(data);

class Options$Query$getRestaurantItems
    extends graphql.QueryOptions<Query$getRestaurantItems> {
  Options$Query$getRestaurantItems({
    String? operationName,
    required Variables$Query$getRestaurantItems variables,
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
          document: documentNodeQuerygetRestaurantItems,
          parserFn: _parserFn$Query$getRestaurantItems,
        );
}

class WatchOptions$Query$getRestaurantItems
    extends graphql.WatchQueryOptions<Query$getRestaurantItems> {
  WatchOptions$Query$getRestaurantItems({
    String? operationName,
    required Variables$Query$getRestaurantItems variables,
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
          document: documentNodeQuerygetRestaurantItems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantItems,
        );
}

class FetchMoreOptions$Query$getRestaurantItems
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantItems({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantItems variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantItems,
        );
}

extension ClientExtension$Query$getRestaurantItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantItems>>
      query$getRestaurantItems(
              Options$Query$getRestaurantItems options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantItems>
      watchQuery$getRestaurantItems(
              WatchOptions$Query$getRestaurantItems options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantItems({
    required Query$getRestaurantItems data,
    required Variables$Query$getRestaurantItems variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantItems),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantItems? readQuery$getRestaurantItems({
    required Variables$Query$getRestaurantItems variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantItems),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantItems.fromJson(result);
  }
}

class Query$getRestaurantItems$restaurant_item {
  Query$getRestaurantItems$restaurant_item({
    required this.id,
    required this.name,
    this.description,
    required this.cost,
    required this.position,
    this.category_id,
    required this.item_type,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.options,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$cost = json['cost'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$item_type = json['item_type'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item(
      id: (l$id as int),
      name: Query$getRestaurantItems$restaurant_item$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getRestaurantItems$restaurant_item$description.fromJson(
              (l$description as Map<String, dynamic>)),
      cost: moneyFromJson(l$cost),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      item_type: (l$item_type as String),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      options: (l$options as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item$options.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getRestaurantItems$restaurant_item$name name;

  final Query$getRestaurantItems$restaurant_item$description? description;

  final double cost;

  final int position;

  final int? category_id;

  final String item_type;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final List<Query$getRestaurantItems$restaurant_item$options> options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$options = options;
    _resultData['options'] = l$options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$cost = cost;
    final l$position = position;
    final l$category_id = category_id;
    final l$item_type = item_type;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$cost,
      l$position,
      l$category_id,
      l$item_type,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      Object.hashAll(l$options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item) ||
        runtimeType != other.runtimeType) {
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$special_period_end = special_period_end;
    final lOther$special_period_end = other.special_period_end;
    if (l$special_period_end != lOther$special_period_end) {
      return false;
    }
    final l$special_period_start = special_period_start;
    final lOther$special_period_start = other.special_period_start;
    if (l$special_period_start != lOther$special_period_start) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options.length != lOther$options.length) {
      return false;
    }
    for (int i = 0; i < l$options.length; i++) {
      final l$options$entry = l$options[i];
      final lOther$options$entry = lOther$options[i];
      if (l$options$entry != lOther$options$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item
    on Query$getRestaurantItems$restaurant_item {
  CopyWith$Query$getRestaurantItems$restaurant_item<
          Query$getRestaurantItems$restaurant_item>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item(
    Query$getRestaurantItems$restaurant_item instance,
    TRes Function(Query$getRestaurantItems$restaurant_item) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item;

  factory CopyWith$Query$getRestaurantItems$restaurant_item.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item;

  TRes call({
    int? id,
    Query$getRestaurantItems$restaurant_item$name? name,
    Query$getRestaurantItems$restaurant_item$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getRestaurantItems$restaurant_item$options>? options,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name;
  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description;
  TRes options(
      Iterable<Query$getRestaurantItems$restaurant_item$options> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options<
                      Query$getRestaurantItems$restaurant_item$options>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cost = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? item_type = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getRestaurantItems$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getRestaurantItems$restaurant_item$description?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        special_period_end: special_period_end == _undefined
            ? _instance.special_period_end
            : (special_period_end as String?),
        special_period_start: special_period_start == _undefined
            ? _instance.special_period_start
            : (special_period_start as String?),
        options: options == _undefined || options == null
            ? _instance.options
            : (options
                as List<Query$getRestaurantItems$restaurant_item$options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantItems$restaurant_item$description(
            local$description, (e) => call(description: e));
  }

  TRes options(
          Iterable<Query$getRestaurantItems$restaurant_item$options> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options<
                          Query$getRestaurantItems$restaurant_item$options>>)
              _fn) =>
      call(
          options: _fn(_instance.options.map(
              (e) => CopyWith$Query$getRestaurantItems$restaurant_item$options(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item(this._res);

  TRes _res;

  call({
    int? id,
    Query$getRestaurantItems$restaurant_item$name? name,
    Query$getRestaurantItems$restaurant_item$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getRestaurantItems$restaurant_item$options>? options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name =>
      CopyWith$Query$getRestaurantItems$restaurant_item$name.stub(_res);
  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
              _res);
  options(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$name {
  Query$getRestaurantItems$restaurant_item$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item$name$translations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item$name$translations>
      translations;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$name) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$name
    on Query$getRestaurantItems$restaurant_item$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$name<
          Query$getRestaurantItems$restaurant_item$name>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$name(
    Query$getRestaurantItems$restaurant_item$name instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$name) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
                      Query$getRestaurantItems$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$name _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
                          Query$getRestaurantItems$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$name$translations {
  Query$getRestaurantItems$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$name$translations
    on Query$getRestaurantItems$restaurant_item$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
          Query$getRestaurantItems$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
    Query$getRestaurantItems$restaurant_item$name$translations instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$name$translations _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$description {
  Query$getRestaurantItems$restaurant_item$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$getRestaurantItems$restaurant_item$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$description
    on Query$getRestaurantItems$restaurant_item$description {
  CopyWith$Query$getRestaurantItems$restaurant_item$description<
          Query$getRestaurantItems$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$description(
    Query$getRestaurantItems$restaurant_item$description instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$description) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
                      Query$getRestaurantItems$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description<TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$description _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
                          Query$getRestaurantItems$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$description$translations {
  Query$getRestaurantItems$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$description$translations(
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
            is Query$getRestaurantItems$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$description$translations
    on Query$getRestaurantItems$restaurant_item$description$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
          Query$getRestaurantItems$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
    Query$getRestaurantItems$restaurant_item$description$translations instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$description$translations
      _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$options {
  Query$getRestaurantItems$restaurant_item$options({
    required this.item_options,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options.fromJson(
      Map<String, dynamic> json) {
    final l$item_options = json['item_options'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options(
      item_options: (l$item_options as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item$options$item_options>
      item_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_options = item_options;
    _resultData['item_options'] =
        l$item_options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_options = item_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$item_options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_options = item_options;
    final lOther$item_options = other.item_options;
    if (l$item_options.length != lOther$item_options.length) {
      return false;
    }
    for (int i = 0; i < l$item_options.length; i++) {
      final l$item_options$entry = l$item_options[i];
      final lOther$item_options$entry = lOther$item_options[i];
      if (l$item_options$entry != lOther$item_options$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options
    on Query$getRestaurantItems$restaurant_item$options {
  CopyWith$Query$getRestaurantItems$restaurant_item$options<
          Query$getRestaurantItems$restaurant_item$options>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options(
    Query$getRestaurantItems$restaurant_item$options instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$options) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  });
  TRes item_options(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
                      Query$getRestaurantItems$restaurant_item$options$item_options>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$options) _then;

  static const _undefined = {};

  TRes call({
    Object? item_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options(
        item_options: item_options == _undefined || item_options == null
            ? _instance.item_options
            : (item_options as List<
                Query$getRestaurantItems$restaurant_item$options$item_options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes item_options(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
                          Query$getRestaurantItems$restaurant_item$options$item_options>>)
              _fn) =>
      call(
          item_options: _fn(_instance.item_options.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  }) =>
      _res;
  item_options(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options {
  Query$getRestaurantItems$restaurant_item$options$item_options({
    required this.id,
    required this.free_choice,
    required this.cost_per_extra,
    required this.option_type,
    required this.position,
    required this.maximum_choice,
    required this.minimum_choice,
    required this.name,
    required this.choices,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$free_choice = json['free_choice'];
    final l$cost_per_extra = json['cost_per_extra'];
    final l$option_type = json['option_type'];
    final l$position = json['position'];
    final l$maximum_choice = json['maximum_choice'];
    final l$minimum_choice = json['minimum_choice'];
    final l$name = json['name'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: moneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name: Query$getRestaurantItems$restaurant_item$options$item_options$name
          .fromJson((l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int free_choice;

  final double cost_per_extra;

  final String option_type;

  final int position;

  final int maximum_choice;

  final int minimum_choice;

  final Query$getRestaurantItems$restaurant_item$options$item_options$name name;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices>
      choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$free_choice = free_choice;
    _resultData['free_choice'] = l$free_choice;
    final l$cost_per_extra = cost_per_extra;
    _resultData['cost_per_extra'] = moneyToJson(l$cost_per_extra);
    final l$option_type = option_type;
    _resultData['option_type'] = l$option_type;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$maximum_choice = maximum_choice;
    _resultData['maximum_choice'] = l$maximum_choice;
    final l$minimum_choice = minimum_choice;
    _resultData['minimum_choice'] = l$minimum_choice;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$choices = choices;
    _resultData['choices'] = l$choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$free_choice = free_choice;
    final l$cost_per_extra = cost_per_extra;
    final l$option_type = option_type;
    final l$position = position;
    final l$maximum_choice = maximum_choice;
    final l$minimum_choice = minimum_choice;
    final l$name = name;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$free_choice,
      l$cost_per_extra,
      l$option_type,
      l$position,
      l$maximum_choice,
      l$minimum_choice,
      l$name,
      Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantItems$restaurant_item$options$item_options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$free_choice = free_choice;
    final lOther$free_choice = other.free_choice;
    if (l$free_choice != lOther$free_choice) {
      return false;
    }
    final l$cost_per_extra = cost_per_extra;
    final lOther$cost_per_extra = other.cost_per_extra;
    if (l$cost_per_extra != lOther$cost_per_extra) {
      return false;
    }
    final l$option_type = option_type;
    final lOther$option_type = other.option_type;
    if (l$option_type != lOther$option_type) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$maximum_choice = maximum_choice;
    final lOther$maximum_choice = other.maximum_choice;
    if (l$maximum_choice != lOther$maximum_choice) {
      return false;
    }
    final l$minimum_choice = minimum_choice;
    final lOther$minimum_choice = other.minimum_choice;
    if (l$minimum_choice != lOther$minimum_choice) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices.length != lOther$choices.length) {
      return false;
    }
    for (int i = 0; i < l$choices.length; i++) {
      final l$choices$entry = l$choices[i];
      final lOther$choices$entry = lOther$choices[i];
      if (l$choices$entry != lOther$choices$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options
    on Query$getRestaurantItems$restaurant_item$options$item_options {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
          Query$getRestaurantItems$restaurant_item$options$item_options>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
    Query$getRestaurantItems$restaurant_item$options$item_options instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$options$item_options)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getRestaurantItems$restaurant_item$options$item_options$name? name,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
      TRes> get name;
  TRes choices(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$options$item_options) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? free_choice = _undefined,
    Object? cost_per_extra = _undefined,
    Object? option_type = _undefined,
    Object? position = _undefined,
    Object? maximum_choice = _undefined,
    Object? minimum_choice = _undefined,
    Object? name = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options$item_options(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        free_choice: free_choice == _undefined || free_choice == null
            ? _instance.free_choice
            : (free_choice as int),
        cost_per_extra: cost_per_extra == _undefined || cost_per_extra == null
            ? _instance.cost_per_extra
            : (cost_per_extra as double),
        option_type: option_type == _undefined || option_type == null
            ? _instance.option_type
            : (option_type as String),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        maximum_choice: maximum_choice == _undefined || maximum_choice == null
            ? _instance.maximum_choice
            : (maximum_choice as int),
        minimum_choice: minimum_choice == _undefined || minimum_choice == null
            ? _instance.minimum_choice
            : (minimum_choice as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getRestaurantItems$restaurant_item$options$item_options$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options(
      this._res);

  TRes _res;

  call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getRestaurantItems$restaurant_item$options$item_options$name? name,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
          TRes>
      get name =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name
              .stub(_res);
  choices(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$name {
  Query$getRestaurantItems$restaurant_item$options$item_options$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$name
    on Query$getRestaurantItems$restaurant_item$options$item_options$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
          Query$getRestaurantItems$restaurant_item$options$item_options$name>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
    Query$getRestaurantItems$restaurant_item$options$item_options$name instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$name)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
                      Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$name
      _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$options$item_options$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options$item_options$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
                          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$name$translations {
  Query$getRestaurantItems$restaurant_item$options$item_options$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
    on Query$getRestaurantItems$restaurant_item$options$item_options$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
    Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>
      option_choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$option_choices = option_choices;
    _resultData['option_choices'] =
        l$option_choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$option_choices = option_choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$option_choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option_choices = option_choices;
    final lOther$option_choices = other.option_choices;
    if (l$option_choices.length != lOther$option_choices.length) {
      return false;
    }
    for (int i = 0; i < l$option_choices.length; i++) {
      final l$option_choices$entry = l$option_choices[i];
      final lOther$option_choices$entry = lOther$option_choices[i];
      if (l$option_choices$entry != lOther$option_choices$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
      this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
              .stub(_res);
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantOperators {
  factory Variables$Query$getRestaurantOperators({required int restaurantId}) =>
      Variables$Query$getRestaurantOperators._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$getRestaurantOperators._(this._$data);

  factory Variables$Query$getRestaurantOperators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$getRestaurantOperators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantOperators<
          Variables$Query$getRestaurantOperators>
      get copyWith => CopyWith$Variables$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    return Object.hashAll([l$restaurantId]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Variables$Query$getRestaurantOperators(
    Variables$Query$getRestaurantOperators instance,
    TRes Function(Variables$Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantOperators;

  factory CopyWith$Variables$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantOperators;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantOperators _instance;

  final TRes Function(Variables$Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$getRestaurantOperators._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$getRestaurantOperators {
  Query$getRestaurantOperators({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantOperators$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantOperators
    on Query$getRestaurantOperators {
  CopyWith$Query$getRestaurantOperators<Query$getRestaurantOperators>
      get copyWith => CopyWith$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Query$getRestaurantOperators(
    Query$getRestaurantOperators instance,
    TRes Function(Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Query$getRestaurantOperators;

  factory CopyWith$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators;

  TRes call({
    Query$getRestaurantOperators$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators _instance;

  final TRes Function(Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({
    Query$getRestaurantOperators$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk
              .stub(_res);
}

const documentNodeQuerygetRestaurantOperators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantOperators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restaurantId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_operators'),
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
                name: NameNode(value: 'restaurant_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'operator_details'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                    name: NameNode(value: 'current_gps'),
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
                    name: NameNode(value: 'firebase_id'),
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
Query$getRestaurantOperators _parserFn$Query$getRestaurantOperators(
        Map<String, dynamic> data) =>
    Query$getRestaurantOperators.fromJson(data);

class Options$Query$getRestaurantOperators
    extends graphql.QueryOptions<Query$getRestaurantOperators> {
  Options$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class WatchOptions$Query$getRestaurantOperators
    extends graphql.WatchQueryOptions<Query$getRestaurantOperators> {
  WatchOptions$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class FetchMoreOptions$Query$getRestaurantOperators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantOperators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantOperators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantOperators,
        );
}

extension ClientExtension$Query$getRestaurantOperators
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantOperators>>
      query$getRestaurantOperators(
              Options$Query$getRestaurantOperators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantOperators>
      watchQuery$getRestaurantOperators(
              WatchOptions$Query$getRestaurantOperators options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantOperators({
    required Query$getRestaurantOperators data,
    required Variables$Query$getRestaurantOperators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantOperators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantOperators? readQuery$getRestaurantOperators({
    required Variables$Query$getRestaurantOperators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantOperators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantOperators.fromJson(result);
  }
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk({
    required this.restaurant_operators,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_operators = json['restaurant_operators'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk(
      restaurant_operators: (l$restaurant_operators as List<dynamic>)
          .map((e) =>
              Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>
      restaurant_operators;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operators = restaurant_operators;
    _resultData['restaurant_operators'] =
        l$restaurant_operators.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operators = restaurant_operators;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operators.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators$restaurant_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_operators = restaurant_operators;
    final lOther$restaurant_operators = other.restaurant_operators;
    if (l$restaurant_operators.length != lOther$restaurant_operators.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operators.length; i++) {
      final l$restaurant_operators$entry = l$restaurant_operators[i];
      final lOther$restaurant_operators$entry = lOther$restaurant_operators[i];
      if (l$restaurant_operators$entry != lOther$restaurant_operators$entry) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantOperators$restaurant_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk;

  TRes call({
    List<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  });
  TRes restaurant_operators(
      Iterable<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators> Function(
              Iterable<
                  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
                      Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantOperators$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_operators = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators$restaurant_restaurant_by_pk(
        restaurant_operators: restaurant_operators == _undefined ||
                restaurant_operators == null
            ? _instance.restaurant_operators
            : (restaurant_operators as List<
                Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operators(
          Iterable<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
                          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>>)
              _fn) =>
      call(
          restaurant_operators: _fn(_instance.restaurant_operators.map((e) =>
              CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    List<Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  }) =>
      _res;
  restaurant_operators(_fn) => _res;
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators({
    required this.id,
    required this.restaurant_id,
    required this.operator_details,
    required this.user,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_id = json['restaurant_id'];
    final l$operator_details = json['operator_details'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
      id: (l$id as int),
      restaurant_id: (l$restaurant_id as int),
      operator_details:
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
              .fromJson((l$operator_details as Map<String, dynamic>)),
      user:
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int restaurant_id;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
      operator_details;

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$operator_details = operator_details;
    _resultData['operator_details'] = l$operator_details.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant_id = restaurant_id;
    final l$operator_details = operator_details;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_id,
      l$operator_details,
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
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$operator_details = operator_details;
    final lOther$operator_details = other.operator_details;
    if (l$operator_details != lOther$operator_details) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators;

  TRes call({
    int? id,
    int? restaurant_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details?
        operator_details,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
      TRes> get operator_details;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_id = _undefined,
    Object? operator_details = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        operator_details: operator_details == _undefined ||
                operator_details == null
            ? _instance.operator_details
            : (operator_details
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
      TRes> get operator_details {
    final local$operator_details = _instance.operator_details;
    return CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
        local$operator_details, (e) => call(operator_details: e));
  }

  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators(
      this._res);

  TRes _res;

  call({
    int? id,
    int? restaurant_id,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details?
        operator_details,
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
          TRes>
      get operator_details =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
              .stub(_res);
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
          TRes>
      get user =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
              .stub(_res);
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details({
    required this.owner,
    required this.status,
    this.current_gps,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details.fromJson(
      Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$status = json['status'];
    final l$current_gps = json['current_gps'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
      owner: (l$owner as bool),
      status: (l$status as String),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool owner;

  final String status;

  final Geography? current_gps;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$owner = owner;
    final l$status = status;
    final l$current_gps = current_gps;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$owner,
      l$status,
      l$current_gps,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details) ||
        runtimeType != other.runtimeType) {
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
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details;

  TRes call({
    bool? owner,
    String? status,
    Geography? current_gps,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? owner = _undefined,
    Object? status = _undefined,
    Object? current_gps = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$operator_details(
      this._res);

  TRes _res;

  call({
    bool? owner,
    String? status,
    Geography? current_gps,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user {
  Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user({
    this.phone,
    this.name,
    this.image,
    required this.language_id,
    required this.id,
    required this.firebase_id,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user.fromJson(
      Map<String, dynamic> json) {
    final l$phone = json['phone'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
      phone: (l$phone as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? phone;

  final String? name;

  final String? image;

  final String language_id;

  final int id;

  final String firebase_id;

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
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
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
    final l$firebase_id = firebase_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$phone,
      l$name,
      l$image,
      l$language_id,
      l$id,
      l$firebase_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user) ||
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
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
    on Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user {
  CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
    Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user;

  factory CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user;

  TRes call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? phone = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators$user(
      this._res);

  TRes _res;

  call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantDetailsId {
  factory Variables$Query$getRestaurantDetailsId({required int restauarntId}) =>
      Variables$Query$getRestaurantDetailsId._({
        r'restauarntId': restauarntId,
      });

  Variables$Query$getRestaurantDetailsId._(this._$data);

  factory Variables$Query$getRestaurantDetailsId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restauarntId = data['restauarntId'];
    result$data['restauarntId'] = (l$restauarntId as int);
    return Variables$Query$getRestaurantDetailsId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restauarntId => (_$data['restauarntId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restauarntId = restauarntId;
    result$data['restauarntId'] = l$restauarntId;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantDetailsId<
          Variables$Query$getRestaurantDetailsId>
      get copyWith => CopyWith$Variables$Query$getRestaurantDetailsId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantDetailsId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restauarntId = restauarntId;
    final lOther$restauarntId = other.restauarntId;
    if (l$restauarntId != lOther$restauarntId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restauarntId = restauarntId;
    return Object.hashAll([l$restauarntId]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantDetailsId<TRes> {
  factory CopyWith$Variables$Query$getRestaurantDetailsId(
    Variables$Query$getRestaurantDetailsId instance,
    TRes Function(Variables$Query$getRestaurantDetailsId) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantDetailsId;

  factory CopyWith$Variables$Query$getRestaurantDetailsId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantDetailsId;

  TRes call({int? restauarntId});
}

class _CopyWithImpl$Variables$Query$getRestaurantDetailsId<TRes>
    implements CopyWith$Variables$Query$getRestaurantDetailsId<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantDetailsId(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantDetailsId _instance;

  final TRes Function(Variables$Query$getRestaurantDetailsId) _then;

  static const _undefined = {};

  TRes call({Object? restauarntId = _undefined}) =>
      _then(Variables$Query$getRestaurantDetailsId._({
        ..._instance._$data,
        if (restauarntId != _undefined && restauarntId != null)
          'restauarntId': (restauarntId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantDetailsId<TRes>
    implements CopyWith$Variables$Query$getRestaurantDetailsId<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantDetailsId(this._res);

  TRes _res;

  call({int? restauarntId}) => _res;
}

class Query$getRestaurantDetailsId {
  Query$getRestaurantDetailsId({
    this.restaurant_restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantDetailsId.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant_by_pk = json['restaurant_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantDetailsId(
      restaurant_restaurant_by_pk: l$restaurant_restaurant_by_pk == null
          ? null
          : Query$getRestaurantDetailsId$restaurant_restaurant_by_pk.fromJson(
              (l$restaurant_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantDetailsId$restaurant_restaurant_by_pk?
      restaurant_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    _resultData['restaurant_restaurant_by_pk'] =
        l$restaurant_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantDetailsId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant_by_pk = restaurant_restaurant_by_pk;
    final lOther$restaurant_restaurant_by_pk =
        other.restaurant_restaurant_by_pk;
    if (l$restaurant_restaurant_by_pk != lOther$restaurant_restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantDetailsId
    on Query$getRestaurantDetailsId {
  CopyWith$Query$getRestaurantDetailsId<Query$getRestaurantDetailsId>
      get copyWith => CopyWith$Query$getRestaurantDetailsId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantDetailsId<TRes> {
  factory CopyWith$Query$getRestaurantDetailsId(
    Query$getRestaurantDetailsId instance,
    TRes Function(Query$getRestaurantDetailsId) then,
  ) = _CopyWithImpl$Query$getRestaurantDetailsId;

  factory CopyWith$Query$getRestaurantDetailsId.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantDetailsId;

  TRes call({
    Query$getRestaurantDetailsId$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantDetailsId<TRes>
    implements CopyWith$Query$getRestaurantDetailsId<TRes> {
  _CopyWithImpl$Query$getRestaurantDetailsId(
    this._instance,
    this._then,
  );

  final Query$getRestaurantDetailsId _instance;

  final TRes Function(Query$getRestaurantDetailsId) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantDetailsId(
        restaurant_restaurant_by_pk: restaurant_restaurant_by_pk == _undefined
            ? _instance.restaurant_restaurant_by_pk
            : (restaurant_restaurant_by_pk
                as Query$getRestaurantDetailsId$restaurant_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk {
    final local$restaurant_restaurant_by_pk =
        _instance.restaurant_restaurant_by_pk;
    return local$restaurant_restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
            local$restaurant_restaurant_by_pk,
            (e) => call(restaurant_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantDetailsId<TRes>
    implements CopyWith$Query$getRestaurantDetailsId<TRes> {
  _CopyWithStubImpl$Query$getRestaurantDetailsId(this._res);

  TRes _res;

  call({
    Query$getRestaurantDetailsId$restaurant_restaurant_by_pk?
        restaurant_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<TRes>
      get restaurant_restaurant_by_pk =>
          CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk
              .stub(_res);
}

const documentNodeQuerygetRestaurantDetailsId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantDetailsId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restauarntId')),
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
        name: NameNode(value: 'restaurant_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restauarntId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'details_id'),
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
Query$getRestaurantDetailsId _parserFn$Query$getRestaurantDetailsId(
        Map<String, dynamic> data) =>
    Query$getRestaurantDetailsId.fromJson(data);

class Options$Query$getRestaurantDetailsId
    extends graphql.QueryOptions<Query$getRestaurantDetailsId> {
  Options$Query$getRestaurantDetailsId({
    String? operationName,
    required Variables$Query$getRestaurantDetailsId variables,
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
          document: documentNodeQuerygetRestaurantDetailsId,
          parserFn: _parserFn$Query$getRestaurantDetailsId,
        );
}

class WatchOptions$Query$getRestaurantDetailsId
    extends graphql.WatchQueryOptions<Query$getRestaurantDetailsId> {
  WatchOptions$Query$getRestaurantDetailsId({
    String? operationName,
    required Variables$Query$getRestaurantDetailsId variables,
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
          document: documentNodeQuerygetRestaurantDetailsId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantDetailsId,
        );
}

class FetchMoreOptions$Query$getRestaurantDetailsId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantDetailsId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantDetailsId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantDetailsId,
        );
}

extension ClientExtension$Query$getRestaurantDetailsId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantDetailsId>>
      query$getRestaurantDetailsId(
              Options$Query$getRestaurantDetailsId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantDetailsId>
      watchQuery$getRestaurantDetailsId(
              WatchOptions$Query$getRestaurantDetailsId options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantDetailsId({
    required Query$getRestaurantDetailsId data,
    required Variables$Query$getRestaurantDetailsId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantDetailsId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantDetailsId? readQuery$getRestaurantDetailsId({
    required Variables$Query$getRestaurantDetailsId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantDetailsId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantDetailsId.fromJson(result);
  }
}

class Query$getRestaurantDetailsId$restaurant_restaurant_by_pk {
  Query$getRestaurantDetailsId$restaurant_restaurant_by_pk({
    required this.details_id,
    required this.$__typename,
  });

  factory Query$getRestaurantDetailsId$restaurant_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantDetailsId$restaurant_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
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

extension UtilityExtension$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk
    on Query$getRestaurantDetailsId$restaurant_restaurant_by_pk {
  CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
          Query$getRestaurantDetailsId$restaurant_restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
    Query$getRestaurantDetailsId$restaurant_restaurant_by_pk instance,
    TRes Function(Query$getRestaurantDetailsId$restaurant_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk;

  factory CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantDetailsId$restaurant_restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantDetailsId$restaurant_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantDetailsId$restaurant_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}
