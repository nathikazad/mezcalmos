import '../../__generated/schema.graphql.dart';
import '../../business_rental/__generated/business_rental.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$updateBsOrderItem {
  factory Variables$Mutation$updateBsOrderItem({
    required int id,
    required Input$business_order_request_item_set_input data,
  }) =>
      Variables$Mutation$updateBsOrderItem._({
        r'id': id,
        r'data': data,
      });

  Variables$Mutation$updateBsOrderItem._(this._$data);

  factory Variables$Mutation$updateBsOrderItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$data = data['data'];
    result$data['data'] = Input$business_order_request_item_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateBsOrderItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$business_order_request_item_set_input get data =>
      (_$data['data'] as Input$business_order_request_item_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateBsOrderItem<
          Variables$Mutation$updateBsOrderItem>
      get copyWith => CopyWith$Variables$Mutation$updateBsOrderItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateBsOrderItem) ||
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

abstract class CopyWith$Variables$Mutation$updateBsOrderItem<TRes> {
  factory CopyWith$Variables$Mutation$updateBsOrderItem(
    Variables$Mutation$updateBsOrderItem instance,
    TRes Function(Variables$Mutation$updateBsOrderItem) then,
  ) = _CopyWithImpl$Variables$Mutation$updateBsOrderItem;

  factory CopyWith$Variables$Mutation$updateBsOrderItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateBsOrderItem;

