import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$GetTaxiMinimalDeliveryOrders {
  factory Variables$Query$GetTaxiMinimalDeliveryOrders({
    required String status,
    required int limit,
    required int offset,
    required Input$Int_comparison_exp driver_id,
  }) =>
      Variables$Query$GetTaxiMinimalDeliveryOrders._({
        r'status': status,
        r'limit': limit,
        r'offset': offset,
        r'driver_id': driver_id,
      });

  Variables$Query$GetTaxiMinimalDeliveryOrders._(this._$data);

  factory Variables$Query$GetTaxiMinimalDeliveryOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$status = data['status'];
    result$data['status'] = (l$status as String);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    final l$driver_id = data['driver_id'];
    result$data['driver_id'] = Input$Int_comparison_exp.fromJson(
        (l$driver_id as Map<String, dynamic>));
    return Variables$Query$GetTaxiMinimalDeliveryOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get status => (_$data['status'] as String);
  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Input$Int_comparison_exp get driver_id =>
      (_$data['driver_id'] as Input$Int_comparison_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$status = status;
    result$data['status'] = l$status;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    final l$driver_id = driver_id;
    result$data['driver_id'] = l$driver_id.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders<
          Variables$Query$GetTaxiMinimalDeliveryOrders>
      get copyWith => CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetTaxiMinimalDeliveryOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$limit = limit;
    final l$offset = offset;
    final l$driver_id = driver_id;
    return Object.hashAll([
      l$status,
      l$limit,
      l$offset,
      l$driver_id,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  factory CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders(
    Variables$Query$GetTaxiMinimalDeliveryOrders instance,
    TRes Function(Variables$Query$GetTaxiMinimalDeliveryOrders) then,
  ) = _CopyWithImpl$Variables$Query$GetTaxiMinimalDeliveryOrders;

  factory CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetTaxiMinimalDeliveryOrders;

  TRes call({
    String? status,
    int? limit,
    int? offset,
    Input$Int_comparison_exp? driver_id,
  });
}

class _CopyWithImpl$Variables$Query$GetTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithImpl$Variables$Query$GetTaxiMinimalDeliveryOrders(
    this._instance,
    this._then,
  );

  final Variables$Query$GetTaxiMinimalDeliveryOrders _instance;

  final TRes Function(Variables$Query$GetTaxiMinimalDeliveryOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? driver_id = _undefined,
  }) =>
      _then(Variables$Query$GetTaxiMinimalDeliveryOrders._({
        ..._instance._$data,
        if (status != _undefined && status != null)
          'status': (status as String),
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
        if (driver_id != _undefined && driver_id != null)
          'driver_id': (driver_id as Input$Int_comparison_exp),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Variables$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$GetTaxiMinimalDeliveryOrders(this._res);

  TRes _res;

  call({
    String? status,
    int? limit,
    int? offset,
    Input$Int_comparison_exp? driver_id,
  }) =>
      _res;
}

class Query$GetTaxiMinimalDeliveryOrders {
  Query$GetTaxiMinimalDeliveryOrders({
    required this.taxi_order,
    required this.$__typename,
  });

  factory Query$GetTaxiMinimalDeliveryOrders.fromJson(
      Map<String, dynamic> json) {
    final l$taxi_order = json['taxi_order'];
    final l$$__typename = json['__typename'];
    return Query$GetTaxiMinimalDeliveryOrders(
      taxi_order: (l$taxi_order as List<dynamic>)
          .map((e) => Query$GetTaxiMinimalDeliveryOrders$taxi_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetTaxiMinimalDeliveryOrders$taxi_order> taxi_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$taxi_order = taxi_order;
    _resultData['taxi_order'] = l$taxi_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$taxi_order = taxi_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$taxi_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTaxiMinimalDeliveryOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$taxi_order = taxi_order;
    final lOther$taxi_order = other.taxi_order;
    if (l$taxi_order.length != lOther$taxi_order.length) {
      return false;
    }
    for (int i = 0; i < l$taxi_order.length; i++) {
      final l$taxi_order$entry = l$taxi_order[i];
      final lOther$taxi_order$entry = lOther$taxi_order[i];
      if (l$taxi_order$entry != lOther$taxi_order$entry) {
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

extension UtilityExtension$Query$GetTaxiMinimalDeliveryOrders
    on Query$GetTaxiMinimalDeliveryOrders {
  CopyWith$Query$GetTaxiMinimalDeliveryOrders<
          Query$GetTaxiMinimalDeliveryOrders>
      get copyWith => CopyWith$Query$GetTaxiMinimalDeliveryOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders(
    Query$GetTaxiMinimalDeliveryOrders instance,
    TRes Function(Query$GetTaxiMinimalDeliveryOrders) then,
  ) = _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders;

  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders;

  TRes call({
    List<Query$GetTaxiMinimalDeliveryOrders$taxi_order>? taxi_order,
    String? $__typename,
  });
  TRes taxi_order(
      Iterable<Query$GetTaxiMinimalDeliveryOrders$taxi_order> Function(
              Iterable<
                  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<
                      Query$GetTaxiMinimalDeliveryOrders$taxi_order>>)
          _fn);
}

class _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders(
    this._instance,
    this._then,
  );

  final Query$GetTaxiMinimalDeliveryOrders _instance;

  final TRes Function(Query$GetTaxiMinimalDeliveryOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? taxi_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTaxiMinimalDeliveryOrders(
        taxi_order: taxi_order == _undefined || taxi_order == null
            ? _instance.taxi_order
            : (taxi_order
                as List<Query$GetTaxiMinimalDeliveryOrders$taxi_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes taxi_order(
          Iterable<Query$GetTaxiMinimalDeliveryOrders$taxi_order> Function(
                  Iterable<
                      CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<
                          Query$GetTaxiMinimalDeliveryOrders$taxi_order>>)
              _fn) =>
      call(
          taxi_order: _fn(_instance.taxi_order.map(
              (e) => CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Query$GetTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders(this._res);

  TRes _res;

  call({
    List<Query$GetTaxiMinimalDeliveryOrders$taxi_order>? taxi_order,
    String? $__typename,
  }) =>
      _res;
  taxi_order(_fn) => _res;
}

const documentNodeQueryGetTaxiMinimalDeliveryOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTaxiMinimalDeliveryOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driver_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int_comparison_exp'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'taxi_order'),
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
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'order_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'driver_id'),
                value: VariableNode(name: NameNode(value: 'driver_id')),
              ),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_polyline'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ride_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
Query$GetTaxiMinimalDeliveryOrders _parserFn$Query$GetTaxiMinimalDeliveryOrders(
        Map<String, dynamic> data) =>
    Query$GetTaxiMinimalDeliveryOrders.fromJson(data);

class Options$Query$GetTaxiMinimalDeliveryOrders
    extends graphql.QueryOptions<Query$GetTaxiMinimalDeliveryOrders> {
  Options$Query$GetTaxiMinimalDeliveryOrders({
    String? operationName,
    required Variables$Query$GetTaxiMinimalDeliveryOrders variables,
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
          document: documentNodeQueryGetTaxiMinimalDeliveryOrders,
          parserFn: _parserFn$Query$GetTaxiMinimalDeliveryOrders,
        );
}

class WatchOptions$Query$GetTaxiMinimalDeliveryOrders
    extends graphql.WatchQueryOptions<Query$GetTaxiMinimalDeliveryOrders> {
  WatchOptions$Query$GetTaxiMinimalDeliveryOrders({
    String? operationName,
    required Variables$Query$GetTaxiMinimalDeliveryOrders variables,
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
          document: documentNodeQueryGetTaxiMinimalDeliveryOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetTaxiMinimalDeliveryOrders,
        );
}

class FetchMoreOptions$Query$GetTaxiMinimalDeliveryOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTaxiMinimalDeliveryOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetTaxiMinimalDeliveryOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetTaxiMinimalDeliveryOrders,
        );
}

extension ClientExtension$Query$GetTaxiMinimalDeliveryOrders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTaxiMinimalDeliveryOrders>>
      query$GetTaxiMinimalDeliveryOrders(
              Options$Query$GetTaxiMinimalDeliveryOrders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetTaxiMinimalDeliveryOrders>
      watchQuery$GetTaxiMinimalDeliveryOrders(
              WatchOptions$Query$GetTaxiMinimalDeliveryOrders options) =>
          this.watchQuery(options);
  void writeQuery$GetTaxiMinimalDeliveryOrders({
    required Query$GetTaxiMinimalDeliveryOrders data,
    required Variables$Query$GetTaxiMinimalDeliveryOrders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetTaxiMinimalDeliveryOrders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetTaxiMinimalDeliveryOrders? readQuery$GetTaxiMinimalDeliveryOrders({
    required Variables$Query$GetTaxiMinimalDeliveryOrders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetTaxiMinimalDeliveryOrders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetTaxiMinimalDeliveryOrders.fromJson(result);
  }
}

class Query$GetTaxiMinimalDeliveryOrders$taxi_order {
  Query$GetTaxiMinimalDeliveryOrders$taxi_order({
    required this.id,
    required this.status,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    required this.trip_polyline,
    required this.trip_distance,
    required this.trip_duration,
    required this.ride_cost,
    required this.car_type,
    required this.order_time,
    this.customer,
    required this.$__typename,
  });

  factory Query$GetTaxiMinimalDeliveryOrders$taxi_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$ride_cost = json['ride_cost'];
    final l$car_type = json['car_type'];
    final l$order_time = json['order_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$GetTaxiMinimalDeliveryOrders$taxi_order(
      id: (l$id as int),
      status: (l$status as String),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      trip_polyline: (l$trip_polyline as String),
      trip_distance: (l$trip_distance as int),
      trip_duration: (l$trip_duration as int),
      ride_cost: moneyFromJson(l$ride_cost),
      car_type: (l$car_type as String),
      order_time: (l$order_time as String),
      customer: l$customer == null
          ? null
          : Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String status;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String trip_polyline;

  final int trip_distance;

  final int trip_duration;

  final double ride_cost;

  final String car_type;

  final String order_time;

  final Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer? customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$ride_cost = ride_cost;
    _resultData['ride_cost'] = moneyToJson(l$ride_cost);
    final l$car_type = car_type;
    _resultData['car_type'] = l$car_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$trip_polyline = trip_polyline;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$ride_cost = ride_cost;
    final l$car_type = car_type;
    final l$order_time = order_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$trip_polyline,
      l$trip_distance,
      l$trip_duration,
      l$ride_cost,
      l$car_type,
      l$order_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTaxiMinimalDeliveryOrders$taxi_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$ride_cost = ride_cost;
    final lOther$ride_cost = other.ride_cost;
    if (l$ride_cost != lOther$ride_cost) {
      return false;
    }
    final l$car_type = car_type;
    final lOther$car_type = other.car_type;
    if (l$car_type != lOther$car_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
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

extension UtilityExtension$Query$GetTaxiMinimalDeliveryOrders$taxi_order
    on Query$GetTaxiMinimalDeliveryOrders$taxi_order {
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<
          Query$GetTaxiMinimalDeliveryOrders$taxi_order>
      get copyWith => CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<TRes> {
  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order(
    Query$GetTaxiMinimalDeliveryOrders$taxi_order instance,
    TRes Function(Query$GetTaxiMinimalDeliveryOrders$taxi_order) then,
  ) = _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order;

  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order;

  TRes call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order<TRes>
    implements CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<TRes> {
  _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order(
    this._instance,
    this._then,
  );

  final Query$GetTaxiMinimalDeliveryOrders$taxi_order _instance;

  final TRes Function(Query$GetTaxiMinimalDeliveryOrders$taxi_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? ride_cost = _undefined,
    Object? car_type = _undefined,
    Object? order_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTaxiMinimalDeliveryOrders$taxi_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        pickup_gps: pickup_gps == _undefined || pickup_gps == null
            ? _instance.pickup_gps
            : (pickup_gps as Geography),
        pickup_address: pickup_address == _undefined || pickup_address == null
            ? _instance.pickup_address
            : (pickup_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        trip_polyline: trip_polyline == _undefined || trip_polyline == null
            ? _instance.trip_polyline
            : (trip_polyline as String),
        trip_distance: trip_distance == _undefined || trip_distance == null
            ? _instance.trip_distance
            : (trip_distance as int),
        trip_duration: trip_duration == _undefined || trip_duration == null
            ? _instance.trip_duration
            : (trip_duration as int),
        ride_cost: ride_cost == _undefined || ride_cost == null
            ? _instance.ride_cost
            : (ride_cost as double),
        car_type: car_type == _undefined || car_type == null
            ? _instance.car_type
            : (car_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer.stub(
            _then(_instance))
        : CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order<TRes>
    implements CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order<TRes> {
  _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order(this._res);

  TRes _res;

  call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes>
      get customer =>
          CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer.stub(
              _res);
}

class Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer {
  Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
      user:
          Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user user;

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
    if (!(other is Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer) ||
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

extension UtilityExtension$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer
    on Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer {
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<
          Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer>
      get copyWith =>
          CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<
    TRes> {
  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer instance,
    TRes Function(Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer) then,
  ) = _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer;

  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer;

  TRes call({
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes>
    implements
        CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes> {
  _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
    this._instance,
    this._then,
  );

  final Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer _instance;

  final TRes Function(Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<
        TRes>
    implements
        CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer<TRes> {
  _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer(
      this._res);

  TRes _res;

  call({
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<TRes>
      get user =>
          CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user
              .stub(_res);
}

class Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user {
  Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user({
    this.image,
    this.name,
    required this.id,
    this.phone,
    required this.$__typename,
  });

  factory Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user) ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user
    on Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user {
  CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
          Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user>
      get copyWith =>
          CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
    TRes> {
  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
    Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user instance,
    TRes Function(Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user;

  factory CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
        TRes>
    implements
        CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user _instance;

  final TRes Function(
      Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
        TRes>
    implements
        CopyWith$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$GetTaxiMinimalDeliveryOrders$taxi_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$ListenTaxiMinimalDeliveryOrders {
  factory Variables$Subscription$ListenTaxiMinimalDeliveryOrders({
    required String status,
    required int limit,
    required int offset,
    required Input$Int_comparison_exp driver_id,
  }) =>
      Variables$Subscription$ListenTaxiMinimalDeliveryOrders._({
        r'status': status,
        r'limit': limit,
        r'offset': offset,
        r'driver_id': driver_id,
      });

  Variables$Subscription$ListenTaxiMinimalDeliveryOrders._(this._$data);

  factory Variables$Subscription$ListenTaxiMinimalDeliveryOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$status = data['status'];
    result$data['status'] = (l$status as String);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    final l$driver_id = data['driver_id'];
    result$data['driver_id'] = Input$Int_comparison_exp.fromJson(
        (l$driver_id as Map<String, dynamic>));
    return Variables$Subscription$ListenTaxiMinimalDeliveryOrders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  String get status => (_$data['status'] as String);
  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Input$Int_comparison_exp get driver_id =>
      (_$data['driver_id'] as Input$Int_comparison_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$status = status;
    result$data['status'] = l$status;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    final l$driver_id = driver_id;
    result$data['driver_id'] = l$driver_id.toJson();
    return result$data;
  }

  CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<
          Variables$Subscription$ListenTaxiMinimalDeliveryOrders>
      get copyWith =>
          CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$ListenTaxiMinimalDeliveryOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$limit = limit;
    final l$offset = offset;
    final l$driver_id = driver_id;
    return Object.hashAll([
      l$status,
      l$limit,
      l$offset,
      l$driver_id,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<
    TRes> {
  factory CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
    Variables$Subscription$ListenTaxiMinimalDeliveryOrders instance,
    TRes Function(Variables$Subscription$ListenTaxiMinimalDeliveryOrders) then,
  ) = _CopyWithImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders;

  factory CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders;

  TRes call({
    String? status,
    int? limit,
    int? offset,
    Input$Int_comparison_exp? driver_id,
  });
}

class _CopyWithImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<TRes>
    implements
        CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ListenTaxiMinimalDeliveryOrders _instance;

  final TRes Function(Variables$Subscription$ListenTaxiMinimalDeliveryOrders)
      _then;

  static const _undefined = {};

  TRes call({
    Object? status = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? driver_id = _undefined,
  }) =>
      _then(Variables$Subscription$ListenTaxiMinimalDeliveryOrders._({
        ..._instance._$data,
        if (status != _undefined && status != null)
          'status': (status as String),
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
        if (driver_id != _undefined && driver_id != null)
          'driver_id': (driver_id as Input$Int_comparison_exp),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<
        TRes>
    implements
        CopyWith$Variables$Subscription$ListenTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ListenTaxiMinimalDeliveryOrders(
      this._res);

  TRes _res;

  call({
    String? status,
    int? limit,
    int? offset,
    Input$Int_comparison_exp? driver_id,
  }) =>
      _res;
}

class Subscription$ListenTaxiMinimalDeliveryOrders {
  Subscription$ListenTaxiMinimalDeliveryOrders({
    required this.taxi_order,
    required this.$__typename,
  });

  factory Subscription$ListenTaxiMinimalDeliveryOrders.fromJson(
      Map<String, dynamic> json) {
    final l$taxi_order = json['taxi_order'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenTaxiMinimalDeliveryOrders(
      taxi_order: (l$taxi_order as List<dynamic>)
          .map((e) =>
              Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>
      taxi_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$taxi_order = taxi_order;
    _resultData['taxi_order'] = l$taxi_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$taxi_order = taxi_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$taxi_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenTaxiMinimalDeliveryOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$taxi_order = taxi_order;
    final lOther$taxi_order = other.taxi_order;
    if (l$taxi_order.length != lOther$taxi_order.length) {
      return false;
    }
    for (int i = 0; i < l$taxi_order.length; i++) {
      final l$taxi_order$entry = l$taxi_order[i];
      final lOther$taxi_order$entry = lOther$taxi_order[i];
      if (l$taxi_order$entry != lOther$taxi_order$entry) {
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

extension UtilityExtension$Subscription$ListenTaxiMinimalDeliveryOrders
    on Subscription$ListenTaxiMinimalDeliveryOrders {
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders<
          Subscription$ListenTaxiMinimalDeliveryOrders>
      get copyWith => CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders<TRes> {
  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders(
    Subscription$ListenTaxiMinimalDeliveryOrders instance,
    TRes Function(Subscription$ListenTaxiMinimalDeliveryOrders) then,
  ) = _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders;

  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders;

  TRes call({
    List<Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>? taxi_order,
    String? $__typename,
  });
  TRes taxi_order(
      Iterable<Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order> Function(
              Iterable<
                  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
                      Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders(
    this._instance,
    this._then,
  );

  final Subscription$ListenTaxiMinimalDeliveryOrders _instance;

  final TRes Function(Subscription$ListenTaxiMinimalDeliveryOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? taxi_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenTaxiMinimalDeliveryOrders(
        taxi_order: taxi_order == _undefined || taxi_order == null
            ? _instance.taxi_order
            : (taxi_order as List<
                Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes taxi_order(
          Iterable<Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order> Function(
                  Iterable<
                      CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
                          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>>)
              _fn) =>
      call(
          taxi_order: _fn(_instance.taxi_order.map((e) =>
              CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders<TRes>
    implements CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders<TRes> {
  _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders(this._res);

  TRes _res;

  call({
    List<Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>? taxi_order,
    String? $__typename,
  }) =>
      _res;
  taxi_order(_fn) => _res;
}

const documentNodeSubscriptionListenTaxiMinimalDeliveryOrders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenTaxiMinimalDeliveryOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driver_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int_comparison_exp'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'taxi_order'),
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
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'order_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'driver_id'),
                value: VariableNode(name: NameNode(value: 'driver_id')),
              ),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_polyline'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ride_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
Subscription$ListenTaxiMinimalDeliveryOrders
    _parserFn$Subscription$ListenTaxiMinimalDeliveryOrders(
            Map<String, dynamic> data) =>
        Subscription$ListenTaxiMinimalDeliveryOrders.fromJson(data);

class Options$Subscription$ListenTaxiMinimalDeliveryOrders extends graphql
    .SubscriptionOptions<Subscription$ListenTaxiMinimalDeliveryOrders> {
  Options$Subscription$ListenTaxiMinimalDeliveryOrders({
    String? operationName,
    required Variables$Subscription$ListenTaxiMinimalDeliveryOrders variables,
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
          document: documentNodeSubscriptionListenTaxiMinimalDeliveryOrders,
          parserFn: _parserFn$Subscription$ListenTaxiMinimalDeliveryOrders,
        );
}

class WatchOptions$Subscription$ListenTaxiMinimalDeliveryOrders extends graphql
    .WatchQueryOptions<Subscription$ListenTaxiMinimalDeliveryOrders> {
  WatchOptions$Subscription$ListenTaxiMinimalDeliveryOrders({
    String? operationName,
    required Variables$Subscription$ListenTaxiMinimalDeliveryOrders variables,
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
          document: documentNodeSubscriptionListenTaxiMinimalDeliveryOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenTaxiMinimalDeliveryOrders,
        );
}

class FetchMoreOptions$Subscription$ListenTaxiMinimalDeliveryOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenTaxiMinimalDeliveryOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$ListenTaxiMinimalDeliveryOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionListenTaxiMinimalDeliveryOrders,
        );
}

extension ClientExtension$Subscription$ListenTaxiMinimalDeliveryOrders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenTaxiMinimalDeliveryOrders>>
      subscribe$ListenTaxiMinimalDeliveryOrders(
              Options$Subscription$ListenTaxiMinimalDeliveryOrders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$ListenTaxiMinimalDeliveryOrders>
      watchSubscription$ListenTaxiMinimalDeliveryOrders(
              WatchOptions$Subscription$ListenTaxiMinimalDeliveryOrders
                  options) =>
          this.watchQuery(options);
}

class Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order {
  Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order({
    required this.id,
    required this.status,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    required this.trip_polyline,
    required this.trip_distance,
    required this.trip_duration,
    required this.ride_cost,
    required this.car_type,
    required this.order_time,
    this.customer,
    required this.$__typename,
  });

  factory Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$ride_cost = json['ride_cost'];
    final l$car_type = json['car_type'];
    final l$order_time = json['order_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
      id: (l$id as int),
      status: (l$status as String),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      trip_polyline: (l$trip_polyline as String),
      trip_distance: (l$trip_distance as int),
      trip_duration: (l$trip_duration as int),
      ride_cost: moneyFromJson(l$ride_cost),
      car_type: (l$car_type as String),
      order_time: (l$order_time as String),
      customer: l$customer == null
          ? null
          : Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String status;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String trip_polyline;

  final int trip_distance;

  final int trip_duration;

  final double ride_cost;

  final String car_type;

  final String order_time;

  final Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$ride_cost = ride_cost;
    _resultData['ride_cost'] = moneyToJson(l$ride_cost);
    final l$car_type = car_type;
    _resultData['car_type'] = l$car_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$trip_polyline = trip_polyline;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$ride_cost = ride_cost;
    final l$car_type = car_type;
    final l$order_time = order_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$trip_polyline,
      l$trip_distance,
      l$trip_duration,
      l$ride_cost,
      l$car_type,
      l$order_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$ride_cost = ride_cost;
    final lOther$ride_cost = other.ride_cost;
    if (l$ride_cost != lOther$ride_cost) {
      return false;
    }
    final l$car_type = car_type;
    final lOther$car_type = other.car_type;
    if (l$car_type != lOther$car_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
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

extension UtilityExtension$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order
    on Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order {
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order>
      get copyWith =>
          CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
    TRes> {
  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order instance,
    TRes Function(Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order) then,
  ) = _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order;

  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order;

  TRes call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<TRes> {
  _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
    this._instance,
    this._then,
  );

  final Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order _instance;

  final TRes Function(Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? ride_cost = _undefined,
    Object? car_type = _undefined,
    Object? order_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        pickup_gps: pickup_gps == _undefined || pickup_gps == null
            ? _instance.pickup_gps
            : (pickup_gps as Geography),
        pickup_address: pickup_address == _undefined || pickup_address == null
            ? _instance.pickup_address
            : (pickup_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        trip_polyline: trip_polyline == _undefined || trip_polyline == null
            ? _instance.trip_polyline
            : (trip_polyline as String),
        trip_distance: trip_distance == _undefined || trip_distance == null
            ? _instance.trip_distance
            : (trip_distance as int),
        trip_duration: trip_duration == _undefined || trip_duration == null
            ? _instance.trip_duration
            : (trip_duration as int),
        ride_cost: ride_cost == _undefined || ride_cost == null
            ? _instance.ride_cost
            : (ride_cost as double),
        car_type: car_type == _undefined || car_type == null
            ? _instance.car_type
            : (car_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order<TRes> {
  _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer
              .stub(_res);
}

class Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer {
  Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
      user:
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
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
            is Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer) ||
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

extension UtilityExtension$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer
    on Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer {
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer>
      get copyWith =>
          CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
    TRes> {
  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer instance,
    TRes Function(
            Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer;

  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer;

  TRes call({
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer
      _instance;

  final TRes Function(
      Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
              .stub(_res);
}

class Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user {
  Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user({
    this.image,
    this.name,
    required this.id,
    this.phone,
    required this.$__typename,
  });

  factory Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user) ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
    on Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user {
  CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
    Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
        instance,
    TRes Function(
            Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user;

  factory CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user
      _instance;

  final TRes Function(
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenTaxiMinimalDeliveryOrders$taxi_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_taxi_order {
  factory Variables$Query$get_taxi_order({required int orderId}) =>
      Variables$Query$get_taxi_order._({
        r'orderId': orderId,
      });

  Variables$Query$get_taxi_order._(this._$data);

  factory Variables$Query$get_taxi_order.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_taxi_order._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_taxi_order<Variables$Query$get_taxi_order>
      get copyWith => CopyWith$Variables$Query$get_taxi_order(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_taxi_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    return Object.hashAll([l$orderId]);
  }
}

abstract class CopyWith$Variables$Query$get_taxi_order<TRes> {
  factory CopyWith$Variables$Query$get_taxi_order(
    Variables$Query$get_taxi_order instance,
    TRes Function(Variables$Query$get_taxi_order) then,
  ) = _CopyWithImpl$Variables$Query$get_taxi_order;

  factory CopyWith$Variables$Query$get_taxi_order.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_taxi_order;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_taxi_order<TRes>
    implements CopyWith$Variables$Query$get_taxi_order<TRes> {
  _CopyWithImpl$Variables$Query$get_taxi_order(
    this._instance,
    this._then,
  );

  final Variables$Query$get_taxi_order _instance;

  final TRes Function(Variables$Query$get_taxi_order) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_taxi_order._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_taxi_order<TRes>
    implements CopyWith$Variables$Query$get_taxi_order<TRes> {
  _CopyWithStubImpl$Variables$Query$get_taxi_order(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_taxi_order {
  Query$get_taxi_order({
    this.taxi_order_by_pk,
    required this.$__typename,
  });

  factory Query$get_taxi_order.fromJson(Map<String, dynamic> json) {
    final l$taxi_order_by_pk = json['taxi_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order(
      taxi_order_by_pk: l$taxi_order_by_pk == null
          ? null
          : Query$get_taxi_order$taxi_order_by_pk.fromJson(
              (l$taxi_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_taxi_order$taxi_order_by_pk? taxi_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$taxi_order_by_pk = taxi_order_by_pk;
    _resultData['taxi_order_by_pk'] = l$taxi_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$taxi_order_by_pk = taxi_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$taxi_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_taxi_order) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$taxi_order_by_pk = taxi_order_by_pk;
    final lOther$taxi_order_by_pk = other.taxi_order_by_pk;
    if (l$taxi_order_by_pk != lOther$taxi_order_by_pk) {
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

extension UtilityExtension$Query$get_taxi_order on Query$get_taxi_order {
  CopyWith$Query$get_taxi_order<Query$get_taxi_order> get copyWith =>
      CopyWith$Query$get_taxi_order(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_taxi_order<TRes> {
  factory CopyWith$Query$get_taxi_order(
    Query$get_taxi_order instance,
    TRes Function(Query$get_taxi_order) then,
  ) = _CopyWithImpl$Query$get_taxi_order;

  factory CopyWith$Query$get_taxi_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order;

  TRes call({
    Query$get_taxi_order$taxi_order_by_pk? taxi_order_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> get taxi_order_by_pk;
}

class _CopyWithImpl$Query$get_taxi_order<TRes>
    implements CopyWith$Query$get_taxi_order<TRes> {
  _CopyWithImpl$Query$get_taxi_order(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order _instance;

  final TRes Function(Query$get_taxi_order) _then;

  static const _undefined = {};

  TRes call({
    Object? taxi_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order(
        taxi_order_by_pk: taxi_order_by_pk == _undefined
            ? _instance.taxi_order_by_pk
            : (taxi_order_by_pk as Query$get_taxi_order$taxi_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> get taxi_order_by_pk {
    final local$taxi_order_by_pk = _instance.taxi_order_by_pk;
    return local$taxi_order_by_pk == null
        ? CopyWith$Query$get_taxi_order$taxi_order_by_pk.stub(_then(_instance))
        : CopyWith$Query$get_taxi_order$taxi_order_by_pk(
            local$taxi_order_by_pk, (e) => call(taxi_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_taxi_order<TRes>
    implements CopyWith$Query$get_taxi_order<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order(this._res);

  TRes _res;

  call({
    Query$get_taxi_order$taxi_order_by_pk? taxi_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> get taxi_order_by_pk =>
      CopyWith$Query$get_taxi_order$taxi_order_by_pk.stub(_res);
}

const documentNodeQueryget_taxi_order = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_taxi_order'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
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
        name: NameNode(value: 'taxi_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'orderId')),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_polyline'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ride_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
            name: NameNode(value: 'driver'),
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
Query$get_taxi_order _parserFn$Query$get_taxi_order(
        Map<String, dynamic> data) =>
    Query$get_taxi_order.fromJson(data);

class Options$Query$get_taxi_order
    extends graphql.QueryOptions<Query$get_taxi_order> {
  Options$Query$get_taxi_order({
    String? operationName,
    required Variables$Query$get_taxi_order variables,
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
          document: documentNodeQueryget_taxi_order,
          parserFn: _parserFn$Query$get_taxi_order,
        );
}

class WatchOptions$Query$get_taxi_order
    extends graphql.WatchQueryOptions<Query$get_taxi_order> {
  WatchOptions$Query$get_taxi_order({
    String? operationName,
    required Variables$Query$get_taxi_order variables,
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
          document: documentNodeQueryget_taxi_order,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_taxi_order,
        );
}

class FetchMoreOptions$Query$get_taxi_order extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_taxi_order({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_taxi_order variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_taxi_order,
        );
}

extension ClientExtension$Query$get_taxi_order on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_taxi_order>> query$get_taxi_order(
          Options$Query$get_taxi_order options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_taxi_order> watchQuery$get_taxi_order(
          WatchOptions$Query$get_taxi_order options) =>
      this.watchQuery(options);
  void writeQuery$get_taxi_order({
    required Query$get_taxi_order data,
    required Variables$Query$get_taxi_order variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_taxi_order),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_taxi_order? readQuery$get_taxi_order({
    required Variables$Query$get_taxi_order variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryget_taxi_order),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_taxi_order.fromJson(result);
  }
}

class Query$get_taxi_order$taxi_order_by_pk {
  Query$get_taxi_order$taxi_order_by_pk({
    required this.id,
    required this.status,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    required this.trip_polyline,
    required this.trip_distance,
    required this.trip_duration,
    required this.ride_cost,
    required this.car_type,
    required this.order_time,
    this.customer,
    this.driver,
    required this.$__typename,
  });

  factory Query$get_taxi_order$taxi_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$ride_cost = json['ride_cost'];
    final l$car_type = json['car_type'];
    final l$order_time = json['order_time'];
    final l$customer = json['customer'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order$taxi_order_by_pk(
      id: (l$id as int),
      status: (l$status as String),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      trip_polyline: (l$trip_polyline as String),
      trip_distance: (l$trip_distance as int),
      trip_duration: (l$trip_duration as int),
      ride_cost: moneyFromJson(l$ride_cost),
      car_type: (l$car_type as String),
      order_time: (l$order_time as String),
      customer: l$customer == null
          ? null
          : Query$get_taxi_order$taxi_order_by_pk$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      driver: l$driver == null
          ? null
          : Query$get_taxi_order$taxi_order_by_pk$driver.fromJson(
              (l$driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String status;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String trip_polyline;

  final int trip_distance;

  final int trip_duration;

  final double ride_cost;

  final String car_type;

  final String order_time;

  final Query$get_taxi_order$taxi_order_by_pk$customer? customer;

  final Query$get_taxi_order$taxi_order_by_pk$driver? driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$ride_cost = ride_cost;
    _resultData['ride_cost'] = moneyToJson(l$ride_cost);
    final l$car_type = car_type;
    _resultData['car_type'] = l$car_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$trip_polyline = trip_polyline;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$ride_cost = ride_cost;
    final l$car_type = car_type;
    final l$order_time = order_time;
    final l$customer = customer;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$trip_polyline,
      l$trip_distance,
      l$trip_duration,
      l$ride_cost,
      l$car_type,
      l$order_time,
      l$customer,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_taxi_order$taxi_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$ride_cost = ride_cost;
    final lOther$ride_cost = other.ride_cost;
    if (l$ride_cost != lOther$ride_cost) {
      return false;
    }
    final l$car_type = car_type;
    final lOther$car_type = other.car_type;
    if (l$car_type != lOther$car_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Query$get_taxi_order$taxi_order_by_pk
    on Query$get_taxi_order$taxi_order_by_pk {
  CopyWith$Query$get_taxi_order$taxi_order_by_pk<
          Query$get_taxi_order$taxi_order_by_pk>
      get copyWith => CopyWith$Query$get_taxi_order$taxi_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> {
  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk(
    Query$get_taxi_order$taxi_order_by_pk instance,
    TRes Function(Query$get_taxi_order$taxi_order_by_pk) then,
  ) = _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk;

  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk;

  TRes call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Query$get_taxi_order$taxi_order_by_pk$customer? customer,
    Query$get_taxi_order$taxi_order_by_pk$driver? driver,
    String? $__typename,
  });
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> get customer;
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> get driver;
}

class _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> {
  _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order$taxi_order_by_pk _instance;

  final TRes Function(Query$get_taxi_order$taxi_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? ride_cost = _undefined,
    Object? car_type = _undefined,
    Object? order_time = _undefined,
    Object? customer = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order$taxi_order_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        pickup_gps: pickup_gps == _undefined || pickup_gps == null
            ? _instance.pickup_gps
            : (pickup_gps as Geography),
        pickup_address: pickup_address == _undefined || pickup_address == null
            ? _instance.pickup_address
            : (pickup_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        trip_polyline: trip_polyline == _undefined || trip_polyline == null
            ? _instance.trip_polyline
            : (trip_polyline as String),
        trip_distance: trip_distance == _undefined || trip_distance == null
            ? _instance.trip_distance
            : (trip_distance as int),
        trip_duration: trip_duration == _undefined || trip_duration == null
            ? _instance.trip_duration
            : (trip_duration as int),
        ride_cost: ride_cost == _undefined || ride_cost == null
            ? _instance.ride_cost
            : (ride_cost as double),
        car_type: car_type == _undefined || car_type == null
            ? _instance.car_type
            : (car_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer as Query$get_taxi_order$taxi_order_by_pk$customer?),
        driver: driver == _undefined
            ? _instance.driver
            : (driver as Query$get_taxi_order$taxi_order_by_pk$driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer.stub(
            _then(_instance))
        : CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer(
            local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver.stub(
            _then(_instance))
        : CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver(
            local$driver, (e) => call(driver: e));
  }
}

class _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    String? status,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? trip_polyline,
    int? trip_distance,
    int? trip_duration,
    double? ride_cost,
    String? car_type,
    String? order_time,
    Query$get_taxi_order$taxi_order_by_pk$customer? customer,
    Query$get_taxi_order$taxi_order_by_pk$driver? driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> get customer =>
      CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer.stub(_res);
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> get driver =>
      CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver.stub(_res);
}

class Query$get_taxi_order$taxi_order_by_pk$customer {
  Query$get_taxi_order$taxi_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_taxi_order$taxi_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order$taxi_order_by_pk$customer(
      user: Query$get_taxi_order$taxi_order_by_pk$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_taxi_order$taxi_order_by_pk$customer$user user;

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
    if (!(other is Query$get_taxi_order$taxi_order_by_pk$customer) ||
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

extension UtilityExtension$Query$get_taxi_order$taxi_order_by_pk$customer
    on Query$get_taxi_order$taxi_order_by_pk$customer {
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<
          Query$get_taxi_order$taxi_order_by_pk$customer>
      get copyWith => CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> {
  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer(
    Query$get_taxi_order$taxi_order_by_pk$customer instance,
    TRes Function(Query$get_taxi_order$taxi_order_by_pk$customer) then,
  ) = _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer;

  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer;

  TRes call({
    Query$get_taxi_order$taxi_order_by_pk$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes> get user;
}

class _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> {
  _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order$taxi_order_by_pk$customer _instance;

  final TRes Function(Query$get_taxi_order$taxi_order_by_pk$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order$taxi_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_taxi_order$taxi_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer(this._res);

  TRes _res;

  call({
    Query$get_taxi_order$taxi_order_by_pk$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes> get user =>
      CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user.stub(_res);
}

class Query$get_taxi_order$taxi_order_by_pk$customer$user {
  Query$get_taxi_order$taxi_order_by_pk$customer$user({
    this.image,
    this.name,
    required this.id,
    this.phone,
    required this.$__typename,
  });

  factory Query$get_taxi_order$taxi_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order$taxi_order_by_pk$customer$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_taxi_order$taxi_order_by_pk$customer$user) ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$get_taxi_order$taxi_order_by_pk$customer$user
    on Query$get_taxi_order$taxi_order_by_pk$customer$user {
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<
          Query$get_taxi_order$taxi_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user(
    Query$get_taxi_order$taxi_order_by_pk$customer$user instance,
    TRes Function(Query$get_taxi_order$taxi_order_by_pk$customer$user) then,
  ) = _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user;

  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes>
    implements
        CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes> {
  _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order$taxi_order_by_pk$customer$user _instance;

  final TRes Function(Query$get_taxi_order$taxi_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order$taxi_order_by_pk$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_taxi_order$taxi_order_by_pk$customer$user<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_taxi_order$taxi_order_by_pk$driver {
  Query$get_taxi_order$taxi_order_by_pk$driver({
    this.user,
    required this.$__typename,
  });

  factory Query$get_taxi_order$taxi_order_by_pk$driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order$taxi_order_by_pk$driver(
      user: l$user == null
          ? null
          : Query$get_taxi_order$taxi_order_by_pk$driver$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_taxi_order$taxi_order_by_pk$driver$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
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
    if (!(other is Query$get_taxi_order$taxi_order_by_pk$driver) ||
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

extension UtilityExtension$Query$get_taxi_order$taxi_order_by_pk$driver
    on Query$get_taxi_order$taxi_order_by_pk$driver {
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<
          Query$get_taxi_order$taxi_order_by_pk$driver>
      get copyWith => CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> {
  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver(
    Query$get_taxi_order$taxi_order_by_pk$driver instance,
    TRes Function(Query$get_taxi_order$taxi_order_by_pk$driver) then,
  ) = _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver;

  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver.stub(TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver;

  TRes call({
    Query$get_taxi_order$taxi_order_by_pk$driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes> get user;
}

class _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> {
  _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order$taxi_order_by_pk$driver _instance;

  final TRes Function(Query$get_taxi_order$taxi_order_by_pk$driver) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order$taxi_order_by_pk$driver(
        user: user == _undefined
            ? _instance.user
            : (user as Query$get_taxi_order$taxi_order_by_pk$driver$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user.stub(
            _then(_instance))
        : CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver<TRes>
    implements CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver(this._res);

  TRes _res;

  call({
    Query$get_taxi_order$taxi_order_by_pk$driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes> get user =>
      CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user.stub(_res);
}

class Query$get_taxi_order$taxi_order_by_pk$driver$user {
  Query$get_taxi_order$taxi_order_by_pk$driver$user({
    this.image,
    this.name,
    required this.id,
    this.phone,
    required this.$__typename,
  });

  factory Query$get_taxi_order$taxi_order_by_pk$driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Query$get_taxi_order$taxi_order_by_pk$driver$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_taxi_order$taxi_order_by_pk$driver$user) ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$get_taxi_order$taxi_order_by_pk$driver$user
    on Query$get_taxi_order$taxi_order_by_pk$driver$user {
  CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<
          Query$get_taxi_order$taxi_order_by_pk$driver$user>
      get copyWith =>
          CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<
    TRes> {
  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user(
    Query$get_taxi_order$taxi_order_by_pk$driver$user instance,
    TRes Function(Query$get_taxi_order$taxi_order_by_pk$driver$user) then,
  ) = _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user;

  factory CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes>
    implements
        CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes> {
  _CopyWithImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user(
    this._instance,
    this._then,
  );

  final Query$get_taxi_order$taxi_order_by_pk$driver$user _instance;

  final TRes Function(Query$get_taxi_order$taxi_order_by_pk$driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_taxi_order$taxi_order_by_pk$driver$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes>
    implements
        CopyWith$Query$get_taxi_order$taxi_order_by_pk$driver$user<TRes> {
  _CopyWithStubImpl$Query$get_taxi_order$taxi_order_by_pk$driver$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_taxi_order_driver {
  factory Variables$Subscription$listen_taxi_order_driver(
          {required int orderId}) =>
      Variables$Subscription$listen_taxi_order_driver._({
        r'orderId': orderId,
      });

  Variables$Subscription$listen_taxi_order_driver._(this._$data);

  factory Variables$Subscription$listen_taxi_order_driver.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$listen_taxi_order_driver._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_taxi_order_driver<
          Variables$Subscription$listen_taxi_order_driver>
      get copyWith => CopyWith$Variables$Subscription$listen_taxi_order_driver(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_taxi_order_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    return Object.hashAll([l$orderId]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_taxi_order_driver<TRes> {
  factory CopyWith$Variables$Subscription$listen_taxi_order_driver(
    Variables$Subscription$listen_taxi_order_driver instance,
    TRes Function(Variables$Subscription$listen_taxi_order_driver) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_taxi_order_driver;

  factory CopyWith$Variables$Subscription$listen_taxi_order_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_taxi_order_driver;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$listen_taxi_order_driver<TRes>
    implements CopyWith$Variables$Subscription$listen_taxi_order_driver<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_taxi_order_driver(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_taxi_order_driver _instance;

  final TRes Function(Variables$Subscription$listen_taxi_order_driver) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$listen_taxi_order_driver._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_taxi_order_driver<TRes>
    implements CopyWith$Variables$Subscription$listen_taxi_order_driver<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_taxi_order_driver(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$listen_taxi_order_driver {
  Subscription$listen_taxi_order_driver({
    this.taxi_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_taxi_order_driver.fromJson(
      Map<String, dynamic> json) {
    final l$taxi_order_by_pk = json['taxi_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_taxi_order_driver(
      taxi_order_by_pk: l$taxi_order_by_pk == null
          ? null
          : Subscription$listen_taxi_order_driver$taxi_order_by_pk.fromJson(
              (l$taxi_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk?
      taxi_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$taxi_order_by_pk = taxi_order_by_pk;
    _resultData['taxi_order_by_pk'] = l$taxi_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$taxi_order_by_pk = taxi_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$taxi_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_taxi_order_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$taxi_order_by_pk = taxi_order_by_pk;
    final lOther$taxi_order_by_pk = other.taxi_order_by_pk;
    if (l$taxi_order_by_pk != lOther$taxi_order_by_pk) {
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

extension UtilityExtension$Subscription$listen_taxi_order_driver
    on Subscription$listen_taxi_order_driver {
  CopyWith$Subscription$listen_taxi_order_driver<
          Subscription$listen_taxi_order_driver>
      get copyWith => CopyWith$Subscription$listen_taxi_order_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_taxi_order_driver<TRes> {
  factory CopyWith$Subscription$listen_taxi_order_driver(
    Subscription$listen_taxi_order_driver instance,
    TRes Function(Subscription$listen_taxi_order_driver) then,
  ) = _CopyWithImpl$Subscription$listen_taxi_order_driver;

  factory CopyWith$Subscription$listen_taxi_order_driver.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_taxi_order_driver;

  TRes call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk? taxi_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes>
      get taxi_order_by_pk;
}

class _CopyWithImpl$Subscription$listen_taxi_order_driver<TRes>
    implements CopyWith$Subscription$listen_taxi_order_driver<TRes> {
  _CopyWithImpl$Subscription$listen_taxi_order_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_taxi_order_driver _instance;

  final TRes Function(Subscription$listen_taxi_order_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? taxi_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_taxi_order_driver(
        taxi_order_by_pk: taxi_order_by_pk == _undefined
            ? _instance.taxi_order_by_pk
            : (taxi_order_by_pk
                as Subscription$listen_taxi_order_driver$taxi_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes>
      get taxi_order_by_pk {
    final local$taxi_order_by_pk = _instance.taxi_order_by_pk;
    return local$taxi_order_by_pk == null
        ? CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk.stub(
            _then(_instance))
        : CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk(
            local$taxi_order_by_pk, (e) => call(taxi_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_taxi_order_driver<TRes>
    implements CopyWith$Subscription$listen_taxi_order_driver<TRes> {
  _CopyWithStubImpl$Subscription$listen_taxi_order_driver(this._res);

  TRes _res;

  call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk? taxi_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes>
      get taxi_order_by_pk =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk.stub(
              _res);
}

const documentNodeSubscriptionlisten_taxi_order_driver =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_taxi_order_driver'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
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
        name: NameNode(value: 'taxi_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'orderId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'driver'),
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
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
Subscription$listen_taxi_order_driver
    _parserFn$Subscription$listen_taxi_order_driver(
            Map<String, dynamic> data) =>
        Subscription$listen_taxi_order_driver.fromJson(data);

class Options$Subscription$listen_taxi_order_driver
    extends graphql.SubscriptionOptions<Subscription$listen_taxi_order_driver> {
  Options$Subscription$listen_taxi_order_driver({
    String? operationName,
    required Variables$Subscription$listen_taxi_order_driver variables,
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
          document: documentNodeSubscriptionlisten_taxi_order_driver,
          parserFn: _parserFn$Subscription$listen_taxi_order_driver,
        );
}

class WatchOptions$Subscription$listen_taxi_order_driver
    extends graphql.WatchQueryOptions<Subscription$listen_taxi_order_driver> {
  WatchOptions$Subscription$listen_taxi_order_driver({
    String? operationName,
    required Variables$Subscription$listen_taxi_order_driver variables,
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
          document: documentNodeSubscriptionlisten_taxi_order_driver,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_taxi_order_driver,
        );
}

class FetchMoreOptions$Subscription$listen_taxi_order_driver
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_taxi_order_driver({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_taxi_order_driver variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_taxi_order_driver,
        );
}

extension ClientExtension$Subscription$listen_taxi_order_driver
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_taxi_order_driver>>
      subscribe$listen_taxi_order_driver(
              Options$Subscription$listen_taxi_order_driver options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_taxi_order_driver>
      watchSubscription$listen_taxi_order_driver(
              WatchOptions$Subscription$listen_taxi_order_driver options) =>
          this.watchQuery(options);
}

class Subscription$listen_taxi_order_driver$taxi_order_by_pk {
  Subscription$listen_taxi_order_driver$taxi_order_by_pk({
    this.driver,
    required this.$__typename,
  });

  factory Subscription$listen_taxi_order_driver$taxi_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_taxi_order_driver$taxi_order_by_pk(
      driver: l$driver == null
          ? null
          : Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver
              .fromJson((l$driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver? driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_taxi_order_driver$taxi_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Subscription$listen_taxi_order_driver$taxi_order_by_pk
    on Subscription$listen_taxi_order_driver$taxi_order_by_pk {
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<
          Subscription$listen_taxi_order_driver$taxi_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk(
    Subscription$listen_taxi_order_driver$taxi_order_by_pk instance,
    TRes Function(Subscription$listen_taxi_order_driver$taxi_order_by_pk) then,
  ) = _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk;

  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk;

  TRes call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver? driver,
    String? $__typename,
  });
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<TRes>
      get driver;
}

class _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes> {
  _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk _instance;

  final TRes Function(Subscription$listen_taxi_order_driver$taxi_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_taxi_order_driver$taxi_order_by_pk(
        driver: driver == _undefined
            ? _instance.driver
            : (driver
                as Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<TRes>
      get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
            local$driver, (e) => call(driver: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk(
      this._res);

  TRes _res;

  call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver? driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<TRes>
      get driver =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver
              .stub(_res);
}

class Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver {
  Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver({
    this.user,
    required this.$__typename,
  });

  factory Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
      user: l$user == null
          ? null
          : Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user?
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
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
            is Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver) ||
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

extension UtilityExtension$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver
    on Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver {
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
          Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver>
      get copyWith =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
    TRes> {
  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver instance,
    TRes Function(Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver;

  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver;

  TRes call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
        TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver _instance;

  final TRes Function(
      Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
        user: user == _undefined
            ? _instance.user
            : (user
                as Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
            local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
        TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver(
      this._res);

  TRes _res;

  call({
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user
              .stub(_res);
}

class Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user {
  Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user({
    this.image,
    this.name,
    required this.id,
    this.phone,
    required this.$__typename,
  });

  factory Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user) ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user
    on Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user {
  CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
          Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user>
      get copyWith =>
          CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
    TRes> {
  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
    Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user instance,
    TRes Function(
            Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user;

  factory CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user
      _instance;

  final TRes Function(
      Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_taxi_order_driver$taxi_order_by_pk$driver$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}
