import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$listen_on_inprocess_driver_orders {
  factory Variables$Subscription$listen_on_inprocess_driver_orders(
          {required int driverId}) =>
      Variables$Subscription$listen_on_inprocess_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Subscription$listen_on_inprocess_driver_orders._(this._$data);

  factory Variables$Subscription$listen_on_inprocess_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Subscription$listen_on_inprocess_driver_orders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
          Variables$Subscription$listen_on_inprocess_driver_orders>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders(
    Variables$Subscription$listen_on_inprocess_driver_orders instance,
    TRes Function(Variables$Subscription$listen_on_inprocess_driver_orders)
        then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders;

  factory CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
            TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_inprocess_driver_orders _instance;

  final TRes Function(Variables$Subscription$listen_on_inprocess_driver_orders)
      _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Subscription$listen_on_inprocess_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
            TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders(
      this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Subscription$listen_on_inprocess_driver_orders {
  Subscription$listen_on_inprocess_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_inprocess_driver_orders$delivery_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_inprocess_driver_orders$delivery_order>
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
    if (!(other is Subscription$listen_on_inprocess_driver_orders) ||
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

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders
    on Subscription$listen_on_inprocess_driver_orders {
  CopyWith$Subscription$listen_on_inprocess_driver_orders<
          Subscription$listen_on_inprocess_driver_orders>
      get copyWith => CopyWith$Subscription$listen_on_inprocess_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders(
    Subscription$listen_on_inprocess_driver_orders instance,
    TRes Function(Subscription$listen_on_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders;

  TRes call({
    List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$listen_on_inprocess_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
                      Subscription$listen_on_inprocess_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders<TRes>
    implements CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders _instance;

  final TRes Function(Subscription$listen_on_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_inprocess_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order as List<
                Subscription$listen_on_inprocess_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$listen_on_inprocess_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
                          Subscription$listen_on_inprocess_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders<TRes>
    implements CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_inprocess_driver_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_inprocess_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
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
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: true),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'dropoff_gps'),
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
                name: NameNode(value: 'language_id'),
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
Subscription$listen_on_inprocess_driver_orders
    _parserFn$Subscription$listen_on_inprocess_driver_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_inprocess_driver_orders.fromJson(data);

class Options$Subscription$listen_on_inprocess_driver_orders extends graphql
    .SubscriptionOptions<Subscription$listen_on_inprocess_driver_orders> {
  Options$Subscription$listen_on_inprocess_driver_orders({
    String? operationName,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
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
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
          parserFn: _parserFn$Subscription$listen_on_inprocess_driver_orders,
        );
}

class WatchOptions$Subscription$listen_on_inprocess_driver_orders
    extends graphql
        .WatchQueryOptions<Subscription$listen_on_inprocess_driver_orders> {
  WatchOptions$Subscription$listen_on_inprocess_driver_orders({
    String? operationName,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
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
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_inprocess_driver_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_inprocess_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_inprocess_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
        );
}

extension ClientExtension$Subscription$listen_on_inprocess_driver_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_inprocess_driver_orders>>
      subscribe$listen_on_inprocess_driver_orders(
              Options$Subscription$listen_on_inprocess_driver_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_inprocess_driver_orders>
      watchSubscription$listen_on_inprocess_driver_orders(
              WatchOptions$Subscription$listen_on_inprocess_driver_orders
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order {
  Subscription$listen_on_inprocess_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
      customer;

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
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
            is Subscription$listen_on_inprocess_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order
    on Subscription$listen_on_inprocess_driver_orders$delivery_order {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
          Subscription$listen_on_inprocess_driver_orders$delivery_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
    Subscription$listen_on_inprocess_driver_orders$delivery_order instance,
    TRes Function(Subscription$listen_on_inprocess_driver_orders$delivery_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer?
        customer,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
      TRes> get customer;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order _instance;

  final TRes Function(
      Subscription$listen_on_inprocess_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_inprocess_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer?
        customer,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
              .stub(_res);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$customer {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
      user:
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
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
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$customer {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer;

  TRes call({
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
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
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

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
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
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
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
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
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_past_driver_orders {
  factory Variables$Query$get_past_driver_orders({required int driverId}) =>
      Variables$Query$get_past_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Query$get_past_driver_orders._(this._$data);

  factory Variables$Query$get_past_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Query$get_past_driver_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Query$get_past_driver_orders<
          Variables$Query$get_past_driver_orders>
      get copyWith => CopyWith$Variables$Query$get_past_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_past_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  factory CopyWith$Variables$Query$get_past_driver_orders(
    Variables$Query$get_past_driver_orders instance,
    TRes Function(Variables$Query$get_past_driver_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_past_driver_orders;

  factory CopyWith$Variables$Query$get_past_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_past_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Query$get_past_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_past_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_past_driver_orders _instance;

  final TRes Function(Variables$Query$get_past_driver_orders) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Query$get_past_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_past_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_past_driver_orders(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Query$get_past_driver_orders {
  Query$get_past_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$get_past_driver_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_past_driver_orders$delivery_order> delivery_order;

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
    if (!(other is Query$get_past_driver_orders) ||
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

extension UtilityExtension$Query$get_past_driver_orders
    on Query$get_past_driver_orders {
  CopyWith$Query$get_past_driver_orders<Query$get_past_driver_orders>
      get copyWith => CopyWith$Query$get_past_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders<TRes> {
  factory CopyWith$Query$get_past_driver_orders(
    Query$get_past_driver_orders instance,
    TRes Function(Query$get_past_driver_orders) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders;

  factory CopyWith$Query$get_past_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders;

  TRes call({
    List<Query$get_past_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$get_past_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$get_past_driver_orders$delivery_order<
                      Query$get_past_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_past_driver_orders<TRes>
    implements CopyWith$Query$get_past_driver_orders<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders _instance;

  final TRes Function(Query$get_past_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$get_past_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$get_past_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$get_past_driver_orders$delivery_order<
                          Query$get_past_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order
              .map((e) => CopyWith$Query$get_past_driver_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_past_driver_orders<TRes>
    implements CopyWith$Query$get_past_driver_orders<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders(this._res);

  TRes _res;

  call({
    List<Query$get_past_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryget_past_driver_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_past_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
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
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: false),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'dropoff_gps'),
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
                name: NameNode(value: 'language_id'),
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
Query$get_past_driver_orders _parserFn$Query$get_past_driver_orders(
        Map<String, dynamic> data) =>
    Query$get_past_driver_orders.fromJson(data);

class Options$Query$get_past_driver_orders
    extends graphql.QueryOptions<Query$get_past_driver_orders> {
  Options$Query$get_past_driver_orders({
    String? operationName,
    required Variables$Query$get_past_driver_orders variables,
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
          document: documentNodeQueryget_past_driver_orders,
          parserFn: _parserFn$Query$get_past_driver_orders,
        );
}

class WatchOptions$Query$get_past_driver_orders
    extends graphql.WatchQueryOptions<Query$get_past_driver_orders> {
  WatchOptions$Query$get_past_driver_orders({
    String? operationName,
    required Variables$Query$get_past_driver_orders variables,
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
          document: documentNodeQueryget_past_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_past_driver_orders,
        );
}

class FetchMoreOptions$Query$get_past_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_past_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_past_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_past_driver_orders,
        );
}

extension ClientExtension$Query$get_past_driver_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_past_driver_orders>>
      query$get_past_driver_orders(
              Options$Query$get_past_driver_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_past_driver_orders>
      watchQuery$get_past_driver_orders(
              WatchOptions$Query$get_past_driver_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_past_driver_orders({
    required Query$get_past_driver_orders data,
    required Variables$Query$get_past_driver_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_past_driver_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_past_driver_orders? readQuery$get_past_driver_orders({
    required Variables$Query$get_past_driver_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_past_driver_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_past_driver_orders.fromJson(result);
  }
}

class Query$get_past_driver_orders$delivery_order {
  Query$get_past_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer: Query$get_past_driver_orders$delivery_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$get_past_driver_orders$delivery_order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$get_past_driver_orders$delivery_order$customer customer;

  final Query$get_past_driver_orders$delivery_order$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders$delivery_order
    on Query$get_past_driver_orders$delivery_order {
  CopyWith$Query$get_past_driver_orders$delivery_order<
          Query$get_past_driver_orders$delivery_order>
      get copyWith => CopyWith$Query$get_past_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order(
    Query$get_past_driver_orders$delivery_order instance,
    TRes Function(Query$get_past_driver_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order;

  factory CopyWith$Query$get_past_driver_orders$delivery_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_past_driver_orders$delivery_order$customer? customer,
    Query$get_past_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_past_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$get_past_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_past_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
            _then(_instance))
        : CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_past_driver_orders$delivery_order$customer? customer,
    Query$get_past_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer.stub(
              _res);
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
              _res);
}

class Query$get_past_driver_orders$delivery_order$customer {
  Query$get_past_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$customer(
      user: Query$get_past_driver_orders$delivery_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_past_driver_orders$delivery_order$customer$user user;

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
    if (!(other is Query$get_past_driver_orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$customer
    on Query$get_past_driver_orders$delivery_order$customer {
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<
          Query$get_past_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer(
    Query$get_past_driver_orders$delivery_order$customer instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer;

  TRes call({
    Query$get_past_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer<TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$customer _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_past_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_past_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Query$get_past_driver_orders$delivery_order$customer$user {
  Query$get_past_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$customer$user(
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
    if (!(other is Query$get_past_driver_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$customer$user
    on Query$get_past_driver_orders$delivery_order$customer$user {
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
          Query$get_past_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
    Query$get_past_driver_orders$delivery_order$customer$user instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$customer$user _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_past_driver_orders$delivery_order$restaurant {
  Query$get_past_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

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
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
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
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order$restaurant) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$restaurant
    on Query$get_past_driver_orders$delivery_order$restaurant {
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<
          Query$get_past_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
    Query$get_past_driver_orders$delivery_order$restaurant instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$restaurant) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$restaurant _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_inprocess_driver_orders {
  factory Variables$Query$get_inprocess_driver_orders(
          {required int driverId}) =>
      Variables$Query$get_inprocess_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Query$get_inprocess_driver_orders._(this._$data);

  factory Variables$Query$get_inprocess_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Query$get_inprocess_driver_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Query$get_inprocess_driver_orders<
          Variables$Query$get_inprocess_driver_orders>
      get copyWith => CopyWith$Variables$Query$get_inprocess_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  factory CopyWith$Variables$Query$get_inprocess_driver_orders(
    Variables$Query$get_inprocess_driver_orders instance,
    TRes Function(Variables$Query$get_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_inprocess_driver_orders;

  factory CopyWith$Variables$Query$get_inprocess_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_inprocess_driver_orders _instance;

  final TRes Function(Variables$Query$get_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Query$get_inprocess_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Query$get_inprocess_driver_orders {
  Query$get_inprocess_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$get_inprocess_driver_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_inprocess_driver_orders$delivery_order> delivery_order;

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
    if (!(other is Query$get_inprocess_driver_orders) ||
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

extension UtilityExtension$Query$get_inprocess_driver_orders
    on Query$get_inprocess_driver_orders {
  CopyWith$Query$get_inprocess_driver_orders<Query$get_inprocess_driver_orders>
      get copyWith => CopyWith$Query$get_inprocess_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders<TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders(
    Query$get_inprocess_driver_orders instance,
    TRes Function(Query$get_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders;

  factory CopyWith$Query$get_inprocess_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders;

  TRes call({
    List<Query$get_inprocess_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$get_inprocess_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$get_inprocess_driver_orders$delivery_order<
                      Query$get_inprocess_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders _instance;

  final TRes Function(Query$get_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$get_inprocess_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$get_inprocess_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$get_inprocess_driver_orders$delivery_order<
                          Query$get_inprocess_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map(
              (e) => CopyWith$Query$get_inprocess_driver_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders(this._res);

  TRes _res;

  call({
    List<Query$get_inprocess_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryget_inprocess_driver_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_inprocess_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
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
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: false),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'package_cost'),
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
            name: NameNode(value: 'dropoff_gps'),
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
                name: NameNode(value: 'language_id'),
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
Query$get_inprocess_driver_orders _parserFn$Query$get_inprocess_driver_orders(
        Map<String, dynamic> data) =>
    Query$get_inprocess_driver_orders.fromJson(data);

class Options$Query$get_inprocess_driver_orders
    extends graphql.QueryOptions<Query$get_inprocess_driver_orders> {
  Options$Query$get_inprocess_driver_orders({
    String? operationName,
    required Variables$Query$get_inprocess_driver_orders variables,
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
          document: documentNodeQueryget_inprocess_driver_orders,
          parserFn: _parserFn$Query$get_inprocess_driver_orders,
        );
}

class WatchOptions$Query$get_inprocess_driver_orders
    extends graphql.WatchQueryOptions<Query$get_inprocess_driver_orders> {
  WatchOptions$Query$get_inprocess_driver_orders({
    String? operationName,
    required Variables$Query$get_inprocess_driver_orders variables,
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
          document: documentNodeQueryget_inprocess_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_inprocess_driver_orders,
        );
}

class FetchMoreOptions$Query$get_inprocess_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_inprocess_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_inprocess_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_inprocess_driver_orders,
        );
}

extension ClientExtension$Query$get_inprocess_driver_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_inprocess_driver_orders>>
      query$get_inprocess_driver_orders(
              Options$Query$get_inprocess_driver_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_inprocess_driver_orders>
      watchQuery$get_inprocess_driver_orders(
              WatchOptions$Query$get_inprocess_driver_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_inprocess_driver_orders({
    required Query$get_inprocess_driver_orders data,
    required Variables$Query$get_inprocess_driver_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_inprocess_driver_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_inprocess_driver_orders? readQuery$get_inprocess_driver_orders({
    required Variables$Query$get_inprocess_driver_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_inprocess_driver_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_inprocess_driver_orders.fromJson(result);
  }
}

class Query$get_inprocess_driver_orders$delivery_order {
  Query$get_inprocess_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Query$get_inprocess_driver_orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$get_inprocess_driver_orders$delivery_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$get_inprocess_driver_orders$delivery_order$customer customer;

  final Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_inprocess_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order
    on Query$get_inprocess_driver_orders$delivery_order {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order<
          Query$get_inprocess_driver_orders$delivery_order>
      get copyWith => CopyWith$Query$get_inprocess_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order(
    Query$get_inprocess_driver_orders$delivery_order instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_inprocess_driver_orders$delivery_order$customer? customer,
    Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order _instance;

  final TRes Function(Query$get_inprocess_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_inprocess_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$get_inprocess_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_inprocess_driver_orders$delivery_order$customer? customer,
    Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant
              .stub(_res);
}

class Query$get_inprocess_driver_orders$delivery_order$customer {
  Query$get_inprocess_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$customer(
      user: Query$get_inprocess_driver_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_inprocess_driver_orders$delivery_order$customer$user user;

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
    if (!(other is Query$get_inprocess_driver_orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$customer
    on Query$get_inprocess_driver_orders$delivery_order$customer {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
          Query$get_inprocess_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
    Query$get_inprocess_driver_orders$delivery_order$customer instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer;

  TRes call({
    Query$get_inprocess_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$customer _instance;

  final TRes Function(Query$get_inprocess_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_inprocess_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_inprocess_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Query$get_inprocess_driver_orders$delivery_order$customer$user {
  Query$get_inprocess_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$customer$user(
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
            is Query$get_inprocess_driver_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$customer$user
    on Query$get_inprocess_driver_orders$delivery_order$customer$user {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
          Query$get_inprocess_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
    Query$get_inprocess_driver_orders$delivery_order$customer$user instance,
    TRes Function(
            Query$get_inprocess_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
      Query$get_inprocess_driver_orders$delivery_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_inprocess_driver_orders$delivery_order$restaurant {
  Query$get_inprocess_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

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
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
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
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
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
            is Query$get_inprocess_driver_orders$delivery_order$restaurant) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$restaurant
    on Query$get_inprocess_driver_orders$delivery_order$restaurant {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
          Query$get_inprocess_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
    Query$get_inprocess_driver_orders$delivery_order$restaurant instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$restaurant _instance;

  final TRes Function(
      Query$get_inprocess_driver_orders$delivery_order$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}
