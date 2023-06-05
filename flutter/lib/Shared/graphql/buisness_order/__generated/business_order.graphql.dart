import '../../__generated/schema.graphql.dart';
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
