import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$admin_listen_on_dv_orders {
  factory Variables$Subscription$admin_listen_on_dv_orders(
          {required bool inProccess}) =>
      Variables$Subscription$admin_listen_on_dv_orders._({
        r'inProccess': inProccess,
      });

  Variables$Subscription$admin_listen_on_dv_orders._(this._$data);

  factory Variables$Subscription$admin_listen_on_dv_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Subscription$admin_listen_on_dv_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Subscription$admin_listen_on_dv_orders<
          Variables$Subscription$admin_listen_on_dv_orders>
      get copyWith => CopyWith$Variables$Subscription$admin_listen_on_dv_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$admin_listen_on_dv_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inProccess = inProccess;
    final lOther$inProccess = other.inProccess;
    if (l$inProccess != lOther$inProccess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inProccess = inProccess;
    return Object.hashAll([l$inProccess]);
  }
}

abstract class CopyWith$Variables$Subscription$admin_listen_on_dv_orders<TRes> {
  factory CopyWith$Variables$Subscription$admin_listen_on_dv_orders(
    Variables$Subscription$admin_listen_on_dv_orders instance,
    TRes Function(Variables$Subscription$admin_listen_on_dv_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$admin_listen_on_dv_orders;

  factory CopyWith$Variables$Subscription$admin_listen_on_dv_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$admin_listen_on_dv_orders;

  TRes call({bool? inProccess});
}

class _CopyWithImpl$Variables$Subscription$admin_listen_on_dv_orders<TRes>
    implements CopyWith$Variables$Subscription$admin_listen_on_dv_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$admin_listen_on_dv_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$admin_listen_on_dv_orders _instance;

  final TRes Function(Variables$Subscription$admin_listen_on_dv_orders) _then;

  static const _undefined = {};

  TRes call({Object? inProccess = _undefined}) =>
      _then(Variables$Subscription$admin_listen_on_dv_orders._({
        ..._instance._$data,
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$admin_listen_on_dv_orders<TRes>
    implements CopyWith$Variables$Subscription$admin_listen_on_dv_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$admin_listen_on_dv_orders(this._res);

  TRes _res;

  call({bool? inProccess}) => _res;
}

class Subscription$admin_listen_on_dv_orders {
  Subscription$admin_listen_on_dv_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_dv_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_dv_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) =>
              Subscription$admin_listen_on_dv_orders$delivery_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$admin_listen_on_dv_orders$delivery_order>
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
    if (!(other is Subscription$admin_listen_on_dv_orders) ||
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

extension UtilityExtension$Subscription$admin_listen_on_dv_orders
    on Subscription$admin_listen_on_dv_orders {
  CopyWith$Subscription$admin_listen_on_dv_orders<
          Subscription$admin_listen_on_dv_orders>
      get copyWith => CopyWith$Subscription$admin_listen_on_dv_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_dv_orders<TRes> {
  factory CopyWith$Subscription$admin_listen_on_dv_orders(
    Subscription$admin_listen_on_dv_orders instance,
    TRes Function(Subscription$admin_listen_on_dv_orders) then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_dv_orders;

  factory CopyWith$Subscription$admin_listen_on_dv_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders;

  TRes call({
    List<Subscription$admin_listen_on_dv_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$admin_listen_on_dv_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<
                      Subscription$admin_listen_on_dv_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$admin_listen_on_dv_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_dv_orders<TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_dv_orders(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_dv_orders _instance;

  final TRes Function(Subscription$admin_listen_on_dv_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_dv_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Subscription$admin_listen_on_dv_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$admin_listen_on_dv_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<
                          Subscription$admin_listen_on_dv_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_dv_orders<TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders(this._res);

  TRes _res;

  call({
    List<Subscription$admin_listen_on_dv_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionadmin_listen_on_dv_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'admin_listen_on_dv_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
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
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'deliveryCompany',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProccess')),
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
            name: NameNode(value: 'order_type'),
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
Subscription$admin_listen_on_dv_orders
    _parserFn$Subscription$admin_listen_on_dv_orders(
            Map<String, dynamic> data) =>
        Subscription$admin_listen_on_dv_orders.fromJson(data);

class Options$Subscription$admin_listen_on_dv_orders extends graphql
    .SubscriptionOptions<Subscription$admin_listen_on_dv_orders> {
  Options$Subscription$admin_listen_on_dv_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_dv_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_dv_orders,
          parserFn: _parserFn$Subscription$admin_listen_on_dv_orders,
        );
}

class WatchOptions$Subscription$admin_listen_on_dv_orders
    extends graphql.WatchQueryOptions<Subscription$admin_listen_on_dv_orders> {
  WatchOptions$Subscription$admin_listen_on_dv_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_dv_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_dv_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$admin_listen_on_dv_orders,
        );
}

class FetchMoreOptions$Subscription$admin_listen_on_dv_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$admin_listen_on_dv_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$admin_listen_on_dv_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionadmin_listen_on_dv_orders,
        );
}

extension ClientExtension$Subscription$admin_listen_on_dv_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$admin_listen_on_dv_orders>>
      subscribe$admin_listen_on_dv_orders(
              Options$Subscription$admin_listen_on_dv_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$admin_listen_on_dv_orders>
      watchSubscription$admin_listen_on_dv_orders(
              WatchOptions$Subscription$admin_listen_on_dv_orders options) =>
          this.watchQuery(options);
}

class Subscription$admin_listen_on_dv_orders$delivery_order {
  Subscription$admin_listen_on_dv_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.order_type,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_dv_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$order_type = json['order_type'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_dv_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      order_type: (l$order_type as String),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer: Subscription$admin_listen_on_dv_orders$delivery_order$customer
          .fromJson((l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String order_type;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Subscription$admin_listen_on_dv_orders$delivery_order$customer customer;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
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
    final l$order_type = order_type;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$order_type,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$service_provider_id,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$admin_listen_on_dv_orders$delivery_order) ||
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$admin_listen_on_dv_orders$delivery_order
    on Subscription$admin_listen_on_dv_orders$delivery_order {
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<
          Subscription$admin_listen_on_dv_orders$delivery_order>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order(
    Subscription$admin_listen_on_dv_orders$delivery_order instance,
    TRes Function(Subscription$admin_listen_on_dv_orders$delivery_order) then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order;

  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? order_type,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$admin_listen_on_dv_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order<TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_dv_orders$delivery_order _instance;

  final TRes Function(Subscription$admin_listen_on_dv_orders$delivery_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? order_type = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_dv_orders$delivery_order(
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
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
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
                as Subscription$admin_listen_on_dv_orders$delivery_order$customer),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? order_type,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$admin_listen_on_dv_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer
              .stub(_res);
}

class Subscription$admin_listen_on_dv_orders$delivery_order$customer {
  Subscription$admin_listen_on_dv_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_dv_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_dv_orders$delivery_order$customer(
      user: Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
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
            is Subscription$admin_listen_on_dv_orders$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$admin_listen_on_dv_orders$delivery_order$customer
    on Subscription$admin_listen_on_dv_orders$delivery_order$customer {
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
          Subscription$admin_listen_on_dv_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer(
    Subscription$admin_listen_on_dv_orders$delivery_order$customer instance,
    TRes Function(
            Subscription$admin_listen_on_dv_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer;

  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer;

  TRes call({
    Subscription$admin_listen_on_dv_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_dv_orders$delivery_order$customer
      _instance;

  final TRes Function(
      Subscription$admin_listen_on_dv_orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_dv_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$admin_listen_on_dv_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$admin_listen_on_dv_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
              .stub(_res);
}

class Subscription$admin_listen_on_dv_orders$delivery_order$customer$user {
  Subscription$admin_listen_on_dv_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_dv_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
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
            is Subscription$admin_listen_on_dv_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
    on Subscription$admin_listen_on_dv_orders$delivery_order$customer$user {
  CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
          Subscription$admin_listen_on_dv_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
    Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$admin_listen_on_dv_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_dv_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$admin_listen_on_dv_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_dv_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_dv_orders {
  factory Variables$Query$admin_get_dv_orders({required bool inProccess}) =>
      Variables$Query$admin_get_dv_orders._({
        r'inProccess': inProccess,
      });

  Variables$Query$admin_get_dv_orders._(this._$data);

  factory Variables$Query$admin_get_dv_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Query$admin_get_dv_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_dv_orders<
          Variables$Query$admin_get_dv_orders>
      get copyWith => CopyWith$Variables$Query$admin_get_dv_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_dv_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inProccess = inProccess;
    final lOther$inProccess = other.inProccess;
    if (l$inProccess != lOther$inProccess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inProccess = inProccess;
    return Object.hashAll([l$inProccess]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_dv_orders<TRes> {
  factory CopyWith$Variables$Query$admin_get_dv_orders(
    Variables$Query$admin_get_dv_orders instance,
    TRes Function(Variables$Query$admin_get_dv_orders) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_dv_orders;

  factory CopyWith$Variables$Query$admin_get_dv_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_dv_orders;

  TRes call({bool? inProccess});
}

class _CopyWithImpl$Variables$Query$admin_get_dv_orders<TRes>
    implements CopyWith$Variables$Query$admin_get_dv_orders<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_dv_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_dv_orders _instance;

  final TRes Function(Variables$Query$admin_get_dv_orders) _then;

  static const _undefined = {};

  TRes call({Object? inProccess = _undefined}) =>
      _then(Variables$Query$admin_get_dv_orders._({
        ..._instance._$data,
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_dv_orders<TRes>
    implements CopyWith$Variables$Query$admin_get_dv_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_dv_orders(this._res);

  TRes _res;

  call({bool? inProccess}) => _res;
}

class Query$admin_get_dv_orders {
  Query$admin_get_dv_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$admin_get_dv_orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$admin_get_dv_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_dv_orders$delivery_order> delivery_order;

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
    if (!(other is Query$admin_get_dv_orders) ||
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

extension UtilityExtension$Query$admin_get_dv_orders
    on Query$admin_get_dv_orders {
  CopyWith$Query$admin_get_dv_orders<Query$admin_get_dv_orders> get copyWith =>
      CopyWith$Query$admin_get_dv_orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$admin_get_dv_orders<TRes> {
  factory CopyWith$Query$admin_get_dv_orders(
    Query$admin_get_dv_orders instance,
    TRes Function(Query$admin_get_dv_orders) then,
  ) = _CopyWithImpl$Query$admin_get_dv_orders;

  factory CopyWith$Query$admin_get_dv_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_orders;

  TRes call({
    List<Query$admin_get_dv_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$admin_get_dv_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$admin_get_dv_orders$delivery_order<
                      Query$admin_get_dv_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_dv_orders<TRes>
    implements CopyWith$Query$admin_get_dv_orders<TRes> {
  _CopyWithImpl$Query$admin_get_dv_orders(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_orders _instance;

  final TRes Function(Query$admin_get_dv_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$admin_get_dv_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$admin_get_dv_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$admin_get_dv_orders$delivery_order<
                          Query$admin_get_dv_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order
              .map((e) => CopyWith$Query$admin_get_dv_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_dv_orders<TRes>
    implements CopyWith$Query$admin_get_dv_orders<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_orders(this._res);

  TRes _res;

  call({
    List<Query$admin_get_dv_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryadmin_get_dv_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_dv_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
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
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'deliveryCompany',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProccess')),
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
            name: NameNode(value: 'order_type'),
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
Query$admin_get_dv_orders _parserFn$Query$admin_get_dv_orders(
        Map<String, dynamic> data) =>
    Query$admin_get_dv_orders.fromJson(data);

class Options$Query$admin_get_dv_orders
    extends graphql.QueryOptions<Query$admin_get_dv_orders> {
  Options$Query$admin_get_dv_orders({
    String? operationName,
    required Variables$Query$admin_get_dv_orders variables,
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
          document: documentNodeQueryadmin_get_dv_orders,
          parserFn: _parserFn$Query$admin_get_dv_orders,
        );
}

class WatchOptions$Query$admin_get_dv_orders
    extends graphql.WatchQueryOptions<Query$admin_get_dv_orders> {
  WatchOptions$Query$admin_get_dv_orders({
    String? operationName,
    required Variables$Query$admin_get_dv_orders variables,
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
          document: documentNodeQueryadmin_get_dv_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_dv_orders,
        );
}

class FetchMoreOptions$Query$admin_get_dv_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_dv_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_dv_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_dv_orders,
        );
}

extension ClientExtension$Query$admin_get_dv_orders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_dv_orders>>
      query$admin_get_dv_orders(
              Options$Query$admin_get_dv_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_dv_orders>
      watchQuery$admin_get_dv_orders(
              WatchOptions$Query$admin_get_dv_orders options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_dv_orders({
    required Query$admin_get_dv_orders data,
    required Variables$Query$admin_get_dv_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryadmin_get_dv_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_dv_orders? readQuery$admin_get_dv_orders({
    required Variables$Query$admin_get_dv_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryadmin_get_dv_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get_dv_orders.fromJson(result);
  }
}

class Query$admin_get_dv_orders$delivery_order {
  Query$admin_get_dv_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.order_type,
    required this.customer,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get_dv_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$order_type = json['order_type'];
    final l$customer = json['customer'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      order_type: (l$order_type as String),
      customer: Query$admin_get_dv_orders$delivery_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final String order_type;

  final Query$admin_get_dv_orders$delivery_order$customer customer;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
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
    final l$order_type = order_type;
    final l$customer = customer;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$order_type,
      l$customer,
      l$service_provider_id,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_orders$delivery_order) ||
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$admin_get_dv_orders$delivery_order
    on Query$admin_get_dv_orders$delivery_order {
  CopyWith$Query$admin_get_dv_orders$delivery_order<
          Query$admin_get_dv_orders$delivery_order>
      get copyWith => CopyWith$Query$admin_get_dv_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_orders$delivery_order<TRes> {
  factory CopyWith$Query$admin_get_dv_orders$delivery_order(
    Query$admin_get_dv_orders$delivery_order instance,
    TRes Function(Query$admin_get_dv_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$admin_get_dv_orders$delivery_order;

  factory CopyWith$Query$admin_get_dv_orders$delivery_order.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? order_type,
    Query$admin_get_dv_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer<TRes> get customer;
}

class _CopyWithImpl$Query$admin_get_dv_orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get_dv_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$admin_get_dv_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_orders$delivery_order _instance;

  final TRes Function(Query$admin_get_dv_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? order_type = _undefined,
    Object? customer = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_orders$delivery_order(
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
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as Query$admin_get_dv_orders$delivery_order$customer),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$admin_get_dv_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get_dv_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? order_type,
    Query$admin_get_dv_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$admin_get_dv_orders$delivery_order$customer.stub(_res);
}

class Query$admin_get_dv_orders$delivery_order$customer {
  Query$admin_get_dv_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$admin_get_dv_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_orders$delivery_order$customer(
      user: Query$admin_get_dv_orders$delivery_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_dv_orders$delivery_order$customer$user user;

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
    if (!(other is Query$admin_get_dv_orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$admin_get_dv_orders$delivery_order$customer
    on Query$admin_get_dv_orders$delivery_order$customer {
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer<
          Query$admin_get_dv_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$admin_get_dv_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$admin_get_dv_orders$delivery_order$customer(
    Query$admin_get_dv_orders$delivery_order$customer instance,
    TRes Function(Query$admin_get_dv_orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer;

  factory CopyWith$Query$admin_get_dv_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer;

  TRes call({
    Query$admin_get_dv_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer<TRes>
    implements
        CopyWith$Query$admin_get_dv_orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_orders$delivery_order$customer _instance;

  final TRes Function(Query$admin_get_dv_orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$admin_get_dv_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer<TRes>
    implements
        CopyWith$Query$admin_get_dv_orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$admin_get_dv_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user.stub(
              _res);
}

class Query$admin_get_dv_orders$delivery_order$customer$user {
  Query$admin_get_dv_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$admin_get_dv_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_orders$delivery_order$customer$user(
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
    if (!(other is Query$admin_get_dv_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$admin_get_dv_orders$delivery_order$customer$user
    on Query$admin_get_dv_orders$delivery_order$customer$user {
  CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<
          Query$admin_get_dv_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user(
    Query$admin_get_dv_orders$delivery_order$customer$user instance,
    TRes Function(Query$admin_get_dv_orders$delivery_order$customer$user) then,
  ) = _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer$user;

  factory CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer$user<TRes>
    implements
        CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<TRes> {
  _CopyWithImpl$Query$admin_get_dv_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_orders$delivery_order$customer$user _instance;

  final TRes Function(Query$admin_get_dv_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_orders$delivery_order$customer$user<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$admin_listen_on_restaurant_orders {
  factory Variables$Subscription$admin_listen_on_restaurant_orders(
          {required bool inProccess}) =>
      Variables$Subscription$admin_listen_on_restaurant_orders._({
        r'inProccess': inProccess,
      });

  Variables$Subscription$admin_listen_on_restaurant_orders._(this._$data);

  factory Variables$Subscription$admin_listen_on_restaurant_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Subscription$admin_listen_on_restaurant_orders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders<
          Variables$Subscription$admin_listen_on_restaurant_orders>
      get copyWith =>
          CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$admin_listen_on_restaurant_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inProccess = inProccess;
    final lOther$inProccess = other.inProccess;
    if (l$inProccess != lOther$inProccess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inProccess = inProccess;
    return Object.hashAll([l$inProccess]);
  }
}

abstract class CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders<
    TRes> {
  factory CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders(
    Variables$Subscription$admin_listen_on_restaurant_orders instance,
    TRes Function(Variables$Subscription$admin_listen_on_restaurant_orders)
        then,
  ) = _CopyWithImpl$Variables$Subscription$admin_listen_on_restaurant_orders;

  factory CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$admin_listen_on_restaurant_orders;

  TRes call({bool? inProccess});
}

class _CopyWithImpl$Variables$Subscription$admin_listen_on_restaurant_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders<
            TRes> {
  _CopyWithImpl$Variables$Subscription$admin_listen_on_restaurant_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$admin_listen_on_restaurant_orders _instance;

  final TRes Function(Variables$Subscription$admin_listen_on_restaurant_orders)
      _then;

  static const _undefined = {};

  TRes call({Object? inProccess = _undefined}) =>
      _then(Variables$Subscription$admin_listen_on_restaurant_orders._({
        ..._instance._$data,
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$admin_listen_on_restaurant_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$admin_listen_on_restaurant_orders<
            TRes> {
  _CopyWithStubImpl$Variables$Subscription$admin_listen_on_restaurant_orders(
      this._res);

  TRes _res;

  call({bool? inProccess}) => _res;
}

class Subscription$admin_listen_on_restaurant_orders {
  Subscription$admin_listen_on_restaurant_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_restaurant_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_restaurant_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Subscription$admin_listen_on_restaurant_orders$restaurant_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$admin_listen_on_restaurant_orders$restaurant_order>
      restaurant_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] =
        l$restaurant_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_order = restaurant_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$admin_listen_on_restaurant_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order.length != lOther$restaurant_order.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_order.length; i++) {
      final l$restaurant_order$entry = l$restaurant_order[i];
      final lOther$restaurant_order$entry = lOther$restaurant_order[i];
      if (l$restaurant_order$entry != lOther$restaurant_order$entry) {
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

extension UtilityExtension$Subscription$admin_listen_on_restaurant_orders
    on Subscription$admin_listen_on_restaurant_orders {
  CopyWith$Subscription$admin_listen_on_restaurant_orders<
          Subscription$admin_listen_on_restaurant_orders>
      get copyWith => CopyWith$Subscription$admin_listen_on_restaurant_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_restaurant_orders<TRes> {
  factory CopyWith$Subscription$admin_listen_on_restaurant_orders(
    Subscription$admin_listen_on_restaurant_orders instance,
    TRes Function(Subscription$admin_listen_on_restaurant_orders) then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders;

  factory CopyWith$Subscription$admin_listen_on_restaurant_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders;

  TRes call({
    List<Subscription$admin_listen_on_restaurant_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Subscription$admin_listen_on_restaurant_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
                      Subscription$admin_listen_on_restaurant_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_restaurant_orders<TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_restaurant_orders _instance;

  final TRes Function(Subscription$admin_listen_on_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_restaurant_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order as List<
                Subscription$admin_listen_on_restaurant_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Subscription$admin_listen_on_restaurant_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
                          Subscription$admin_listen_on_restaurant_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_restaurant_orders<TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders(this._res);

  TRes _res;

  call({
    List<Subscription$admin_listen_on_restaurant_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeSubscriptionadmin_listen_on_restaurant_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'admin_listen_on_restaurant_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProccess')),
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
            name: NameNode(value: 'restaurant_id'),
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
            name: NameNode(value: 'total_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_location_address'),
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
Subscription$admin_listen_on_restaurant_orders
    _parserFn$Subscription$admin_listen_on_restaurant_orders(
            Map<String, dynamic> data) =>
        Subscription$admin_listen_on_restaurant_orders.fromJson(data);

class Options$Subscription$admin_listen_on_restaurant_orders extends graphql
    .SubscriptionOptions<Subscription$admin_listen_on_restaurant_orders> {
  Options$Subscription$admin_listen_on_restaurant_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_restaurant_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_restaurant_orders,
          parserFn: _parserFn$Subscription$admin_listen_on_restaurant_orders,
        );
}

class WatchOptions$Subscription$admin_listen_on_restaurant_orders
    extends graphql
        .WatchQueryOptions<Subscription$admin_listen_on_restaurant_orders> {
  WatchOptions$Subscription$admin_listen_on_restaurant_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_restaurant_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_restaurant_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$admin_listen_on_restaurant_orders,
        );
}

class FetchMoreOptions$Subscription$admin_listen_on_restaurant_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$admin_listen_on_restaurant_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$admin_listen_on_restaurant_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionadmin_listen_on_restaurant_orders,
        );
}

extension ClientExtension$Subscription$admin_listen_on_restaurant_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$admin_listen_on_restaurant_orders>>
      subscribe$admin_listen_on_restaurant_orders(
              Options$Subscription$admin_listen_on_restaurant_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$admin_listen_on_restaurant_orders>
      watchSubscription$admin_listen_on_restaurant_orders(
              WatchOptions$Subscription$admin_listen_on_restaurant_orders
                  options) =>
          this.watchQuery(options);
}

class Subscription$admin_listen_on_restaurant_orders$restaurant_order {
  Subscription$admin_listen_on_restaurant_orders$restaurant_order({
    required this.id,
    required this.restaurant_id,
    required this.order_time,
    required this.status,
    this.total_cost,
    this.to_location_address,
    required this.customer,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_restaurant_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_id = json['restaurant_id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_restaurant_orders$restaurant_order(
      id: (l$id as int),
      restaurant_id: (l$restaurant_id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      customer:
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int restaurant_id;

  final String order_time;

  final String status;

  final double? total_cost;

  final String? to_location_address;

  final Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant_id = restaurant_id;
    final l$order_time = order_time;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_id,
      l$order_time,
      l$status,
      l$total_cost,
      l$to_location_address,
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
            is Subscription$admin_listen_on_restaurant_orders$restaurant_order) ||
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
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
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

extension UtilityExtension$Subscription$admin_listen_on_restaurant_orders$restaurant_order
    on Subscription$admin_listen_on_restaurant_orders$restaurant_order {
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
          Subscription$admin_listen_on_restaurant_orders$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order(
    Subscription$admin_listen_on_restaurant_orders$restaurant_order instance,
    TRes Function(
            Subscription$admin_listen_on_restaurant_orders$restaurant_order)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order;

  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order;

  TRes call({
    int? id,
    int? restaurant_id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_restaurant_orders$restaurant_order
      _instance;

  final TRes Function(
      Subscription$admin_listen_on_restaurant_orders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_restaurant_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    int? restaurant_id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
              .stub(_res);
}

class Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer {
  Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
      user:
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
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
            is Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
    on Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer {
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
        instance,
    TRes Function(
            Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer;

  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer;

  TRes call({
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer
      _instance;

  final TRes Function(
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
              .stub(_res);
}

class Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user {
  Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
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
            is Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
    on Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user {
  CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
    Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
        instance,
    TRes Function(
            Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user;

  factory CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_restaurant_orders$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_restaurant_orders {
  factory Variables$Query$admin_get_restaurant_orders(
          {required bool inProccess}) =>
      Variables$Query$admin_get_restaurant_orders._({
        r'inProccess': inProccess,
      });

  Variables$Query$admin_get_restaurant_orders._(this._$data);

  factory Variables$Query$admin_get_restaurant_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Query$admin_get_restaurant_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_restaurant_orders<
          Variables$Query$admin_get_restaurant_orders>
      get copyWith => CopyWith$Variables$Query$admin_get_restaurant_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_restaurant_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inProccess = inProccess;
    final lOther$inProccess = other.inProccess;
    if (l$inProccess != lOther$inProccess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inProccess = inProccess;
    return Object.hashAll([l$inProccess]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_restaurant_orders<TRes> {
  factory CopyWith$Variables$Query$admin_get_restaurant_orders(
    Variables$Query$admin_get_restaurant_orders instance,
    TRes Function(Variables$Query$admin_get_restaurant_orders) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_restaurant_orders;

  factory CopyWith$Variables$Query$admin_get_restaurant_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_restaurant_orders;

  TRes call({bool? inProccess});
}

class _CopyWithImpl$Variables$Query$admin_get_restaurant_orders<TRes>
    implements CopyWith$Variables$Query$admin_get_restaurant_orders<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_restaurant_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_restaurant_orders _instance;

  final TRes Function(Variables$Query$admin_get_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({Object? inProccess = _undefined}) =>
      _then(Variables$Query$admin_get_restaurant_orders._({
        ..._instance._$data,
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_restaurant_orders<TRes>
    implements CopyWith$Variables$Query$admin_get_restaurant_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_restaurant_orders(this._res);

  TRes _res;

  call({bool? inProccess}) => _res;
}

class Query$admin_get_restaurant_orders {
  Query$admin_get_restaurant_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$admin_get_restaurant_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurant_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$admin_get_restaurant_orders$restaurant_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_restaurant_orders$restaurant_order>
      restaurant_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] =
        l$restaurant_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_order = restaurant_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurant_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order.length != lOther$restaurant_order.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_order.length; i++) {
      final l$restaurant_order$entry = l$restaurant_order[i];
      final lOther$restaurant_order$entry = lOther$restaurant_order[i];
      if (l$restaurant_order$entry != lOther$restaurant_order$entry) {
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

extension UtilityExtension$Query$admin_get_restaurant_orders
    on Query$admin_get_restaurant_orders {
  CopyWith$Query$admin_get_restaurant_orders<Query$admin_get_restaurant_orders>
      get copyWith => CopyWith$Query$admin_get_restaurant_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurant_orders<TRes> {
  factory CopyWith$Query$admin_get_restaurant_orders(
    Query$admin_get_restaurant_orders instance,
    TRes Function(Query$admin_get_restaurant_orders) then,
  ) = _CopyWithImpl$Query$admin_get_restaurant_orders;

  factory CopyWith$Query$admin_get_restaurant_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurant_orders;

  TRes call({
    List<Query$admin_get_restaurant_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$admin_get_restaurant_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$admin_get_restaurant_orders$restaurant_order<
                      Query$admin_get_restaurant_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_restaurant_orders<TRes>
    implements CopyWith$Query$admin_get_restaurant_orders<TRes> {
  _CopyWithImpl$Query$admin_get_restaurant_orders(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurant_orders _instance;

  final TRes Function(Query$admin_get_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurant_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order
                as List<Query$admin_get_restaurant_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$admin_get_restaurant_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$admin_get_restaurant_orders$restaurant_order<
                          Query$admin_get_restaurant_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Query$admin_get_restaurant_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_restaurant_orders<TRes>
    implements CopyWith$Query$admin_get_restaurant_orders<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurant_orders(this._res);

  TRes _res;

  call({
    List<Query$admin_get_restaurant_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryadmin_get_restaurant_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_restaurant_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'restaurant_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProccess')),
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
            name: NameNode(value: 'restaurant_id'),
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
            name: NameNode(value: 'total_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_location_address'),
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
Query$admin_get_restaurant_orders _parserFn$Query$admin_get_restaurant_orders(
        Map<String, dynamic> data) =>
    Query$admin_get_restaurant_orders.fromJson(data);

class Options$Query$admin_get_restaurant_orders
    extends graphql.QueryOptions<Query$admin_get_restaurant_orders> {
  Options$Query$admin_get_restaurant_orders({
    String? operationName,
    required Variables$Query$admin_get_restaurant_orders variables,
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
          document: documentNodeQueryadmin_get_restaurant_orders,
          parserFn: _parserFn$Query$admin_get_restaurant_orders,
        );
}

class WatchOptions$Query$admin_get_restaurant_orders
    extends graphql.WatchQueryOptions<Query$admin_get_restaurant_orders> {
  WatchOptions$Query$admin_get_restaurant_orders({
    String? operationName,
    required Variables$Query$admin_get_restaurant_orders variables,
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
          document: documentNodeQueryadmin_get_restaurant_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_restaurant_orders,
        );
}

class FetchMoreOptions$Query$admin_get_restaurant_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_restaurant_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_restaurant_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_restaurant_orders,
        );
}

extension ClientExtension$Query$admin_get_restaurant_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_restaurant_orders>>
      query$admin_get_restaurant_orders(
              Options$Query$admin_get_restaurant_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_restaurant_orders>
      watchQuery$admin_get_restaurant_orders(
              WatchOptions$Query$admin_get_restaurant_orders options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_restaurant_orders({
    required Query$admin_get_restaurant_orders data,
    required Variables$Query$admin_get_restaurant_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_restaurant_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_restaurant_orders? readQuery$admin_get_restaurant_orders({
    required Variables$Query$admin_get_restaurant_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryadmin_get_restaurant_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$admin_get_restaurant_orders.fromJson(result);
  }
}

class Query$admin_get_restaurant_orders$restaurant_order {
  Query$admin_get_restaurant_orders$restaurant_order({
    required this.id,
    required this.restaurant_id,
    required this.order_time,
    required this.status,
    this.total_cost,
    this.to_location_address,
    required this.customer,
    required this.$__typename,
  });

  factory Query$admin_get_restaurant_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant_id = json['restaurant_id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurant_orders$restaurant_order(
      id: (l$id as int),
      restaurant_id: (l$restaurant_id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      customer:
          Query$admin_get_restaurant_orders$restaurant_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int restaurant_id;

  final String order_time;

  final String status;

  final double? total_cost;

  final String? to_location_address;

  final Query$admin_get_restaurant_orders$restaurant_order$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant_id = restaurant_id;
    final l$order_time = order_time;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant_id,
      l$order_time,
      l$status,
      l$total_cost,
      l$to_location_address,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurant_orders$restaurant_order) ||
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
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
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

extension UtilityExtension$Query$admin_get_restaurant_orders$restaurant_order
    on Query$admin_get_restaurant_orders$restaurant_order {
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order<
          Query$admin_get_restaurant_orders$restaurant_order>
      get copyWith =>
          CopyWith$Query$admin_get_restaurant_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurant_orders$restaurant_order<
    TRes> {
  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order(
    Query$admin_get_restaurant_orders$restaurant_order instance,
    TRes Function(Query$admin_get_restaurant_orders$restaurant_order) then,
  ) = _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order;

  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order;

  TRes call({
    int? id,
    int? restaurant_id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$admin_get_restaurant_orders$restaurant_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order<TRes> {
  _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurant_orders$restaurant_order _instance;

  final TRes Function(Query$admin_get_restaurant_orders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant_id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurant_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$admin_get_restaurant_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    int? restaurant_id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$admin_get_restaurant_orders$restaurant_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer
              .stub(_res);
}

class Query$admin_get_restaurant_orders$restaurant_order$customer {
  Query$admin_get_restaurant_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$admin_get_restaurant_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurant_orders$restaurant_order$customer(
      user: Query$admin_get_restaurant_orders$restaurant_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_restaurant_orders$restaurant_order$customer$user user;

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
            is Query$admin_get_restaurant_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Query$admin_get_restaurant_orders$restaurant_order$customer
    on Query$admin_get_restaurant_orders$restaurant_order$customer {
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<
          Query$admin_get_restaurant_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer(
    Query$admin_get_restaurant_orders$restaurant_order$customer instance,
    TRes Function(Query$admin_get_restaurant_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer;

  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer;

  TRes call({
    Query$admin_get_restaurant_orders$restaurant_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurant_orders$restaurant_order$customer _instance;

  final TRes Function(
      Query$admin_get_restaurant_orders$restaurant_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurant_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$admin_get_restaurant_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$admin_get_restaurant_orders$restaurant_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user
              .stub(_res);
}

class Query$admin_get_restaurant_orders$restaurant_order$customer$user {
  Query$admin_get_restaurant_orders$restaurant_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$admin_get_restaurant_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurant_orders$restaurant_order$customer$user(
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
            is Query$admin_get_restaurant_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Query$admin_get_restaurant_orders$restaurant_order$customer$user
    on Query$admin_get_restaurant_orders$restaurant_order$customer$user {
  CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
          Query$admin_get_restaurant_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user(
    Query$admin_get_restaurant_orders$restaurant_order$customer$user instance,
    TRes Function(
            Query$admin_get_restaurant_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user;

  factory CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurant_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
      Query$admin_get_restaurant_orders$restaurant_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurant_orders$restaurant_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurant_orders$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_service__orders {
  factory Variables$Query$admin_get_service__orders({
    required String serviceProviderType,
    required int serviceProviderId,
    required bool inProccess,
    required int limit,
  }) =>
      Variables$Query$admin_get_service__orders._({
        r'serviceProviderType': serviceProviderType,
        r'serviceProviderId': serviceProviderId,
        r'inProccess': inProccess,
        r'limit': limit,
      });

  Variables$Query$admin_get_service__orders._(this._$data);

  factory Variables$Query$admin_get_service__orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = data['serviceProviderType'];
    result$data['serviceProviderType'] = (l$serviceProviderType as String);
    final l$serviceProviderId = data['serviceProviderId'];
    result$data['serviceProviderId'] = (l$serviceProviderId as int);
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    return Variables$Query$admin_get_service__orders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get serviceProviderType => (_$data['serviceProviderType'] as String);
  int get serviceProviderId => (_$data['serviceProviderId'] as int);
  bool get inProccess => (_$data['inProccess'] as bool);
  int get limit => (_$data['limit'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = serviceProviderType;
    result$data['serviceProviderType'] = l$serviceProviderType;
    final l$serviceProviderId = serviceProviderId;
    result$data['serviceProviderId'] = l$serviceProviderId;
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_service__orders<
          Variables$Query$admin_get_service__orders>
      get copyWith => CopyWith$Variables$Query$admin_get_service__orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_service__orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceProviderType = serviceProviderType;
    final lOther$serviceProviderType = other.serviceProviderType;
    if (l$serviceProviderType != lOther$serviceProviderType) {
      return false;
    }
    final l$serviceProviderId = serviceProviderId;
    final lOther$serviceProviderId = other.serviceProviderId;
    if (l$serviceProviderId != lOther$serviceProviderId) {
      return false;
    }
    final l$inProccess = inProccess;
    final lOther$inProccess = other.inProccess;
    if (l$inProccess != lOther$inProccess) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceProviderType = serviceProviderType;
    final l$serviceProviderId = serviceProviderId;
    final l$inProccess = inProccess;
    final l$limit = limit;
    return Object.hashAll([
      l$serviceProviderType,
      l$serviceProviderId,
      l$inProccess,
      l$limit,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_service__orders<TRes> {
  factory CopyWith$Variables$Query$admin_get_service__orders(
    Variables$Query$admin_get_service__orders instance,
    TRes Function(Variables$Query$admin_get_service__orders) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_service__orders;

  factory CopyWith$Variables$Query$admin_get_service__orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_service__orders;

  TRes call({
    String? serviceProviderType,
    int? serviceProviderId,
    bool? inProccess,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$admin_get_service__orders<TRes>
    implements CopyWith$Variables$Query$admin_get_service__orders<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_service__orders(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_service__orders _instance;

  final TRes Function(Variables$Query$admin_get_service__orders) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceProviderType = _undefined,
    Object? serviceProviderId = _undefined,
    Object? inProccess = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$admin_get_service__orders._({
        ..._instance._$data,
        if (serviceProviderType != _undefined && serviceProviderType != null)
          'serviceProviderType': (serviceProviderType as String),
        if (serviceProviderId != _undefined && serviceProviderId != null)
          'serviceProviderId': (serviceProviderId as int),
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
        if (limit != _undefined && limit != null) 'limit': (limit as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_service__orders<TRes>
    implements CopyWith$Variables$Query$admin_get_service__orders<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_service__orders(this._res);

  TRes _res;

  call({
    String? serviceProviderType,
    int? serviceProviderId,
    bool? inProccess,
    int? limit,
  }) =>
      _res;
}

class Query$admin_get_service__orders {
  Query$admin_get_service__orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$admin_get_service__orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_service__orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$admin_get_service__orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_service__orders$delivery_order> delivery_order;

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
    if (!(other is Query$admin_get_service__orders) ||
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

extension UtilityExtension$Query$admin_get_service__orders
    on Query$admin_get_service__orders {
  CopyWith$Query$admin_get_service__orders<Query$admin_get_service__orders>
      get copyWith => CopyWith$Query$admin_get_service__orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_service__orders<TRes> {
  factory CopyWith$Query$admin_get_service__orders(
    Query$admin_get_service__orders instance,
    TRes Function(Query$admin_get_service__orders) then,
  ) = _CopyWithImpl$Query$admin_get_service__orders;

  factory CopyWith$Query$admin_get_service__orders.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_service__orders;

  TRes call({
    List<Query$admin_get_service__orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$admin_get_service__orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$admin_get_service__orders$delivery_order<
                      Query$admin_get_service__orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_service__orders<TRes>
    implements CopyWith$Query$admin_get_service__orders<TRes> {
  _CopyWithImpl$Query$admin_get_service__orders(
    this._instance,
    this._then,
  );

  final Query$admin_get_service__orders _instance;

  final TRes Function(Query$admin_get_service__orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_service__orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$admin_get_service__orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$admin_get_service__orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$admin_get_service__orders$delivery_order<
                          Query$admin_get_service__orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map(
              (e) => CopyWith$Query$admin_get_service__orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_service__orders<TRes>
    implements CopyWith$Query$admin_get_service__orders<TRes> {
  _CopyWithStubImpl$Query$admin_get_service__orders(this._res);

  TRes _res;

  call({
    List<Query$admin_get_service__orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryadmin_get_service__orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_service__orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceProviderType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'serviceProviderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
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
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'serviceProviderType')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'serviceProviderId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProccess')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
            name: NameNode(value: 'order_type'),
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
Query$admin_get_service__orders _parserFn$Query$admin_get_service__orders(
        Map<String, dynamic> data) =>
    Query$admin_get_service__orders.fromJson(data);

class Options$Query$admin_get_service__orders
    extends graphql.QueryOptions<Query$admin_get_service__orders> {
  Options$Query$admin_get_service__orders({
    String? operationName,
    required Variables$Query$admin_get_service__orders variables,
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
          document: documentNodeQueryadmin_get_service__orders,
          parserFn: _parserFn$Query$admin_get_service__orders,
        );
}

class WatchOptions$Query$admin_get_service__orders
    extends graphql.WatchQueryOptions<Query$admin_get_service__orders> {
  WatchOptions$Query$admin_get_service__orders({
    String? operationName,
    required Variables$Query$admin_get_service__orders variables,
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
          document: documentNodeQueryadmin_get_service__orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_service__orders,
        );
}

class FetchMoreOptions$Query$admin_get_service__orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_service__orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_service__orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_service__orders,
        );
}

extension ClientExtension$Query$admin_get_service__orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_service__orders>>
      query$admin_get_service__orders(
              Options$Query$admin_get_service__orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_service__orders>
      watchQuery$admin_get_service__orders(
              WatchOptions$Query$admin_get_service__orders options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_service__orders({
    required Query$admin_get_service__orders data,
    required Variables$Query$admin_get_service__orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_service__orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_service__orders? readQuery$admin_get_service__orders({
    required Variables$Query$admin_get_service__orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryadmin_get_service__orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$admin_get_service__orders.fromJson(result);
  }
}

class Query$admin_get_service__orders$delivery_order {
  Query$admin_get_service__orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.order_type,
    required this.dropoff_gps,
    required this.customer,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get_service__orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$order_type = json['order_type'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_service__orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      order_type: (l$order_type as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Query$admin_get_service__orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final String order_type;

  final Geography dropoff_gps;

  final Query$admin_get_service__orders$delivery_order$customer customer;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
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
    final l$order_type = order_type;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$order_type,
      l$dropoff_gps,
      l$customer,
      l$service_provider_id,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_service__orders$delivery_order) ||
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$admin_get_service__orders$delivery_order
    on Query$admin_get_service__orders$delivery_order {
  CopyWith$Query$admin_get_service__orders$delivery_order<
          Query$admin_get_service__orders$delivery_order>
      get copyWith => CopyWith$Query$admin_get_service__orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_service__orders$delivery_order<TRes> {
  factory CopyWith$Query$admin_get_service__orders$delivery_order(
    Query$admin_get_service__orders$delivery_order instance,
    TRes Function(Query$admin_get_service__orders$delivery_order) then,
  ) = _CopyWithImpl$Query$admin_get_service__orders$delivery_order;

  factory CopyWith$Query$admin_get_service__orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    String? order_type,
    Geography? dropoff_gps,
    Query$admin_get_service__orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Query$admin_get_service__orders$delivery_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$admin_get_service__orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get_service__orders$delivery_order<TRes> {
  _CopyWithImpl$Query$admin_get_service__orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$admin_get_service__orders$delivery_order _instance;

  final TRes Function(Query$admin_get_service__orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? order_type = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_service__orders$delivery_order(
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
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$admin_get_service__orders$delivery_order$customer),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_service__orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$admin_get_service__orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get_service__orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    String? order_type,
    Geography? dropoff_gps,
    Query$admin_get_service__orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_service__orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$admin_get_service__orders$delivery_order$customer.stub(
              _res);
}

class Query$admin_get_service__orders$delivery_order$customer {
  Query$admin_get_service__orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$admin_get_service__orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_service__orders$delivery_order$customer(
      user:
          Query$admin_get_service__orders$delivery_order$customer$user.fromJson(
              (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_service__orders$delivery_order$customer$user user;

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
    if (!(other is Query$admin_get_service__orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$admin_get_service__orders$delivery_order$customer
    on Query$admin_get_service__orders$delivery_order$customer {
  CopyWith$Query$admin_get_service__orders$delivery_order$customer<
          Query$admin_get_service__orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$admin_get_service__orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_service__orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$admin_get_service__orders$delivery_order$customer(
    Query$admin_get_service__orders$delivery_order$customer instance,
    TRes Function(Query$admin_get_service__orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer;

  factory CopyWith$Query$admin_get_service__orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer;

  TRes call({
    Query$admin_get_service__orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$admin_get_service__orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$admin_get_service__orders$delivery_order$customer _instance;

  final TRes Function(Query$admin_get_service__orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_service__orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$admin_get_service__orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$admin_get_service__orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$admin_get_service__orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$admin_get_service__orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$admin_get_service__orders$delivery_order$customer$user
              .stub(_res);
}

class Query$admin_get_service__orders$delivery_order$customer$user {
  Query$admin_get_service__orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$admin_get_service__orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_service__orders$delivery_order$customer$user(
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
            is Query$admin_get_service__orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$admin_get_service__orders$delivery_order$customer$user
    on Query$admin_get_service__orders$delivery_order$customer$user {
  CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<
          Query$admin_get_service__orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$admin_get_service__orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$admin_get_service__orders$delivery_order$customer$user(
    Query$admin_get_service__orders$delivery_order$customer$user instance,
    TRes Function(Query$admin_get_service__orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer$user;

  factory CopyWith$Query$admin_get_service__orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$admin_get_service__orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$admin_get_service__orders$delivery_order$customer$user _instance;

  final TRes Function(
      Query$admin_get_service__orders$delivery_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_service__orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get_service__orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_service__orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
