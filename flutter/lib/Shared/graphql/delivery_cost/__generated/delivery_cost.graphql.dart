import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getDeliveryCostByServiceProviderId {
  factory Variables$Query$getDeliveryCostByServiceProviderId({
    required int serviceProviderId,
    String? serviceType,
  }) =>
      Variables$Query$getDeliveryCostByServiceProviderId._({
        r'serviceProviderId': serviceProviderId,
        if (serviceType != null) r'serviceType': serviceType,
      });

  Variables$Query$getDeliveryCostByServiceProviderId._(this._$data);

  factory Variables$Query$getDeliveryCostByServiceProviderId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceProviderId = data['serviceProviderId'];
    result$data['serviceProviderId'] = (l$serviceProviderId as int);
    if (data.containsKey('serviceType')) {
      final l$serviceType = data['serviceType'];
      result$data['serviceType'] = (l$serviceType as String?);
    }
    return Variables$Query$getDeliveryCostByServiceProviderId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get serviceProviderId => (_$data['serviceProviderId'] as int);
  String? get serviceType => (_$data['serviceType'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceProviderId = serviceProviderId;
    result$data['serviceProviderId'] = l$serviceProviderId;
    if (_$data.containsKey('serviceType')) {
      final l$serviceType = serviceType;
      result$data['serviceType'] = l$serviceType;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getDeliveryCostByServiceProviderId<
          Variables$Query$getDeliveryCostByServiceProviderId>
      get copyWith =>
          CopyWith$Variables$Query$getDeliveryCostByServiceProviderId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDeliveryCostByServiceProviderId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceProviderId = serviceProviderId;
    final lOther$serviceProviderId = other.serviceProviderId;
    if (l$serviceProviderId != lOther$serviceProviderId) {
      return false;
    }
    final l$serviceType = serviceType;
    final lOther$serviceType = other.serviceType;
    if (_$data.containsKey('serviceType') !=
        other._$data.containsKey('serviceType')) {
      return false;
    }
    if (l$serviceType != lOther$serviceType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceProviderId = serviceProviderId;
    final l$serviceType = serviceType;
    return Object.hashAll([
      l$serviceProviderId,
      _$data.containsKey('serviceType') ? l$serviceType : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getDeliveryCostByServiceProviderId<
    TRes> {
  factory CopyWith$Variables$Query$getDeliveryCostByServiceProviderId(
    Variables$Query$getDeliveryCostByServiceProviderId instance,
    TRes Function(Variables$Query$getDeliveryCostByServiceProviderId) then,
  ) = _CopyWithImpl$Variables$Query$getDeliveryCostByServiceProviderId;

  factory CopyWith$Variables$Query$getDeliveryCostByServiceProviderId.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$getDeliveryCostByServiceProviderId;

  TRes call({
    int? serviceProviderId,
    String? serviceType,
  });
}

class _CopyWithImpl$Variables$Query$getDeliveryCostByServiceProviderId<TRes>
    implements
        CopyWith$Variables$Query$getDeliveryCostByServiceProviderId<TRes> {
  _CopyWithImpl$Variables$Query$getDeliveryCostByServiceProviderId(
    this._instance,
    this._then,
  );

  final Variables$Query$getDeliveryCostByServiceProviderId _instance;

  final TRes Function(Variables$Query$getDeliveryCostByServiceProviderId) _then;

  static const _undefined = {};

  TRes call({
    Object? serviceProviderId = _undefined,
    Object? serviceType = _undefined,
  }) =>
      _then(Variables$Query$getDeliveryCostByServiceProviderId._({
        ..._instance._$data,
        if (serviceProviderId != _undefined && serviceProviderId != null)
          'serviceProviderId': (serviceProviderId as int),
        if (serviceType != _undefined) 'serviceType': (serviceType as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDeliveryCostByServiceProviderId<TRes>
    implements
        CopyWith$Variables$Query$getDeliveryCostByServiceProviderId<TRes> {
  _CopyWithStubImpl$Variables$Query$getDeliveryCostByServiceProviderId(
      this._res);

  TRes _res;

  call({
    int? serviceProviderId,
    String? serviceType,
  }) =>
      _res;
}

class Query$getDeliveryCostByServiceProviderId {
  Query$getDeliveryCostByServiceProviderId({
    required this.delivery_details,
    required this.$__typename,
  });

  factory Query$getDeliveryCostByServiceProviderId.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_details = json['delivery_details'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCostByServiceProviderId(
      delivery_details: (l$delivery_details as List<dynamic>)
          .map((e) => Query$getDeliveryCostByServiceProviderId$delivery_details
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getDeliveryCostByServiceProviderId$delivery_details>
      delivery_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_details = delivery_details;
    _resultData['delivery_details'] =
        l$delivery_details.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_details = delivery_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_details.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDeliveryCostByServiceProviderId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_details = delivery_details;
    final lOther$delivery_details = other.delivery_details;
    if (l$delivery_details.length != lOther$delivery_details.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_details.length; i++) {
      final l$delivery_details$entry = l$delivery_details[i];
      final lOther$delivery_details$entry = lOther$delivery_details[i];
      if (l$delivery_details$entry != lOther$delivery_details$entry) {
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

extension UtilityExtension$Query$getDeliveryCostByServiceProviderId
    on Query$getDeliveryCostByServiceProviderId {
  CopyWith$Query$getDeliveryCostByServiceProviderId<
          Query$getDeliveryCostByServiceProviderId>
      get copyWith => CopyWith$Query$getDeliveryCostByServiceProviderId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCostByServiceProviderId<TRes> {
  factory CopyWith$Query$getDeliveryCostByServiceProviderId(
    Query$getDeliveryCostByServiceProviderId instance,
    TRes Function(Query$getDeliveryCostByServiceProviderId) then,
  ) = _CopyWithImpl$Query$getDeliveryCostByServiceProviderId;

  factory CopyWith$Query$getDeliveryCostByServiceProviderId.stub(TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId;

  TRes call({
    List<Query$getDeliveryCostByServiceProviderId$delivery_details>?
        delivery_details,
    String? $__typename,
  });
  TRes delivery_details(
      Iterable<Query$getDeliveryCostByServiceProviderId$delivery_details> Function(
              Iterable<
                  CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
                      Query$getDeliveryCostByServiceProviderId$delivery_details>>)
          _fn);
}

class _CopyWithImpl$Query$getDeliveryCostByServiceProviderId<TRes>
    implements CopyWith$Query$getDeliveryCostByServiceProviderId<TRes> {
  _CopyWithImpl$Query$getDeliveryCostByServiceProviderId(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCostByServiceProviderId _instance;

  final TRes Function(Query$getDeliveryCostByServiceProviderId) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCostByServiceProviderId(
        delivery_details:
            delivery_details == _undefined || delivery_details == null
                ? _instance.delivery_details
                : (delivery_details as List<
                    Query$getDeliveryCostByServiceProviderId$delivery_details>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_details(
          Iterable<Query$getDeliveryCostByServiceProviderId$delivery_details> Function(
                  Iterable<
                      CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
                          Query$getDeliveryCostByServiceProviderId$delivery_details>>)
              _fn) =>
      call(
          delivery_details: _fn(_instance.delivery_details.map((e) =>
              CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId<TRes>
    implements CopyWith$Query$getDeliveryCostByServiceProviderId<TRes> {
  _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId(this._res);

  TRes _res;

  call({
    List<Query$getDeliveryCostByServiceProviderId$delivery_details>?
        delivery_details,
    String? $__typename,
  }) =>
      _res;
  delivery_details(_fn) => _res;
}

const documentNodeQuerygetDeliveryCostByServiceProviderId =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDeliveryCostByServiceProviderId'),
    variableDefinitions: [
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
        variable: VariableNode(name: NameNode(value: 'serviceType')),
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
        name: NameNode(value: 'delivery_details'),
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
                    value: VariableNode(
                        name: NameNode(value: 'serviceProviderId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'serviceType')),
                  )
                ]),
              ),
            ]),
          )
        ],
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
Query$getDeliveryCostByServiceProviderId
    _parserFn$Query$getDeliveryCostByServiceProviderId(
            Map<String, dynamic> data) =>
        Query$getDeliveryCostByServiceProviderId.fromJson(data);

class Options$Query$getDeliveryCostByServiceProviderId
    extends graphql.QueryOptions<Query$getDeliveryCostByServiceProviderId> {
  Options$Query$getDeliveryCostByServiceProviderId({
    String? operationName,
    required Variables$Query$getDeliveryCostByServiceProviderId variables,
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
          document: documentNodeQuerygetDeliveryCostByServiceProviderId,
          parserFn: _parserFn$Query$getDeliveryCostByServiceProviderId,
        );
}

class WatchOptions$Query$getDeliveryCostByServiceProviderId extends graphql
    .WatchQueryOptions<Query$getDeliveryCostByServiceProviderId> {
  WatchOptions$Query$getDeliveryCostByServiceProviderId({
    String? operationName,
    required Variables$Query$getDeliveryCostByServiceProviderId variables,
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
          document: documentNodeQuerygetDeliveryCostByServiceProviderId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDeliveryCostByServiceProviderId,
        );
}

class FetchMoreOptions$Query$getDeliveryCostByServiceProviderId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDeliveryCostByServiceProviderId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDeliveryCostByServiceProviderId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDeliveryCostByServiceProviderId,
        );
}

extension ClientExtension$Query$getDeliveryCostByServiceProviderId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDeliveryCostByServiceProviderId>>
      query$getDeliveryCostByServiceProviderId(
              Options$Query$getDeliveryCostByServiceProviderId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDeliveryCostByServiceProviderId>
      watchQuery$getDeliveryCostByServiceProviderId(
              WatchOptions$Query$getDeliveryCostByServiceProviderId options) =>
          this.watchQuery(options);
  void writeQuery$getDeliveryCostByServiceProviderId({
    required Query$getDeliveryCostByServiceProviderId data,
    required Variables$Query$getDeliveryCostByServiceProviderId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDeliveryCostByServiceProviderId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDeliveryCostByServiceProviderId?
      readQuery$getDeliveryCostByServiceProviderId({
    required Variables$Query$getDeliveryCostByServiceProviderId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetDeliveryCostByServiceProviderId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getDeliveryCostByServiceProviderId.fromJson(result);
  }
}

class Query$getDeliveryCostByServiceProviderId$delivery_details {
  Query$getDeliveryCostByServiceProviderId$delivery_details({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$getDeliveryCostByServiceProviderId$delivery_details.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$getDeliveryCostByServiceProviderId$delivery_details(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$cost_per_km = cost_per_km;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$minimum_cost = minimum_cost;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
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
    if (!(other is Query$getDeliveryCostByServiceProviderId$delivery_details) ||
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

extension UtilityExtension$Query$getDeliveryCostByServiceProviderId$delivery_details
    on Query$getDeliveryCostByServiceProviderId$delivery_details {
  CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
          Query$getDeliveryCostByServiceProviderId$delivery_details>
      get copyWith =>
          CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
    TRes> {
  factory CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details(
    Query$getDeliveryCostByServiceProviderId$delivery_details instance,
    TRes Function(Query$getDeliveryCostByServiceProviderId$delivery_details)
        then,
  ) = _CopyWithImpl$Query$getDeliveryCostByServiceProviderId$delivery_details;

  factory CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId$delivery_details;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDeliveryCostByServiceProviderId$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
            TRes> {
  _CopyWithImpl$Query$getDeliveryCostByServiceProviderId$delivery_details(
    this._instance,
    this._then,
  );

  final Query$getDeliveryCostByServiceProviderId$delivery_details _instance;

  final TRes Function(Query$getDeliveryCostByServiceProviderId$delivery_details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDeliveryCostByServiceProviderId$delivery_details(
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
}

class _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId$delivery_details<
        TRes>
    implements
        CopyWith$Query$getDeliveryCostByServiceProviderId$delivery_details<
            TRes> {
  _CopyWithStubImpl$Query$getDeliveryCostByServiceProviderId$delivery_details(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addDeliveryCost {
  factory Variables$Mutation$addDeliveryCost(
          {required Input$delivery_details_insert_input deliveryCost}) =>
      Variables$Mutation$addDeliveryCost._({
        r'deliveryCost': deliveryCost,
      });

  Variables$Mutation$addDeliveryCost._(this._$data);

  factory Variables$Mutation$addDeliveryCost.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$deliveryCost = data['deliveryCost'];
    result$data['deliveryCost'] = Input$delivery_details_insert_input.fromJson(
        (l$deliveryCost as Map<String, dynamic>));
    return Variables$Mutation$addDeliveryCost._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$delivery_details_insert_input get deliveryCost =>
      (_$data['deliveryCost'] as Input$delivery_details_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$deliveryCost = deliveryCost;
    result$data['deliveryCost'] = l$deliveryCost.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addDeliveryCost<
          Variables$Mutation$addDeliveryCost>
      get copyWith => CopyWith$Variables$Mutation$addDeliveryCost(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addDeliveryCost) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deliveryCost = deliveryCost;
    final lOther$deliveryCost = other.deliveryCost;
    if (l$deliveryCost != lOther$deliveryCost) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deliveryCost = deliveryCost;
    return Object.hashAll([l$deliveryCost]);
  }
}

abstract class CopyWith$Variables$Mutation$addDeliveryCost<TRes> {
  factory CopyWith$Variables$Mutation$addDeliveryCost(
    Variables$Mutation$addDeliveryCost instance,
    TRes Function(Variables$Mutation$addDeliveryCost) then,
  ) = _CopyWithImpl$Variables$Mutation$addDeliveryCost;

  factory CopyWith$Variables$Mutation$addDeliveryCost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addDeliveryCost;

  TRes call({Input$delivery_details_insert_input? deliveryCost});
}

class _CopyWithImpl$Variables$Mutation$addDeliveryCost<TRes>
    implements CopyWith$Variables$Mutation$addDeliveryCost<TRes> {
  _CopyWithImpl$Variables$Mutation$addDeliveryCost(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addDeliveryCost _instance;

  final TRes Function(Variables$Mutation$addDeliveryCost) _then;

  static const _undefined = {};

  TRes call({Object? deliveryCost = _undefined}) =>
      _then(Variables$Mutation$addDeliveryCost._({
        ..._instance._$data,
        if (deliveryCost != _undefined && deliveryCost != null)
          'deliveryCost': (deliveryCost as Input$delivery_details_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addDeliveryCost<TRes>
    implements CopyWith$Variables$Mutation$addDeliveryCost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addDeliveryCost(this._res);

  TRes _res;

  call({Input$delivery_details_insert_input? deliveryCost}) => _res;
}

class Mutation$addDeliveryCost {
  Mutation$addDeliveryCost({
    this.insert_delivery_details_one,
    required this.$__typename,
  });

  factory Mutation$addDeliveryCost.fromJson(Map<String, dynamic> json) {
    final l$insert_delivery_details_one = json['insert_delivery_details_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addDeliveryCost(
      insert_delivery_details_one: l$insert_delivery_details_one == null
          ? null
          : Mutation$addDeliveryCost$insert_delivery_details_one.fromJson(
              (l$insert_delivery_details_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addDeliveryCost$insert_delivery_details_one?
      insert_delivery_details_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_delivery_details_one = insert_delivery_details_one;
    _resultData['insert_delivery_details_one'] =
        l$insert_delivery_details_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_delivery_details_one = insert_delivery_details_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_delivery_details_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addDeliveryCost) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_delivery_details_one = insert_delivery_details_one;
    final lOther$insert_delivery_details_one =
        other.insert_delivery_details_one;
    if (l$insert_delivery_details_one != lOther$insert_delivery_details_one) {
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

extension UtilityExtension$Mutation$addDeliveryCost
    on Mutation$addDeliveryCost {
  CopyWith$Mutation$addDeliveryCost<Mutation$addDeliveryCost> get copyWith =>
      CopyWith$Mutation$addDeliveryCost(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addDeliveryCost<TRes> {
  factory CopyWith$Mutation$addDeliveryCost(
    Mutation$addDeliveryCost instance,
    TRes Function(Mutation$addDeliveryCost) then,
  ) = _CopyWithImpl$Mutation$addDeliveryCost;

  factory CopyWith$Mutation$addDeliveryCost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addDeliveryCost;

  TRes call({
    Mutation$addDeliveryCost$insert_delivery_details_one?
        insert_delivery_details_one,
    String? $__typename,
  });
  CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<TRes>
      get insert_delivery_details_one;
}

class _CopyWithImpl$Mutation$addDeliveryCost<TRes>
    implements CopyWith$Mutation$addDeliveryCost<TRes> {
  _CopyWithImpl$Mutation$addDeliveryCost(
    this._instance,
    this._then,
  );

  final Mutation$addDeliveryCost _instance;

  final TRes Function(Mutation$addDeliveryCost) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_delivery_details_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addDeliveryCost(
        insert_delivery_details_one: insert_delivery_details_one == _undefined
            ? _instance.insert_delivery_details_one
            : (insert_delivery_details_one
                as Mutation$addDeliveryCost$insert_delivery_details_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<TRes>
      get insert_delivery_details_one {
    final local$insert_delivery_details_one =
        _instance.insert_delivery_details_one;
    return local$insert_delivery_details_one == null
        ? CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one(
            local$insert_delivery_details_one,
            (e) => call(insert_delivery_details_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addDeliveryCost<TRes>
    implements CopyWith$Mutation$addDeliveryCost<TRes> {
  _CopyWithStubImpl$Mutation$addDeliveryCost(this._res);

  TRes _res;

  call({
    Mutation$addDeliveryCost$insert_delivery_details_one?
        insert_delivery_details_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<TRes>
      get insert_delivery_details_one =>
          CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one.stub(
              _res);
}

const documentNodeMutationaddDeliveryCost = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addDeliveryCost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'deliveryCost')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_details_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_delivery_details_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'deliveryCost')),
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
Mutation$addDeliveryCost _parserFn$Mutation$addDeliveryCost(
        Map<String, dynamic> data) =>
    Mutation$addDeliveryCost.fromJson(data);
typedef OnMutationCompleted$Mutation$addDeliveryCost = FutureOr<void> Function(
  dynamic,
  Mutation$addDeliveryCost?,
);

class Options$Mutation$addDeliveryCost
    extends graphql.MutationOptions<Mutation$addDeliveryCost> {
  Options$Mutation$addDeliveryCost({
    String? operationName,
    required Variables$Mutation$addDeliveryCost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addDeliveryCost? onCompleted,
    graphql.OnMutationUpdate<Mutation$addDeliveryCost>? update,
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
                        : _parserFn$Mutation$addDeliveryCost(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddDeliveryCost,
          parserFn: _parserFn$Mutation$addDeliveryCost,
        );

  final OnMutationCompleted$Mutation$addDeliveryCost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addDeliveryCost
    extends graphql.WatchQueryOptions<Mutation$addDeliveryCost> {
  WatchOptions$Mutation$addDeliveryCost({
    String? operationName,
    required Variables$Mutation$addDeliveryCost variables,
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
          document: documentNodeMutationaddDeliveryCost,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addDeliveryCost,
        );
}

extension ClientExtension$Mutation$addDeliveryCost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addDeliveryCost>> mutate$addDeliveryCost(
          Options$Mutation$addDeliveryCost options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addDeliveryCost>
      watchMutation$addDeliveryCost(
              WatchOptions$Mutation$addDeliveryCost options) =>
          this.watchMutation(options);
}

class Mutation$addDeliveryCost$insert_delivery_details_one {
  Mutation$addDeliveryCost$insert_delivery_details_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addDeliveryCost$insert_delivery_details_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addDeliveryCost$insert_delivery_details_one(
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
    if (!(other is Mutation$addDeliveryCost$insert_delivery_details_one) ||
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

extension UtilityExtension$Mutation$addDeliveryCost$insert_delivery_details_one
    on Mutation$addDeliveryCost$insert_delivery_details_one {
  CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<
          Mutation$addDeliveryCost$insert_delivery_details_one>
      get copyWith =>
          CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<
    TRes> {
  factory CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one(
    Mutation$addDeliveryCost$insert_delivery_details_one instance,
    TRes Function(Mutation$addDeliveryCost$insert_delivery_details_one) then,
  ) = _CopyWithImpl$Mutation$addDeliveryCost$insert_delivery_details_one;

  factory CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addDeliveryCost$insert_delivery_details_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addDeliveryCost$insert_delivery_details_one<TRes>
    implements
        CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<TRes> {
  _CopyWithImpl$Mutation$addDeliveryCost$insert_delivery_details_one(
    this._instance,
    this._then,
  );

  final Mutation$addDeliveryCost$insert_delivery_details_one _instance;

  final TRes Function(Mutation$addDeliveryCost$insert_delivery_details_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addDeliveryCost$insert_delivery_details_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addDeliveryCost$insert_delivery_details_one<
        TRes>
    implements
        CopyWith$Mutation$addDeliveryCost$insert_delivery_details_one<TRes> {
  _CopyWithStubImpl$Mutation$addDeliveryCost$insert_delivery_details_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDeliveryCost {
  factory Variables$Mutation$updateDeliveryCost({
    required int id,
    Input$delivery_details_set_input? data,
  }) =>
      Variables$Mutation$updateDeliveryCost._({
        r'id': id,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateDeliveryCost._(this._$data);

  factory Variables$Mutation$updateDeliveryCost.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$delivery_details_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    return Variables$Mutation$updateDeliveryCost._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$delivery_details_set_input? get data =>
      (_$data['data'] as Input$delivery_details_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDeliveryCost<
          Variables$Mutation$updateDeliveryCost>
      get copyWith => CopyWith$Variables$Mutation$updateDeliveryCost(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDeliveryCost) ||
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
    if (_$data.containsKey('data') != other._$data.containsKey('data')) {
      return false;
    }
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
      _$data.containsKey('data') ? l$data : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDeliveryCost<TRes> {
  factory CopyWith$Variables$Mutation$updateDeliveryCost(
    Variables$Mutation$updateDeliveryCost instance,
    TRes Function(Variables$Mutation$updateDeliveryCost) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDeliveryCost;

  factory CopyWith$Variables$Mutation$updateDeliveryCost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDeliveryCost;

  TRes call({
    int? id,
    Input$delivery_details_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDeliveryCost<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryCost<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDeliveryCost(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDeliveryCost _instance;

  final TRes Function(Variables$Mutation$updateDeliveryCost) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateDeliveryCost._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined)
          'data': (data as Input$delivery_details_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDeliveryCost<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryCost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDeliveryCost(this._res);

  TRes _res;

  call({
    int? id,
    Input$delivery_details_set_input? data,
  }) =>
      _res;
}

class Mutation$updateDeliveryCost {
  Mutation$updateDeliveryCost({
    this.update_delivery_details_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCost.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_details_by_pk =
        json['update_delivery_details_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCost(
      update_delivery_details_by_pk: l$update_delivery_details_by_pk == null
          ? null
          : Mutation$updateDeliveryCost$update_delivery_details_by_pk.fromJson(
              (l$update_delivery_details_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDeliveryCost$update_delivery_details_by_pk?
      update_delivery_details_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_details_by_pk = update_delivery_details_by_pk;
    _resultData['update_delivery_details_by_pk'] =
        l$update_delivery_details_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_details_by_pk = update_delivery_details_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_details_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryCost) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_details_by_pk = update_delivery_details_by_pk;
    final lOther$update_delivery_details_by_pk =
        other.update_delivery_details_by_pk;
    if (l$update_delivery_details_by_pk !=
        lOther$update_delivery_details_by_pk) {
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

extension UtilityExtension$Mutation$updateDeliveryCost
    on Mutation$updateDeliveryCost {
  CopyWith$Mutation$updateDeliveryCost<Mutation$updateDeliveryCost>
      get copyWith => CopyWith$Mutation$updateDeliveryCost(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCost<TRes> {
  factory CopyWith$Mutation$updateDeliveryCost(
    Mutation$updateDeliveryCost instance,
    TRes Function(Mutation$updateDeliveryCost) then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCost;

  factory CopyWith$Mutation$updateDeliveryCost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCost;

  TRes call({
    Mutation$updateDeliveryCost$update_delivery_details_by_pk?
        update_delivery_details_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<TRes>
      get update_delivery_details_by_pk;
}

class _CopyWithImpl$Mutation$updateDeliveryCost<TRes>
    implements CopyWith$Mutation$updateDeliveryCost<TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCost(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCost _instance;

  final TRes Function(Mutation$updateDeliveryCost) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_details_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryCost(
        update_delivery_details_by_pk: update_delivery_details_by_pk ==
                _undefined
            ? _instance.update_delivery_details_by_pk
            : (update_delivery_details_by_pk
                as Mutation$updateDeliveryCost$update_delivery_details_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<TRes>
      get update_delivery_details_by_pk {
    final local$update_delivery_details_by_pk =
        _instance.update_delivery_details_by_pk;
    return local$update_delivery_details_by_pk == null
        ? CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk(
            local$update_delivery_details_by_pk,
            (e) => call(update_delivery_details_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryCost<TRes>
    implements CopyWith$Mutation$updateDeliveryCost<TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCost(this._res);

  TRes _res;

  call({
    Mutation$updateDeliveryCost$update_delivery_details_by_pk?
        update_delivery_details_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<TRes>
      get update_delivery_details_by_pk =>
          CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDeliveryCost = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDeliveryCost'),
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
          name: NameNode(value: 'delivery_details_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_details_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
Mutation$updateDeliveryCost _parserFn$Mutation$updateDeliveryCost(
        Map<String, dynamic> data) =>
    Mutation$updateDeliveryCost.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDeliveryCost = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDeliveryCost?,
);

class Options$Mutation$updateDeliveryCost
    extends graphql.MutationOptions<Mutation$updateDeliveryCost> {
  Options$Mutation$updateDeliveryCost({
    String? operationName,
    required Variables$Mutation$updateDeliveryCost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDeliveryCost? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDeliveryCost>? update,
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
                        : _parserFn$Mutation$updateDeliveryCost(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDeliveryCost,
          parserFn: _parserFn$Mutation$updateDeliveryCost,
        );

  final OnMutationCompleted$Mutation$updateDeliveryCost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDeliveryCost
    extends graphql.WatchQueryOptions<Mutation$updateDeliveryCost> {
  WatchOptions$Mutation$updateDeliveryCost({
    String? operationName,
    required Variables$Mutation$updateDeliveryCost variables,
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
          document: documentNodeMutationupdateDeliveryCost,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDeliveryCost,
        );
}

extension ClientExtension$Mutation$updateDeliveryCost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDeliveryCost>>
      mutate$updateDeliveryCost(
              Options$Mutation$updateDeliveryCost options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDeliveryCost>
      watchMutation$updateDeliveryCost(
              WatchOptions$Mutation$updateDeliveryCost options) =>
          this.watchMutation(options);
}

class Mutation$updateDeliveryCost$update_delivery_details_by_pk {
  Mutation$updateDeliveryCost$update_delivery_details_by_pk({
    required this.cost_per_km,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.minimum_cost,
    required this.service_provider_id,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryCost$update_delivery_details_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$minimum_cost = json['minimum_cost'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryCost$update_delivery_details_by_pk(
      cost_per_km: moneyFromJson(l$cost_per_km),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final double minimum_cost;

  final int service_provider_id;

  final String service_provider_type;

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
    final l$cost_per_km = cost_per_km;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$minimum_cost = minimum_cost;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$minimum_cost,
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
    if (!(other is Mutation$updateDeliveryCost$update_delivery_details_by_pk) ||
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

extension UtilityExtension$Mutation$updateDeliveryCost$update_delivery_details_by_pk
    on Mutation$updateDeliveryCost$update_delivery_details_by_pk {
  CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
          Mutation$updateDeliveryCost$update_delivery_details_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk(
    Mutation$updateDeliveryCost$update_delivery_details_by_pk instance,
    TRes Function(Mutation$updateDeliveryCost$update_delivery_details_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk;

  factory CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk;

  TRes call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryCost$update_delivery_details_by_pk _instance;

  final TRes Function(Mutation$updateDeliveryCost$update_delivery_details_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? minimum_cost = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryCost$update_delivery_details_by_pk(
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
}

class _CopyWithStubImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryCost$update_delivery_details_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryCost$update_delivery_details_by_pk(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    double? minimum_cost,
    int? service_provider_id,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
}
