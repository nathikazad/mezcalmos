import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$listen_on_restaurant_order_by_id {
  factory Variables$Subscription$listen_on_restaurant_order_by_id(
          {required int order_id}) =>
      Variables$Subscription$listen_on_restaurant_order_by_id._({
        r'order_id': order_id,
      });

  Variables$Subscription$listen_on_restaurant_order_by_id._(this._$data);

  factory Variables$Subscription$listen_on_restaurant_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$order_id = data['order_id'];
    result$data['order_id'] = (l$order_id as int);
    return Variables$Subscription$listen_on_restaurant_order_by_id._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get order_id => (_$data['order_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$order_id = order_id;
    result$data['order_id'] = l$order_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id<
          Variables$Subscription$listen_on_restaurant_order_by_id>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_restaurant_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$order_id = order_id;
    return Object.hashAll([l$order_id]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id(
    Variables$Subscription$listen_on_restaurant_order_by_id instance,
    TRes Function(Variables$Subscription$listen_on_restaurant_order_by_id) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_restaurant_order_by_id;

  factory CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_restaurant_order_by_id;

  TRes call({int? order_id});
}

class _CopyWithImpl$Variables$Subscription$listen_on_restaurant_order_by_id<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_restaurant_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_restaurant_order_by_id _instance;

  final TRes Function(Variables$Subscription$listen_on_restaurant_order_by_id)
      _then;

  static const _undefined = {};

  TRes call({Object? order_id = _undefined}) =>
      _then(Variables$Subscription$listen_on_restaurant_order_by_id._({
        ..._instance._$data,
        if (order_id != _undefined && order_id != null)
          'order_id': (order_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_restaurant_order_by_id<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_restaurant_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_restaurant_order_by_id(
      this._res);

  TRes _res;

  call({int? order_id}) => _res;
}

class Subscription$listen_on_restaurant_order_by_id {
  Subscription$listen_on_restaurant_order_by_id({
    this.restaurant_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order_by_pk = json['restaurant_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id(
      restaurant_order_by_pk: l$restaurant_order_by_pk == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
              .fromJson((l$restaurant_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk?
      restaurant_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    _resultData['restaurant_order_by_pk'] = l$restaurant_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_restaurant_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    final lOther$restaurant_order_by_pk = other.restaurant_order_by_pk;
    if (l$restaurant_order_by_pk != lOther$restaurant_order_by_pk) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id
    on Subscription$listen_on_restaurant_order_by_id {
  CopyWith$Subscription$listen_on_restaurant_order_by_id<
          Subscription$listen_on_restaurant_order_by_id>
      get copyWith => CopyWith$Subscription$listen_on_restaurant_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id<TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id(
    Subscription$listen_on_restaurant_order_by_id instance,
    TRes Function(Subscription$listen_on_restaurant_order_by_id) then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id;

  TRes call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk?
        restaurant_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
      TRes> get restaurant_order_by_pk;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_restaurant_order_by_id<TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id _instance;

  final TRes Function(Subscription$listen_on_restaurant_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_restaurant_order_by_id(
        restaurant_order_by_pk: restaurant_order_by_pk == _undefined
            ? _instance.restaurant_order_by_pk
            : (restaurant_order_by_pk
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
      TRes> get restaurant_order_by_pk {
    final local$restaurant_order_by_pk = _instance.restaurant_order_by_pk;
    return local$restaurant_order_by_pk == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
            local$restaurant_order_by_pk,
            (e) => call(restaurant_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_restaurant_order_by_id<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id(this._res);

  TRes _res;

  call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk?
        restaurant_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
          TRes>
      get restaurant_order_by_pk =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
              .stub(_res);
}

const documentNodeSubscriptionlisten_on_restaurant_order_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_restaurant_order_by_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'order_id')),
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
        name: NameNode(value: 'restaurant_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'order_id')),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_item'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'archived'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'cost_per_one'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quantity'),
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
            name: NameNode(value: 'to_location_gps'),
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
            name: NameNode(value: 'estimated_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_food_ready_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_id'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'tax'),
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
            name: NameNode(value: 'items_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'delivery_cost'),
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
Subscription$listen_on_restaurant_order_by_id
    _parserFn$Subscription$listen_on_restaurant_order_by_id(
            Map<String, dynamic> data) =>
        Subscription$listen_on_restaurant_order_by_id.fromJson(data);

class Options$Subscription$listen_on_restaurant_order_by_id extends graphql
    .SubscriptionOptions<Subscription$listen_on_restaurant_order_by_id> {
  Options$Subscription$listen_on_restaurant_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_restaurant_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_restaurant_order_by_id,
          parserFn: _parserFn$Subscription$listen_on_restaurant_order_by_id,
        );
}

class WatchOptions$Subscription$listen_on_restaurant_order_by_id extends graphql
    .WatchQueryOptions<Subscription$listen_on_restaurant_order_by_id> {
  WatchOptions$Subscription$listen_on_restaurant_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_restaurant_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_restaurant_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_restaurant_order_by_id,
        );
}

class FetchMoreOptions$Subscription$listen_on_restaurant_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_restaurant_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_restaurant_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_restaurant_order_by_id,
        );
}

extension ClientExtension$Subscription$listen_on_restaurant_order_by_id
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_restaurant_order_by_id>>
      subscribe$listen_on_restaurant_order_by_id(
              Options$Subscription$listen_on_restaurant_order_by_id options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_restaurant_order_by_id>
      watchSubscription$listen_on_restaurant_order_by_id(
              WatchOptions$Subscription$listen_on_restaurant_order_by_id
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk({
    required this.id,
    this.notes,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    this.stripe_payment_id,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    required this.order_type,
    required this.order_time,
    this.firebase_id,
    required this.customer_app_type,
    required this.customer,
    required this.tax,
    this.total_cost,
    this.items_cost,
    required this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_type = json['order_type'];
    final l$order_time = json['order_time'];
    final l$firebase_id = json['firebase_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$customer = json['customer'];
    final l$tax = json['tax'];
    final l$total_cost = json['total_cost'];
    final l$items_cost = json['items_cost'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
      id: (l$id as int),
      notes: (l$notes as String?),
      restaurant:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      stripe_payment_id: (l$stripe_payment_id as int?),
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_type: (l$order_type as String),
      order_time: (l$order_time as String),
      firebase_id: (l$firebase_id as String?),
      customer_app_type: (l$customer_app_type as String),
      customer:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      tax: moneyFromJson(l$tax),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      chat_id: (l$chat_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? notes;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
      restaurant;

  final List<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>
      items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final int? stripe_payment_id;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final String order_type;

  final String order_time;

  final String? firebase_id;

  final String customer_app_type;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
      customer;

  final double tax;

  final double? total_cost;

  final double? items_cost;

  final int chat_id;

  final double delivery_cost;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery?
      delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] =
        l$to_location_gps == null ? null : geographyToJson(l$to_location_gps);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    _resultData['actual_food_ready_time'] = l$actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$items_cost = items_cost;
    _resultData['items_cost'] =
        l$items_cost == null ? null : moneyToJson(l$items_cost);
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$notes = notes;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_type = order_type;
    final l$order_time = order_time;
    final l$firebase_id = firebase_id;
    final l$customer_app_type = customer_app_type;
    final l$customer = customer;
    final l$tax = tax;
    final l$total_cost = total_cost;
    final l$items_cost = items_cost;
    final l$chat_id = chat_id;
    final l$delivery_cost = delivery_cost;
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$notes,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$stripe_payment_id,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$order_type,
      l$order_time,
      l$firebase_id,
      l$customer_app_type,
      l$customer,
      l$tax,
      l$total_cost,
      l$items_cost,
      l$chat_id,
      l$delivery_cost,
      l$delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
      return false;
    }
    final l$actual_food_ready_time = actual_food_ready_time;
    final lOther$actual_food_ready_time = other.actual_food_ready_time;
    if (l$actual_food_ready_time != lOther$actual_food_ready_time) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$delivery_id = delivery_id;
    final lOther$delivery_id = other.delivery_id;
    if (l$delivery_id != lOther$delivery_id) {
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$items_cost = items_cost;
    final lOther$items_cost = other.items_cost;
    if (l$items_cost != lOther$items_cost) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk;

  TRes call({
    int? id,
    String? notes,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer?
        customer,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    double? delivery_cost,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery?
        delivery,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
      TRes> get restaurant;
  TRes items(
      Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
                      Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>>)
          _fn);
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
      TRes> get customer;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
      TRes> get delivery;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_type = _undefined,
    Object? order_time = _undefined,
    Object? firebase_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? customer = _undefined,
    Object? tax = _undefined,
    Object? total_cost = _undefined,
    Object? items_cost = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        to_location_gps: to_location_gps == _undefined
            ? _instance.to_location_gps
            : (to_location_gps as Geography?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        actual_food_ready_time: actual_food_ready_time == _undefined
            ? _instance.actual_food_ready_time
            : (actual_food_ready_time as String?),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        items_cost: items_cost == _undefined
            ? _instance.items_cost
            : (items_cost as double?),
        chat_id: chat_id == _undefined || chat_id == null
            ? _instance.chat_id
            : (chat_id as int),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
                          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
      TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? notes,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer?
        customer,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    double? delivery_cost,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery?
        delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
          TRes>
      get delivery =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant;

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

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant)
      _then;

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
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
      restaurant_item:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$notes,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item != lOther$restaurant_item) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items;

  TRes call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item({
    required this.item_type,
    required this.name,
    this.description,
    required this.position,
    this.category_id,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String item_type;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
      name;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
      description;

  final int position;

  final int? category_id;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item_type,
      l$name,
      l$description,
      l$position,
      l$category_id,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$archived,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item;

  TRes call({
    String? item_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
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
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
              .stub(_res);
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name;

  TRes call({
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
                      Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
                          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description;

  TRes call({
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
                      Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
                          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
      user:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer;

  TRes call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
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
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
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

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery) ||
        runtimeType != other.runtimeType) {
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
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
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
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_order_by_id {
  factory Variables$Query$get_restaurant_order_by_id({required int order_id}) =>
      Variables$Query$get_restaurant_order_by_id._({
        r'order_id': order_id,
      });

  Variables$Query$get_restaurant_order_by_id._(this._$data);

  factory Variables$Query$get_restaurant_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$order_id = data['order_id'];
    result$data['order_id'] = (l$order_id as int);
    return Variables$Query$get_restaurant_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get order_id => (_$data['order_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$order_id = order_id;
    result$data['order_id'] = l$order_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_order_by_id<
          Variables$Query$get_restaurant_order_by_id>
      get copyWith => CopyWith$Variables$Query$get_restaurant_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$order_id = order_id;
    return Object.hashAll([l$order_id]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_order_by_id<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_order_by_id(
    Variables$Query$get_restaurant_order_by_id instance,
    TRes Function(Variables$Query$get_restaurant_order_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_order_by_id;

  factory CopyWith$Variables$Query$get_restaurant_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_order_by_id;

  TRes call({int? order_id});
}

class _CopyWithImpl$Variables$Query$get_restaurant_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_restaurant_order_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_order_by_id _instance;

  final TRes Function(Variables$Query$get_restaurant_order_by_id) _then;

  static const _undefined = {};

  TRes call({Object? order_id = _undefined}) =>
      _then(Variables$Query$get_restaurant_order_by_id._({
        ..._instance._$data,
        if (order_id != _undefined && order_id != null)
          'order_id': (order_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_restaurant_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_order_by_id(this._res);

  TRes _res;

  call({int? order_id}) => _res;
}

class Query$get_restaurant_order_by_id {
  Query$get_restaurant_order_by_id({
    this.restaurant_order_by_pk,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id.fromJson(Map<String, dynamic> json) {
    final l$restaurant_order_by_pk = json['restaurant_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id(
      restaurant_order_by_pk: l$restaurant_order_by_pk == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk.fromJson(
              (l$restaurant_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk?
      restaurant_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    _resultData['restaurant_order_by_pk'] = l$restaurant_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_order_by_pk = restaurant_order_by_pk;
    final lOther$restaurant_order_by_pk = other.restaurant_order_by_pk;
    if (l$restaurant_order_by_pk != lOther$restaurant_order_by_pk) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id
    on Query$get_restaurant_order_by_id {
  CopyWith$Query$get_restaurant_order_by_id<Query$get_restaurant_order_by_id>
      get copyWith => CopyWith$Query$get_restaurant_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id<TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id(
    Query$get_restaurant_order_by_id instance,
    TRes Function(Query$get_restaurant_order_by_id) then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id;

  factory CopyWith$Query$get_restaurant_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id;

  TRes call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk?
        restaurant_order_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id<TRes>
    implements CopyWith$Query$get_restaurant_order_by_id<TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id _instance;

  final TRes Function(Query$get_restaurant_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id(
        restaurant_order_by_pk: restaurant_order_by_pk == _undefined
            ? _instance.restaurant_order_by_pk
            : (restaurant_order_by_pk
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk {
    final local$restaurant_order_by_pk = _instance.restaurant_order_by_pk;
    return local$restaurant_order_by_pk == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk(
            local$restaurant_order_by_pk,
            (e) => call(restaurant_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id<TRes>
    implements CopyWith$Query$get_restaurant_order_by_id<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id(this._res);

  TRes _res;

  call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk?
        restaurant_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk.stub(
              _res);
}

const documentNodeQueryget_restaurant_order_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_order_by_id'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'order_id')),
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
        name: NameNode(value: 'restaurant_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'order_id')),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_item'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'archived'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'cost_per_one'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quantity'),
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
            name: NameNode(value: 'to_location_gps'),
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
            name: NameNode(value: 'estimated_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_food_ready_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_id'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tax'),
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
            name: NameNode(value: 'items_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'delivery_cost'),
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
Query$get_restaurant_order_by_id _parserFn$Query$get_restaurant_order_by_id(
        Map<String, dynamic> data) =>
    Query$get_restaurant_order_by_id.fromJson(data);

class Options$Query$get_restaurant_order_by_id
    extends graphql.QueryOptions<Query$get_restaurant_order_by_id> {
  Options$Query$get_restaurant_order_by_id({
    String? operationName,
    required Variables$Query$get_restaurant_order_by_id variables,
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
          document: documentNodeQueryget_restaurant_order_by_id,
          parserFn: _parserFn$Query$get_restaurant_order_by_id,
        );
}

class WatchOptions$Query$get_restaurant_order_by_id
    extends graphql.WatchQueryOptions<Query$get_restaurant_order_by_id> {
  WatchOptions$Query$get_restaurant_order_by_id({
    String? operationName,
    required Variables$Query$get_restaurant_order_by_id variables,
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
          document: documentNodeQueryget_restaurant_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_order_by_id,
        );
}

class FetchMoreOptions$Query$get_restaurant_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_order_by_id,
        );
}

extension ClientExtension$Query$get_restaurant_order_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_order_by_id>>
      query$get_restaurant_order_by_id(
              Options$Query$get_restaurant_order_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_order_by_id>
      watchQuery$get_restaurant_order_by_id(
              WatchOptions$Query$get_restaurant_order_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_order_by_id({
    required Query$get_restaurant_order_by_id data,
    required Variables$Query$get_restaurant_order_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_order_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_order_by_id? readQuery$get_restaurant_order_by_id({
    required Variables$Query$get_restaurant_order_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_order_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_order_by_id.fromJson(result);
  }
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk({
    required this.id,
    this.notes,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    this.stripe_payment_id,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    required this.order_type,
    required this.order_time,
    this.firebase_id,
    required this.customer_app_type,
    required this.tax,
    this.total_cost,
    this.items_cost,
    required this.chat_id,
    required this.customer,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_type = json['order_type'];
    final l$order_time = json['order_time'];
    final l$firebase_id = json['firebase_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$tax = json['tax'];
    final l$total_cost = json['total_cost'];
    final l$items_cost = json['items_cost'];
    final l$chat_id = json['chat_id'];
    final l$customer = json['customer'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk(
      id: (l$id as int),
      notes: (l$notes as String?),
      restaurant:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_order_by_id$restaurant_order_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      stripe_payment_id: (l$stripe_payment_id as int?),
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_type: (l$order_type as String),
      order_time: (l$order_time as String),
      firebase_id: (l$firebase_id as String?),
      customer_app_type: (l$customer_app_type as String),
      tax: moneyFromJson(l$tax),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      chat_id: (l$chat_id as int),
      customer: Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer
          .fromJson((l$customer as Map<String, dynamic>)),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? notes;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
      restaurant;

  final List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>
      items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final int? stripe_payment_id;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final String order_type;

  final String order_time;

  final String? firebase_id;

  final String customer_app_type;

  final double tax;

  final double? total_cost;

  final double? items_cost;

  final int chat_id;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer
      customer;

  final double delivery_cost;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery?
      delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] =
        l$to_location_gps == null ? null : geographyToJson(l$to_location_gps);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    _resultData['actual_food_ready_time'] = l$actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$items_cost = items_cost;
    _resultData['items_cost'] =
        l$items_cost == null ? null : moneyToJson(l$items_cost);
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$notes = notes;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_type = order_type;
    final l$order_time = order_time;
    final l$firebase_id = firebase_id;
    final l$customer_app_type = customer_app_type;
    final l$tax = tax;
    final l$total_cost = total_cost;
    final l$items_cost = items_cost;
    final l$chat_id = chat_id;
    final l$customer = customer;
    final l$delivery_cost = delivery_cost;
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$notes,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$stripe_payment_id,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$order_type,
      l$order_time,
      l$firebase_id,
      l$customer_app_type,
      l$tax,
      l$total_cost,
      l$items_cost,
      l$chat_id,
      l$customer,
      l$delivery_cost,
      l$delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_order_by_id$restaurant_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
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
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
      return false;
    }
    final l$actual_food_ready_time = actual_food_ready_time;
    final lOther$actual_food_ready_time = other.actual_food_ready_time;
    if (l$actual_food_ready_time != lOther$actual_food_ready_time) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$delivery_id = delivery_id;
    final lOther$delivery_id = other.delivery_id;
    if (l$delivery_id != lOther$delivery_id) {
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$items_cost = items_cost;
    final lOther$items_cost = other.items_cost;
    if (l$items_cost != lOther$items_cost) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk instance,
    TRes Function(Query$get_restaurant_order_by_id$restaurant_order_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk;

  TRes call({
    int? id,
    String? notes,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer? customer,
    double? delivery_cost,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
      TRes> get restaurant;
  TRes items(
      Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
                      Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>>)
          _fn);
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
      TRes> get customer;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
      TRes> get delivery;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk _instance;

  final TRes Function(Query$get_restaurant_order_by_id$restaurant_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_type = _undefined,
    Object? order_time = _undefined,
    Object? firebase_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? tax = _undefined,
    Object? total_cost = _undefined,
    Object? items_cost = _undefined,
    Object? chat_id = _undefined,
    Object? customer = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        to_location_gps: to_location_gps == _undefined
            ? _instance.to_location_gps
            : (to_location_gps as Geography?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        actual_food_ready_time: actual_food_ready_time == _undefined
            ? _instance.actual_food_ready_time
            : (actual_food_ready_time as String?),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        items_cost: items_cost == _undefined
            ? _instance.items_cost
            : (items_cost as double?),
        chat_id: chat_id == _undefined || chat_id == null
            ? _instance.chat_id
            : (chat_id as int),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
                          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
      TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? notes,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer? customer,
    double? delivery_cost,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery? delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer
              .stub(_res);
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
          TRes>
      get delivery =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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
    if (!(other
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant;

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

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
      _instance;

  final TRes Function(
      Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant) _then;

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
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
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

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
      restaurant_item:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$notes,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item != lOther$restaurant_item) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items instance,
    TRes Function(Query$get_restaurant_order_by_id$restaurant_order_by_pk$items)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items;

  TRes call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items _instance;

  final TRes Function(
      Query$get_restaurant_order_by_id$restaurant_order_by_pk$items) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item({
    required this.item_type,
    required this.name,
    this.description,
    required this.position,
    this.category_id,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String item_type;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
      name;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
      description;

  final int position;

  final int? category_id;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item_type,
      l$name,
      l$description,
      l$position,
      l$category_id,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$archived,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item;

  TRes call({
    String? item_type,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
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
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name;

  TRes call({
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
                      Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
                          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description;

  TRes call({
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
                      Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
                          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
      user:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer;

  TRes call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer
      _instance;

  final TRes Function(
      Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
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
    if (!(other
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$customer$user(
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

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery) ||
        runtimeType != other.runtimeType) {
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
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery
      _instance;

  final TRes Function(
      Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
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
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$get_restaurant_orders {
  factory Variables$Subscription$get_restaurant_orders(
          {required int restaurantId}) =>
      Variables$Subscription$get_restaurant_orders._({
        r'restaurantId': restaurantId,
      });

  Variables$Subscription$get_restaurant_orders._(this._$data);

  factory Variables$Subscription$get_restaurant_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Subscription$get_restaurant_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Subscription$get_restaurant_orders<
          Variables$Subscription$get_restaurant_orders>
      get copyWith => CopyWith$Variables$Subscription$get_restaurant_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$get_restaurant_orders) ||
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

abstract class CopyWith$Variables$Subscription$get_restaurant_orders<TRes> {
  factory CopyWith$Variables$Subscription$get_restaurant_orders(
    Variables$Subscription$get_restaurant_orders instance,
    TRes Function(Variables$Subscription$get_restaurant_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$get_restaurant_orders;

  factory CopyWith$Variables$Subscription$get_restaurant_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$get_restaurant_orders;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Subscription$get_restaurant_orders<TRes>
    implements CopyWith$Variables$Subscription$get_restaurant_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$get_restaurant_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$get_restaurant_orders _instance;

  final TRes Function(Variables$Subscription$get_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Subscription$get_restaurant_orders._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$get_restaurant_orders<TRes>
    implements CopyWith$Variables$Subscription$get_restaurant_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$get_restaurant_orders(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Subscription$get_restaurant_orders {
  Subscription$get_restaurant_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Subscription$get_restaurant_orders$restaurant_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$get_restaurant_orders$restaurant_order>
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
    if (!(other is Subscription$get_restaurant_orders) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders
    on Subscription$get_restaurant_orders {
  CopyWith$Subscription$get_restaurant_orders<
          Subscription$get_restaurant_orders>
      get copyWith => CopyWith$Subscription$get_restaurant_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders<TRes> {
  factory CopyWith$Subscription$get_restaurant_orders(
    Subscription$get_restaurant_orders instance,
    TRes Function(Subscription$get_restaurant_orders) then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders;

  factory CopyWith$Subscription$get_restaurant_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders;

  TRes call({
    List<Subscription$get_restaurant_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Subscription$get_restaurant_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Subscription$get_restaurant_orders$restaurant_order<
                      Subscription$get_restaurant_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_restaurant_orders<TRes>
    implements CopyWith$Subscription$get_restaurant_orders<TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders _instance;

  final TRes Function(Subscription$get_restaurant_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order
                as List<Subscription$get_restaurant_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Subscription$get_restaurant_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Subscription$get_restaurant_orders$restaurant_order<
                          Subscription$get_restaurant_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Subscription$get_restaurant_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders<TRes>
    implements CopyWith$Subscription$get_restaurant_orders<TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders(this._res);

  TRes _res;

  call({
    List<Subscription$get_restaurant_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeSubscriptionget_restaurant_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'get_restaurant_orders'),
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
        name: NameNode(value: 'restaurant_order'),
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
                    value: VariableNode(name: NameNode(value: 'restaurantId')),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_item'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'archived'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'cost_per_one'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quantity'),
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
            name: NameNode(value: 'to_location_gps'),
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
            name: NameNode(value: 'estimated_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_food_ready_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_id'),
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
            name: NameNode(value: 'items_cost'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tax'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'delivery_cost'),
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
Subscription$get_restaurant_orders _parserFn$Subscription$get_restaurant_orders(
        Map<String, dynamic> data) =>
    Subscription$get_restaurant_orders.fromJson(data);

class Options$Subscription$get_restaurant_orders
    extends graphql.SubscriptionOptions<Subscription$get_restaurant_orders> {
  Options$Subscription$get_restaurant_orders({
    String? operationName,
    required Variables$Subscription$get_restaurant_orders variables,
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
          document: documentNodeSubscriptionget_restaurant_orders,
          parserFn: _parserFn$Subscription$get_restaurant_orders,
        );
}

class WatchOptions$Subscription$get_restaurant_orders
    extends graphql.WatchQueryOptions<Subscription$get_restaurant_orders> {
  WatchOptions$Subscription$get_restaurant_orders({
    String? operationName,
    required Variables$Subscription$get_restaurant_orders variables,
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
          document: documentNodeSubscriptionget_restaurant_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$get_restaurant_orders,
        );
}

class FetchMoreOptions$Subscription$get_restaurant_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$get_restaurant_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$get_restaurant_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionget_restaurant_orders,
        );
}

extension ClientExtension$Subscription$get_restaurant_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$get_restaurant_orders>>
      subscribe$get_restaurant_orders(
              Options$Subscription$get_restaurant_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$get_restaurant_orders>
      watchSubscription$get_restaurant_orders(
              WatchOptions$Subscription$get_restaurant_orders options) =>
          this.watchQuery(options);
}

class Subscription$get_restaurant_orders$restaurant_order {
  Subscription$get_restaurant_orders$restaurant_order({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    required this.customer,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    this.stripe_payment_id,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.total_cost,
    this.items_cost,
    this.review_id,
    required this.order_type,
    required this.order_time,
    this.firebase_id,
    required this.customer_app_type,
    this.notes,
    required this.tax,
    required this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$customer = json['customer'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$items_cost = json['items_cost'];
    final l$review_id = json['review_id'];
    final l$order_type = json['order_type'];
    final l$order_time = json['order_time'];
    final l$firebase_id = json['firebase_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$notes = json['notes'];
    final l$tax = json['tax'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order(
      id: (l$id as int),
      restaurant: Subscription$get_restaurant_orders$restaurant_order$restaurant
          .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) => Subscription$get_restaurant_orders$restaurant_order$items
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      customer:
          Subscription$get_restaurant_orders$restaurant_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      stripe_payment_id: (l$stripe_payment_id as int?),
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      review_id: (l$review_id as int?),
      order_type: (l$order_type as String),
      order_time: (l$order_time as String),
      firebase_id: (l$firebase_id as String?),
      customer_app_type: (l$customer_app_type as String),
      notes: (l$notes as String?),
      tax: moneyFromJson(l$tax),
      chat_id: (l$chat_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Subscription$get_restaurant_orders$restaurant_order$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$get_restaurant_orders$restaurant_order$restaurant
      restaurant;

  final List<Subscription$get_restaurant_orders$restaurant_order$items> items;

  final String payment_type;

  final Subscription$get_restaurant_orders$restaurant_order$customer customer;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final int? stripe_payment_id;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final double? total_cost;

  final double? items_cost;

  final int? review_id;

  final String order_type;

  final String order_time;

  final String? firebase_id;

  final String customer_app_type;

  final String? notes;

  final double tax;

  final int chat_id;

  final double delivery_cost;

  final Subscription$get_restaurant_orders$restaurant_order$delivery? delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] =
        l$to_location_gps == null ? null : geographyToJson(l$to_location_gps);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    _resultData['actual_food_ready_time'] = l$actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$items_cost = items_cost;
    _resultData['items_cost'] =
        l$items_cost == null ? null : moneyToJson(l$items_cost);
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$customer = customer;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$items_cost = items_cost;
    final l$review_id = review_id;
    final l$order_type = order_type;
    final l$order_time = order_time;
    final l$firebase_id = firebase_id;
    final l$customer_app_type = customer_app_type;
    final l$notes = notes;
    final l$tax = tax;
    final l$chat_id = chat_id;
    final l$delivery_cost = delivery_cost;
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$customer,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$stripe_payment_id,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$total_cost,
      l$items_cost,
      l$review_id,
      l$order_type,
      l$order_time,
      l$firebase_id,
      l$customer_app_type,
      l$notes,
      l$tax,
      l$chat_id,
      l$delivery_cost,
      l$delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_restaurant_orders$restaurant_order) ||
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
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
      return false;
    }
    final l$actual_food_ready_time = actual_food_ready_time;
    final lOther$actual_food_ready_time = other.actual_food_ready_time;
    if (l$actual_food_ready_time != lOther$actual_food_ready_time) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$delivery_id = delivery_id;
    final lOther$delivery_id = other.delivery_id;
    if (l$delivery_id != lOther$delivery_id) {
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
    final l$items_cost = items_cost;
    final lOther$items_cost = other.items_cost;
    if (l$items_cost != lOther$items_cost) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order
    on Subscription$get_restaurant_orders$restaurant_order {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order<
          Subscription$get_restaurant_orders$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order(
    Subscription$get_restaurant_orders$restaurant_order instance,
    TRes Function(Subscription$get_restaurant_orders$restaurant_order) then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order;

  TRes call({
    int? id,
    Subscription$get_restaurant_orders$restaurant_order$restaurant? restaurant,
    List<Subscription$get_restaurant_orders$restaurant_order$items>? items,
    String? payment_type,
    Subscription$get_restaurant_orders$restaurant_order$customer? customer,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    double? total_cost,
    double? items_cost,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Subscription$get_restaurant_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<TRes>
      get restaurant;
  TRes items(
      Iterable<Subscription$get_restaurant_orders$restaurant_order$items> Function(
              Iterable<
                  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
                      Subscription$get_restaurant_orders$restaurant_order$items>>)
          _fn);
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<TRes>
      get customer;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery;
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order<TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order<TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order _instance;

  final TRes Function(Subscription$get_restaurant_orders$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? customer = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? items_cost = _undefined,
    Object? review_id = _undefined,
    Object? order_type = _undefined,
    Object? order_time = _undefined,
    Object? firebase_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? notes = _undefined,
    Object? tax = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Subscription$get_restaurant_orders$restaurant_order$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$get_restaurant_orders$restaurant_order$items>),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$get_restaurant_orders$restaurant_order$customer),
        to_location_gps: to_location_gps == _undefined
            ? _instance.to_location_gps
            : (to_location_gps as Geography?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        actual_food_ready_time: actual_food_ready_time == _undefined
            ? _instance.actual_food_ready_time
            : (actual_food_ready_time as String?),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        items_cost: items_cost == _undefined
            ? _instance.items_cost
            : (items_cost as double?),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        chat_id: chat_id == _undefined || chat_id == null
            ? _instance.chat_id
            : (chat_id as int),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Subscription$get_restaurant_orders$restaurant_order$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Subscription$get_restaurant_orders$restaurant_order$items> Function(
                  Iterable<
                      CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
                          Subscription$get_restaurant_orders$restaurant_order$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$get_restaurant_orders$restaurant_order$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$get_restaurant_orders$restaurant_order$restaurant? restaurant,
    List<Subscription$get_restaurant_orders$restaurant_order$items>? items,
    String? payment_type,
    Subscription$get_restaurant_orders$restaurant_order$customer? customer,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    double? total_cost,
    double? items_cost,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Subscription$get_restaurant_orders$restaurant_order$delivery? delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer
              .stub(_res);
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<TRes>
      get delivery =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery
              .stub(_res);
}

class Subscription$get_restaurant_orders$restaurant_order$restaurant {
  Subscription$get_restaurant_orders$restaurant_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$restaurant(
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
    if (!(other
            is Subscription$get_restaurant_orders$restaurant_order$restaurant) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$restaurant
    on Subscription$get_restaurant_orders$restaurant_order$restaurant {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<
          Subscription$get_restaurant_orders$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant(
    Subscription$get_restaurant_orders$restaurant_order$restaurant instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant;

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

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$restaurant
      _instance;

  final TRes Function(
      Subscription$get_restaurant_orders$restaurant_order$restaurant) _then;

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
      _then(Subscription$get_restaurant_orders$restaurant_order$restaurant(
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

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$restaurant(
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

class Subscription$get_restaurant_orders$restaurant_order$items {
  Subscription$get_restaurant_orders$restaurant_order$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items(
      restaurant_item:
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$notes,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$get_restaurant_orders$restaurant_order$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item != lOther$restaurant_item) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items
    on Subscription$get_restaurant_orders$restaurant_order$items {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
          Subscription$get_restaurant_orders$restaurant_order$items>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items(
    Subscription$get_restaurant_orders$restaurant_order$items instance,
    TRes Function(Subscription$get_restaurant_orders$restaurant_order$items)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items;

  TRes call({
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items _instance;

  final TRes Function(Subscription$get_restaurant_orders$restaurant_order$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders$restaurant_order$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items(
      this._res);

  TRes _res;

  call({
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
              .stub(_res);
}

class Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item {
  Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item({
    required this.item_type,
    required this.name,
    this.description,
    required this.position,
    this.category_id,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String item_type;

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
      name;

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description?
      description;

  final int position;

  final int? category_id;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item_type,
      l$name,
      l$description,
      l$position,
      l$category_id,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$archived,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
    on Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
        instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item;

  TRes call({
    String? item_type,
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name?
        name,
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item
      _instance;

  final TRes Function(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
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
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name?
        name,
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
              .stub(_res);
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
              .stub(_res);
}

class Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name {
  Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>
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
            is Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
    on Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
        instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name;

  TRes call({
    List<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
                      Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name
      _instance;

  final TRes Function(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
                          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations {
  Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
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
            is Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
    on Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description {
  Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>
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
            is Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
    on Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
        instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description;

  TRes call({
    List<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
                      Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description
      _instance;

  final TRes Function(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
                          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations {
  Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
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
            is Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
    on Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
    Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$get_restaurant_orders$restaurant_order$customer {
  Subscription$get_restaurant_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$customer(
      user: Subscription$get_restaurant_orders$restaurant_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_restaurant_orders$restaurant_order$customer$user user;

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
            is Subscription$get_restaurant_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$customer
    on Subscription$get_restaurant_orders$restaurant_order$customer {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<
          Subscription$get_restaurant_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer(
    Subscription$get_restaurant_orders$restaurant_order$customer instance,
    TRes Function(Subscription$get_restaurant_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer;

  TRes call({
    Subscription$get_restaurant_orders$restaurant_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$customer _instance;

  final TRes Function(
      Subscription$get_restaurant_orders$restaurant_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$get_restaurant_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$get_restaurant_orders$restaurant_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user
              .stub(_res);
}

class Subscription$get_restaurant_orders$restaurant_order$customer$user {
  Subscription$get_restaurant_orders$restaurant_order$customer$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$customer$user(
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
    if (!(other
            is Subscription$get_restaurant_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$customer$user
    on Subscription$get_restaurant_orders$restaurant_order$customer$user {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
          Subscription$get_restaurant_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user(
    Subscription$get_restaurant_orders$restaurant_order$customer$user instance,
    TRes Function(
            Subscription$get_restaurant_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
      Subscription$get_restaurant_orders$restaurant_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders$restaurant_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$customer$user(
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

class Subscription$get_restaurant_orders$restaurant_order$delivery {
  Subscription$get_restaurant_orders$restaurant_order$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Subscription$get_restaurant_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Subscription$get_restaurant_orders$restaurant_order$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$get_restaurant_orders$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
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
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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

extension UtilityExtension$Subscription$get_restaurant_orders$restaurant_order$delivery
    on Subscription$get_restaurant_orders$restaurant_order$delivery {
  CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<
          Subscription$get_restaurant_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery(
    Subscription$get_restaurant_orders$restaurant_order$delivery instance,
    TRes Function(Subscription$get_restaurant_orders$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$delivery;

  factory CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Subscription$get_restaurant_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Subscription$get_restaurant_orders$restaurant_order$delivery _instance;

  final TRes Function(
      Subscription$get_restaurant_orders$restaurant_order$delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_restaurant_orders$restaurant_order$delivery(
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
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Subscription$get_restaurant_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Subscription$get_restaurant_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_restaurant_current_orders {
  factory Variables$Subscription$listen_restaurant_current_orders(
          {required int restaurantId}) =>
      Variables$Subscription$listen_restaurant_current_orders._({
        r'restaurantId': restaurantId,
      });

  Variables$Subscription$listen_restaurant_current_orders._(this._$data);

  factory Variables$Subscription$listen_restaurant_current_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Subscription$listen_restaurant_current_orders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_restaurant_current_orders<
          Variables$Subscription$listen_restaurant_current_orders>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_restaurant_current_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_restaurant_current_orders) ||
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

abstract class CopyWith$Variables$Subscription$listen_restaurant_current_orders<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_restaurant_current_orders(
    Variables$Subscription$listen_restaurant_current_orders instance,
    TRes Function(Variables$Subscription$listen_restaurant_current_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_restaurant_current_orders;

  factory CopyWith$Variables$Subscription$listen_restaurant_current_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_restaurant_current_orders;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Subscription$listen_restaurant_current_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_restaurant_current_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_restaurant_current_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_restaurant_current_orders _instance;

  final TRes Function(Variables$Subscription$listen_restaurant_current_orders)
      _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Subscription$listen_restaurant_current_orders._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_restaurant_current_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_restaurant_current_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_restaurant_current_orders(
      this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Subscription$listen_restaurant_current_orders {
  Subscription$listen_restaurant_current_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Subscription$listen_restaurant_current_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Subscription$listen_restaurant_current_orders$restaurant_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_restaurant_current_orders$restaurant_order>
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
    if (!(other is Subscription$listen_restaurant_current_orders) ||
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

extension UtilityExtension$Subscription$listen_restaurant_current_orders
    on Subscription$listen_restaurant_current_orders {
  CopyWith$Subscription$listen_restaurant_current_orders<
          Subscription$listen_restaurant_current_orders>
      get copyWith => CopyWith$Subscription$listen_restaurant_current_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_restaurant_current_orders<TRes> {
  factory CopyWith$Subscription$listen_restaurant_current_orders(
    Subscription$listen_restaurant_current_orders instance,
    TRes Function(Subscription$listen_restaurant_current_orders) then,
  ) = _CopyWithImpl$Subscription$listen_restaurant_current_orders;

  factory CopyWith$Subscription$listen_restaurant_current_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_restaurant_current_orders;

  TRes call({
    List<Subscription$listen_restaurant_current_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Subscription$listen_restaurant_current_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
                      Subscription$listen_restaurant_current_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_restaurant_current_orders<TRes>
    implements CopyWith$Subscription$listen_restaurant_current_orders<TRes> {
  _CopyWithImpl$Subscription$listen_restaurant_current_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_restaurant_current_orders _instance;

  final TRes Function(Subscription$listen_restaurant_current_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_restaurant_current_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order as List<
                Subscription$listen_restaurant_current_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Subscription$listen_restaurant_current_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
                          Subscription$listen_restaurant_current_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_restaurant_current_orders<TRes>
    implements CopyWith$Subscription$listen_restaurant_current_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_restaurant_current_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_restaurant_current_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_restaurant_current_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_restaurant_current_orders'),
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
        name: NameNode(value: 'restaurant_order'),
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
                    value: VariableNode(name: NameNode(value: 'restaurantId')),
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
Subscription$listen_restaurant_current_orders
    _parserFn$Subscription$listen_restaurant_current_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_restaurant_current_orders.fromJson(data);

class Options$Subscription$listen_restaurant_current_orders extends graphql
    .SubscriptionOptions<Subscription$listen_restaurant_current_orders> {
  Options$Subscription$listen_restaurant_current_orders({
    String? operationName,
    required Variables$Subscription$listen_restaurant_current_orders variables,
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
          document: documentNodeSubscriptionlisten_restaurant_current_orders,
          parserFn: _parserFn$Subscription$listen_restaurant_current_orders,
        );
}

class WatchOptions$Subscription$listen_restaurant_current_orders extends graphql
    .WatchQueryOptions<Subscription$listen_restaurant_current_orders> {
  WatchOptions$Subscription$listen_restaurant_current_orders({
    String? operationName,
    required Variables$Subscription$listen_restaurant_current_orders variables,
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
          document: documentNodeSubscriptionlisten_restaurant_current_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_restaurant_current_orders,
        );
}

class FetchMoreOptions$Subscription$listen_restaurant_current_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_restaurant_current_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_restaurant_current_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_restaurant_current_orders,
        );
}

extension ClientExtension$Subscription$listen_restaurant_current_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_restaurant_current_orders>>
      subscribe$listen_restaurant_current_orders(
              Options$Subscription$listen_restaurant_current_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_restaurant_current_orders>
      watchSubscription$listen_restaurant_current_orders(
              WatchOptions$Subscription$listen_restaurant_current_orders
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_restaurant_current_orders$restaurant_order {
  Subscription$listen_restaurant_current_orders$restaurant_order({
    required this.id,
    required this.order_time,
    required this.status,
    this.total_cost,
    this.to_location_address,
    required this.customer,
    required this.$__typename,
  });

  factory Subscription$listen_restaurant_current_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      customer:
          Subscription$listen_restaurant_current_orders$restaurant_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double? total_cost;

  final String? to_location_address;

  final Subscription$listen_restaurant_current_orders$restaurant_order$customer
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$order_time = order_time;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listen_restaurant_current_orders$restaurant_order) ||
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

extension UtilityExtension$Subscription$listen_restaurant_current_orders$restaurant_order
    on Subscription$listen_restaurant_current_orders$restaurant_order {
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
          Subscription$listen_restaurant_current_orders$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order(
    Subscription$listen_restaurant_current_orders$restaurant_order instance,
    TRes Function(
            Subscription$listen_restaurant_current_orders$restaurant_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order;

  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Subscription$listen_restaurant_current_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_restaurant_current_orders$restaurant_order
      _instance;

  final TRes Function(
      Subscription$listen_restaurant_current_orders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_restaurant_current_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
                as Subscription$listen_restaurant_current_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Subscription$listen_restaurant_current_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer
              .stub(_res);
}

class Subscription$listen_restaurant_current_orders$restaurant_order$customer {
  Subscription$listen_restaurant_current_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_restaurant_current_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders$restaurant_order$customer(
      user:
          Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
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
            is Subscription$listen_restaurant_current_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Subscription$listen_restaurant_current_orders$restaurant_order$customer
    on Subscription$listen_restaurant_current_orders$restaurant_order$customer {
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
          Subscription$listen_restaurant_current_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer(
    Subscription$listen_restaurant_current_orders$restaurant_order$customer
        instance,
    TRes Function(
            Subscription$listen_restaurant_current_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer;

  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer;

  TRes call({
    Subscription$listen_restaurant_current_orders$restaurant_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_restaurant_current_orders$restaurant_order$customer
      _instance;

  final TRes Function(
          Subscription$listen_restaurant_current_orders$restaurant_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_restaurant_current_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_restaurant_current_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_restaurant_current_orders$restaurant_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
              .stub(_res);
}

class Subscription$listen_restaurant_current_orders$restaurant_order$customer$user {
  Subscription$listen_restaurant_current_orders$restaurant_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_restaurant_current_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
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
            is Subscription$listen_restaurant_current_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
    on Subscription$listen_restaurant_current_orders$restaurant_order$customer$user {
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
          Subscription$listen_restaurant_current_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
    Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_restaurant_current_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user;

  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_restaurant_current_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_restaurant_current_orders$restaurant_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_current_orders {
  factory Variables$Query$get_restaurant_current_orders(
          {required int restaurantId}) =>
      Variables$Query$get_restaurant_current_orders._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$get_restaurant_current_orders._(this._$data);

  factory Variables$Query$get_restaurant_current_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$get_restaurant_current_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_current_orders<
          Variables$Query$get_restaurant_current_orders>
      get copyWith => CopyWith$Variables$Query$get_restaurant_current_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_current_orders) ||
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

abstract class CopyWith$Variables$Query$get_restaurant_current_orders<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_current_orders(
    Variables$Query$get_restaurant_current_orders instance,
    TRes Function(Variables$Query$get_restaurant_current_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_current_orders;

  factory CopyWith$Variables$Query$get_restaurant_current_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_current_orders;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$get_restaurant_current_orders<TRes>
    implements CopyWith$Variables$Query$get_restaurant_current_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_current_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_current_orders _instance;

  final TRes Function(Variables$Query$get_restaurant_current_orders) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$get_restaurant_current_orders._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_current_orders<TRes>
    implements CopyWith$Variables$Query$get_restaurant_current_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_current_orders(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$get_restaurant_current_orders {
  Query$get_restaurant_current_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$get_restaurant_current_orders.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_current_orders$restaurant_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_restaurant_current_orders$restaurant_order>
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
    if (!(other is Query$get_restaurant_current_orders) ||
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

extension UtilityExtension$Query$get_restaurant_current_orders
    on Query$get_restaurant_current_orders {
  CopyWith$Query$get_restaurant_current_orders<
          Query$get_restaurant_current_orders>
      get copyWith => CopyWith$Query$get_restaurant_current_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_current_orders<TRes> {
  factory CopyWith$Query$get_restaurant_current_orders(
    Query$get_restaurant_current_orders instance,
    TRes Function(Query$get_restaurant_current_orders) then,
  ) = _CopyWithImpl$Query$get_restaurant_current_orders;

  factory CopyWith$Query$get_restaurant_current_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_current_orders;

  TRes call({
    List<Query$get_restaurant_current_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$get_restaurant_current_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_current_orders$restaurant_order<
                      Query$get_restaurant_current_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_current_orders<TRes>
    implements CopyWith$Query$get_restaurant_current_orders<TRes> {
  _CopyWithImpl$Query$get_restaurant_current_orders(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_current_orders _instance;

  final TRes Function(Query$get_restaurant_current_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_current_orders(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order
                as List<Query$get_restaurant_current_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$get_restaurant_current_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_current_orders$restaurant_order<
                          Query$get_restaurant_current_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Query$get_restaurant_current_orders$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_current_orders<TRes>
    implements CopyWith$Query$get_restaurant_current_orders<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_current_orders(this._res);

  TRes _res;

  call({
    List<Query$get_restaurant_current_orders$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryget_restaurant_current_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_current_orders'),
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
        name: NameNode(value: 'restaurant_order'),
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
                    value: VariableNode(name: NameNode(value: 'restaurantId')),
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
Query$get_restaurant_current_orders
    _parserFn$Query$get_restaurant_current_orders(Map<String, dynamic> data) =>
        Query$get_restaurant_current_orders.fromJson(data);

class Options$Query$get_restaurant_current_orders
    extends graphql.QueryOptions<Query$get_restaurant_current_orders> {
  Options$Query$get_restaurant_current_orders({
    String? operationName,
    required Variables$Query$get_restaurant_current_orders variables,
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
          document: documentNodeQueryget_restaurant_current_orders,
          parserFn: _parserFn$Query$get_restaurant_current_orders,
        );
}

class WatchOptions$Query$get_restaurant_current_orders
    extends graphql.WatchQueryOptions<Query$get_restaurant_current_orders> {
  WatchOptions$Query$get_restaurant_current_orders({
    String? operationName,
    required Variables$Query$get_restaurant_current_orders variables,
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
          document: documentNodeQueryget_restaurant_current_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_current_orders,
        );
}

class FetchMoreOptions$Query$get_restaurant_current_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_current_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_current_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_current_orders,
        );
}

extension ClientExtension$Query$get_restaurant_current_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_current_orders>>
      query$get_restaurant_current_orders(
              Options$Query$get_restaurant_current_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_current_orders>
      watchQuery$get_restaurant_current_orders(
              WatchOptions$Query$get_restaurant_current_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_current_orders({
    required Query$get_restaurant_current_orders data,
    required Variables$Query$get_restaurant_current_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_current_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_current_orders? readQuery$get_restaurant_current_orders({
    required Variables$Query$get_restaurant_current_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_current_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_current_orders.fromJson(result);
  }
}

class Query$get_restaurant_current_orders$restaurant_order {
  Query$get_restaurant_current_orders$restaurant_order({
    required this.id,
    required this.order_time,
    required this.status,
    this.total_cost,
    this.to_location_address,
    required this.customer,
    required this.$__typename,
  });

  factory Query$get_restaurant_current_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      customer: Query$get_restaurant_current_orders$restaurant_order$customer
          .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double? total_cost;

  final String? to_location_address;

  final Query$get_restaurant_current_orders$restaurant_order$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$order_time = order_time;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$get_restaurant_current_orders$restaurant_order) ||
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

extension UtilityExtension$Query$get_restaurant_current_orders$restaurant_order
    on Query$get_restaurant_current_orders$restaurant_order {
  CopyWith$Query$get_restaurant_current_orders$restaurant_order<
          Query$get_restaurant_current_orders$restaurant_order>
      get copyWith =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_current_orders$restaurant_order<
    TRes> {
  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order(
    Query$get_restaurant_current_orders$restaurant_order instance,
    TRes Function(Query$get_restaurant_current_orders$restaurant_order) then,
  ) = _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order;

  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_current_orders$restaurant_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order<TRes> {
  _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_current_orders$restaurant_order _instance;

  final TRes Function(Query$get_restaurant_current_orders$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_current_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
                as Query$get_restaurant_current_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_current_orders$restaurant_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer
              .stub(_res);
}

class Query$get_restaurant_current_orders$restaurant_order$customer {
  Query$get_restaurant_current_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_restaurant_current_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders$restaurant_order$customer(
      user: Query$get_restaurant_current_orders$restaurant_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_current_orders$restaurant_order$customer$user user;

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
            is Query$get_restaurant_current_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Query$get_restaurant_current_orders$restaurant_order$customer
    on Query$get_restaurant_current_orders$restaurant_order$customer {
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<
          Query$get_restaurant_current_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer(
    Query$get_restaurant_current_orders$restaurant_order$customer instance,
    TRes Function(Query$get_restaurant_current_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer;

  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer;

  TRes call({
    Query$get_restaurant_current_orders$restaurant_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_current_orders$restaurant_order$customer _instance;

  final TRes Function(
      Query$get_restaurant_current_orders$restaurant_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_current_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_restaurant_current_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_current_orders$restaurant_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user
              .stub(_res);
}

class Query$get_restaurant_current_orders$restaurant_order$customer$user {
  Query$get_restaurant_current_orders$restaurant_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_restaurant_current_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders$restaurant_order$customer$user(
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
            is Query$get_restaurant_current_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Query$get_restaurant_current_orders$restaurant_order$customer$user
    on Query$get_restaurant_current_orders$restaurant_order$customer$user {
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
          Query$get_restaurant_current_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user(
    Query$get_restaurant_current_orders$restaurant_order$customer$user instance,
    TRes Function(
            Query$get_restaurant_current_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user;

  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_current_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
      Query$get_restaurant_current_orders$restaurant_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_current_orders$restaurant_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_past_orders {
  factory Variables$Query$get_restaurant_past_orders(
          {required int restaurantId}) =>
      Variables$Query$get_restaurant_past_orders._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$get_restaurant_past_orders._(this._$data);

  factory Variables$Query$get_restaurant_past_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$get_restaurant_past_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_past_orders<
          Variables$Query$get_restaurant_past_orders>
      get copyWith => CopyWith$Variables$Query$get_restaurant_past_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_past_orders) ||
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

abstract class CopyWith$Variables$Query$get_restaurant_past_orders<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_past_orders(
    Variables$Query$get_restaurant_past_orders instance,
    TRes Function(Variables$Query$get_restaurant_past_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_past_orders;

  factory CopyWith$Variables$Query$get_restaurant_past_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$get_restaurant_past_orders<TRes>
    implements CopyWith$Variables$Query$get_restaurant_past_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_past_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_past_orders _instance;

  final TRes Function(Variables$Query$get_restaurant_past_orders) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$get_restaurant_past_orders._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders<TRes>
    implements CopyWith$Variables$Query$get_restaurant_past_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$get_restaurant_past_orders {
  Query$get_restaurant_past_orders({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$get_restaurant_past_orders.fromJson(Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_past_orders$restaurant_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_restaurant_past_orders$restaurant_order>
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
    if (!(other is Query$get_restaurant_past_orders) ||
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

extension UtilityExtension$Query$get_restaurant_past_orders
    on Query$get_restaurant_past_orders {
  CopyWith$Query$get_restaurant_past_orders<Query$get_restaurant_past_orders>
      get copyWith => CopyWith$Query$get_restaurant_past_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_past_orders<TRes> {
  factory CopyWith$Query$get_restaurant_past_orders(
    Query$get_restaurant_past_orders instance,
    TRes Function(Query$get_restaurant_past_orders) then,
  ) = _CopyWithImpl$Query$get_restaurant_past_orders;

  factory CopyWith$Query$get_restaurant_past_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_past_orders;

  TRes call({
    List<Query$get_restaurant_past_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$get_restaurant_past_orders$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_past_orders$restaurant_order<
                      Query$get_restaurant_past_orders$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_past_orders<TRes>
    implements CopyWith$Query$get_restaurant_past_orders<TRes> {
  _CopyWithImpl$Query$get_restaurant_past_orders(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_past_orders _instance;

  final TRes Function(Query$get_restaurant_past_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_past_orders(
        restaurant_order:
            restaurant_order == _undefined || restaurant_order == null
                ? _instance.restaurant_order
                : (restaurant_order
                    as List<Query$get_restaurant_past_orders$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$get_restaurant_past_orders$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_past_orders$restaurant_order<
                          Query$get_restaurant_past_orders$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map(
              (e) => CopyWith$Query$get_restaurant_past_orders$restaurant_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_past_orders<TRes>
    implements CopyWith$Query$get_restaurant_past_orders<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_past_orders(this._res);

  TRes _res;

  call({
    List<Query$get_restaurant_past_orders$restaurant_order>? restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryget_restaurant_past_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_past_orders'),
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
        name: NameNode(value: 'restaurant_order'),
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
                    value: VariableNode(name: NameNode(value: 'restaurantId')),
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
Query$get_restaurant_past_orders _parserFn$Query$get_restaurant_past_orders(
        Map<String, dynamic> data) =>
    Query$get_restaurant_past_orders.fromJson(data);

class Options$Query$get_restaurant_past_orders
    extends graphql.QueryOptions<Query$get_restaurant_past_orders> {
  Options$Query$get_restaurant_past_orders({
    String? operationName,
    required Variables$Query$get_restaurant_past_orders variables,
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
          document: documentNodeQueryget_restaurant_past_orders,
          parserFn: _parserFn$Query$get_restaurant_past_orders,
        );
}

class WatchOptions$Query$get_restaurant_past_orders
    extends graphql.WatchQueryOptions<Query$get_restaurant_past_orders> {
  WatchOptions$Query$get_restaurant_past_orders({
    String? operationName,
    required Variables$Query$get_restaurant_past_orders variables,
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
          document: documentNodeQueryget_restaurant_past_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_past_orders,
        );
}

class FetchMoreOptions$Query$get_restaurant_past_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_past_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_past_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_past_orders,
        );
}

extension ClientExtension$Query$get_restaurant_past_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_past_orders>>
      query$get_restaurant_past_orders(
              Options$Query$get_restaurant_past_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_past_orders>
      watchQuery$get_restaurant_past_orders(
              WatchOptions$Query$get_restaurant_past_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_past_orders({
    required Query$get_restaurant_past_orders data,
    required Variables$Query$get_restaurant_past_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_past_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_past_orders? readQuery$get_restaurant_past_orders({
    required Variables$Query$get_restaurant_past_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_past_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_past_orders.fromJson(result);
  }
}

class Query$get_restaurant_past_orders$restaurant_order {
  Query$get_restaurant_past_orders$restaurant_order({
    required this.id,
    required this.order_time,
    required this.status,
    this.total_cost,
    this.to_location_address,
    required this.customer,
    required this.$__typename,
  });

  factory Query$get_restaurant_past_orders$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      customer:
          Query$get_restaurant_past_orders$restaurant_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double? total_cost;

  final String? to_location_address;

  final Query$get_restaurant_past_orders$restaurant_order$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$order_time = order_time;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Query$get_restaurant_past_orders$restaurant_order) ||
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

extension UtilityExtension$Query$get_restaurant_past_orders$restaurant_order
    on Query$get_restaurant_past_orders$restaurant_order {
  CopyWith$Query$get_restaurant_past_orders$restaurant_order<
          Query$get_restaurant_past_orders$restaurant_order>
      get copyWith =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_past_orders$restaurant_order<
    TRes> {
  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order(
    Query$get_restaurant_past_orders$restaurant_order instance,
    TRes Function(Query$get_restaurant_past_orders$restaurant_order) then,
  ) = _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order;

  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_past_orders$restaurant_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order<TRes> {
  _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_past_orders$restaurant_order _instance;

  final TRes Function(Query$get_restaurant_past_orders$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? to_location_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_past_orders$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
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
                as Query$get_restaurant_past_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order<TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_past_orders$restaurant_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer
              .stub(_res);
}

class Query$get_restaurant_past_orders$restaurant_order$customer {
  Query$get_restaurant_past_orders$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_restaurant_past_orders$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders$restaurant_order$customer(
      user: Query$get_restaurant_past_orders$restaurant_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_past_orders$restaurant_order$customer$user user;

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
            is Query$get_restaurant_past_orders$restaurant_order$customer) ||
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

extension UtilityExtension$Query$get_restaurant_past_orders$restaurant_order$customer
    on Query$get_restaurant_past_orders$restaurant_order$customer {
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<
          Query$get_restaurant_past_orders$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer(
    Query$get_restaurant_past_orders$restaurant_order$customer instance,
    TRes Function(Query$get_restaurant_past_orders$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer;

  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer;

  TRes call({
    Query$get_restaurant_past_orders$restaurant_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_past_orders$restaurant_order$customer _instance;

  final TRes Function(
      Query$get_restaurant_past_orders$restaurant_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_past_orders$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_restaurant_past_orders$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_past_orders$restaurant_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user
              .stub(_res);
}

class Query$get_restaurant_past_orders$restaurant_order$customer$user {
  Query$get_restaurant_past_orders$restaurant_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_restaurant_past_orders$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders$restaurant_order$customer$user(
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
            is Query$get_restaurant_past_orders$restaurant_order$customer$user) ||
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

extension UtilityExtension$Query$get_restaurant_past_orders$restaurant_order$customer$user
    on Query$get_restaurant_past_orders$restaurant_order$customer$user {
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<
          Query$get_restaurant_past_orders$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user(
    Query$get_restaurant_past_orders$restaurant_order$customer$user instance,
    TRes Function(
            Query$get_restaurant_past_orders$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user;

  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_past_orders$restaurant_order$customer$user
      _instance;

  final TRes Function(
      Query$get_restaurant_past_orders$restaurant_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_past_orders$restaurant_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$querry_restaurant_orders_by_restaurant_id {
  factory Variables$Query$querry_restaurant_orders_by_restaurant_id(
          {required int restaurantId}) =>
      Variables$Query$querry_restaurant_orders_by_restaurant_id._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$querry_restaurant_orders_by_restaurant_id._(this._$data);

  factory Variables$Query$querry_restaurant_orders_by_restaurant_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$querry_restaurant_orders_by_restaurant_id._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id<
          Variables$Query$querry_restaurant_orders_by_restaurant_id>
      get copyWith =>
          CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$querry_restaurant_orders_by_restaurant_id) ||
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

abstract class CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id<
    TRes> {
  factory CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id(
    Variables$Query$querry_restaurant_orders_by_restaurant_id instance,
    TRes Function(Variables$Query$querry_restaurant_orders_by_restaurant_id)
        then,
  ) = _CopyWithImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id;

  factory CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id<
        TRes>
    implements
        CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id<
            TRes> {
  _CopyWithImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id(
    this._instance,
    this._then,
  );

  final Variables$Query$querry_restaurant_orders_by_restaurant_id _instance;

  final TRes Function(Variables$Query$querry_restaurant_orders_by_restaurant_id)
      _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$querry_restaurant_orders_by_restaurant_id._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id<
        TRes>
    implements
        CopyWith$Variables$Query$querry_restaurant_orders_by_restaurant_id<
            TRes> {
  _CopyWithStubImpl$Variables$Query$querry_restaurant_orders_by_restaurant_id(
      this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$querry_restaurant_orders_by_restaurant_id {
  Query$querry_restaurant_orders_by_restaurant_id({
    required this.restaurant_order,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_order = json['restaurant_order'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id(
      restaurant_order: (l$restaurant_order as List<dynamic>)
          .map((e) =>
              Query$querry_restaurant_orders_by_restaurant_id$restaurant_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>
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
    if (!(other is Query$querry_restaurant_orders_by_restaurant_id) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id
    on Query$querry_restaurant_orders_by_restaurant_id {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id<
          Query$querry_restaurant_orders_by_restaurant_id>
      get copyWith => CopyWith$Query$querry_restaurant_orders_by_restaurant_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id<TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id(
    Query$querry_restaurant_orders_by_restaurant_id instance,
    TRes Function(Query$querry_restaurant_orders_by_restaurant_id) then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id;

  TRes call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>?
        restaurant_order,
    String? $__typename,
  });
  TRes restaurant_order(
      Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order> Function(
              Iterable<
                  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
                      Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>>)
          _fn);
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id<TRes>
    implements CopyWith$Query$querry_restaurant_orders_by_restaurant_id<TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id _instance;

  final TRes Function(Query$querry_restaurant_orders_by_restaurant_id) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$querry_restaurant_orders_by_restaurant_id(
        restaurant_order: restaurant_order == _undefined ||
                restaurant_order == null
            ? _instance.restaurant_order
            : (restaurant_order as List<
                Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_order(
          Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order> Function(
                  Iterable<
                      CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
                          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>>)
              _fn) =>
      call(
          restaurant_order: _fn(_instance.restaurant_order.map((e) =>
              CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id<TRes>
    implements CopyWith$Query$querry_restaurant_orders_by_restaurant_id<TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id(this._res);

  TRes _res;

  call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>?
        restaurant_order,
    String? $__typename,
  }) =>
      _res;
  restaurant_order(_fn) => _res;
}

const documentNodeQueryquerry_restaurant_orders_by_restaurant_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'querry_restaurant_orders_by_restaurant_id'),
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
        name: NameNode(value: 'restaurant_order'),
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
                    value: VariableNode(name: NameNode(value: 'restaurantId')),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'restaurant_item'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'item_type'),
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
                    name: NameNode(value: 'archived'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'cost_per_one'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quantity'),
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
            name: NameNode(value: 'to_location_gps'),
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
            name: NameNode(value: 'estimated_food_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_food_ready_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_id'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tax'),
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
            name: NameNode(value: 'items_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'delivery_cost'),
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
Query$querry_restaurant_orders_by_restaurant_id
    _parserFn$Query$querry_restaurant_orders_by_restaurant_id(
            Map<String, dynamic> data) =>
        Query$querry_restaurant_orders_by_restaurant_id.fromJson(data);

class Options$Query$querry_restaurant_orders_by_restaurant_id extends graphql
    .QueryOptions<Query$querry_restaurant_orders_by_restaurant_id> {
  Options$Query$querry_restaurant_orders_by_restaurant_id({
    String? operationName,
    required Variables$Query$querry_restaurant_orders_by_restaurant_id
        variables,
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
          document: documentNodeQueryquerry_restaurant_orders_by_restaurant_id,
          parserFn: _parserFn$Query$querry_restaurant_orders_by_restaurant_id,
        );
}

class WatchOptions$Query$querry_restaurant_orders_by_restaurant_id
    extends graphql
        .WatchQueryOptions<Query$querry_restaurant_orders_by_restaurant_id> {
  WatchOptions$Query$querry_restaurant_orders_by_restaurant_id({
    String? operationName,
    required Variables$Query$querry_restaurant_orders_by_restaurant_id
        variables,
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
          document: documentNodeQueryquerry_restaurant_orders_by_restaurant_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$querry_restaurant_orders_by_restaurant_id,
        );
}

class FetchMoreOptions$Query$querry_restaurant_orders_by_restaurant_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$querry_restaurant_orders_by_restaurant_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$querry_restaurant_orders_by_restaurant_id
        variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryquerry_restaurant_orders_by_restaurant_id,
        );
}

extension ClientExtension$Query$querry_restaurant_orders_by_restaurant_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$querry_restaurant_orders_by_restaurant_id>>
      query$querry_restaurant_orders_by_restaurant_id(
              Options$Query$querry_restaurant_orders_by_restaurant_id
                  options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$querry_restaurant_orders_by_restaurant_id>
      watchQuery$querry_restaurant_orders_by_restaurant_id(
              WatchOptions$Query$querry_restaurant_orders_by_restaurant_id
                  options) =>
          this.watchQuery(options);
  void writeQuery$querry_restaurant_orders_by_restaurant_id({
    required Query$querry_restaurant_orders_by_restaurant_id data,
    required Variables$Query$querry_restaurant_orders_by_restaurant_id
        variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document:
                  documentNodeQueryquerry_restaurant_orders_by_restaurant_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$querry_restaurant_orders_by_restaurant_id?
      readQuery$querry_restaurant_orders_by_restaurant_id({
    required Variables$Query$querry_restaurant_orders_by_restaurant_id
        variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document:
                documentNodeQueryquerry_restaurant_orders_by_restaurant_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$querry_restaurant_orders_by_restaurant_id.fromJson(result);
  }
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    this.stripe_payment_id,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    required this.order_type,
    required this.order_time,
    this.firebase_id,
    required this.customer_app_type,
    required this.customer,
    this.notes,
    required this.tax,
    this.total_cost,
    this.items_cost,
    required this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_type = json['order_type'];
    final l$order_time = json['order_time'];
    final l$firebase_id = json['firebase_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$customer = json['customer'];
    final l$notes = json['notes'];
    final l$tax = json['tax'];
    final l$total_cost = json['total_cost'];
    final l$items_cost = json['items_cost'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
      id: (l$id as int),
      restaurant:
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      payment_type: (l$payment_type as String),
      to_location_gps: l$to_location_gps == null
          ? null
          : geographyFromJson(l$to_location_gps),
      to_location_address: (l$to_location_address as String?),
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      actual_food_ready_time: (l$actual_food_ready_time as String?),
      stripe_payment_id: (l$stripe_payment_id as int?),
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_type: (l$order_type as String),
      order_time: (l$order_time as String),
      firebase_id: (l$firebase_id as String?),
      customer_app_type: (l$customer_app_type as String),
      customer:
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      notes: (l$notes as String?),
      tax: moneyFromJson(l$tax),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      chat_id: (l$chat_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
      restaurant;

  final List<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>
      items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final int? stripe_payment_id;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final String order_type;

  final String order_time;

  final String? firebase_id;

  final String customer_app_type;

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
      customer;

  final String? notes;

  final double tax;

  final double? total_cost;

  final double? items_cost;

  final int chat_id;

  final double delivery_cost;

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery?
      delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] =
        l$to_location_gps == null ? null : geographyToJson(l$to_location_gps);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    _resultData['actual_food_ready_time'] = l$actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$items_cost = items_cost;
    _resultData['items_cost'] =
        l$items_cost == null ? null : moneyToJson(l$items_cost);
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$stripe_payment_id = stripe_payment_id;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_type = order_type;
    final l$order_time = order_time;
    final l$firebase_id = firebase_id;
    final l$customer_app_type = customer_app_type;
    final l$customer = customer;
    final l$notes = notes;
    final l$tax = tax;
    final l$total_cost = total_cost;
    final l$items_cost = items_cost;
    final l$chat_id = chat_id;
    final l$delivery_cost = delivery_cost;
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$stripe_payment_id,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$order_type,
      l$order_time,
      l$firebase_id,
      l$customer_app_type,
      l$customer,
      l$notes,
      l$tax,
      l$total_cost,
      l$items_cost,
      l$chat_id,
      l$delivery_cost,
      l$delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order) ||
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
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
      return false;
    }
    final l$actual_food_ready_time = actual_food_ready_time;
    final lOther$actual_food_ready_time = other.actual_food_ready_time;
    if (l$actual_food_ready_time != lOther$actual_food_ready_time) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$delivery_id = delivery_id;
    final lOther$delivery_id = other.delivery_id;
    if (l$delivery_id != lOther$delivery_id) {
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$items_cost = items_cost;
    final lOther$items_cost = other.items_cost;
    if (l$items_cost != lOther$items_cost) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order;

  TRes call({
    int? id,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant?
        restaurant,
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer?
        customer,
    String? notes,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    double? delivery_cost,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery?
        delivery,
    String? $__typename,
  });
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
      TRes> get restaurant;
  TRes items(
      Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items> Function(
              Iterable<
                  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
                      Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>>)
          _fn);
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
      TRes> get customer;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
      TRes> get delivery;
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order
      _instance;

  final TRes Function(
      Query$querry_restaurant_orders_by_restaurant_id$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_type = _undefined,
    Object? order_time = _undefined,
    Object? firebase_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? customer = _undefined,
    Object? notes = _undefined,
    Object? tax = _undefined,
    Object? total_cost = _undefined,
    Object? items_cost = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        to_location_gps: to_location_gps == _undefined
            ? _instance.to_location_gps
            : (to_location_gps as Geography?),
        to_location_address: to_location_address == _undefined
            ? _instance.to_location_address
            : (to_location_address as String?),
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        actual_food_ready_time: actual_food_ready_time == _undefined
            ? _instance.actual_food_ready_time
            : (actual_food_ready_time as String?),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        delivery_id: delivery_id == _undefined
            ? _instance.delivery_id
            : (delivery_id as int?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        items_cost: items_cost == _undefined
            ? _instance.items_cost
            : (items_cost as double?),
        chat_id: chat_id == _undefined || chat_id == null
            ? _instance.chat_id
            : (chat_id as int),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items> Function(
                  Iterable<
                      CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
                          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
      TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant?
        restaurant,
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    int? stripe_payment_id,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    String? order_type,
    String? order_time,
    String? firebase_id,
    String? customer_app_type,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer?
        customer,
    String? notes,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    double? delivery_cost,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery?
        delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
              .stub(_res);
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
          TRes>
      get delivery =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
              .stub(_res);
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
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
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant;

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

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant)
      _then;

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
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
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

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$restaurant(
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

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
      restaurant_item:
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] = l$restaurant_item.toJson();
    final l$cost_per_one = cost_per_one;
    _resultData['cost_per_one'] = moneyToJson(l$cost_per_one);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item,
      l$cost_per_one,
      l$id,
      l$notes,
      l$quantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item != lOther$restaurant_item) {
      return false;
    }
    final l$cost_per_one = cost_per_one;
    final lOther$cost_per_one = other.cost_per_one;
    if (l$cost_per_one != lOther$cost_per_one) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items;

  TRes call({
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item),
        cost_per_one: cost_per_one == _undefined || cost_per_one == null
            ? _instance.cost_per_one
            : (cost_per_one as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items(
      this._res);

  TRes _res;

  call({
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
              .stub(_res);
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item({
    required this.item_type,
    required this.name,
    this.description,
    required this.position,
    this.category_id,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.archived,
    required this.cost,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$item_type = json['item_type'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$archived = json['archived'];
    final l$cost = json['cost'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
              .fromJson((l$description as Map<String, dynamic>)),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      archived: (l$archived as bool),
      cost: moneyFromJson(l$cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String item_type;

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
      name;

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description?
      description;

  final int position;

  final int? category_id;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final bool archived;

  final double cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$archived = archived;
    _resultData['archived'] = l$archived;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_type = item_type;
    final l$name = name;
    final l$description = description;
    final l$position = position;
    final l$category_id = category_id;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$archived = archived;
    final l$cost = cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item_type,
      l$name,
      l$description,
      l$position,
      l$category_id,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      l$archived,
      l$cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
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
    final l$archived = archived;
    final lOther$archived = other.archived;
    if (l$archived != lOther$archived) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item;

  TRes call({
    String? item_type,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name?
        name,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  });
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item)
      _then;

  static const _undefined = {};

  TRes call({
    Object? item_type = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? archived = _undefined,
    Object? cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
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
        archived: archived == _undefined || archived == null
            ? _instance.archived
            : (archived as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name?
        name,
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description?
        description,
    int? position,
    int? category_id,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    bool? archived,
    double? cost,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
              .stub(_res);
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
              .stub(_res);
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>
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
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name;

  TRes call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
                      Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
                          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
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
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>
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
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description;

  TRes call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
                      Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
                          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
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
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
      user:
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
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
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer;

  TRes call({
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer(
      this._res);

  TRes _res;

  call({
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
              .stub(_res);
}

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
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
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user) ||
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$customer$user(
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

class Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery {
  Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$current_gps = json['current_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_arrival_at_dropoff_time;

  final String? cancellation_time;

  final Geography? current_gps;

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$cancellation_time = cancellation_time;
    final l$current_gps = current_gps;
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$actual_arrival_at_pickup_time,
      l$actual_arrival_at_dropoff_time,
      l$cancellation_time,
      l$current_gps,
      l$delivery_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
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
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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

extension UtilityExtension$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
    on Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery {
  CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
    Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
        instance,
    TRes Function(
            Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery;

  factory CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery;

  TRes call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery
      _instance;

  final TRes Function(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? current_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
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
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Query$querry_restaurant_orders_by_restaurant_id$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? actual_arrival_at_pickup_time,
    String? actual_arrival_at_dropoff_time,
    String? cancellation_time,
    Geography? current_gps,
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
}