  TRes call({
    int? id,
    Input$business_order_request_item_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateBsOrderItem<TRes>
    implements CopyWith$Variables$Mutation$updateBsOrderItem<TRes> {
  _CopyWithImpl$Variables$Mutation$updateBsOrderItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateBsOrderItem _instance;

  final TRes Function(Variables$Mutation$updateBsOrderItem) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateBsOrderItem._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined && data != null)
          'data': (data as Input$business_order_request_item_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateBsOrderItem<TRes>
    implements CopyWith$Variables$Mutation$updateBsOrderItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateBsOrderItem(this._res);

  TRes _res;

  call({
    int? id,
    Input$business_order_request_item_set_input? data,
  }) =>
      _res;
}

class Mutation$updateBsOrderItem {
  Mutation$updateBsOrderItem({
    this.update_business_order_request_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateBsOrderItem.fromJson(Map<String, dynamic> json) {
    final l$update_business_order_request_item_by_pk =
        json['update_business_order_request_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateBsOrderItem(
      update_business_order_request_item_by_pk:
          l$update_business_order_request_item_by_pk == null
              ? null
              : Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
                  .fromJson((l$update_business_order_request_item_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateBsOrderItem$update_business_order_request_item_by_pk?
      update_business_order_request_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_order_request_item_by_pk =
        update_business_order_request_item_by_pk;
    _resultData['update_business_order_request_item_by_pk'] =
        l$update_business_order_request_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_order_request_item_by_pk =
        update_business_order_request_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_order_request_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateBsOrderItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_order_request_item_by_pk =
        update_business_order_request_item_by_pk;
    final lOther$update_business_order_request_item_by_pk =
        other.update_business_order_request_item_by_pk;
    if (l$update_business_order_request_item_by_pk !=
        lOther$update_business_order_request_item_by_pk) {
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

extension UtilityExtension$Mutation$updateBsOrderItem
    on Mutation$updateBsOrderItem {
  CopyWith$Mutation$updateBsOrderItem<Mutation$updateBsOrderItem>
      get copyWith => CopyWith$Mutation$updateBsOrderItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateBsOrderItem<TRes> {
  factory CopyWith$Mutation$updateBsOrderItem(
    Mutation$updateBsOrderItem instance,
    TRes Function(Mutation$updateBsOrderItem) then,
  ) = _CopyWithImpl$Mutation$updateBsOrderItem;

  factory CopyWith$Mutation$updateBsOrderItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateBsOrderItem;

  TRes call({
    Mutation$updateBsOrderItem$update_business_order_request_item_by_pk?
        update_business_order_request_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
      TRes> get update_business_order_request_item_by_pk;
}

class _CopyWithImpl$Mutation$updateBsOrderItem<TRes>
    implements CopyWith$Mutation$updateBsOrderItem<TRes> {
  _CopyWithImpl$Mutation$updateBsOrderItem(
    this._instance,
    this._then,
  );

  final Mutation$updateBsOrderItem _instance;

  final TRes Function(Mutation$updateBsOrderItem) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_order_request_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateBsOrderItem(
        update_business_order_request_item_by_pk:
            update_business_order_request_item_by_pk == _undefined
                ? _instance.update_business_order_request_item_by_pk
                : (update_business_order_request_item_by_pk
                    as Mutation$updateBsOrderItem$update_business_order_request_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
      TRes> get update_business_order_request_item_by_pk {
    final local$update_business_order_request_item_by_pk =
        _instance.update_business_order_request_item_by_pk;
    return local$update_business_order_request_item_by_pk == null
        ? CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
            local$update_business_order_request_item_by_pk,
            (e) => call(update_business_order_request_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateBsOrderItem<TRes>
    implements CopyWith$Mutation$updateBsOrderItem<TRes> {
  _CopyWithStubImpl$Mutation$updateBsOrderItem(this._res);

  TRes _res;

  call({
    Mutation$updateBsOrderItem$update_business_order_request_item_by_pk?
        update_business_order_request_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
          TRes>
      get update_business_order_request_item_by_pk =>
          CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
              .stub(_res);
}

const documentNodeMutationupdateBsOrderItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateBsOrderItem'),
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
          name: NameNode(value: 'business_order_request_item_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_business_order_request_item_by_pk'),
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
            name: NameNode(value: 'item_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'parameters'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_request_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offering_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'time'),
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
Mutation$updateBsOrderItem _parserFn$Mutation$updateBsOrderItem(
        Map<String, dynamic> data) =>
    Mutation$updateBsOrderItem.fromJson(data);
typedef OnMutationCompleted$Mutation$updateBsOrderItem = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateBsOrderItem?,
);

class Options$Mutation$updateBsOrderItem
    extends graphql.MutationOptions<Mutation$updateBsOrderItem> {
  Options$Mutation$updateBsOrderItem({
    String? operationName,
    required Variables$Mutation$updateBsOrderItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateBsOrderItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateBsOrderItem>? update,
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
                        : _parserFn$Mutation$updateBsOrderItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateBsOrderItem,
          parserFn: _parserFn$Mutation$updateBsOrderItem,
        );

  final OnMutationCompleted$Mutation$updateBsOrderItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateBsOrderItem
    extends graphql.WatchQueryOptions<Mutation$updateBsOrderItem> {
  WatchOptions$Mutation$updateBsOrderItem({
    String? operationName,
    required Variables$Mutation$updateBsOrderItem variables,
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
          document: documentNodeMutationupdateBsOrderItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateBsOrderItem,
        );
}

extension ClientExtension$Mutation$updateBsOrderItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateBsOrderItem>>
      mutate$updateBsOrderItem(
              Options$Mutation$updateBsOrderItem options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateBsOrderItem>
      watchMutation$updateBsOrderItem(
              WatchOptions$Mutation$updateBsOrderItem options) =>
          this.watchMutation(options);
}

class Mutation$updateBsOrderItem$update_business_order_request_item_by_pk {
  Mutation$updateBsOrderItem$update_business_order_request_item_by_pk({
    required this.available,
    required this.cost,
    required this.id,
    required this.item_id,
    required this.parameters,
    required this.order_request_id,
    required this.offering_type,
    this.time,
    required this.$__typename,
  });

  factory Mutation$updateBsOrderItem$update_business_order_request_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$item_id = json['item_id'];
    final l$parameters = json['parameters'];
    final l$order_request_id = json['order_request_id'];
    final l$offering_type = json['offering_type'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      item_id: (l$item_id as int),
      parameters: mapFromJson(l$parameters),
      order_request_id: (l$order_request_id as int),
      offering_type: (l$offering_type as String),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final int item_id;

  final dynamic parameters;

  final int order_request_id;

  final String offering_type;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$item_id = item_id;
    final l$parameters = parameters;
    final l$order_request_id = order_request_id;
    final l$offering_type = offering_type;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
      l$item_id,
      l$parameters,
      l$order_request_id,
      l$offering_type,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateBsOrderItem$update_business_order_request_item_by_pk) ||
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
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
    on Mutation$updateBsOrderItem$update_business_order_request_item_by_pk {
  CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
          Mutation$updateBsOrderItem$update_business_order_request_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
    Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
        instance,
    TRes Function(
            Mutation$updateBsOrderItem$update_business_order_request_item_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk;

  factory CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    int? item_id,
    dynamic? parameters,
    int? order_request_id,
    String? offering_type,
    String? time,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateBsOrderItem$update_business_order_request_item_by_pk
      _instance;

  final TRes Function(
          Mutation$updateBsOrderItem$update_business_order_request_item_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? item_id = _undefined,
    Object? parameters = _undefined,
    Object? order_request_id = _undefined,
    Object? offering_type = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateBsOrderItem$update_business_order_request_item_by_pk(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    int? item_id,
    dynamic? parameters,
    int? order_request_id,
    String? offering_type,
    String? time,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getHomeRentalOrderRequest {
  factory Variables$Query$getHomeRentalOrderRequest({required int orderId}) =>
      Variables$Query$getHomeRentalOrderRequest._({
        r'orderId': orderId,
      });

  Variables$Query$getHomeRentalOrderRequest._(this._$data);

  factory Variables$Query$getHomeRentalOrderRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$getHomeRentalOrderRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$getHomeRentalOrderRequest<
          Variables$Query$getHomeRentalOrderRequest>
      get copyWith => CopyWith$Variables$Query$getHomeRentalOrderRequest(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getHomeRentalOrderRequest) ||
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

abstract class CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  factory CopyWith$Variables$Query$getHomeRentalOrderRequest(
    Variables$Query$getHomeRentalOrderRequest instance,
    TRes Function(Variables$Query$getHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest;

  factory CopyWith$Variables$Query$getHomeRentalOrderRequest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Variables$Query$getHomeRentalOrderRequest _instance;

  final TRes Function(Variables$Query$getHomeRentalOrderRequest) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$getHomeRentalOrderRequest._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$getHomeRentalOrderRequest {
  Query$getHomeRentalOrderRequest({
    this.business_order_request_by_pk,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest.fromJson(Map<String, dynamic> json) {
    final l$business_order_request_by_pk = json['business_order_request_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest(
      business_order_request_by_pk: l$business_order_request_by_pk == null
          ? null
          : Query$getHomeRentalOrderRequest$business_order_request_by_pk
              .fromJson(
                  (l$business_order_request_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk?
      business_order_request_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request_by_pk = business_order_request_by_pk;
    _resultData['business_order_request_by_pk'] =
        l$business_order_request_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_order_request_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getHomeRentalOrderRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final lOther$business_order_request_by_pk =
        other.business_order_request_by_pk;
    if (l$business_order_request_by_pk != lOther$business_order_request_by_pk) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest
    on Query$getHomeRentalOrderRequest {
  CopyWith$Query$getHomeRentalOrderRequest<Query$getHomeRentalOrderRequest>
      get copyWith => CopyWith$Query$getHomeRentalOrderRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest(
    Query$getHomeRentalOrderRequest instance,
    TRes Function(Query$getHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest;

  factory CopyWith$Query$getHomeRentalOrderRequest.stub(TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest;

  TRes call({
    Query$getHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest _instance;

  final TRes Function(Query$getHomeRentalOrderRequest) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest(
        business_order_request_by_pk: business_order_request_by_pk == _undefined
            ? _instance.business_order_request_by_pk
            : (business_order_request_by_pk
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk {
    final local$business_order_request_by_pk =
        _instance.business_order_request_by_pk;
    return local$business_order_request_by_pk == null
        ? CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
            local$business_order_request_by_pk,
            (e) => call(business_order_request_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest(this._res);

  TRes _res;

  call({
    Query$getHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk
              .stub(_res);
}

const documentNodeQuerygetHomeRentalOrderRequest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getHomeRentalOrderRequest'),
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
        name: NameNode(value: 'business_order_request_by_pk'),
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
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'customer_app_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
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
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user_id'),
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
                    name: NameNode(value: 'name'),
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
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review_id'),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'order_request_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offering_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'item_id'),
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
                name: NameNode(value: 'parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rental'),
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
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'image'),
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
                        name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'time'),
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
Query$getHomeRentalOrderRequest _parserFn$Query$getHomeRentalOrderRequest(
        Map<String, dynamic> data) =>
    Query$getHomeRentalOrderRequest.fromJson(data);

class Options$Query$getHomeRentalOrderRequest
    extends graphql.QueryOptions<Query$getHomeRentalOrderRequest> {
  Options$Query$getHomeRentalOrderRequest({
    String? operationName,
    required Variables$Query$getHomeRentalOrderRequest variables,
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
          document: documentNodeQuerygetHomeRentalOrderRequest,
          parserFn: _parserFn$Query$getHomeRentalOrderRequest,
        );
}

class WatchOptions$Query$getHomeRentalOrderRequest
    extends graphql.WatchQueryOptions<Query$getHomeRentalOrderRequest> {
  WatchOptions$Query$getHomeRentalOrderRequest({
    String? operationName,
    required Variables$Query$getHomeRentalOrderRequest variables,
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
          document: documentNodeQuerygetHomeRentalOrderRequest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getHomeRentalOrderRequest,
        );
}

class FetchMoreOptions$Query$getHomeRentalOrderRequest
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getHomeRentalOrderRequest({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getHomeRentalOrderRequest variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetHomeRentalOrderRequest,
        );
}

extension ClientExtension$Query$getHomeRentalOrderRequest
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getHomeRentalOrderRequest>>
      query$getHomeRentalOrderRequest(
              Options$Query$getHomeRentalOrderRequest options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getHomeRentalOrderRequest>
      watchQuery$getHomeRentalOrderRequest(
              WatchOptions$Query$getHomeRentalOrderRequest options) =>
          this.watchQuery(options);
  void writeQuery$getHomeRentalOrderRequest({
    required Query$getHomeRentalOrderRequest data,
    required Variables$Query$getHomeRentalOrderRequest variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetHomeRentalOrderRequest),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getHomeRentalOrderRequest? readQuery$getHomeRentalOrderRequest({
    required Variables$Query$getHomeRentalOrderRequest variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetHomeRentalOrderRequest),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getHomeRentalOrderRequest.fromJson(result);
  }
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk({
    required this.business_id,
    required this.customer_id,
    required this.customer_app_type,
    required this.business,
    required this.customer,
    this.chat_id,
    this.cost,
    required this.status,
    this.review_id,
    required this.order_time,
    this.notes,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$customer_id = json['customer_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$business = json['business'];
    final l$customer = json['customer'];
    final l$chat_id = json['chat_id'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_time = json['order_time'];
    final l$notes = json['notes'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk(
      business_id: (l$business_id as int),
      customer_id: (l$customer_id as int),
      customer_app_type: (l$customer_app_type as String),
      business:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
              .fromJson((l$business as Map<String, dynamic>)),
      customer:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      chat_id: (l$chat_id as int?),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_time: (l$order_time as String),
      notes: (l$notes as String?),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int business_id;

  final int customer_id;

  final String customer_app_type;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
      business;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
      customer;

  final int? chat_id;

  final double? cost;

  final String status;

  final int? review_id;

  final String order_time;

  final String? notes;

  final int id;

  final List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    final l$customer_app_type = customer_app_type;
    final l$business = business;
    final l$customer = customer;
    final l$chat_id = chat_id;
    final l$cost = cost;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_time = order_time;
    final l$notes = notes;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$customer_id,
      l$customer_app_type,
      l$business,
      l$customer,
      l$chat_id,
      l$cost,
      l$status,
      l$review_id,
      l$order_time,
      l$notes,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk instance,
    TRes Function(Query$getHomeRentalOrderRequest$business_order_request_by_pk)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk;

  TRes call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer;
  TRes items(
      Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
              Iterable<
                  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
                      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>>)
          _fn);
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk _instance;

  final TRes Function(
      Query$getHomeRentalOrderRequest$business_order_request_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? business = _undefined,
    Object? customer = _undefined,
    Object? chat_id = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_time = _undefined,
    Object? notes = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest$business_order_request_by_pk(
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$business),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
                  Iterable<
                      CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
                          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
      this._res);

  TRes _res;

  call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
          TRes>
      get business =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
              .stub(_res);
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
              .stub(_res);
  items(_fn) => _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$business {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$business({
    required this.details_id,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
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
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$business) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$business {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$business)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
      user_id: (l$user_id as int),
      user:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer;

  TRes call({
    int? user_id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items({
    required this.available,
    required this.cost,
    required this.order_request_id,
    required this.offering_type,
    required this.item_id,
    required this.id,
    required this.parameters,
    this.rental,
    this.time,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$order_request_id = json['order_request_id'];
    final l$offering_type = json['offering_type'];
    final l$item_id = json['item_id'];
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$rental = json['rental'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      order_request_id: (l$order_request_id as int),
      offering_type: (l$offering_type as String),
      item_id: (l$item_id as int),
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      rental: l$rental == null
          ? null
          : Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int order_request_id;

  final String offering_type;

  final int item_id;

  final int id;

  final dynamic parameters;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
      rental;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$order_request_id = order_request_id;
    final l$offering_type = offering_type;
    final l$item_id = item_id;
    final l$id = id;
    final l$parameters = parameters;
    final l$rental = rental;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$order_request_id,
      l$offering_type,
      l$item_id,
      l$id,
      l$parameters,
      l$rental,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items) ||
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
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items;

  TRes call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
      _instance;

  final TRes Function(
      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items) _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? order_request_id = _undefined,
    Object? offering_type = _undefined,
    Object? item_id = _undefined,
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? rental = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
            .stub(_then(_instance))
        : CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          TRes>
      get rental =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      id: (l$id as int),
      details:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  TRes call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          TRes>
      get details =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details({
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      id: (l$id as int),
      name:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      name;

  final dynamic? additional_parameters;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$additional_parameters,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details) ||
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
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  TRes call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          TRes>
      get name =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  TRes call({
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenBsOrders {
  factory Variables$Subscription$listenBsOrders({required int busnessId}) =>
      Variables$Subscription$listenBsOrders._({
        r'busnessId': busnessId,
      });

  Variables$Subscription$listenBsOrders._(this._$data);

  factory Variables$Subscription$listenBsOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$busnessId = data['busnessId'];
    result$data['busnessId'] = (l$busnessId as int);
    return Variables$Subscription$listenBsOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get busnessId => (_$data['busnessId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$busnessId = busnessId;
    result$data['busnessId'] = l$busnessId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listenBsOrders<
          Variables$Subscription$listenBsOrders>
      get copyWith => CopyWith$Variables$Subscription$listenBsOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listenBsOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$busnessId = busnessId;
    final lOther$busnessId = other.busnessId;
    if (l$busnessId != lOther$busnessId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$busnessId = busnessId;
    return Object.hashAll([l$busnessId]);
  }
}

abstract class CopyWith$Variables$Subscription$listenBsOrders<TRes> {
  factory CopyWith$Variables$Subscription$listenBsOrders(
    Variables$Subscription$listenBsOrders instance,
    TRes Function(Variables$Subscription$listenBsOrders) then,
  ) = _CopyWithImpl$Variables$Subscription$listenBsOrders;

  factory CopyWith$Variables$Subscription$listenBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenBsOrders;

  TRes call({int? busnessId});
}

class _CopyWithImpl$Variables$Subscription$listenBsOrders<TRes>
    implements CopyWith$Variables$Subscription$listenBsOrders<TRes> {
  _CopyWithImpl$Variables$Subscription$listenBsOrders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenBsOrders _instance;

  final TRes Function(Variables$Subscription$listenBsOrders) _then;

  static const _undefined = {};

  TRes call({Object? busnessId = _undefined}) =>
      _then(Variables$Subscription$listenBsOrders._({
        ..._instance._$data,
        if (busnessId != _undefined && busnessId != null)
          'busnessId': (busnessId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenBsOrders<TRes>
    implements CopyWith$Variables$Subscription$listenBsOrders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenBsOrders(this._res);

  TRes _res;

  call({int? busnessId}) => _res;
}

class Subscription$listenBsOrders {
  Subscription$listenBsOrders({
    required this.business_order_request,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders.fromJson(Map<String, dynamic> json) {
    final l$business_order_request = json['business_order_request'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders(
      business_order_request: (l$business_order_request as List<dynamic>)
          .map((e) =>
              Subscription$listenBsOrders$business_order_request.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listenBsOrders$business_order_request>
      business_order_request;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request = business_order_request;
    _resultData['business_order_request'] =
        l$business_order_request.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request = business_order_request;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_order_request.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenBsOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request = business_order_request;
    final lOther$business_order_request = other.business_order_request;
    if (l$business_order_request.length !=
        lOther$business_order_request.length) {
      return false;
    }
    for (int i = 0; i < l$business_order_request.length; i++) {
      final l$business_order_request$entry = l$business_order_request[i];
      final lOther$business_order_request$entry =
          lOther$business_order_request[i];
      if (l$business_order_request$entry !=
          lOther$business_order_request$entry) {
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

extension UtilityExtension$Subscription$listenBsOrders
    on Subscription$listenBsOrders {
  CopyWith$Subscription$listenBsOrders<Subscription$listenBsOrders>
      get copyWith => CopyWith$Subscription$listenBsOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders<TRes> {
  factory CopyWith$Subscription$listenBsOrders(
    Subscription$listenBsOrders instance,
    TRes Function(Subscription$listenBsOrders) then,
  ) = _CopyWithImpl$Subscription$listenBsOrders;

  factory CopyWith$Subscription$listenBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders;

  TRes call({
    List<Subscription$listenBsOrders$business_order_request>?
        business_order_request,
    String? $__typename,
  });
  TRes business_order_request(
      Iterable<Subscription$listenBsOrders$business_order_request> Function(
              Iterable<
                  CopyWith$Subscription$listenBsOrders$business_order_request<
                      Subscription$listenBsOrders$business_order_request>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenBsOrders<TRes>
    implements CopyWith$Subscription$listenBsOrders<TRes> {
  _CopyWithImpl$Subscription$listenBsOrders(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders _instance;

  final TRes Function(Subscription$listenBsOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders(
        business_order_request: business_order_request == _undefined ||
                business_order_request == null
            ? _instance.business_order_request
            : (business_order_request
                as List<Subscription$listenBsOrders$business_order_request>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_order_request(
          Iterable<Subscription$listenBsOrders$business_order_request> Function(
                  Iterable<
                      CopyWith$Subscription$listenBsOrders$business_order_request<
                          Subscription$listenBsOrders$business_order_request>>)
              _fn) =>
      call(
          business_order_request: _fn(_instance.business_order_request.map(
              (e) =>
                  CopyWith$Subscription$listenBsOrders$business_order_request(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$listenBsOrders<TRes>
    implements CopyWith$Subscription$listenBsOrders<TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders(this._res);

  TRes _res;

  call({
    List<Subscription$listenBsOrders$business_order_request>?
        business_order_request,
    String? $__typename,
  }) =>
      _res;
  business_order_request(_fn) => _res;
}

const documentNodeSubscriptionlistenBsOrders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenBsOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'busnessId')),
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
        name: NameNode(value: 'business_order_request'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'business_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'busnessId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'customer_app_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
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
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user_id'),
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
                    name: NameNode(value: 'name'),
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
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review_id'),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'order_request_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offering_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'item_id'),
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
                name: NameNode(value: 'parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rental'),
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
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'additional_parameters'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'image'),
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
                        name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'time'),
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
Subscription$listenBsOrders _parserFn$Subscription$listenBsOrders(
        Map<String, dynamic> data) =>
    Subscription$listenBsOrders.fromJson(data);

class Options$Subscription$listenBsOrders
    extends graphql.SubscriptionOptions<Subscription$listenBsOrders> {
  Options$Subscription$listenBsOrders({
    String? operationName,
    required Variables$Subscription$listenBsOrders variables,
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
          document: documentNodeSubscriptionlistenBsOrders,
          parserFn: _parserFn$Subscription$listenBsOrders,
        );
}

class WatchOptions$Subscription$listenBsOrders
    extends graphql.WatchQueryOptions<Subscription$listenBsOrders> {
  WatchOptions$Subscription$listenBsOrders({
    String? operationName,
    required Variables$Subscription$listenBsOrders variables,
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
          document: documentNodeSubscriptionlistenBsOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listenBsOrders,
        );
}

class FetchMoreOptions$Subscription$listenBsOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenBsOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenBsOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlistenBsOrders,
        );
}

extension ClientExtension$Subscription$listenBsOrders on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listenBsOrders>>
      subscribe$listenBsOrders(Options$Subscription$listenBsOrders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listenBsOrders>
      watchSubscription$listenBsOrders(
              WatchOptions$Subscription$listenBsOrders options) =>
          this.watchQuery(options);
}

class Subscription$listenBsOrders$business_order_request {
  Subscription$listenBsOrders$business_order_request({
    required this.business_id,
    required this.customer_id,
    required this.customer_app_type,
    required this.business,
    required this.customer,
    this.chat_id,
    this.cost,
    required this.status,
    this.review_id,
    required this.order_time,
    this.notes,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$customer_id = json['customer_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$business = json['business'];
    final l$customer = json['customer'];
    final l$chat_id = json['chat_id'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_time = json['order_time'];
    final l$notes = json['notes'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request(
      business_id: (l$business_id as int),
      customer_id: (l$customer_id as int),
      customer_app_type: (l$customer_app_type as String),
      business:
          Subscription$listenBsOrders$business_order_request$business.fromJson(
              (l$business as Map<String, dynamic>)),
      customer:
          Subscription$listenBsOrders$business_order_request$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      chat_id: (l$chat_id as int?),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_time: (l$order_time as String),
      notes: (l$notes as String?),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listenBsOrders$business_order_request$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int business_id;

  final int customer_id;

  final String customer_app_type;

  final Subscription$listenBsOrders$business_order_request$business business;

  final Subscription$listenBsOrders$business_order_request$customer customer;

  final int? chat_id;

  final double? cost;

  final String status;

  final int? review_id;

  final String order_time;

  final String? notes;

  final int id;

  final List<Subscription$listenBsOrders$business_order_request$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    final l$customer_app_type = customer_app_type;
    final l$business = business;
    final l$customer = customer;
    final l$chat_id = chat_id;
    final l$cost = cost;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_time = order_time;
    final l$notes = notes;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$customer_id,
      l$customer_app_type,
      l$business,
      l$customer,
      l$chat_id,
      l$cost,
      l$status,
      l$review_id,
      l$order_time,
      l$notes,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenBsOrders$business_order_request) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request
    on Subscription$listenBsOrders$business_order_request {
  CopyWith$Subscription$listenBsOrders$business_order_request<
          Subscription$listenBsOrders$business_order_request>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request(
    Subscription$listenBsOrders$business_order_request instance,
    TRes Function(Subscription$listenBsOrders$business_order_request) then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request;

  factory CopyWith$Subscription$listenBsOrders$business_order_request.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request;

  TRes call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Subscription$listenBsOrders$business_order_request$business? business,
    Subscription$listenBsOrders$business_order_request$customer? customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Subscription$listenBsOrders$business_order_request$items>? items,
    String? $__typename,
  });
  CopyWith$Subscription$listenBsOrders$business_order_request$business<TRes>
      get business;
  CopyWith$Subscription$listenBsOrders$business_order_request$customer<TRes>
      get customer;
  TRes items(
      Iterable<Subscription$listenBsOrders$business_order_request$items> Function(
              Iterable<
                  CopyWith$Subscription$listenBsOrders$business_order_request$items<
                      Subscription$listenBsOrders$business_order_request$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request<TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request<TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request _instance;

  final TRes Function(Subscription$listenBsOrders$business_order_request) _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? business = _undefined,
    Object? customer = _undefined,
    Object? chat_id = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_time = _undefined,
    Object? notes = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request(
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listenBsOrders$business_order_request$business),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listenBsOrders$business_order_request$customer),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listenBsOrders$business_order_request$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenBsOrders$business_order_request$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listenBsOrders$business_order_request$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listenBsOrders$business_order_request$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listenBsOrders$business_order_request$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Subscription$listenBsOrders$business_order_request$items> Function(
                  Iterable<
                      CopyWith$Subscription$listenBsOrders$business_order_request$items<
                          Subscription$listenBsOrders$business_order_request$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listenBsOrders$business_order_request$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request<TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request<TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request(
      this._res);

  TRes _res;

  call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Subscription$listenBsOrders$business_order_request$business? business,
    Subscription$listenBsOrders$business_order_request$customer? customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Subscription$listenBsOrders$business_order_request$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenBsOrders$business_order_request$business<TRes>
      get business =>
          CopyWith$Subscription$listenBsOrders$business_order_request$business
              .stub(_res);
  CopyWith$Subscription$listenBsOrders$business_order_request$customer<TRes>
      get customer =>
          CopyWith$Subscription$listenBsOrders$business_order_request$customer
              .stub(_res);
  items(_fn) => _res;
}

class Subscription$listenBsOrders$business_order_request$business {
  Subscription$listenBsOrders$business_order_request$business({
    required this.details_id,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$business(
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
    if (!(other
            is Subscription$listenBsOrders$business_order_request$business) ||
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$business
    on Subscription$listenBsOrders$business_order_request$business {
  CopyWith$Subscription$listenBsOrders$business_order_request$business<
          Subscription$listenBsOrders$business_order_request$business>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$business<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$business(
    Subscription$listenBsOrders$business_order_request$business instance,
    TRes Function(Subscription$listenBsOrders$business_order_request$business)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$business;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$business;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$business<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$business<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$business(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$business _instance;

  final TRes Function(
      Subscription$listenBsOrders$business_order_request$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$business<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenBsOrders$business_order_request$customer {
  Subscription$listenBsOrders$business_order_request$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$customer(
      user_id: (l$user_id as int),
      user: Subscription$listenBsOrders$business_order_request$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Subscription$listenBsOrders$business_order_request$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
            is Subscription$listenBsOrders$business_order_request$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$customer
    on Subscription$listenBsOrders$business_order_request$customer {
  CopyWith$Subscription$listenBsOrders$business_order_request$customer<
          Subscription$listenBsOrders$business_order_request$customer>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$customer<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$customer(
    Subscription$listenBsOrders$business_order_request$customer instance,
    TRes Function(Subscription$listenBsOrders$business_order_request$customer)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer;

  TRes call({
    int? user_id,
    Subscription$listenBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$customer<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$customer _instance;

  final TRes Function(
      Subscription$listenBsOrders$business_order_request$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listenBsOrders$business_order_request$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listenBsOrders$business_order_request$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Subscription$listenBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listenBsOrders$business_order_request$customer$user
              .stub(_res);
}

class Subscription$listenBsOrders$business_order_request$customer$user {
  Subscription$listenBsOrders$business_order_request$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
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
            is Subscription$listenBsOrders$business_order_request$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$customer$user
    on Subscription$listenBsOrders$business_order_request$customer$user {
  CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
          Subscription$listenBsOrders$business_order_request$customer$user>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$customer$user(
    Subscription$listenBsOrders$business_order_request$customer$user instance,
    TRes Function(
            Subscription$listenBsOrders$business_order_request$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer$user;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$customer$user
      _instance;

  final TRes Function(
      Subscription$listenBsOrders$business_order_request$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenBsOrders$business_order_request$items {
  Subscription$listenBsOrders$business_order_request$items({
    required this.available,
    required this.cost,
    required this.order_request_id,
    required this.offering_type,
    required this.item_id,
    required this.id,
    required this.parameters,
    this.rental,
    this.time,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$items.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$order_request_id = json['order_request_id'];
    final l$offering_type = json['offering_type'];
    final l$item_id = json['item_id'];
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$rental = json['rental'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$items(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      order_request_id: (l$order_request_id as int),
      offering_type: (l$offering_type as String),
      item_id: (l$item_id as int),
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      rental: l$rental == null
          ? null
          : Subscription$listenBsOrders$business_order_request$items$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int order_request_id;

  final String offering_type;

  final int item_id;

  final int id;

  final dynamic parameters;

  final Subscription$listenBsOrders$business_order_request$items$rental? rental;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$order_request_id = order_request_id;
    final l$offering_type = offering_type;
    final l$item_id = item_id;
    final l$id = id;
    final l$parameters = parameters;
    final l$rental = rental;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$order_request_id,
      l$offering_type,
      l$item_id,
      l$id,
      l$parameters,
      l$rental,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenBsOrders$business_order_request$items) ||
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
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$items
    on Subscription$listenBsOrders$business_order_request$items {
  CopyWith$Subscription$listenBsOrders$business_order_request$items<
          Subscription$listenBsOrders$business_order_request$items>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$items<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$items(
    Subscription$listenBsOrders$business_order_request$items instance,
    TRes Function(Subscription$listenBsOrders$business_order_request$items)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items;

  TRes call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Subscription$listenBsOrders$business_order_request$items$rental? rental,
    String? time,
    String? $__typename,
  });
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<TRes>
      get rental;
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$items _instance;

  final TRes Function(Subscription$listenBsOrders$business_order_request$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? order_request_id = _undefined,
    Object? offering_type = _undefined,
    Object? item_id = _undefined,
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? rental = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request$items(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Subscription$listenBsOrders$business_order_request$items$rental?),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<TRes>
      get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Subscription$listenBsOrders$business_order_request$items$rental
            .stub(_then(_instance))
        : CopyWith$Subscription$listenBsOrders$business_order_request$items$rental(
            local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Subscription$listenBsOrders$business_order_request$items$rental? rental,
    String? time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<TRes>
      get rental =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental
              .stub(_res);
}

class Subscription$listenBsOrders$business_order_request$items$rental {
  Subscription$listenBsOrders$business_order_request$items$rental({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$items$rental(
      id: (l$id as int),
      details:
          Subscription$listenBsOrders$business_order_request$items$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listenBsOrders$business_order_request$items$rental$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listenBsOrders$business_order_request$items$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$items$rental
    on Subscription$listenBsOrders$business_order_request$items$rental {
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<
          Subscription$listenBsOrders$business_order_request$items$rental>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental(
    Subscription$listenBsOrders$business_order_request$items$rental instance,
    TRes Function(
            Subscription$listenBsOrders$business_order_request$items$rental)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental;

  TRes call({
    int? id,
    Subscription$listenBsOrders$business_order_request$items$rental$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$items$rental
      _instance;

  final TRes Function(
      Subscription$listenBsOrders$business_order_request$items$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenBsOrders$business_order_request$items$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listenBsOrders$business_order_request$items$rental$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listenBsOrders$business_order_request$items$rental$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
          TRes>
      get details =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details
              .stub(_res);
}

class Subscription$listenBsOrders$business_order_request$items$rental$details {
  Subscription$listenBsOrders$business_order_request$items$rental$details({
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$items$rental$details(
      id: (l$id as int),
      name:
          Subscription$listenBsOrders$business_order_request$items$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listenBsOrders$business_order_request$items$rental$details$name
      name;

  final dynamic? additional_parameters;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$additional_parameters,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenBsOrders$business_order_request$items$rental$details) ||
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
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$items$rental$details
    on Subscription$listenBsOrders$business_order_request$items$rental$details {
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
          Subscription$listenBsOrders$business_order_request$items$rental$details>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details(
    Subscription$listenBsOrders$business_order_request$items$rental$details
        instance,
    TRes Function(
            Subscription$listenBsOrders$business_order_request$items$rental$details)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details;

  TRes call({
    int? id,
    Subscription$listenBsOrders$business_order_request$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$items$rental$details
      _instance;

  final TRes Function(
          Subscription$listenBsOrders$business_order_request$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenBsOrders$business_order_request$items$rental$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listenBsOrders$business_order_request$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listenBsOrders$business_order_request$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name
              .stub(_res);
}

class Subscription$listenBsOrders$business_order_request$items$rental$details$name {
  Subscription$listenBsOrders$business_order_request$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>
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
            is Subscription$listenBsOrders$business_order_request$items$rental$details$name) ||
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$items$rental$details$name
    on Subscription$listenBsOrders$business_order_request$items$rental$details$name {
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
          Subscription$listenBsOrders$business_order_request$items$rental$details$name>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name(
    Subscription$listenBsOrders$business_order_request$items$rental$details$name
        instance,
    TRes Function(
            Subscription$listenBsOrders$business_order_request$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name;

  TRes call({
    List<Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
                      Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$items$rental$details$name
      _instance;

  final TRes Function(
          Subscription$listenBsOrders$business_order_request$items$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenBsOrders$business_order_request$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
                          Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations {
  Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
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
            is Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations) ||
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

extension UtilityExtension$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations
    on Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations {
  CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
          Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
    Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations
        instance,
    TRes Function(
            Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations;

  factory CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listenBsOrders$business_order_request$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getBsOrders {
  factory Variables$Query$getBsOrders({
    required int busnessId,
    String? status,
  }) =>
      Variables$Query$getBsOrders._({
        r'busnessId': busnessId,
        if (status != null) r'status': status,
      });

  Variables$Query$getBsOrders._(this._$data);

  factory Variables$Query$getBsOrders.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$busnessId = data['busnessId'];
    result$data['busnessId'] = (l$busnessId as int);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    return Variables$Query$getBsOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get busnessId => (_$data['busnessId'] as int);
  String? get status => (_$data['status'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$busnessId = busnessId;
    result$data['busnessId'] = l$busnessId;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getBsOrders<Variables$Query$getBsOrders>
      get copyWith => CopyWith$Variables$Query$getBsOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getBsOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$busnessId = busnessId;
    final lOther$busnessId = other.busnessId;
    if (l$busnessId != lOther$busnessId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$busnessId = busnessId;
    final l$status = status;
    return Object.hashAll([
      l$busnessId,
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getBsOrders<TRes> {
  factory CopyWith$Variables$Query$getBsOrders(
    Variables$Query$getBsOrders instance,
    TRes Function(Variables$Query$getBsOrders) then,
  ) = _CopyWithImpl$Variables$Query$getBsOrders;

  factory CopyWith$Variables$Query$getBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getBsOrders;

  TRes call({
    int? busnessId,
    String? status,
  });
}

class _CopyWithImpl$Variables$Query$getBsOrders<TRes>
    implements CopyWith$Variables$Query$getBsOrders<TRes> {
  _CopyWithImpl$Variables$Query$getBsOrders(
    this._instance,
    this._then,
  );

  final Variables$Query$getBsOrders _instance;

  final TRes Function(Variables$Query$getBsOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? busnessId = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Query$getBsOrders._({
        ..._instance._$data,
        if (busnessId != _undefined && busnessId != null)
          'busnessId': (busnessId as int),
        if (status != _undefined) 'status': (status as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getBsOrders<TRes>
    implements CopyWith$Variables$Query$getBsOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$getBsOrders(this._res);

  TRes _res;

  call({
    int? busnessId,
    String? status,
  }) =>
      _res;
}

class Query$getBsOrders {
  Query$getBsOrders({
    required this.business_order_request,
    required this.$__typename,
  });

  factory Query$getBsOrders.fromJson(Map<String, dynamic> json) {
    final l$business_order_request = json['business_order_request'];
    final l$$__typename = json['__typename'];
    return Query$getBsOrders(
      business_order_request: (l$business_order_request as List<dynamic>)
          .map((e) => Query$getBsOrders$business_order_request.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBsOrders$business_order_request> business_order_request;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request = business_order_request;
    _resultData['business_order_request'] =
        l$business_order_request.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request = business_order_request;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_order_request.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsOrders) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request = business_order_request;
    final lOther$business_order_request = other.business_order_request;
    if (l$business_order_request.length !=
        lOther$business_order_request.length) {
      return false;
    }
    for (int i = 0; i < l$business_order_request.length; i++) {
      final l$business_order_request$entry = l$business_order_request[i];
      final lOther$business_order_request$entry =
          lOther$business_order_request[i];
      if (l$business_order_request$entry !=
          lOther$business_order_request$entry) {
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

extension UtilityExtension$Query$getBsOrders on Query$getBsOrders {
  CopyWith$Query$getBsOrders<Query$getBsOrders> get copyWith =>
      CopyWith$Query$getBsOrders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getBsOrders<TRes> {
  factory CopyWith$Query$getBsOrders(
    Query$getBsOrders instance,
    TRes Function(Query$getBsOrders) then,
  ) = _CopyWithImpl$Query$getBsOrders;

  factory CopyWith$Query$getBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$getBsOrders;

  TRes call({
    List<Query$getBsOrders$business_order_request>? business_order_request,
    String? $__typename,
  });
  TRes business_order_request(
      Iterable<Query$getBsOrders$business_order_request> Function(
              Iterable<
                  CopyWith$Query$getBsOrders$business_order_request<
                      Query$getBsOrders$business_order_request>>)
          _fn);
}

class _CopyWithImpl$Query$getBsOrders<TRes>
    implements CopyWith$Query$getBsOrders<TRes> {
  _CopyWithImpl$Query$getBsOrders(
    this._instance,
    this._then,
  );

  final Query$getBsOrders _instance;

  final TRes Function(Query$getBsOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsOrders(
        business_order_request: business_order_request == _undefined ||
                business_order_request == null
            ? _instance.business_order_request
            : (business_order_request
                as List<Query$getBsOrders$business_order_request>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_order_request(
          Iterable<Query$getBsOrders$business_order_request> Function(
                  Iterable<
                      CopyWith$Query$getBsOrders$business_order_request<
                          Query$getBsOrders$business_order_request>>)
              _fn) =>
      call(
          business_order_request: _fn(_instance.business_order_request
              .map((e) => CopyWith$Query$getBsOrders$business_order_request(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getBsOrders<TRes>
    implements CopyWith$Query$getBsOrders<TRes> {
  _CopyWithStubImpl$Query$getBsOrders(this._res);

  TRes _res;

  call({
    List<Query$getBsOrders$business_order_request>? business_order_request,
    String? $__typename,
  }) =>
      _res;
  business_order_request(_fn) => _res;
}

const documentNodeQuerygetBsOrders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getBsOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'busnessId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
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
        name: NameNode(value: 'business_order_request'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'business_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'busnessId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user_id'),
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
                    name: NameNode(value: 'name'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'time'),
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
Query$getBsOrders _parserFn$Query$getBsOrders(Map<String, dynamic> data) =>
    Query$getBsOrders.fromJson(data);

class Options$Query$getBsOrders
    extends graphql.QueryOptions<Query$getBsOrders> {
  Options$Query$getBsOrders({
    String? operationName,
    required Variables$Query$getBsOrders variables,
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
          document: documentNodeQuerygetBsOrders,
          parserFn: _parserFn$Query$getBsOrders,
        );
}

class WatchOptions$Query$getBsOrders
    extends graphql.WatchQueryOptions<Query$getBsOrders> {
  WatchOptions$Query$getBsOrders({
    String? operationName,
    required Variables$Query$getBsOrders variables,
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
          document: documentNodeQuerygetBsOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getBsOrders,
        );
}

class FetchMoreOptions$Query$getBsOrders extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getBsOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getBsOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetBsOrders,
        );
}

extension ClientExtension$Query$getBsOrders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getBsOrders>> query$getBsOrders(
          Options$Query$getBsOrders options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getBsOrders> watchQuery$getBsOrders(
          WatchOptions$Query$getBsOrders options) =>
      this.watchQuery(options);
  void writeQuery$getBsOrders({
    required Query$getBsOrders data,
    required Variables$Query$getBsOrders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetBsOrders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getBsOrders? readQuery$getBsOrders({
    required Variables$Query$getBsOrders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetBsOrders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getBsOrders.fromJson(result);
  }
}

class Query$getBsOrders$business_order_request {
  Query$getBsOrders$business_order_request({
    required this.customer,
    this.cost,
    required this.status,
    required this.order_time,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Query$getBsOrders$business_order_request.fromJson(
      Map<String, dynamic> json) {
    final l$customer = json['customer'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$order_time = json['order_time'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getBsOrders$business_order_request(
      customer: Query$getBsOrders$business_order_request$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      order_time: (l$order_time as String),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) => Query$getBsOrders$business_order_request$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBsOrders$business_order_request$customer customer;

  final double? cost;

  final String status;

  final String order_time;

  final int id;

  final List<Query$getBsOrders$business_order_request$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$cost = cost;
    final l$status = status;
    final l$order_time = order_time;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer,
      l$cost,
      l$status,
      l$order_time,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsOrders$business_order_request) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$getBsOrders$business_order_request
    on Query$getBsOrders$business_order_request {
  CopyWith$Query$getBsOrders$business_order_request<
          Query$getBsOrders$business_order_request>
      get copyWith => CopyWith$Query$getBsOrders$business_order_request(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsOrders$business_order_request<TRes> {
  factory CopyWith$Query$getBsOrders$business_order_request(
    Query$getBsOrders$business_order_request instance,
    TRes Function(Query$getBsOrders$business_order_request) then,
  ) = _CopyWithImpl$Query$getBsOrders$business_order_request;

  factory CopyWith$Query$getBsOrders$business_order_request.stub(TRes res) =
      _CopyWithStubImpl$Query$getBsOrders$business_order_request;

  TRes call({
    Query$getBsOrders$business_order_request$customer? customer,
    double? cost,
    String? status,
    String? order_time,
    int? id,
    List<Query$getBsOrders$business_order_request$items>? items,
    String? $__typename,
  });
  CopyWith$Query$getBsOrders$business_order_request$customer<TRes> get customer;
  TRes items(
      Iterable<Query$getBsOrders$business_order_request$items> Function(
              Iterable<
                  CopyWith$Query$getBsOrders$business_order_request$items<
                      Query$getBsOrders$business_order_request$items>>)
          _fn);
}

class _CopyWithImpl$Query$getBsOrders$business_order_request<TRes>
    implements CopyWith$Query$getBsOrders$business_order_request<TRes> {
  _CopyWithImpl$Query$getBsOrders$business_order_request(
    this._instance,
    this._then,
  );

  final Query$getBsOrders$business_order_request _instance;

  final TRes Function(Query$getBsOrders$business_order_request) _then;

  static const _undefined = {};

  TRes call({
    Object? customer = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? order_time = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsOrders$business_order_request(
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as Query$getBsOrders$business_order_request$customer),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$getBsOrders$business_order_request$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBsOrders$business_order_request$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$getBsOrders$business_order_request$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Query$getBsOrders$business_order_request$items> Function(
                  Iterable<
                      CopyWith$Query$getBsOrders$business_order_request$items<
                          Query$getBsOrders$business_order_request$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$getBsOrders$business_order_request$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getBsOrders$business_order_request<TRes>
    implements CopyWith$Query$getBsOrders$business_order_request<TRes> {
  _CopyWithStubImpl$Query$getBsOrders$business_order_request(this._res);

  TRes _res;

  call({
    Query$getBsOrders$business_order_request$customer? customer,
    double? cost,
    String? status,
    String? order_time,
    int? id,
    List<Query$getBsOrders$business_order_request$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBsOrders$business_order_request$customer<TRes>
      get customer =>
          CopyWith$Query$getBsOrders$business_order_request$customer.stub(_res);
  items(_fn) => _res;
}

class Query$getBsOrders$business_order_request$customer {
  Query$getBsOrders$business_order_request$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Query$getBsOrders$business_order_request$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getBsOrders$business_order_request$customer(
      user_id: (l$user_id as int),
      user: Query$getBsOrders$business_order_request$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Query$getBsOrders$business_order_request$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsOrders$business_order_request$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Query$getBsOrders$business_order_request$customer
    on Query$getBsOrders$business_order_request$customer {
  CopyWith$Query$getBsOrders$business_order_request$customer<
          Query$getBsOrders$business_order_request$customer>
      get copyWith =>
          CopyWith$Query$getBsOrders$business_order_request$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsOrders$business_order_request$customer<
    TRes> {
  factory CopyWith$Query$getBsOrders$business_order_request$customer(
    Query$getBsOrders$business_order_request$customer instance,
    TRes Function(Query$getBsOrders$business_order_request$customer) then,
  ) = _CopyWithImpl$Query$getBsOrders$business_order_request$customer;

  factory CopyWith$Query$getBsOrders$business_order_request$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer;

  TRes call({
    int? user_id,
    Query$getBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$getBsOrders$business_order_request$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$getBsOrders$business_order_request$customer<TRes>
    implements
        CopyWith$Query$getBsOrders$business_order_request$customer<TRes> {
  _CopyWithImpl$Query$getBsOrders$business_order_request$customer(
    this._instance,
    this._then,
  );

  final Query$getBsOrders$business_order_request$customer _instance;

  final TRes Function(Query$getBsOrders$business_order_request$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsOrders$business_order_request$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$getBsOrders$business_order_request$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBsOrders$business_order_request$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$getBsOrders$business_order_request$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer<TRes>
    implements
        CopyWith$Query$getBsOrders$business_order_request$customer<TRes> {
  _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Query$getBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBsOrders$business_order_request$customer$user<TRes>
      get user =>
          CopyWith$Query$getBsOrders$business_order_request$customer$user.stub(
              _res);
}

class Query$getBsOrders$business_order_request$customer$user {
  Query$getBsOrders$business_order_request$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Query$getBsOrders$business_order_request$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getBsOrders$business_order_request$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsOrders$business_order_request$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getBsOrders$business_order_request$customer$user
    on Query$getBsOrders$business_order_request$customer$user {
  CopyWith$Query$getBsOrders$business_order_request$customer$user<
          Query$getBsOrders$business_order_request$customer$user>
      get copyWith =>
          CopyWith$Query$getBsOrders$business_order_request$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsOrders$business_order_request$customer$user<
    TRes> {
  factory CopyWith$Query$getBsOrders$business_order_request$customer$user(
    Query$getBsOrders$business_order_request$customer$user instance,
    TRes Function(Query$getBsOrders$business_order_request$customer$user) then,
  ) = _CopyWithImpl$Query$getBsOrders$business_order_request$customer$user;

  factory CopyWith$Query$getBsOrders$business_order_request$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBsOrders$business_order_request$customer$user<TRes>
    implements
        CopyWith$Query$getBsOrders$business_order_request$customer$user<TRes> {
  _CopyWithImpl$Query$getBsOrders$business_order_request$customer$user(
    this._instance,
    this._then,
  );

  final Query$getBsOrders$business_order_request$customer$user _instance;

  final TRes Function(Query$getBsOrders$business_order_request$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsOrders$business_order_request$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer$user<
        TRes>
    implements
        CopyWith$Query$getBsOrders$business_order_request$customer$user<TRes> {
  _CopyWithStubImpl$Query$getBsOrders$business_order_request$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getBsOrders$business_order_request$items {
  Query$getBsOrders$business_order_request$items({
    required this.id,
    this.time,
    required this.$__typename,
  });

  factory Query$getBsOrders$business_order_request$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Query$getBsOrders$business_order_request$items(
      id: (l$id as int),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsOrders$business_order_request$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Query$getBsOrders$business_order_request$items
    on Query$getBsOrders$business_order_request$items {
  CopyWith$Query$getBsOrders$business_order_request$items<
          Query$getBsOrders$business_order_request$items>
      get copyWith => CopyWith$Query$getBsOrders$business_order_request$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsOrders$business_order_request$items<TRes> {
  factory CopyWith$Query$getBsOrders$business_order_request$items(
    Query$getBsOrders$business_order_request$items instance,
    TRes Function(Query$getBsOrders$business_order_request$items) then,
  ) = _CopyWithImpl$Query$getBsOrders$business_order_request$items;

  factory CopyWith$Query$getBsOrders$business_order_request$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsOrders$business_order_request$items;

  TRes call({
    int? id,
    String? time,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBsOrders$business_order_request$items<TRes>
    implements CopyWith$Query$getBsOrders$business_order_request$items<TRes> {
  _CopyWithImpl$Query$getBsOrders$business_order_request$items(
    this._instance,
    this._then,
  );

  final Query$getBsOrders$business_order_request$items _instance;

  final TRes Function(Query$getBsOrders$business_order_request$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsOrders$business_order_request$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getBsOrders$business_order_request$items<TRes>
    implements CopyWith$Query$getBsOrders$business_order_request$items<TRes> {
  _CopyWithStubImpl$Query$getBsOrders$business_order_request$items(this._res);

  TRes _res;

  call({
    int? id,
    String? time,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenToBsOrders {
  factory Variables$Subscription$listenToBsOrders({
    required int busnessId,
    String? status,
  }) =>
      Variables$Subscription$listenToBsOrders._({
        r'busnessId': busnessId,
        if (status != null) r'status': status,
      });

  Variables$Subscription$listenToBsOrders._(this._$data);

  factory Variables$Subscription$listenToBsOrders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$busnessId = data['busnessId'];
    result$data['busnessId'] = (l$busnessId as int);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    return Variables$Subscription$listenToBsOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get busnessId => (_$data['busnessId'] as int);
  String? get status => (_$data['status'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$busnessId = busnessId;
    result$data['busnessId'] = l$busnessId;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    return result$data;
  }

  CopyWith$Variables$Subscription$listenToBsOrders<
          Variables$Subscription$listenToBsOrders>
      get copyWith => CopyWith$Variables$Subscription$listenToBsOrders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listenToBsOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$busnessId = busnessId;
    final lOther$busnessId = other.busnessId;
    if (l$busnessId != lOther$busnessId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$busnessId = busnessId;
    final l$status = status;
    return Object.hashAll([
      l$busnessId,
      _$data.containsKey('status') ? l$status : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listenToBsOrders<TRes> {
  factory CopyWith$Variables$Subscription$listenToBsOrders(
    Variables$Subscription$listenToBsOrders instance,
    TRes Function(Variables$Subscription$listenToBsOrders) then,
  ) = _CopyWithImpl$Variables$Subscription$listenToBsOrders;

  factory CopyWith$Variables$Subscription$listenToBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenToBsOrders;

  TRes call({
    int? busnessId,
    String? status,
  });
}

class _CopyWithImpl$Variables$Subscription$listenToBsOrders<TRes>
    implements CopyWith$Variables$Subscription$listenToBsOrders<TRes> {
  _CopyWithImpl$Variables$Subscription$listenToBsOrders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenToBsOrders _instance;

  final TRes Function(Variables$Subscription$listenToBsOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? busnessId = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Subscription$listenToBsOrders._({
        ..._instance._$data,
        if (busnessId != _undefined && busnessId != null)
          'busnessId': (busnessId as int),
        if (status != _undefined) 'status': (status as String?),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenToBsOrders<TRes>
    implements CopyWith$Variables$Subscription$listenToBsOrders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenToBsOrders(this._res);

  TRes _res;

  call({
    int? busnessId,
    String? status,
  }) =>
      _res;
}

class Subscription$listenToBsOrders {
  Subscription$listenToBsOrders({
    required this.business_order_request,
    required this.$__typename,
  });

  factory Subscription$listenToBsOrders.fromJson(Map<String, dynamic> json) {
    final l$business_order_request = json['business_order_request'];
    final l$$__typename = json['__typename'];
    return Subscription$listenToBsOrders(
      business_order_request: (l$business_order_request as List<dynamic>)
          .map((e) =>
              Subscription$listenToBsOrders$business_order_request.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listenToBsOrders$business_order_request>
      business_order_request;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request = business_order_request;
    _resultData['business_order_request'] =
        l$business_order_request.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request = business_order_request;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_order_request.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenToBsOrders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request = business_order_request;
    final lOther$business_order_request = other.business_order_request;
    if (l$business_order_request.length !=
        lOther$business_order_request.length) {
      return false;
    }
    for (int i = 0; i < l$business_order_request.length; i++) {
      final l$business_order_request$entry = l$business_order_request[i];
      final lOther$business_order_request$entry =
          lOther$business_order_request[i];
      if (l$business_order_request$entry !=
          lOther$business_order_request$entry) {
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

extension UtilityExtension$Subscription$listenToBsOrders
    on Subscription$listenToBsOrders {
  CopyWith$Subscription$listenToBsOrders<Subscription$listenToBsOrders>
      get copyWith => CopyWith$Subscription$listenToBsOrders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenToBsOrders<TRes> {
  factory CopyWith$Subscription$listenToBsOrders(
    Subscription$listenToBsOrders instance,
    TRes Function(Subscription$listenToBsOrders) then,
  ) = _CopyWithImpl$Subscription$listenToBsOrders;

  factory CopyWith$Subscription$listenToBsOrders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listenToBsOrders;

  TRes call({
    List<Subscription$listenToBsOrders$business_order_request>?
        business_order_request,
    String? $__typename,
  });
  TRes business_order_request(
      Iterable<Subscription$listenToBsOrders$business_order_request> Function(
              Iterable<
                  CopyWith$Subscription$listenToBsOrders$business_order_request<
                      Subscription$listenToBsOrders$business_order_request>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenToBsOrders<TRes>
    implements CopyWith$Subscription$listenToBsOrders<TRes> {
  _CopyWithImpl$Subscription$listenToBsOrders(
    this._instance,
    this._then,
  );

  final Subscription$listenToBsOrders _instance;

  final TRes Function(Subscription$listenToBsOrders) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenToBsOrders(
        business_order_request: business_order_request == _undefined ||
                business_order_request == null
            ? _instance.business_order_request
            : (business_order_request
                as List<Subscription$listenToBsOrders$business_order_request>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_order_request(
          Iterable<Subscription$listenToBsOrders$business_order_request> Function(
                  Iterable<
                      CopyWith$Subscription$listenToBsOrders$business_order_request<
                          Subscription$listenToBsOrders$business_order_request>>)
              _fn) =>
      call(
          business_order_request: _fn(_instance.business_order_request.map(
              (e) =>
                  CopyWith$Subscription$listenToBsOrders$business_order_request(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$listenToBsOrders<TRes>
    implements CopyWith$Subscription$listenToBsOrders<TRes> {
  _CopyWithStubImpl$Subscription$listenToBsOrders(this._res);

  TRes _res;

  call({
    List<Subscription$listenToBsOrders$business_order_request>?
        business_order_request,
    String? $__typename,
  }) =>
      _res;
  business_order_request(_fn) => _res;
}

const documentNodeSubscriptionlistenToBsOrders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenToBsOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'busnessId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
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
        name: NameNode(value: 'business_order_request'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'business_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'busnessId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user_id'),
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
                    name: NameNode(value: 'name'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'time'),
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
Subscription$listenToBsOrders _parserFn$Subscription$listenToBsOrders(
        Map<String, dynamic> data) =>
    Subscription$listenToBsOrders.fromJson(data);

class Options$Subscription$listenToBsOrders
    extends graphql.SubscriptionOptions<Subscription$listenToBsOrders> {
  Options$Subscription$listenToBsOrders({
    String? operationName,
    required Variables$Subscription$listenToBsOrders variables,
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
          document: documentNodeSubscriptionlistenToBsOrders,
          parserFn: _parserFn$Subscription$listenToBsOrders,
        );
}

class WatchOptions$Subscription$listenToBsOrders
    extends graphql.WatchQueryOptions<Subscription$listenToBsOrders> {
  WatchOptions$Subscription$listenToBsOrders({
    String? operationName,
    required Variables$Subscription$listenToBsOrders variables,
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
          document: documentNodeSubscriptionlistenToBsOrders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listenToBsOrders,
        );
}

class FetchMoreOptions$Subscription$listenToBsOrders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenToBsOrders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenToBsOrders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlistenToBsOrders,
        );
}

extension ClientExtension$Subscription$listenToBsOrders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listenToBsOrders>>
      subscribe$listenToBsOrders(
              Options$Subscription$listenToBsOrders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listenToBsOrders>
      watchSubscription$listenToBsOrders(
              WatchOptions$Subscription$listenToBsOrders options) =>
          this.watchQuery(options);
}

class Subscription$listenToBsOrders$business_order_request {
  Subscription$listenToBsOrders$business_order_request({
    required this.customer,
    this.cost,
    required this.status,
    required this.order_time,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Subscription$listenToBsOrders$business_order_request.fromJson(
      Map<String, dynamic> json) {
    final l$customer = json['customer'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$order_time = json['order_time'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Subscription$listenToBsOrders$business_order_request(
      customer: Subscription$listenToBsOrders$business_order_request$customer
          .fromJson((l$customer as Map<String, dynamic>)),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      order_time: (l$order_time as String),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) => Subscription$listenToBsOrders$business_order_request$items
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listenToBsOrders$business_order_request$customer customer;

  final double? cost;

  final String status;

  final String order_time;

  final int id;

  final List<Subscription$listenToBsOrders$business_order_request$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$cost = cost;
    final l$status = status;
    final l$order_time = order_time;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer,
      l$cost,
      l$status,
      l$order_time,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenToBsOrders$business_order_request) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Subscription$listenToBsOrders$business_order_request
    on Subscription$listenToBsOrders$business_order_request {
  CopyWith$Subscription$listenToBsOrders$business_order_request<
          Subscription$listenToBsOrders$business_order_request>
      get copyWith =>
          CopyWith$Subscription$listenToBsOrders$business_order_request(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenToBsOrders$business_order_request<
    TRes> {
  factory CopyWith$Subscription$listenToBsOrders$business_order_request(
    Subscription$listenToBsOrders$business_order_request instance,
    TRes Function(Subscription$listenToBsOrders$business_order_request) then,
  ) = _CopyWithImpl$Subscription$listenToBsOrders$business_order_request;

  factory CopyWith$Subscription$listenToBsOrders$business_order_request.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request;

  TRes call({
    Subscription$listenToBsOrders$business_order_request$customer? customer,
    double? cost,
    String? status,
    String? order_time,
    int? id,
    List<Subscription$listenToBsOrders$business_order_request$items>? items,
    String? $__typename,
  });
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer<TRes>
      get customer;
  TRes items(
      Iterable<Subscription$listenToBsOrders$business_order_request$items> Function(
              Iterable<
                  CopyWith$Subscription$listenToBsOrders$business_order_request$items<
                      Subscription$listenToBsOrders$business_order_request$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenToBsOrders$business_order_request<TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request<TRes> {
  _CopyWithImpl$Subscription$listenToBsOrders$business_order_request(
    this._instance,
    this._then,
  );

  final Subscription$listenToBsOrders$business_order_request _instance;

  final TRes Function(Subscription$listenToBsOrders$business_order_request)
      _then;

  static const _undefined = {};

  TRes call({
    Object? customer = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? order_time = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenToBsOrders$business_order_request(
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listenToBsOrders$business_order_request$customer),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listenToBsOrders$business_order_request$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listenToBsOrders$business_order_request$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Subscription$listenToBsOrders$business_order_request$items> Function(
                  Iterable<
                      CopyWith$Subscription$listenToBsOrders$business_order_request$items<
                          Subscription$listenToBsOrders$business_order_request$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listenToBsOrders$business_order_request$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request<TRes> {
  _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request(
      this._res);

  TRes _res;

  call({
    Subscription$listenToBsOrders$business_order_request$customer? customer,
    double? cost,
    String? status,
    String? order_time,
    int? id,
    List<Subscription$listenToBsOrders$business_order_request$items>? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer<TRes>
      get customer =>
          CopyWith$Subscription$listenToBsOrders$business_order_request$customer
              .stub(_res);
  items(_fn) => _res;
}

class Subscription$listenToBsOrders$business_order_request$customer {
  Subscription$listenToBsOrders$business_order_request$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listenToBsOrders$business_order_request$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listenToBsOrders$business_order_request$customer(
      user_id: (l$user_id as int),
      user: Subscription$listenToBsOrders$business_order_request$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Subscription$listenToBsOrders$business_order_request$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
            is Subscription$listenToBsOrders$business_order_request$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Subscription$listenToBsOrders$business_order_request$customer
    on Subscription$listenToBsOrders$business_order_request$customer {
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer<
          Subscription$listenToBsOrders$business_order_request$customer>
      get copyWith =>
          CopyWith$Subscription$listenToBsOrders$business_order_request$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenToBsOrders$business_order_request$customer<
    TRes> {
  factory CopyWith$Subscription$listenToBsOrders$business_order_request$customer(
    Subscription$listenToBsOrders$business_order_request$customer instance,
    TRes Function(Subscription$listenToBsOrders$business_order_request$customer)
        then,
  ) = _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer;

  factory CopyWith$Subscription$listenToBsOrders$business_order_request$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer;

  TRes call({
    int? user_id,
    Subscription$listenToBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$customer<
            TRes> {
  _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer(
    this._instance,
    this._then,
  );

  final Subscription$listenToBsOrders$business_order_request$customer _instance;

  final TRes Function(
      Subscription$listenToBsOrders$business_order_request$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenToBsOrders$business_order_request$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listenToBsOrders$business_order_request$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Subscription$listenToBsOrders$business_order_request$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user
              .stub(_res);
}

class Subscription$listenToBsOrders$business_order_request$customer$user {
  Subscription$listenToBsOrders$business_order_request$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listenToBsOrders$business_order_request$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenToBsOrders$business_order_request$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
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
            is Subscription$listenToBsOrders$business_order_request$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listenToBsOrders$business_order_request$customer$user
    on Subscription$listenToBsOrders$business_order_request$customer$user {
  CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
          Subscription$listenToBsOrders$business_order_request$customer$user>
      get copyWith =>
          CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
    TRes> {
  factory CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user(
    Subscription$listenToBsOrders$business_order_request$customer$user instance,
    TRes Function(
            Subscription$listenToBsOrders$business_order_request$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer$user;

  factory CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listenToBsOrders$business_order_request$customer$user
      _instance;

  final TRes Function(
      Subscription$listenToBsOrders$business_order_request$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenToBsOrders$business_order_request$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenToBsOrders$business_order_request$items {
  Subscription$listenToBsOrders$business_order_request$items({
    required this.id,
    this.time,
    required this.$__typename,
  });

  factory Subscription$listenToBsOrders$business_order_request$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Subscription$listenToBsOrders$business_order_request$items(
      id: (l$id as int),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenToBsOrders$business_order_request$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Subscription$listenToBsOrders$business_order_request$items
    on Subscription$listenToBsOrders$business_order_request$items {
  CopyWith$Subscription$listenToBsOrders$business_order_request$items<
          Subscription$listenToBsOrders$business_order_request$items>
      get copyWith =>
          CopyWith$Subscription$listenToBsOrders$business_order_request$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenToBsOrders$business_order_request$items<
    TRes> {
  factory CopyWith$Subscription$listenToBsOrders$business_order_request$items(
    Subscription$listenToBsOrders$business_order_request$items instance,
    TRes Function(Subscription$listenToBsOrders$business_order_request$items)
        then,
  ) = _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$items;

  factory CopyWith$Subscription$listenToBsOrders$business_order_request$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$items;

  TRes call({
    int? id,
    String? time,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$items<
            TRes> {
  _CopyWithImpl$Subscription$listenToBsOrders$business_order_request$items(
    this._instance,
    this._then,
  );

  final Subscription$listenToBsOrders$business_order_request$items _instance;

  final TRes Function(
      Subscription$listenToBsOrders$business_order_request$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenToBsOrders$business_order_request$items(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$items<
        TRes>
    implements
        CopyWith$Subscription$listenToBsOrders$business_order_request$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listenToBsOrders$business_order_request$items(
      this._res);

  TRes _res;

  call({
    int? id,
    String? time,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getBsRentalOrdersItems {
  factory Variables$Query$getBsRentalOrdersItems({
    required int rentalBusinessId,
    required int offset,
    required int limit,
  }) =>
      Variables$Query$getBsRentalOrdersItems._({
        r'rentalBusinessId': rentalBusinessId,
        r'offset': offset,
        r'limit': limit,
      });

  Variables$Query$getBsRentalOrdersItems._(this._$data);

  factory Variables$Query$getBsRentalOrdersItems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$rentalBusinessId = data['rentalBusinessId'];
    result$data['rentalBusinessId'] = (l$rentalBusinessId as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    return Variables$Query$getBsRentalOrdersItems._(result$data);
  }

  Map<String, dynamic> _$data;

  int get rentalBusinessId => (_$data['rentalBusinessId'] as int);
  int get offset => (_$data['offset'] as int);
  int get limit => (_$data['limit'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$rentalBusinessId = rentalBusinessId;
    result$data['rentalBusinessId'] = l$rentalBusinessId;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    return result$data;
  }

  CopyWith$Variables$Query$getBsRentalOrdersItems<
          Variables$Query$getBsRentalOrdersItems>
      get copyWith => CopyWith$Variables$Query$getBsRentalOrdersItems(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getBsRentalOrdersItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rentalBusinessId = rentalBusinessId;
    final lOther$rentalBusinessId = other.rentalBusinessId;
    if (l$rentalBusinessId != lOther$rentalBusinessId) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
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
    final l$rentalBusinessId = rentalBusinessId;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$rentalBusinessId,
      l$offset,
      l$limit,
    ]);
  }
}

abstract class CopyWith$Variables$Query$getBsRentalOrdersItems<TRes> {
  factory CopyWith$Variables$Query$getBsRentalOrdersItems(
    Variables$Query$getBsRentalOrdersItems instance,
    TRes Function(Variables$Query$getBsRentalOrdersItems) then,
  ) = _CopyWithImpl$Variables$Query$getBsRentalOrdersItems;

  factory CopyWith$Variables$Query$getBsRentalOrdersItems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getBsRentalOrdersItems;

  TRes call({
    int? rentalBusinessId,
    int? offset,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$getBsRentalOrdersItems<TRes>
    implements CopyWith$Variables$Query$getBsRentalOrdersItems<TRes> {
  _CopyWithImpl$Variables$Query$getBsRentalOrdersItems(
    this._instance,
    this._then,
  );

  final Variables$Query$getBsRentalOrdersItems _instance;

  final TRes Function(Variables$Query$getBsRentalOrdersItems) _then;

  static const _undefined = {};

  TRes call({
    Object? rentalBusinessId = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$getBsRentalOrdersItems._({
        ..._instance._$data,
        if (rentalBusinessId != _undefined && rentalBusinessId != null)
          'rentalBusinessId': (rentalBusinessId as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
        if (limit != _undefined && limit != null) 'limit': (limit as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getBsRentalOrdersItems<TRes>
    implements CopyWith$Variables$Query$getBsRentalOrdersItems<TRes> {
  _CopyWithStubImpl$Variables$Query$getBsRentalOrdersItems(this._res);

  TRes _res;

  call({
    int? rentalBusinessId,
    int? offset,
    int? limit,
  }) =>
      _res;
}

class Query$getBsRentalOrdersItems {
  Query$getBsRentalOrdersItems({
    required this.business_order_request_item,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems.fromJson(Map<String, dynamic> json) {
    final l$business_order_request_item = json['business_order_request_item'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems(
      business_order_request_item: (l$business_order_request_item
              as List<dynamic>)
          .map((e) =>
              Query$getBsRentalOrdersItems$business_order_request_item.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getBsRentalOrdersItems$business_order_request_item>
      business_order_request_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request_item = business_order_request_item;
    _resultData['business_order_request_item'] =
        l$business_order_request_item.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request_item = business_order_request_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_order_request_item.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsRentalOrdersItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request_item = business_order_request_item;
    final lOther$business_order_request_item =
        other.business_order_request_item;
    if (l$business_order_request_item.length !=
        lOther$business_order_request_item.length) {
      return false;
    }
    for (int i = 0; i < l$business_order_request_item.length; i++) {
      final l$business_order_request_item$entry =
          l$business_order_request_item[i];
      final lOther$business_order_request_item$entry =
          lOther$business_order_request_item[i];
      if (l$business_order_request_item$entry !=
          lOther$business_order_request_item$entry) {
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

extension UtilityExtension$Query$getBsRentalOrdersItems
    on Query$getBsRentalOrdersItems {
  CopyWith$Query$getBsRentalOrdersItems<Query$getBsRentalOrdersItems>
      get copyWith => CopyWith$Query$getBsRentalOrdersItems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems<TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems(
    Query$getBsRentalOrdersItems instance,
    TRes Function(Query$getBsRentalOrdersItems) then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems;

  factory CopyWith$Query$getBsRentalOrdersItems.stub(TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems;

  TRes call({
    List<Query$getBsRentalOrdersItems$business_order_request_item>?
        business_order_request_item,
    String? $__typename,
  });
  TRes business_order_request_item(
      Iterable<Query$getBsRentalOrdersItems$business_order_request_item> Function(
              Iterable<
                  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
                      Query$getBsRentalOrdersItems$business_order_request_item>>)
          _fn);
}

class _CopyWithImpl$Query$getBsRentalOrdersItems<TRes>
    implements CopyWith$Query$getBsRentalOrdersItems<TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems _instance;

  final TRes Function(Query$getBsRentalOrdersItems) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsRentalOrdersItems(
        business_order_request_item:
            business_order_request_item == _undefined ||
                    business_order_request_item == null
                ? _instance.business_order_request_item
                : (business_order_request_item as List<
                    Query$getBsRentalOrdersItems$business_order_request_item>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_order_request_item(
          Iterable<Query$getBsRentalOrdersItems$business_order_request_item> Function(
                  Iterable<
                      CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
                          Query$getBsRentalOrdersItems$business_order_request_item>>)
              _fn) =>
      call(
          business_order_request_item: _fn(_instance.business_order_request_item
              .map((e) =>
                  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getBsRentalOrdersItems<TRes>
    implements CopyWith$Query$getBsRentalOrdersItems<TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems(this._res);

  TRes _res;

  call({
    List<Query$getBsRentalOrdersItems$business_order_request_item>?
        business_order_request_item,
    String? $__typename,
  }) =>
      _res;
  business_order_request_item(_fn) => _res;
}

const documentNodeQuerygetBsRentalOrdersItems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getBsRentalOrdersItems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'rentalBusinessId')),
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
        name: NameNode(value: 'business_order_request_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'rental'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'business_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: VariableNode(
                            name: NameNode(value: 'rentalBusinessId')),
                      )
                    ]),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'order_request_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'parameters'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rental'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
                    name: NameNode(value: 'available'),
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
            name: NameNode(value: 'item_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offering_type'),
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
Query$getBsRentalOrdersItems _parserFn$Query$getBsRentalOrdersItems(
        Map<String, dynamic> data) =>
    Query$getBsRentalOrdersItems.fromJson(data);

class Options$Query$getBsRentalOrdersItems
    extends graphql.QueryOptions<Query$getBsRentalOrdersItems> {
  Options$Query$getBsRentalOrdersItems({
    String? operationName,
    required Variables$Query$getBsRentalOrdersItems variables,
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
          document: documentNodeQuerygetBsRentalOrdersItems,
          parserFn: _parserFn$Query$getBsRentalOrdersItems,
        );
}

class WatchOptions$Query$getBsRentalOrdersItems
    extends graphql.WatchQueryOptions<Query$getBsRentalOrdersItems> {
  WatchOptions$Query$getBsRentalOrdersItems({
    String? operationName,
    required Variables$Query$getBsRentalOrdersItems variables,
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
          document: documentNodeQuerygetBsRentalOrdersItems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getBsRentalOrdersItems,
        );
}

class FetchMoreOptions$Query$getBsRentalOrdersItems
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getBsRentalOrdersItems({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getBsRentalOrdersItems variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetBsRentalOrdersItems,
        );
}

extension ClientExtension$Query$getBsRentalOrdersItems
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getBsRentalOrdersItems>>
      query$getBsRentalOrdersItems(
              Options$Query$getBsRentalOrdersItems options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getBsRentalOrdersItems>
      watchQuery$getBsRentalOrdersItems(
              WatchOptions$Query$getBsRentalOrdersItems options) =>
          this.watchQuery(options);
  void writeQuery$getBsRentalOrdersItems({
    required Query$getBsRentalOrdersItems data,
    required Variables$Query$getBsRentalOrdersItems variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetBsRentalOrdersItems),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getBsRentalOrdersItems? readQuery$getBsRentalOrdersItems({
    required Variables$Query$getBsRentalOrdersItems variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetBsRentalOrdersItems),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getBsRentalOrdersItems.fromJson(result);
  }
}

class Query$getBsRentalOrdersItems$business_order_request_item {
  Query$getBsRentalOrdersItems$business_order_request_item({
    required this.cost,
    required this.id,
    required this.order_request_id,
    required this.parameters,
    this.time,
    this.rental,
    required this.item_id,
    required this.offering_type,
    required this.available,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems$business_order_request_item.fromJson(
      Map<String, dynamic> json) {
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$order_request_id = json['order_request_id'];
    final l$parameters = json['parameters'];
    final l$time = json['time'];
    final l$rental = json['rental'];
    final l$item_id = json['item_id'];
    final l$offering_type = json['offering_type'];
    final l$available = json['available'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems$business_order_request_item(
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      order_request_id: (l$order_request_id as int),
      parameters: mapFromJson(l$parameters),
      time: (l$time as String?),
      rental: l$rental == null
          ? null
          : Query$getBsRentalOrdersItems$business_order_request_item$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      item_id: (l$item_id as int),
      offering_type: (l$offering_type as String),
      available: (l$available as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost;

  final int id;

  final int order_request_id;

  final dynamic parameters;

  final String? time;

  final Query$getBsRentalOrdersItems$business_order_request_item$rental? rental;

  final int item_id;

  final String offering_type;

  final bool available;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$time = time;
    _resultData['time'] = l$time;
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost = cost;
    final l$id = id;
    final l$order_request_id = order_request_id;
    final l$parameters = parameters;
    final l$time = time;
    final l$rental = rental;
    final l$item_id = item_id;
    final l$offering_type = offering_type;
    final l$available = available;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost,
      l$id,
      l$order_request_id,
      l$parameters,
      l$time,
      l$rental,
      l$item_id,
      l$offering_type,
      l$available,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getBsRentalOrdersItems$business_order_request_item) ||
        runtimeType != other.runtimeType) {
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
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Query$getBsRentalOrdersItems$business_order_request_item
    on Query$getBsRentalOrdersItems$business_order_request_item {
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
          Query$getBsRentalOrdersItems$business_order_request_item>
      get copyWith =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
    TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item(
    Query$getBsRentalOrdersItems$business_order_request_item instance,
    TRes Function(Query$getBsRentalOrdersItems$business_order_request_item)
        then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item;

  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item;

  TRes call({
    double? cost,
    int? id,
    int? order_request_id,
    dynamic? parameters,
    String? time,
    Query$getBsRentalOrdersItems$business_order_request_item$rental? rental,
    int? item_id,
    String? offering_type,
    bool? available,
    String? $__typename,
  });
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<TRes>
      get rental;
}

class _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
            TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems$business_order_request_item _instance;

  final TRes Function(Query$getBsRentalOrdersItems$business_order_request_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? order_request_id = _undefined,
    Object? parameters = _undefined,
    Object? time = _undefined,
    Object? rental = _undefined,
    Object? item_id = _undefined,
    Object? offering_type = _undefined,
    Object? available = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsRentalOrdersItems$business_order_request_item(
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        time: time == _undefined ? _instance.time : (time as String?),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Query$getBsRentalOrdersItems$business_order_request_item$rental?),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<TRes>
      get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental
            .stub(_then(_instance))
        : CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental(
            local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item<
            TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item(
      this._res);

  TRes _res;

  call({
    double? cost,
    int? id,
    int? order_request_id,
    dynamic? parameters,
    String? time,
    Query$getBsRentalOrdersItems$business_order_request_item$rental? rental,
    int? item_id,
    String? offering_type,
    bool? available,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<TRes>
      get rental =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental
              .stub(_res);
}

class Query$getBsRentalOrdersItems$business_order_request_item$rental {
  Query$getBsRentalOrdersItems$business_order_request_item$rental({
    required this.details,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems$business_order_request_item$rental.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems$business_order_request_item$rental(
      details:
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getBsRentalOrdersItems$business_order_request_item$rental$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
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
            is Query$getBsRentalOrdersItems$business_order_request_item$rental) ||
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

extension UtilityExtension$Query$getBsRentalOrdersItems$business_order_request_item$rental
    on Query$getBsRentalOrdersItems$business_order_request_item$rental {
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<
          Query$getBsRentalOrdersItems$business_order_request_item$rental>
      get copyWith =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<
    TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental(
    Query$getBsRentalOrdersItems$business_order_request_item$rental instance,
    TRes Function(
            Query$getBsRentalOrdersItems$business_order_request_item$rental)
        then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental;

  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental;

  TRes call({
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<
            TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems$business_order_request_item$rental
      _instance;

  final TRes Function(
      Query$getBsRentalOrdersItems$business_order_request_item$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getBsRentalOrdersItems$business_order_request_item$rental(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getBsRentalOrdersItems$business_order_request_item$rental$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental<
            TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental(
      this._res);

  TRes _res;

  call({
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
          TRes>
      get details =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details
              .stub(_res);
}

class Query$getBsRentalOrdersItems$business_order_request_item$rental$details {
  Query$getBsRentalOrdersItems$business_order_request_item$rental$details({
    this.image,
    required this.name,
    required this.cost,
    required this.id,
    required this.available,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems$business_order_request_item$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$available = json['available'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
      image: l$image == null ? null : mapFromJson(l$image),
      name:
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      cost: mapFromJson(l$cost),
      id: (l$id as int),
      available: (l$available as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? image;

  final Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
      name;

  final dynamic cost;

  final int id;

  final bool available;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$cost = cost;
    final l$id = id;
    final l$available = available;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$cost,
      l$id,
      l$available,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getBsRentalOrdersItems$business_order_request_item$rental$details) ||
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
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
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

extension UtilityExtension$Query$getBsRentalOrdersItems$business_order_request_item$rental$details
    on Query$getBsRentalOrdersItems$business_order_request_item$rental$details {
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details>
      get copyWith =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
    TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details
        instance,
    TRes Function(
            Query$getBsRentalOrdersItems$business_order_request_item$rental$details)
        then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details;

  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details;

  TRes call({
    dynamic? image,
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name?
        name,
    dynamic? cost,
    int? id,
    bool? available,
    String? $__typename,
  });
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
            TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems$business_order_request_item$rental$details
      _instance;

  final TRes Function(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? available = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details(
      this._res);

  TRes _res;

  call({
    dynamic? image,
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name?
        name,
    dynamic? cost,
    int? id,
    bool? available,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
          TRes>
      get name =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
              .stub(_res);
}

class Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name {
  Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>
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
            is Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name) ||
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

extension UtilityExtension$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
    on Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name {
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name>
      get copyWith =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
    TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
        instance,
    TRes Function(
            Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name;

  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name;

  TRes call({
    List<Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
                      Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name
      _instance;

  final TRes Function(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
                          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations {
  Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
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
            is Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations) ||
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

extension UtilityExtension$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations
    on Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations {
  CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
    Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations
        instance,
    TRes Function(
            Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations;

  factory CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getBsRentalOrdersItems$business_order_request_item$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
