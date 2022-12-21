import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Subscription$get_orders {
  Subscription$get_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$get_orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$get_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Subscription$get_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$get_orders$delivery_order> delivery_order;

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
    if (!(other is Subscription$get_orders) ||
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

extension UtilityExtension$Subscription$get_orders on Subscription$get_orders {
  CopyWith$Subscription$get_orders<Subscription$get_orders> get copyWith =>
      CopyWith$Subscription$get_orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$get_orders<TRes> {
  factory CopyWith$Subscription$get_orders(
    Subscription$get_orders instance,
    TRes Function(Subscription$get_orders) then,
  ) = _CopyWithImpl$Subscription$get_orders;

  factory CopyWith$Subscription$get_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_orders;

  TRes call({
    List<Subscription$get_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$get_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$get_orders$delivery_order<
                      Subscription$get_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_orders<TRes>
    implements CopyWith$Subscription$get_orders<TRes> {
  _CopyWithImpl$Subscription$get_orders(
    this._instance,
    this._then,
  );

  final Subscription$get_orders _instance;

  final TRes Function(Subscription$get_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order as List<Subscription$get_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$get_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$get_orders$delivery_order<
                          Subscription$get_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order
              .map((e) => CopyWith$Subscription$get_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$get_orders<TRes>
    implements CopyWith$Subscription$get_orders<TRes> {
  _CopyWithStubImpl$Subscription$get_orders(this._res);

  TRes _res;

  call({
    List<Subscription$get_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionget_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'get_orders'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
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
            name: NameNode(value: 'status'),
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
            name: NameNode(value: 'delivery_cost'),
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
            name: NameNode(value: 'actual_package_ready_time'),
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
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
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
      
    ]),
  ),
]);
Subscription$get_orders _parserFn$Subscription$get_orders(
        Map<String, dynamic> data) =>
    Subscription$get_orders.fromJson(data);

class Options$Subscription$get_orders
    extends graphql.SubscriptionOptions<Subscription$get_orders> {
  Options$Subscription$get_orders({
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
          document: documentNodeSubscriptionget_orders,
          parserFn: _parserFn$Subscription$get_orders,
        );
}

class WatchOptions$Subscription$get_orders
    extends graphql.WatchQueryOptions<Subscription$get_orders> {
  WatchOptions$Subscription$get_orders({
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
          document: documentNodeSubscriptionget_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$get_orders,
        );
}

class FetchMoreOptions$Subscription$get_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$get_orders(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionget_orders,
        );
}

extension ClientExtension$Subscription$get_orders on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$get_orders>> subscribe$get_orders(
          [Options$Subscription$get_orders? options]) =>
      this.subscribe(options ?? Options$Subscription$get_orders());
  graphql.ObservableQuery<Subscription$get_orders> watchSubscription$get_orders(
          [WatchOptions$Subscription$get_orders? options]) =>
      this.watchQuery(options ?? WatchOptions$Subscription$get_orders());
}

class Subscription$get_orders$delivery_order {
  Subscription$get_orders$delivery_order({
    required this.id,
    this.restaurant,
    required this.payment_type,
    this.stripe_payment_id,
    required this.status,
    required this.order_time,
    required this.customer,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.delivery_cost,
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.$__typename,
  });

  factory Subscription$get_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$payment_type = json['payment_type'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$status = json['status'];
    final l$order_time = json['order_time'];
    final l$customer = json['customer'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$$__typename = json['__typename'];
    return Subscription$get_orders$delivery_order(
      id: (l$id as int),
      restaurant: l$restaurant == null
          ? null
          : Subscription$get_orders$delivery_order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      payment_type: (l$payment_type as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      status: (l$status as String),
      order_time: (l$order_time as String),
      customer: Subscription$get_orders$delivery_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$get_orders$delivery_order$restaurant? restaurant;

  final String payment_type;

  final int? stripe_payment_id;

  final String status;

  final String order_time;

  final Subscription$get_orders$delivery_order$customer customer;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final double delivery_cost;

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$payment_type = payment_type;
    final l$stripe_payment_id = stripe_payment_id;
    final l$status = status;
    final l$order_time = order_time;
    final l$customer = customer;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$delivery_cost = delivery_cost;
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant,
      l$payment_type,
      l$stripe_payment_id,
      l$status,
      l$order_time,
      l$customer,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$delivery_cost,
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
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

extension UtilityExtension$Subscription$get_orders$delivery_order
    on Subscription$get_orders$delivery_order {
  CopyWith$Subscription$get_orders$delivery_order<
          Subscription$get_orders$delivery_order>
      get copyWith => CopyWith$Subscription$get_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_orders$delivery_order<TRes> {
  factory CopyWith$Subscription$get_orders$delivery_order(
    Subscription$get_orders$delivery_order instance,
    TRes Function(Subscription$get_orders$delivery_order) then,
  ) = _CopyWithImpl$Subscription$get_orders$delivery_order;

  factory CopyWith$Subscription$get_orders$delivery_order.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_orders$delivery_order;

  TRes call({
    int? id,
    Subscription$get_orders$delivery_order$restaurant? restaurant,
    String? payment_type,
    int? stripe_payment_id,
    String? status,
    String? order_time,
    Subscription$get_orders$delivery_order$customer? customer,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    double? delivery_cost,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    String? $__typename,
  });
  CopyWith$Subscription$get_orders$delivery_order$restaurant<TRes>
      get restaurant;
  CopyWith$Subscription$get_orders$delivery_order$customer<TRes> get customer;
}

class _CopyWithImpl$Subscription$get_orders$delivery_order<TRes>
    implements CopyWith$Subscription$get_orders$delivery_order<TRes> {
  _CopyWithImpl$Subscription$get_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$get_orders$delivery_order _instance;

  final TRes Function(Subscription$get_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? payment_type = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? status = _undefined,
    Object? order_time = _undefined,
    Object? customer = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$get_orders$delivery_order$restaurant?),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as Subscription$get_orders$delivery_order$customer),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_orders$delivery_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$get_orders$delivery_order$restaurant.stub(
            _then(_instance))
        : CopyWith$Subscription$get_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Subscription$get_orders$delivery_order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$get_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$get_orders$delivery_order<TRes>
    implements CopyWith$Subscription$get_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Subscription$get_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    Subscription$get_orders$delivery_order$restaurant? restaurant,
    String? payment_type,
    int? stripe_payment_id,
    String? status,
    String? order_time,
    Subscription$get_orders$delivery_order$customer? customer,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    double? delivery_cost,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_orders$delivery_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Subscription$get_orders$delivery_order$restaurant.stub(_res);
  CopyWith$Subscription$get_orders$delivery_order$customer<TRes> get customer =>
      CopyWith$Subscription$get_orders$delivery_order$customer.stub(_res);
}

class Subscription$get_orders$delivery_order$restaurant {
  Subscription$get_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$get_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$get_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String language_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
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
    final l$language_id = language_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$location_gps,
      l$location_text,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_orders$delivery_order$restaurant) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$get_orders$delivery_order$restaurant
    on Subscription$get_orders$delivery_order$restaurant {
  CopyWith$Subscription$get_orders$delivery_order$restaurant<
          Subscription$get_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$get_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$get_orders$delivery_order$restaurant(
    Subscription$get_orders$delivery_order$restaurant instance,
    TRes Function(Subscription$get_orders$delivery_order$restaurant) then,
  ) = _CopyWithImpl$Subscription$get_orders$delivery_order$restaurant;

  factory CopyWith$Subscription$get_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_orders$delivery_order$restaurant<TRes>
    implements
        CopyWith$Subscription$get_orders$delivery_order$restaurant<TRes> {
  _CopyWithImpl$Subscription$get_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$get_orders$delivery_order$restaurant _instance;

  final TRes Function(Subscription$get_orders$delivery_order$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_orders$delivery_order$restaurant<TRes>
    implements
        CopyWith$Subscription$get_orders$delivery_order$restaurant<TRes> {
  _CopyWithStubImpl$Subscription$get_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$get_orders$delivery_order$customer {
  Subscription$get_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$get_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$get_orders$delivery_order$customer(
      user: Subscription$get_orders$delivery_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_orders$delivery_order$customer$user user;

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
    if (!(other is Subscription$get_orders$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$get_orders$delivery_order$customer
    on Subscription$get_orders$delivery_order$customer {
  CopyWith$Subscription$get_orders$delivery_order$customer<
          Subscription$get_orders$delivery_order$customer>
      get copyWith => CopyWith$Subscription$get_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_orders$delivery_order$customer<TRes> {
  factory CopyWith$Subscription$get_orders$delivery_order$customer(
    Subscription$get_orders$delivery_order$customer instance,
    TRes Function(Subscription$get_orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Subscription$get_orders$delivery_order$customer;

  factory CopyWith$Subscription$get_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer;

  TRes call({
    Subscription$get_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$get_orders$delivery_order$customer$user<TRes> get user;
}

class _CopyWithImpl$Subscription$get_orders$delivery_order$customer<TRes>
    implements CopyWith$Subscription$get_orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Subscription$get_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$get_orders$delivery_order$customer _instance;

  final TRes Function(Subscription$get_orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Subscription$get_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_orders$delivery_order$customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$get_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer<TRes>
    implements CopyWith$Subscription$get_orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer(this._res);

  TRes _res;

  call({
    Subscription$get_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Subscription$get_orders$delivery_order$customer$user.stub(
              _res);
}

class Subscription$get_orders$delivery_order$customer$user {
  Subscription$get_orders$delivery_order$customer$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$get_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$get_orders$delivery_order$customer$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Subscription$get_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$get_orders$delivery_order$customer$user
    on Subscription$get_orders$delivery_order$customer$user {
  CopyWith$Subscription$get_orders$delivery_order$customer$user<
          Subscription$get_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$get_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$get_orders$delivery_order$customer$user(
    Subscription$get_orders$delivery_order$customer$user instance,
    TRes Function(Subscription$get_orders$delivery_order$customer$user) then,
  ) = _CopyWithImpl$Subscription$get_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$get_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_orders$delivery_order$customer$user<TRes>
    implements
        CopyWith$Subscription$get_orders$delivery_order$customer$user<TRes> {
  _CopyWithImpl$Subscription$get_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$get_orders$delivery_order$customer$user _instance;

  final TRes Function(Subscription$get_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_orders$delivery_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$get_orders$delivery_order$customer$user<TRes> {
  _CopyWithStubImpl$Subscription$get_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
