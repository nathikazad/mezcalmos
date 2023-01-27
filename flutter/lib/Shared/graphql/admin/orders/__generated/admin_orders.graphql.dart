import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$admin_listen_on_orders {
  factory Variables$Subscription$admin_listen_on_orders({
    required String serviceProviderType,
    required bool inProccess,
  }) =>
      Variables$Subscription$admin_listen_on_orders._({
        r'serviceProviderType': serviceProviderType,
        r'inProccess': inProccess,
      });

  Variables$Subscription$admin_listen_on_orders._(this._$data);

  factory Variables$Subscription$admin_listen_on_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = data['serviceProviderType'];
    result$data['serviceProviderType'] = (l$serviceProviderType as String);
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Subscription$admin_listen_on_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get serviceProviderType => (_$data['serviceProviderType'] as String);
  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = serviceProviderType;
    result$data['serviceProviderType'] = l$serviceProviderType;
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Subscription$admin_listen_on_orders<
          Variables$Subscription$admin_listen_on_orders>
      get copyWith => CopyWith$Variables$Subscription$admin_listen_on_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$admin_listen_on_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceProviderType = serviceProviderType;
    final lOther$serviceProviderType = other.serviceProviderType;
    if (l$serviceProviderType != lOther$serviceProviderType) {
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
    final l$serviceProviderType = serviceProviderType;
    final l$inProccess = inProccess;
    return Object.hashAll([
      l$serviceProviderType,
      l$inProccess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$admin_listen_on_orders<TRes> {
  factory CopyWith$Variables$Subscription$admin_listen_on_orders(
    Variables$Subscription$admin_listen_on_orders instance,
    TRes Function(Variables$Subscription$admin_listen_on_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$admin_listen_on_orders;

  factory CopyWith$Variables$Subscription$admin_listen_on_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$admin_listen_on_orders;

  TRes call({
    String? serviceProviderType,
    bool? inProccess,
  });
}

class _CopyWithImpl$Variables$Subscription$admin_listen_on_orders<TRes>
    implements CopyWith$Variables$Subscription$admin_listen_on_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$admin_listen_on_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$admin_listen_on_orders _instance;

  final TRes Function(Variables$Subscription$admin_listen_on_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceProviderType = _undefined,
    Object? inProccess = _undefined,
  }) =>
      _then(Variables$Subscription$admin_listen_on_orders._({
        ..._instance._$data,
        if (serviceProviderType != _undefined && serviceProviderType != null)
          'serviceProviderType': (serviceProviderType as String),
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$admin_listen_on_orders<TRes>
    implements CopyWith$Variables$Subscription$admin_listen_on_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$admin_listen_on_orders(this._res);

  TRes _res;

  call({
    String? serviceProviderType,
    bool? inProccess,
  }) =>
      _res;
}

class Subscription$admin_listen_on_orders {
  Subscription$admin_listen_on_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) =>
              Subscription$admin_listen_on_orders$delivery_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$admin_listen_on_orders$delivery_order> delivery_order;

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
    if (!(other is Subscription$admin_listen_on_orders) ||
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

extension UtilityExtension$Subscription$admin_listen_on_orders
    on Subscription$admin_listen_on_orders {
  CopyWith$Subscription$admin_listen_on_orders<
          Subscription$admin_listen_on_orders>
      get copyWith => CopyWith$Subscription$admin_listen_on_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_orders<TRes> {
  factory CopyWith$Subscription$admin_listen_on_orders(
    Subscription$admin_listen_on_orders instance,
    TRes Function(Subscription$admin_listen_on_orders) then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_orders;

  factory CopyWith$Subscription$admin_listen_on_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_orders;

  TRes call({
    List<Subscription$admin_listen_on_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$admin_listen_on_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$admin_listen_on_orders$delivery_order<
                      Subscription$admin_listen_on_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$admin_listen_on_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_orders<TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_orders(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_orders _instance;

  final TRes Function(Subscription$admin_listen_on_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Subscription$admin_listen_on_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$admin_listen_on_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$admin_listen_on_orders$delivery_order<
                          Subscription$admin_listen_on_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$admin_listen_on_orders$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$admin_listen_on_orders<TRes>
    implements CopyWith$Subscription$admin_listen_on_orders<TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_orders(this._res);

  TRes _res;

  call({
    List<Subscription$admin_listen_on_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionadmin_listen_on_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'admin_listen_on_orders'),
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
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
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
Subscription$admin_listen_on_orders
    _parserFn$Subscription$admin_listen_on_orders(Map<String, dynamic> data) =>
        Subscription$admin_listen_on_orders.fromJson(data);

class Options$Subscription$admin_listen_on_orders
    extends graphql.SubscriptionOptions<Subscription$admin_listen_on_orders> {
  Options$Subscription$admin_listen_on_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_orders,
          parserFn: _parserFn$Subscription$admin_listen_on_orders,
        );
}

class WatchOptions$Subscription$admin_listen_on_orders
    extends graphql.WatchQueryOptions<Subscription$admin_listen_on_orders> {
  WatchOptions$Subscription$admin_listen_on_orders({
    String? operationName,
    required Variables$Subscription$admin_listen_on_orders variables,
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
          document: documentNodeSubscriptionadmin_listen_on_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$admin_listen_on_orders,
        );
}

class FetchMoreOptions$Subscription$admin_listen_on_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$admin_listen_on_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$admin_listen_on_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionadmin_listen_on_orders,
        );
}

extension ClientExtension$Subscription$admin_listen_on_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$admin_listen_on_orders>>
      subscribe$admin_listen_on_orders(
              Options$Subscription$admin_listen_on_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$admin_listen_on_orders>
      watchSubscription$admin_listen_on_orders(
              WatchOptions$Subscription$admin_listen_on_orders options) =>
          this.watchQuery(options);
}

class Subscription$admin_listen_on_orders$delivery_order {
  Subscription$admin_listen_on_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.service_provider_id,
    this.service_provider_type,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Subscription$admin_listen_on_orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Subscription$admin_listen_on_orders$delivery_order$customer customer;

  final int? service_provider_id;

  final String? service_provider_type;

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
    if (!(other is Subscription$admin_listen_on_orders$delivery_order) ||
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

extension UtilityExtension$Subscription$admin_listen_on_orders$delivery_order
    on Subscription$admin_listen_on_orders$delivery_order {
  CopyWith$Subscription$admin_listen_on_orders$delivery_order<
          Subscription$admin_listen_on_orders$delivery_order>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_orders$delivery_order<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order(
    Subscription$admin_listen_on_orders$delivery_order instance,
    TRes Function(Subscription$admin_listen_on_orders$delivery_order) then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order;

  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$admin_listen_on_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order<TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order<TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_orders$delivery_order _instance;

  final TRes Function(Subscription$admin_listen_on_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_orders$delivery_order(
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
                as Subscription$admin_listen_on_orders$delivery_order$customer),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order<TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$admin_listen_on_orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer
              .stub(_res);
}

class Subscription$admin_listen_on_orders$delivery_order$customer {
  Subscription$admin_listen_on_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_orders$delivery_order$customer(
      user: Subscription$admin_listen_on_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$admin_listen_on_orders$delivery_order$customer$user user;

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
            is Subscription$admin_listen_on_orders$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$admin_listen_on_orders$delivery_order$customer
    on Subscription$admin_listen_on_orders$delivery_order$customer {
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<
          Subscription$admin_listen_on_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer(
    Subscription$admin_listen_on_orders$delivery_order$customer instance,
    TRes Function(Subscription$admin_listen_on_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer;

  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer;

  TRes call({
    Subscription$admin_listen_on_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_orders$delivery_order$customer _instance;

  final TRes Function(
      Subscription$admin_listen_on_orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$admin_listen_on_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$admin_listen_on_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user
              .stub(_res);
}

class Subscription$admin_listen_on_orders$delivery_order$customer$user {
  Subscription$admin_listen_on_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$admin_listen_on_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$admin_listen_on_orders$delivery_order$customer$user(
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
            is Subscription$admin_listen_on_orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Subscription$admin_listen_on_orders$delivery_order$customer$user
    on Subscription$admin_listen_on_orders$delivery_order$customer$user {
  CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
          Subscription$admin_listen_on_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user(
    Subscription$admin_listen_on_orders$delivery_order$customer$user instance,
    TRes Function(
            Subscription$admin_listen_on_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$admin_listen_on_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
      Subscription$admin_listen_on_orders$delivery_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$admin_listen_on_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$admin_listen_on_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$admin_listen_on_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get__orders {
  factory Variables$Query$admin_get__orders({
    required String serviceProviderType,
    required bool inProccess,
  }) =>
      Variables$Query$admin_get__orders._({
        r'serviceProviderType': serviceProviderType,
        r'inProccess': inProccess,
      });

  Variables$Query$admin_get__orders._(this._$data);

  factory Variables$Query$admin_get__orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = data['serviceProviderType'];
    result$data['serviceProviderType'] = (l$serviceProviderType as String);
    final l$inProccess = data['inProccess'];
    result$data['inProccess'] = (l$inProccess as bool);
    return Variables$Query$admin_get__orders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get serviceProviderType => (_$data['serviceProviderType'] as String);
  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = serviceProviderType;
    result$data['serviceProviderType'] = l$serviceProviderType;
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get__orders<Variables$Query$admin_get__orders>
      get copyWith => CopyWith$Variables$Query$admin_get__orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get__orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceProviderType = serviceProviderType;
    final lOther$serviceProviderType = other.serviceProviderType;
    if (l$serviceProviderType != lOther$serviceProviderType) {
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
    final l$serviceProviderType = serviceProviderType;
    final l$inProccess = inProccess;
    return Object.hashAll([
      l$serviceProviderType,
      l$inProccess,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get__orders<TRes> {
  factory CopyWith$Variables$Query$admin_get__orders(
    Variables$Query$admin_get__orders instance,
    TRes Function(Variables$Query$admin_get__orders) then,
  ) = _CopyWithImpl$Variables$Query$admin_get__orders;

  factory CopyWith$Variables$Query$admin_get__orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get__orders;

  TRes call({
    String? serviceProviderType,
    bool? inProccess,
  });
}

class _CopyWithImpl$Variables$Query$admin_get__orders<TRes>
    implements CopyWith$Variables$Query$admin_get__orders<TRes> {
  _CopyWithImpl$Variables$Query$admin_get__orders(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get__orders _instance;

  final TRes Function(Variables$Query$admin_get__orders) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceProviderType = _undefined,
    Object? inProccess = _undefined,
  }) =>
      _then(Variables$Query$admin_get__orders._({
        ..._instance._$data,
        if (serviceProviderType != _undefined && serviceProviderType != null)
          'serviceProviderType': (serviceProviderType as String),
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get__orders<TRes>
    implements CopyWith$Variables$Query$admin_get__orders<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get__orders(this._res);

  TRes _res;

  call({
    String? serviceProviderType,
    bool? inProccess,
  }) =>
      _res;
}

class Query$admin_get__orders {
  Query$admin_get__orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$admin_get__orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$admin_get__orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$admin_get__orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get__orders$delivery_order> delivery_order;

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
    if (!(other is Query$admin_get__orders) ||
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

extension UtilityExtension$Query$admin_get__orders on Query$admin_get__orders {
  CopyWith$Query$admin_get__orders<Query$admin_get__orders> get copyWith =>
      CopyWith$Query$admin_get__orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$admin_get__orders<TRes> {
  factory CopyWith$Query$admin_get__orders(
    Query$admin_get__orders instance,
    TRes Function(Query$admin_get__orders) then,
  ) = _CopyWithImpl$Query$admin_get__orders;

  factory CopyWith$Query$admin_get__orders.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get__orders;

  TRes call({
    List<Query$admin_get__orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$admin_get__orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$admin_get__orders$delivery_order<
                      Query$admin_get__orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get__orders<TRes>
    implements CopyWith$Query$admin_get__orders<TRes> {
  _CopyWithImpl$Query$admin_get__orders(
    this._instance,
    this._then,
  );

  final Query$admin_get__orders _instance;

  final TRes Function(Query$admin_get__orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get__orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order as List<Query$admin_get__orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$admin_get__orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$admin_get__orders$delivery_order<
                          Query$admin_get__orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order
              .map((e) => CopyWith$Query$admin_get__orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get__orders<TRes>
    implements CopyWith$Query$admin_get__orders<TRes> {
  _CopyWithStubImpl$Query$admin_get__orders(this._res);

  TRes _res;

  call({
    List<Query$admin_get__orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryadmin_get__orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get__orders'),
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
        variable: VariableNode(name: NameNode(value: 'inProccess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
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
Query$admin_get__orders _parserFn$Query$admin_get__orders(
        Map<String, dynamic> data) =>
    Query$admin_get__orders.fromJson(data);

class Options$Query$admin_get__orders
    extends graphql.QueryOptions<Query$admin_get__orders> {
  Options$Query$admin_get__orders({
    String? operationName,
    required Variables$Query$admin_get__orders variables,
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
          document: documentNodeQueryadmin_get__orders,
          parserFn: _parserFn$Query$admin_get__orders,
        );
}

class WatchOptions$Query$admin_get__orders
    extends graphql.WatchQueryOptions<Query$admin_get__orders> {
  WatchOptions$Query$admin_get__orders({
    String? operationName,
    required Variables$Query$admin_get__orders variables,
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
          document: documentNodeQueryadmin_get__orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get__orders,
        );
}

class FetchMoreOptions$Query$admin_get__orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get__orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get__orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get__orders,
        );
}

extension ClientExtension$Query$admin_get__orders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get__orders>> query$admin_get__orders(
          Options$Query$admin_get__orders options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$admin_get__orders> watchQuery$admin_get__orders(
          WatchOptions$Query$admin_get__orders options) =>
      this.watchQuery(options);
  void writeQuery$admin_get__orders({
    required Query$admin_get__orders data,
    required Variables$Query$admin_get__orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryadmin_get__orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get__orders? readQuery$admin_get__orders({
    required Variables$Query$admin_get__orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryadmin_get__orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get__orders.fromJson(result);
  }
}

class Query$admin_get__orders$delivery_order {
  Query$admin_get__orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.service_provider_id,
    this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get__orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$admin_get__orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer: Query$admin_get__orders$delivery_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$admin_get__orders$delivery_order$customer customer;

  final int? service_provider_id;

  final String? service_provider_type;

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
    if (!(other is Query$admin_get__orders$delivery_order) ||
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

extension UtilityExtension$Query$admin_get__orders$delivery_order
    on Query$admin_get__orders$delivery_order {
  CopyWith$Query$admin_get__orders$delivery_order<
          Query$admin_get__orders$delivery_order>
      get copyWith => CopyWith$Query$admin_get__orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get__orders$delivery_order<TRes> {
  factory CopyWith$Query$admin_get__orders$delivery_order(
    Query$admin_get__orders$delivery_order instance,
    TRes Function(Query$admin_get__orders$delivery_order) then,
  ) = _CopyWithImpl$Query$admin_get__orders$delivery_order;

  factory CopyWith$Query$admin_get__orders$delivery_order.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get__orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$admin_get__orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> get customer;
}

class _CopyWithImpl$Query$admin_get__orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get__orders$delivery_order<TRes> {
  _CopyWithImpl$Query$admin_get__orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$admin_get__orders$delivery_order _instance;

  final TRes Function(Query$admin_get__orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get__orders$delivery_order(
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
            : (customer as Query$admin_get__orders$delivery_order$customer),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$admin_get__orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$admin_get__orders$delivery_order<TRes>
    implements CopyWith$Query$admin_get__orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$admin_get__orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$admin_get__orders$delivery_order$customer? customer,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> get customer =>
      CopyWith$Query$admin_get__orders$delivery_order$customer.stub(_res);
}

class Query$admin_get__orders$delivery_order$customer {
  Query$admin_get__orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$admin_get__orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$admin_get__orders$delivery_order$customer(
      user: Query$admin_get__orders$delivery_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get__orders$delivery_order$customer$user user;

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
    if (!(other is Query$admin_get__orders$delivery_order$customer) ||
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

extension UtilityExtension$Query$admin_get__orders$delivery_order$customer
    on Query$admin_get__orders$delivery_order$customer {
  CopyWith$Query$admin_get__orders$delivery_order$customer<
          Query$admin_get__orders$delivery_order$customer>
      get copyWith => CopyWith$Query$admin_get__orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> {
  factory CopyWith$Query$admin_get__orders$delivery_order$customer(
    Query$admin_get__orders$delivery_order$customer instance,
    TRes Function(Query$admin_get__orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Query$admin_get__orders$delivery_order$customer;

  factory CopyWith$Query$admin_get__orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer;

  TRes call({
    Query$admin_get__orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$admin_get__orders$delivery_order$customer$user<TRes> get user;
}

class _CopyWithImpl$Query$admin_get__orders$delivery_order$customer<TRes>
    implements CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Query$admin_get__orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$admin_get__orders$delivery_order$customer _instance;

  final TRes Function(Query$admin_get__orders$delivery_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get__orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$admin_get__orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get__orders$delivery_order$customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$admin_get__orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer<TRes>
    implements CopyWith$Query$admin_get__orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer(this._res);

  TRes _res;

  call({
    Query$admin_get__orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get__orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$admin_get__orders$delivery_order$customer$user.stub(
              _res);
}

class Query$admin_get__orders$delivery_order$customer$user {
  Query$admin_get__orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$admin_get__orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$admin_get__orders$delivery_order$customer$user(
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
    if (!(other is Query$admin_get__orders$delivery_order$customer$user) ||
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

extension UtilityExtension$Query$admin_get__orders$delivery_order$customer$user
    on Query$admin_get__orders$delivery_order$customer$user {
  CopyWith$Query$admin_get__orders$delivery_order$customer$user<
          Query$admin_get__orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$admin_get__orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get__orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$admin_get__orders$delivery_order$customer$user(
    Query$admin_get__orders$delivery_order$customer$user instance,
    TRes Function(Query$admin_get__orders$delivery_order$customer$user) then,
  ) = _CopyWithImpl$Query$admin_get__orders$delivery_order$customer$user;

  factory CopyWith$Query$admin_get__orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get__orders$delivery_order$customer$user<TRes>
    implements
        CopyWith$Query$admin_get__orders$delivery_order$customer$user<TRes> {
  _CopyWithImpl$Query$admin_get__orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$admin_get__orders$delivery_order$customer$user _instance;

  final TRes Function(Query$admin_get__orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get__orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$admin_get__orders$delivery_order$customer$user<TRes> {
  _CopyWithStubImpl$Query$admin_get__orders$delivery_order$customer$user(
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
  }) =>
      Variables$Query$admin_get_service__orders._({
        r'serviceProviderType': serviceProviderType,
        r'serviceProviderId': serviceProviderId,
        r'inProccess': inProccess,
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
    return Variables$Query$admin_get_service__orders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get serviceProviderType => (_$data['serviceProviderType'] as String);
  int get serviceProviderId => (_$data['serviceProviderId'] as int);
  bool get inProccess => (_$data['inProccess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderType = serviceProviderType;
    result$data['serviceProviderType'] = l$serviceProviderType;
    final l$serviceProviderId = serviceProviderId;
    result$data['serviceProviderId'] = l$serviceProviderId;
    final l$inProccess = inProccess;
    result$data['inProccess'] = l$inProccess;
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
    return true;
  }

  @override
  int get hashCode {
    final l$serviceProviderType = serviceProviderType;
    final l$serviceProviderId = serviceProviderId;
    final l$inProccess = inProccess;
    return Object.hashAll([
      l$serviceProviderType,
      l$serviceProviderId,
      l$inProccess,
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
  }) =>
      _then(Variables$Query$admin_get_service__orders._({
        ..._instance._$data,
        if (serviceProviderType != _undefined && serviceProviderType != null)
          'serviceProviderType': (serviceProviderType as String),
        if (serviceProviderId != _undefined && serviceProviderId != null)
          'serviceProviderId': (serviceProviderId as int),
        if (inProccess != _undefined && inProccess != null)
          'inProccess': (inProccess as bool),
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
    required this.dropoff_gps,
    required this.customer,
    this.service_provider_id,
    this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get_service__orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
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
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Query$admin_get_service__orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$admin_get_service__orders$delivery_order$customer customer;

  final int? service_provider_id;

  final String? service_provider_type;

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
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$admin_get_service__orders$delivery_order$customer),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
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
