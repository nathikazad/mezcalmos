import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Subscription$listen_on_delivery_orders {
  Subscription$listen_on_delivery_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_delivery_orders$delivery_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_delivery_orders$delivery_order>
      delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_delivery_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
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

extension UtilityExtension$Subscription$listen_on_delivery_orders
    on Subscription$listen_on_delivery_orders {
  CopyWith$Subscription$listen_on_delivery_orders<
          Subscription$listen_on_delivery_orders>
      get copyWith => CopyWith$Subscription$listen_on_delivery_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders<TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders(
    Subscription$listen_on_delivery_orders instance,
    TRes Function(Subscription$listen_on_delivery_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders;

  factory CopyWith$Subscription$listen_on_delivery_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders;

  TRes call({
    List<Subscription$listen_on_delivery_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$listen_on_delivery_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_delivery_orders$delivery_order<
                      Subscription$listen_on_delivery_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders<TRes>
    implements CopyWith$Subscription$listen_on_delivery_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders _instance;

  final TRes Function(Subscription$listen_on_delivery_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Subscription$listen_on_delivery_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$listen_on_delivery_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_delivery_orders$delivery_order<
                          Subscription$listen_on_delivery_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$listen_on_delivery_orders$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders<TRes>
    implements CopyWith$Subscription$listen_on_delivery_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_delivery_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_delivery_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_delivery_orders'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order'),
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
            name: NameNode(value: 'delivery_driver_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_delivered_time'),
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
            name: NameNode(value: 'customer_id'),
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
          FieldNode(
            name: NameNode(value: 'restaurant'),
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
                name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'delivery_driver'),
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
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
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
            name: NameNode(value: 'trip_polyline'),
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
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellation_time'),
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
Subscription$listen_on_delivery_orders
    _parserFn$Subscription$listen_on_delivery_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_delivery_orders.fromJson(data);

class Options$Subscription$listen_on_delivery_orders extends graphql
    .SubscriptionOptions<Subscription$listen_on_delivery_orders> {
  Options$Subscription$listen_on_delivery_orders({
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
          document: documentNodeSubscriptionlisten_on_delivery_orders,
          parserFn: _parserFn$Subscription$listen_on_delivery_orders,
        );
}

class WatchOptions$Subscription$listen_on_delivery_orders
    extends graphql.WatchQueryOptions<Subscription$listen_on_delivery_orders> {
  WatchOptions$Subscription$listen_on_delivery_orders({
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
          document: documentNodeSubscriptionlisten_on_delivery_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_delivery_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_delivery_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_delivery_orders(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionlisten_on_delivery_orders,
        );
}

extension ClientExtension$Subscription$listen_on_delivery_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_delivery_orders>>
      subscribe$listen_on_delivery_orders(
              [Options$Subscription$listen_on_delivery_orders? options]) =>
          this.subscribe(
              options ?? Options$Subscription$listen_on_delivery_orders());
  graphql.ObservableQuery<Subscription$listen_on_delivery_orders>
      watchSubscription$listen_on_delivery_orders(
              [WatchOptions$Subscription$listen_on_delivery_orders? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Subscription$listen_on_delivery_orders());
}

class Subscription$listen_on_delivery_orders$delivery_order {
  Subscription$listen_on_delivery_orders$delivery_order({
    required this.id,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    this.delivery_driver_type,
    this.delivery_driver_id,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.payment_type,
    this.stripe_payment_id,
    this.estimated_package_ready_time,
    this.actual_package_ready_time,
    this.estimated_arrival_at_pickup_time,
    this.actual_arrival_at_pickup_time,
    this.estimated_arrival_at_dropoff_time,
    this.actual_arrival_at_dropoff_time,
    this.actual_delivered_time,
    required this.status,
    required this.customer_id,
    required this.customer,
    this.restaurant,
    this.delivery_driver,
    this.service_provider_id,
    this.service_provider_type,
    this.trip_polyline,
    this.trip_duration,
    this.trip_distance,
    required this.delivery_cost,
    required this.package_cost,
    this.current_gps,
    required this.order_time,
    this.cancellation_time,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$delivery_driver_type = json['delivery_driver_type'];
    final l$delivery_driver_id = json['delivery_driver_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$payment_type = json['payment_type'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$status = json['status'];
    final l$customer_id = json['customer_id'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$delivery_driver = json['delivery_driver'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_distance = json['trip_distance'];
    final l$delivery_cost = json['delivery_cost'];
    final l$package_cost = json['package_cost'];
    final l$current_gps = json['current_gps'];
    final l$order_time = json['order_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order(
      id: (l$id as int),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      delivery_driver_type: (l$delivery_driver_type as String?),
      delivery_driver_id: (l$delivery_driver_id as int?),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      payment_type: (l$payment_type as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      actual_delivered_time: (l$actual_delivered_time as String?),
      status: (l$status as String),
      customer_id: (l$customer_id as int),
      customer: Subscription$listen_on_delivery_orders$delivery_order$customer
          .fromJson((l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Subscription$listen_on_delivery_orders$delivery_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      delivery_driver: l$delivery_driver == null
          ? null
          : Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      trip_polyline: (l$trip_polyline as String?),
      trip_duration: (l$trip_duration as int?),
      trip_distance: (l$trip_distance as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      package_cost: moneyFromJson(l$package_cost),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      order_time: (l$order_time as String),
      cancellation_time: (l$cancellation_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String? delivery_driver_type;

  final int? delivery_driver_id;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final String payment_type;

  final int? stripe_payment_id;

  final String? estimated_package_ready_time;

  final String? actual_package_ready_time;

  final String? estimated_arrival_at_pickup_time;

  final String? actual_arrival_at_pickup_time;

  final String? estimated_arrival_at_dropoff_time;

  final String? actual_arrival_at_dropoff_time;

  final String? actual_delivered_time;

  final String status;

  final int customer_id;

  final Subscription$listen_on_delivery_orders$delivery_order$customer customer;

  final Subscription$listen_on_delivery_orders$delivery_order$restaurant?
      restaurant;

  final Subscription$listen_on_delivery_orders$delivery_order$delivery_driver?
      delivery_driver;

  final int? service_provider_id;

  final String? service_provider_type;

  final String? trip_polyline;

  final int? trip_duration;

  final int? trip_distance;

  final double delivery_cost;

  final double package_cost;

  final Geography? current_gps;

  final String order_time;

  final String? cancellation_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    _resultData['delivery_driver_id'] = l$delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$payment_type = payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    final l$status = status;
    final l$customer_id = customer_id;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$delivery_driver = delivery_driver;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$trip_polyline = trip_polyline;
    final l$trip_duration = trip_duration;
    final l$trip_distance = trip_distance;
    final l$delivery_cost = delivery_cost;
    final l$package_cost = package_cost;
    final l$current_gps = current_gps;
    final l$order_time = order_time;
    final l$cancellation_time = cancellation_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$delivery_driver_type,
      l$delivery_driver_id,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$payment_type,
      l$stripe_payment_id,
      l$estimated_package_ready_time,
      l$actual_package_ready_time,
      l$estimated_arrival_at_pickup_time,
      l$actual_arrival_at_pickup_time,
      l$estimated_arrival_at_dropoff_time,
      l$actual_arrival_at_dropoff_time,
      l$actual_delivered_time,
      l$status,
      l$customer_id,
      l$customer,
      l$restaurant,
      l$delivery_driver,
      l$service_provider_id,
      l$service_provider_type,
      l$trip_polyline,
      l$trip_duration,
      l$trip_distance,
      l$delivery_cost,
      l$package_cost,
      l$current_gps,
      l$order_time,
      l$cancellation_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_delivery_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
      return false;
    }
    final l$delivery_driver_id = delivery_driver_id;
    final lOther$delivery_driver_id = other.delivery_driver_id;
    if (l$delivery_driver_id != lOther$delivery_driver_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order
    on Subscription$listen_on_delivery_orders$delivery_order {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order<
          Subscription$listen_on_delivery_orders$delivery_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order(
    Subscription$listen_on_delivery_orders$delivery_order instance,
    TRes Function(Subscription$listen_on_delivery_orders$delivery_order) then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order;

  TRes call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Subscription$listen_on_delivery_orders$delivery_order$customer? customer,
    Subscription$listen_on_delivery_orders$delivery_order$restaurant?
        restaurant,
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
      TRes> get restaurant;
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
      TRes> get delivery_driver;
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order<TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order<TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order _instance;

  final TRes Function(Subscription$listen_on_delivery_orders$delivery_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? delivery_driver_type = _undefined,
    Object? delivery_driver_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? payment_type = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? status = _undefined,
    Object? customer_id = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? delivery_driver = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_distance = _undefined,
    Object? delivery_cost = _undefined,
    Object? package_cost = _undefined,
    Object? current_gps = _undefined,
    Object? order_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
        delivery_driver_type: delivery_driver_type == _undefined
            ? _instance.delivery_driver_type
            : (delivery_driver_type as String?),
        delivery_driver_id: delivery_driver_id == _undefined
            ? _instance.delivery_driver_id
            : (delivery_driver_id as int?),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_delivery_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_delivery_orders$delivery_order$restaurant?),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Subscription$listen_on_delivery_orders$delivery_order$delivery_driver?),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Subscription$listen_on_delivery_orders$delivery_order$customer? customer,
    Subscription$listen_on_delivery_orders$delivery_order$restaurant?
        restaurant,
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant
              .stub(_res);
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
              .stub(_res);
}

class Subscription$listen_on_delivery_orders$delivery_order$customer {
  Subscription$listen_on_delivery_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order$customer(
      user: Subscription$listen_on_delivery_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_delivery_orders$delivery_order$customer$user
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
            is Subscription$listen_on_delivery_orders$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order$customer
    on Subscription$listen_on_delivery_orders$delivery_order$customer {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<
          Subscription$listen_on_delivery_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer(
    Subscription$listen_on_delivery_orders$delivery_order$customer instance,
    TRes Function(
            Subscription$listen_on_delivery_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer;

  TRes call({
    Subscription$listen_on_delivery_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order$customer
      _instance;

  final TRes Function(
      Subscription$listen_on_delivery_orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_delivery_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_delivery_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_delivery_orders$delivery_order$customer$user {
  Subscription$listen_on_delivery_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order$customer$user(
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
            is Subscription$listen_on_delivery_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order$customer$user
    on Subscription$listen_on_delivery_orders$delivery_order$customer$user {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
          Subscription$listen_on_delivery_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user(
    Subscription$listen_on_delivery_orders$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_delivery_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_delivery_orders$delivery_order$restaurant {
  Subscription$listen_on_delivery_orders$delivery_order$restaurant({
    required this.name,
    required this.image,
    required this.location_text,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$location_text = json['location_text'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order$restaurant(
      name: (l$name as String),
      image: (l$image as String),
      location_text: (l$location_text as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String location_text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$location_text = location_text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$location_text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_delivery_orders$delivery_order$restaurant) ||
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
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order$restaurant
    on Subscription$listen_on_delivery_orders$delivery_order$restaurant {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
          Subscription$listen_on_delivery_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant(
    Subscription$listen_on_delivery_orders$delivery_order$restaurant instance,
    TRes Function(
            Subscription$listen_on_delivery_orders$delivery_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant;

  TRes call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order$restaurant
      _instance;

  final TRes Function(
      Subscription$listen_on_delivery_orders$delivery_order$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? location_text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_orders$delivery_order$restaurant(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_delivery_orders$delivery_order$delivery_driver {
  Subscription$listen_on_delivery_orders$delivery_order$delivery_driver({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
      user:
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
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
            is Subscription$listen_on_delivery_orders$delivery_order$delivery_driver) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
    on Subscription$listen_on_delivery_orders$delivery_order$delivery_driver {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
        instance,
    TRes Function(
            Subscription$listen_on_delivery_orders$delivery_order$delivery_driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver;

  TRes call({
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order$delivery_driver
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
              .stub(_res);
}

class Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user {
  Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
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
            is Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
    on Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user {
  CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
    Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
        instance,
    TRes Function(
            Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user;

  factory CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_orders$delivery_order$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_delivery_order_by_id {
  factory Variables$Subscription$listen_on_delivery_order_by_id(
          {required int orderId}) =>
      Variables$Subscription$listen_on_delivery_order_by_id._({
        r'orderId': orderId,
      });

  Variables$Subscription$listen_on_delivery_order_by_id._(this._$data);

  factory Variables$Subscription$listen_on_delivery_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$listen_on_delivery_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_delivery_order_by_id<
          Variables$Subscription$listen_on_delivery_order_by_id>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_delivery_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_delivery_order_by_id) ||
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

abstract class CopyWith$Variables$Subscription$listen_on_delivery_order_by_id<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_delivery_order_by_id(
    Variables$Subscription$listen_on_delivery_order_by_id instance,
    TRes Function(Variables$Subscription$listen_on_delivery_order_by_id) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_delivery_order_by_id;

  factory CopyWith$Variables$Subscription$listen_on_delivery_order_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_delivery_order_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$listen_on_delivery_order_by_id<TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_delivery_order_by_id<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_delivery_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_delivery_order_by_id _instance;

  final TRes Function(Variables$Subscription$listen_on_delivery_order_by_id)
      _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$listen_on_delivery_order_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_delivery_order_by_id<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_delivery_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_delivery_order_by_id(
      this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$listen_on_delivery_order_by_id {
  Subscription$listen_on_delivery_order_by_id({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Subscription$listen_on_delivery_order_by_id$delivery_order
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_delivery_order_by_id$delivery_order>
      delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_delivery_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id
    on Subscription$listen_on_delivery_order_by_id {
  CopyWith$Subscription$listen_on_delivery_order_by_id<
          Subscription$listen_on_delivery_order_by_id>
      get copyWith => CopyWith$Subscription$listen_on_delivery_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id<TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id(
    Subscription$listen_on_delivery_order_by_id instance,
    TRes Function(Subscription$listen_on_delivery_order_by_id) then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id;

  TRes call({
    List<Subscription$listen_on_delivery_order_by_id$delivery_order>?
        delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$listen_on_delivery_order_by_id$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
                      Subscription$listen_on_delivery_order_by_id$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_delivery_order_by_id<TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id _instance;

  final TRes Function(Subscription$listen_on_delivery_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_order_by_id(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order as List<
                Subscription$listen_on_delivery_order_by_id$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$listen_on_delivery_order_by_id$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
                          Subscription$listen_on_delivery_order_by_id$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_delivery_order_by_id<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_delivery_order_by_id$delivery_order>?
        delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_delivery_order_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_delivery_order_by_id'),
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
        name: NameNode(value: 'delivery_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'orderId')),
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
            name: NameNode(value: 'delivery_driver_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_delivered_time'),
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
            name: NameNode(value: 'customer_id'),
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
                    name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'delivery_driver'),
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
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
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
            name: NameNode(value: 'trip_polyline'),
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
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellation_time'),
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
Subscription$listen_on_delivery_order_by_id
    _parserFn$Subscription$listen_on_delivery_order_by_id(
            Map<String, dynamic> data) =>
        Subscription$listen_on_delivery_order_by_id.fromJson(data);

class Options$Subscription$listen_on_delivery_order_by_id extends graphql
    .SubscriptionOptions<Subscription$listen_on_delivery_order_by_id> {
  Options$Subscription$listen_on_delivery_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_delivery_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_delivery_order_by_id,
          parserFn: _parserFn$Subscription$listen_on_delivery_order_by_id,
        );
}

class WatchOptions$Subscription$listen_on_delivery_order_by_id extends graphql
    .WatchQueryOptions<Subscription$listen_on_delivery_order_by_id> {
  WatchOptions$Subscription$listen_on_delivery_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_delivery_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_delivery_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_delivery_order_by_id,
        );
}

class FetchMoreOptions$Subscription$listen_on_delivery_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_delivery_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_delivery_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_delivery_order_by_id,
        );
}

extension ClientExtension$Subscription$listen_on_delivery_order_by_id
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_delivery_order_by_id>>
      subscribe$listen_on_delivery_order_by_id(
              Options$Subscription$listen_on_delivery_order_by_id options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_delivery_order_by_id>
      watchSubscription$listen_on_delivery_order_by_id(
              WatchOptions$Subscription$listen_on_delivery_order_by_id
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_delivery_order_by_id$delivery_order {
  Subscription$listen_on_delivery_order_by_id$delivery_order({
    required this.id,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    this.delivery_driver_type,
    this.delivery_driver_id,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.payment_type,
    this.stripe_payment_id,
    this.estimated_package_ready_time,
    this.actual_package_ready_time,
    this.estimated_arrival_at_pickup_time,
    this.actual_arrival_at_pickup_time,
    this.estimated_arrival_at_dropoff_time,
    this.actual_arrival_at_dropoff_time,
    this.actual_delivered_time,
    required this.status,
    required this.customer_id,
    required this.customer,
    this.restaurant_order,
    this.delivery_driver,
    this.service_provider_id,
    this.service_provider_type,
    this.trip_polyline,
    this.trip_duration,
    this.trip_distance,
    required this.delivery_cost,
    required this.package_cost,
    this.current_gps,
    required this.order_time,
    this.cancellation_time,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$delivery_driver_type = json['delivery_driver_type'];
    final l$delivery_driver_id = json['delivery_driver_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$payment_type = json['payment_type'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$status = json['status'];
    final l$customer_id = json['customer_id'];
    final l$customer = json['customer'];
    final l$restaurant_order = json['restaurant_order'];
    final l$delivery_driver = json['delivery_driver'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_distance = json['trip_distance'];
    final l$delivery_cost = json['delivery_cost'];
    final l$package_cost = json['package_cost'];
    final l$current_gps = json['current_gps'];
    final l$order_time = json['order_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order(
      id: (l$id as int),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      delivery_driver_type: (l$delivery_driver_type as String?),
      delivery_driver_id: (l$delivery_driver_id as int?),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      payment_type: (l$payment_type as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      actual_delivered_time: (l$actual_delivered_time as String?),
      status: (l$status as String),
      customer_id: (l$customer_id as int),
      customer:
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      restaurant_order: l$restaurant_order == null
          ? null
          : Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      delivery_driver: l$delivery_driver == null
          ? null
          : Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      trip_polyline: (l$trip_polyline as String?),
      trip_duration: (l$trip_duration as int?),
      trip_distance: (l$trip_distance as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      package_cost: moneyFromJson(l$package_cost),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      order_time: (l$order_time as String),
      cancellation_time: (l$cancellation_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String? delivery_driver_type;

  final int? delivery_driver_id;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final String payment_type;

  final int? stripe_payment_id;

  final String? estimated_package_ready_time;

  final String? actual_package_ready_time;

  final String? estimated_arrival_at_pickup_time;

  final String? actual_arrival_at_pickup_time;

  final String? estimated_arrival_at_dropoff_time;

  final String? actual_arrival_at_dropoff_time;

  final String? actual_delivered_time;

  final String status;

  final int customer_id;

  final Subscription$listen_on_delivery_order_by_id$delivery_order$customer
      customer;

  final Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order?
      restaurant_order;

  final Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver?
      delivery_driver;

  final int? service_provider_id;

  final String? service_provider_type;

  final String? trip_polyline;

  final int? trip_duration;

  final int? trip_distance;

  final double delivery_cost;

  final double package_cost;

  final Geography? current_gps;

  final String order_time;

  final String? cancellation_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    _resultData['delivery_driver_id'] = l$delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$payment_type = payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    final l$status = status;
    final l$customer_id = customer_id;
    final l$customer = customer;
    final l$restaurant_order = restaurant_order;
    final l$delivery_driver = delivery_driver;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$trip_polyline = trip_polyline;
    final l$trip_duration = trip_duration;
    final l$trip_distance = trip_distance;
    final l$delivery_cost = delivery_cost;
    final l$package_cost = package_cost;
    final l$current_gps = current_gps;
    final l$order_time = order_time;
    final l$cancellation_time = cancellation_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$delivery_driver_type,
      l$delivery_driver_id,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$payment_type,
      l$stripe_payment_id,
      l$estimated_package_ready_time,
      l$actual_package_ready_time,
      l$estimated_arrival_at_pickup_time,
      l$actual_arrival_at_pickup_time,
      l$estimated_arrival_at_dropoff_time,
      l$actual_arrival_at_dropoff_time,
      l$actual_delivered_time,
      l$status,
      l$customer_id,
      l$customer,
      l$restaurant_order,
      l$delivery_driver,
      l$service_provider_id,
      l$service_provider_type,
      l$trip_polyline,
      l$trip_duration,
      l$trip_distance,
      l$delivery_cost,
      l$package_cost,
      l$current_gps,
      l$order_time,
      l$cancellation_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_delivery_order_by_id$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
      return false;
    }
    final l$delivery_driver_id = delivery_driver_id;
    final lOther$delivery_driver_id = other.delivery_driver_id;
    if (l$delivery_driver_id != lOther$delivery_driver_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order
    on Subscription$listen_on_delivery_order_by_id$delivery_order {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
          Subscription$listen_on_delivery_order_by_id$delivery_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order(
    Subscription$listen_on_delivery_order_by_id$delivery_order instance,
    TRes Function(Subscription$listen_on_delivery_order_by_id$delivery_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order;

  TRes call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer?
        customer,
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order?
        restaurant_order,
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
      TRes> get customer;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
      TRes> get restaurant_order;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
      TRes> get delivery_driver;
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order _instance;

  final TRes Function(
      Subscription$listen_on_delivery_order_by_id$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? delivery_driver_type = _undefined,
    Object? delivery_driver_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? payment_type = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? status = _undefined,
    Object? customer_id = _undefined,
    Object? customer = _undefined,
    Object? restaurant_order = _undefined,
    Object? delivery_driver = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_distance = _undefined,
    Object? delivery_cost = _undefined,
    Object? package_cost = _undefined,
    Object? current_gps = _undefined,
    Object? order_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_order_by_id$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
        delivery_driver_type: delivery_driver_type == _undefined
            ? _instance.delivery_driver_type
            : (delivery_driver_type as String?),
        delivery_driver_id: delivery_driver_id == _undefined
            ? _instance.delivery_driver_id
            : (delivery_driver_id as int?),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_delivery_order_by_id$delivery_order$customer),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order?),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver?),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
      TRes> get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }

  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer?
        customer,
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order?
        restaurant_order,
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
          TRes>
      get restaurant_order =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
              .stub(_res);
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
              .stub(_res);
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$customer {
  Subscription$listen_on_delivery_order_by_id$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
      user:
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
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
            is Subscription$listen_on_delivery_order_by_id$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$customer
    on Subscription$listen_on_delivery_order_by_id$delivery_order$customer {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer;

  TRes call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user {
  Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
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
            is Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
    on Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
    Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order {
  Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order({
    required this.restaurant,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
      restaurant:
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
    on Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order;

  TRes call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
              .stub(_res);
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant {
  Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant({
    required this.name,
    required this.image,
    required this.location_text,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$location_text = json['location_text'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
      name: (l$name as String),
      image: (l$image as String),
      location_text: (l$location_text as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String location_text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$location_text = location_text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$location_text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant) ||
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
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
    on Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
    Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant;

  TRes call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? location_text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver {
  Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
      user:
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
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
            is Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
    on Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver;

  TRes call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
              .stub(_res);
}

class Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user {
  Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
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
            is Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user) ||
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

extension UtilityExtension$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
    on Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user {
  CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
    Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
        instance,
    TRes Function(
            Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user;

  factory CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user
      _instance;

  final TRes Function(
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_delivery_order_by_id$delivery_order$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_service_delivery_orders {
  factory Variables$Query$get_service_delivery_orders(
          {required int serviceid}) =>
      Variables$Query$get_service_delivery_orders._({
        r'serviceid': serviceid,
      });

  Variables$Query$get_service_delivery_orders._(this._$data);

  factory Variables$Query$get_service_delivery_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceid = data['serviceid'];
    result$data['serviceid'] = (l$serviceid as int);
    return Variables$Query$get_service_delivery_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceid => (_$data['serviceid'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceid = serviceid;
    result$data['serviceid'] = l$serviceid;
    return result$data;
  }

  CopyWith$Variables$Query$get_service_delivery_orders<
          Variables$Query$get_service_delivery_orders>
      get copyWith => CopyWith$Variables$Query$get_service_delivery_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_service_delivery_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceid = serviceid;
    final lOther$serviceid = other.serviceid;
    if (l$serviceid != lOther$serviceid) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceid = serviceid;
    return Object.hashAll([l$serviceid]);
  }
}

abstract class CopyWith$Variables$Query$get_service_delivery_orders<TRes> {
  factory CopyWith$Variables$Query$get_service_delivery_orders(
    Variables$Query$get_service_delivery_orders instance,
    TRes Function(Variables$Query$get_service_delivery_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_service_delivery_orders;

  factory CopyWith$Variables$Query$get_service_delivery_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_service_delivery_orders;

  TRes call({int? serviceid});
}

class _CopyWithImpl$Variables$Query$get_service_delivery_orders<TRes>
    implements CopyWith$Variables$Query$get_service_delivery_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_service_delivery_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_service_delivery_orders _instance;

  final TRes Function(Variables$Query$get_service_delivery_orders) _then;

  static const _undefined = {};

  TRes call({Object? serviceid = _undefined}) =>
      _then(Variables$Query$get_service_delivery_orders._({
        ..._instance._$data,
        if (serviceid != _undefined && serviceid != null)
          'serviceid': (serviceid as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_service_delivery_orders<TRes>
    implements CopyWith$Variables$Query$get_service_delivery_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_service_delivery_orders(this._res);

  TRes _res;

  call({int? serviceid}) => _res;
}

class Query$get_service_delivery_orders {
  Query$get_service_delivery_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$get_service_delivery_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_service_delivery_orders$delivery_order> delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_delivery_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
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

extension UtilityExtension$Query$get_service_delivery_orders
    on Query$get_service_delivery_orders {
  CopyWith$Query$get_service_delivery_orders<Query$get_service_delivery_orders>
      get copyWith => CopyWith$Query$get_service_delivery_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders<TRes> {
  factory CopyWith$Query$get_service_delivery_orders(
    Query$get_service_delivery_orders instance,
    TRes Function(Query$get_service_delivery_orders) then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders;

  factory CopyWith$Query$get_service_delivery_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders;

  TRes call({
    List<Query$get_service_delivery_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$get_service_delivery_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$get_service_delivery_orders$delivery_order<
                      Query$get_service_delivery_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_delivery_orders<TRes>
    implements CopyWith$Query$get_service_delivery_orders<TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders _instance;

  final TRes Function(Query$get_service_delivery_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$get_service_delivery_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$get_service_delivery_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$get_service_delivery_orders$delivery_order<
                          Query$get_service_delivery_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map(
              (e) => CopyWith$Query$get_service_delivery_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_service_delivery_orders<TRes>
    implements CopyWith$Query$get_service_delivery_orders<TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders(this._res);

  TRes _res;

  call({
    List<Query$get_service_delivery_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryget_service_delivery_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_service_delivery_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceid')),
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
        name: NameNode(value: 'delivery_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceid')),
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
            name: NameNode(value: 'delivery_driver_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_delivered_time'),
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
            name: NameNode(value: 'customer_id'),
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
                    name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'delivery_driver'),
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
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
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
            name: NameNode(value: 'trip_polyline'),
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
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellation_time'),
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
Query$get_service_delivery_orders _parserFn$Query$get_service_delivery_orders(
        Map<String, dynamic> data) =>
    Query$get_service_delivery_orders.fromJson(data);

class Options$Query$get_service_delivery_orders
    extends graphql.QueryOptions<Query$get_service_delivery_orders> {
  Options$Query$get_service_delivery_orders({
    String? operationName,
    required Variables$Query$get_service_delivery_orders variables,
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
          document: documentNodeQueryget_service_delivery_orders,
          parserFn: _parserFn$Query$get_service_delivery_orders,
        );
}

class WatchOptions$Query$get_service_delivery_orders
    extends graphql.WatchQueryOptions<Query$get_service_delivery_orders> {
  WatchOptions$Query$get_service_delivery_orders({
    String? operationName,
    required Variables$Query$get_service_delivery_orders variables,
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
          document: documentNodeQueryget_service_delivery_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_service_delivery_orders,
        );
}

class FetchMoreOptions$Query$get_service_delivery_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_service_delivery_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_service_delivery_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_service_delivery_orders,
        );
}

extension ClientExtension$Query$get_service_delivery_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_service_delivery_orders>>
      query$get_service_delivery_orders(
              Options$Query$get_service_delivery_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_service_delivery_orders>
      watchQuery$get_service_delivery_orders(
              WatchOptions$Query$get_service_delivery_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_service_delivery_orders({
    required Query$get_service_delivery_orders data,
    required Variables$Query$get_service_delivery_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_service_delivery_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_service_delivery_orders? readQuery$get_service_delivery_orders({
    required Variables$Query$get_service_delivery_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_service_delivery_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_service_delivery_orders.fromJson(result);
  }
}

class Query$get_service_delivery_orders$delivery_order {
  Query$get_service_delivery_orders$delivery_order({
    required this.id,
    required this.pickup_gps,
    required this.pickup_address,
    required this.dropoff_gps,
    required this.dropoff_address,
    this.delivery_driver_type,
    this.delivery_driver_id,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.payment_type,
    this.stripe_payment_id,
    this.estimated_package_ready_time,
    this.actual_package_ready_time,
    this.estimated_arrival_at_pickup_time,
    this.actual_arrival_at_pickup_time,
    this.estimated_arrival_at_dropoff_time,
    this.actual_arrival_at_dropoff_time,
    this.actual_delivered_time,
    required this.status,
    required this.customer_id,
    required this.customer,
    this.restaurant_order,
    this.delivery_driver,
    this.service_provider_id,
    this.service_provider_type,
    this.trip_polyline,
    this.trip_duration,
    this.trip_distance,
    required this.delivery_cost,
    required this.package_cost,
    this.current_gps,
    required this.order_time,
    this.cancellation_time,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$pickup_gps = json['pickup_gps'];
    final l$pickup_address = json['pickup_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$dropoff_address = json['dropoff_address'];
    final l$delivery_driver_type = json['delivery_driver_type'];
    final l$delivery_driver_id = json['delivery_driver_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$payment_type = json['payment_type'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$status = json['status'];
    final l$customer_id = json['customer_id'];
    final l$customer = json['customer'];
    final l$restaurant_order = json['restaurant_order'];
    final l$delivery_driver = json['delivery_driver'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_distance = json['trip_distance'];
    final l$delivery_cost = json['delivery_cost'];
    final l$package_cost = json['package_cost'];
    final l$current_gps = json['current_gps'];
    final l$order_time = json['order_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order(
      id: (l$id as int),
      pickup_gps: geographyFromJson(l$pickup_gps),
      pickup_address: (l$pickup_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      dropoff_address: (l$dropoff_address as String),
      delivery_driver_type: (l$delivery_driver_type as String?),
      delivery_driver_id: (l$delivery_driver_id as int?),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      payment_type: (l$payment_type as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      actual_delivered_time: (l$actual_delivered_time as String?),
      status: (l$status as String),
      customer_id: (l$customer_id as int),
      customer:
          Query$get_service_delivery_orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      restaurant_order: l$restaurant_order == null
          ? null
          : Query$get_service_delivery_orders$delivery_order$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      delivery_driver: l$delivery_driver == null
          ? null
          : Query$get_service_delivery_orders$delivery_order$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      trip_polyline: (l$trip_polyline as String?),
      trip_duration: (l$trip_duration as int?),
      trip_distance: (l$trip_distance as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      package_cost: moneyFromJson(l$package_cost),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      order_time: (l$order_time as String),
      cancellation_time: (l$cancellation_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography pickup_gps;

  final String pickup_address;

  final Geography dropoff_gps;

  final String dropoff_address;

  final String? delivery_driver_type;

  final int? delivery_driver_id;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final String payment_type;

  final int? stripe_payment_id;

  final String? estimated_package_ready_time;

  final String? actual_package_ready_time;

  final String? estimated_arrival_at_pickup_time;

  final String? actual_arrival_at_pickup_time;

  final String? estimated_arrival_at_dropoff_time;

  final String? actual_arrival_at_dropoff_time;

  final String? actual_delivered_time;

  final String status;

  final int customer_id;

  final Query$get_service_delivery_orders$delivery_order$customer customer;

  final Query$get_service_delivery_orders$delivery_order$restaurant_order?
      restaurant_order;

  final Query$get_service_delivery_orders$delivery_order$delivery_driver?
      delivery_driver;

  final int? service_provider_id;

  final String? service_provider_type;

  final String? trip_polyline;

  final int? trip_duration;

  final int? trip_distance;

  final double delivery_cost;

  final double package_cost;

  final Geography? current_gps;

  final String order_time;

  final String? cancellation_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    _resultData['delivery_driver_type'] = l$delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    _resultData['delivery_driver_id'] = l$delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$pickup_gps = pickup_gps;
    final l$pickup_address = pickup_address;
    final l$dropoff_gps = dropoff_gps;
    final l$dropoff_address = dropoff_address;
    final l$delivery_driver_type = delivery_driver_type;
    final l$delivery_driver_id = delivery_driver_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$payment_type = payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$actual_delivered_time = actual_delivered_time;
    final l$status = status;
    final l$customer_id = customer_id;
    final l$customer = customer;
    final l$restaurant_order = restaurant_order;
    final l$delivery_driver = delivery_driver;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$trip_polyline = trip_polyline;
    final l$trip_duration = trip_duration;
    final l$trip_distance = trip_distance;
    final l$delivery_cost = delivery_cost;
    final l$package_cost = package_cost;
    final l$current_gps = current_gps;
    final l$order_time = order_time;
    final l$cancellation_time = cancellation_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$pickup_gps,
      l$pickup_address,
      l$dropoff_gps,
      l$dropoff_address,
      l$delivery_driver_type,
      l$delivery_driver_id,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$payment_type,
      l$stripe_payment_id,
      l$estimated_package_ready_time,
      l$actual_package_ready_time,
      l$estimated_arrival_at_pickup_time,
      l$actual_arrival_at_pickup_time,
      l$estimated_arrival_at_dropoff_time,
      l$actual_arrival_at_dropoff_time,
      l$actual_delivered_time,
      l$status,
      l$customer_id,
      l$customer,
      l$restaurant_order,
      l$delivery_driver,
      l$service_provider_id,
      l$service_provider_type,
      l$trip_polyline,
      l$trip_duration,
      l$trip_distance,
      l$delivery_cost,
      l$package_cost,
      l$current_gps,
      l$order_time,
      l$cancellation_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_delivery_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$delivery_driver_type = delivery_driver_type;
    final lOther$delivery_driver_type = other.delivery_driver_type;
    if (l$delivery_driver_type != lOther$delivery_driver_type) {
      return false;
    }
    final l$delivery_driver_id = delivery_driver_id;
    final lOther$delivery_driver_id = other.delivery_driver_id;
    if (l$delivery_driver_id != lOther$delivery_driver_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order
    on Query$get_service_delivery_orders$delivery_order {
  CopyWith$Query$get_service_delivery_orders$delivery_order<
          Query$get_service_delivery_orders$delivery_order>
      get copyWith => CopyWith$Query$get_service_delivery_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order<TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order(
    Query$get_service_delivery_orders$delivery_order instance,
    TRes Function(Query$get_service_delivery_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order;

  TRes call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Query$get_service_delivery_orders$delivery_order$customer? customer,
    Query$get_service_delivery_orders$delivery_order$restaurant_order?
        restaurant_order,
    Query$get_service_delivery_orders$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  });
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
      TRes> get restaurant_order;
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
      TRes> get delivery_driver;
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order<TRes>
    implements CopyWith$Query$get_service_delivery_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order _instance;

  final TRes Function(Query$get_service_delivery_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? pickup_gps = _undefined,
    Object? pickup_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? dropoff_address = _undefined,
    Object? delivery_driver_type = _undefined,
    Object? delivery_driver_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? payment_type = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? status = _undefined,
    Object? customer_id = _undefined,
    Object? customer = _undefined,
    Object? restaurant_order = _undefined,
    Object? delivery_driver = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_polyline = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_distance = _undefined,
    Object? delivery_cost = _undefined,
    Object? package_cost = _undefined,
    Object? current_gps = _undefined,
    Object? order_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
        delivery_driver_type: delivery_driver_type == _undefined
            ? _instance.delivery_driver_type
            : (delivery_driver_type as String?),
        delivery_driver_id: delivery_driver_id == _undefined
            ? _instance.delivery_driver_id
            : (delivery_driver_id as int?),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_service_delivery_orders$delivery_order$customer),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Query$get_service_delivery_orders$delivery_order$restaurant_order?),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Query$get_service_delivery_orders$delivery_order$delivery_driver?),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_service_delivery_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
      TRes> get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }

  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order<TRes>
    implements CopyWith$Query$get_service_delivery_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    Geography? pickup_gps,
    String? pickup_address,
    Geography? dropoff_gps,
    String? dropoff_address,
    String? delivery_driver_type,
    int? delivery_driver_id,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    String? payment_type,
    int? stripe_payment_id,
    String? estimated_package_ready_time,
    String? actual_package_ready_time,
    String? estimated_arrival_at_pickup_time,
    String? actual_arrival_at_pickup_time,
    String? estimated_arrival_at_dropoff_time,
    String? actual_arrival_at_dropoff_time,
    String? actual_delivered_time,
    String? status,
    int? customer_id,
    Query$get_service_delivery_orders$delivery_order$customer? customer,
    Query$get_service_delivery_orders$delivery_order$restaurant_order?
        restaurant_order,
    Query$get_service_delivery_orders$delivery_order$delivery_driver?
        delivery_driver,
    int? service_provider_id,
    String? service_provider_type,
    String? trip_polyline,
    int? trip_duration,
    int? trip_distance,
    double? delivery_cost,
    double? package_cost,
    Geography? current_gps,
    String? order_time,
    String? cancellation_time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
          TRes>
      get restaurant_order =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order
              .stub(_res);
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver
              .stub(_res);
}

class Query$get_service_delivery_orders$delivery_order$customer {
  Query$get_service_delivery_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$customer(
      user: Query$get_service_delivery_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_delivery_orders$delivery_order$customer$user user;

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
    if (!(other is Query$get_service_delivery_orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$customer
    on Query$get_service_delivery_orders$delivery_order$customer {
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer<
          Query$get_service_delivery_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$customer(
    Query$get_service_delivery_orders$delivery_order$customer instance,
    TRes Function(Query$get_service_delivery_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer;

  TRes call({
    Query$get_service_delivery_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$customer _instance;

  final TRes Function(Query$get_service_delivery_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_service_delivery_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_service_delivery_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user
              .stub(_res);
}

class Query$get_service_delivery_orders$delivery_order$customer$user {
  Query$get_service_delivery_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$customer$user(
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
            is Query$get_service_delivery_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$customer$user
    on Query$get_service_delivery_orders$delivery_order$customer$user {
  CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<
          Query$get_service_delivery_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user(
    Query$get_service_delivery_orders$delivery_order$customer$user instance,
    TRes Function(
            Query$get_service_delivery_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer$user;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
      Query$get_service_delivery_orders$delivery_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_service_delivery_orders$delivery_order$restaurant_order {
  Query$get_service_delivery_orders$delivery_order$restaurant_order({
    required this.restaurant,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$restaurant_order(
      restaurant:
          Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$get_service_delivery_orders$delivery_order$restaurant_order) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$restaurant_order
    on Query$get_service_delivery_orders$delivery_order$restaurant_order {
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
          Query$get_service_delivery_orders$delivery_order$restaurant_order>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order(
    Query$get_service_delivery_orders$delivery_order$restaurant_order instance,
    TRes Function(
            Query$get_service_delivery_orders$delivery_order$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order;

  TRes call({
    Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$restaurant_order
      _instance;

  final TRes Function(
      Query$get_service_delivery_orders$delivery_order$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders$delivery_order$restaurant_order(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order(
      this._res);

  TRes _res;

  call({
    Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
              .stub(_res);
}

class Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant {
  Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant({
    required this.name,
    required this.image,
    required this.location_text,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$location_text = json['location_text'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
      name: (l$name as String),
      image: (l$image as String),
      location_text: (l$location_text as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final String location_text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$location_text = location_text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$location_text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant) ||
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
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
    on Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant {
  CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
          Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
    Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
        instance,
    TRes Function(
            Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant;

  TRes call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? location_text = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$restaurant_order$restaurant(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? location_text,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_service_delivery_orders$delivery_order$delivery_driver {
  Query$get_service_delivery_orders$delivery_order$delivery_driver({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$delivery_driver(
      user:
          Query$get_service_delivery_orders$delivery_order$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_service_delivery_orders$delivery_order$delivery_driver$user
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
            is Query$get_service_delivery_orders$delivery_order$delivery_driver) ||
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$delivery_driver
    on Query$get_service_delivery_orders$delivery_order$delivery_driver {
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
          Query$get_service_delivery_orders$delivery_order$delivery_driver>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver(
    Query$get_service_delivery_orders$delivery_order$delivery_driver instance,
    TRes Function(
            Query$get_service_delivery_orders$delivery_order$delivery_driver)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver;

  TRes call({
    Query$get_service_delivery_orders$delivery_order$delivery_driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$delivery_driver
      _instance;

  final TRes Function(
      Query$get_service_delivery_orders$delivery_order$delivery_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_delivery_orders$delivery_order$delivery_driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_service_delivery_orders$delivery_order$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver(
      this._res);

  TRes _res;

  call({
    Query$get_service_delivery_orders$delivery_order$delivery_driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user
              .stub(_res);
}

class Query$get_service_delivery_orders$delivery_order$delivery_driver$user {
  Query$get_service_delivery_orders$delivery_order$delivery_driver$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_service_delivery_orders$delivery_order$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
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
            is Query$get_service_delivery_orders$delivery_order$delivery_driver$user) ||
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

extension UtilityExtension$Query$get_service_delivery_orders$delivery_order$delivery_driver$user
    on Query$get_service_delivery_orders$delivery_order$delivery_driver$user {
  CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
          Query$get_service_delivery_orders$delivery_order$delivery_driver$user>
      get copyWith =>
          CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
    TRes> {
  factory CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
    Query$get_service_delivery_orders$delivery_order$delivery_driver$user
        instance,
    TRes Function(
            Query$get_service_delivery_orders$delivery_order$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user;

  factory CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Query$get_service_delivery_orders$delivery_order$delivery_driver$user
      _instance;

  final TRes Function(
          Query$get_service_delivery_orders$delivery_order$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_service_delivery_orders$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Query$get_service_delivery_orders$delivery_order$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
