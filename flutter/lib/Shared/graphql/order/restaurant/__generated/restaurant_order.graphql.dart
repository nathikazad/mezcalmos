import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$get_user_orders {
  factory Variables$Subscription$get_user_orders({required int order_id}) =>
      Variables$Subscription$get_user_orders._({
        r'order_id': order_id,
      });

  Variables$Subscription$get_user_orders._(this._$data);

  factory Variables$Subscription$get_user_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$order_id = data['order_id'];
    result$data['order_id'] = (l$order_id as int);
    return Variables$Subscription$get_user_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get order_id => (_$data['order_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$order_id = order_id;
    result$data['order_id'] = l$order_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$get_user_orders<
          Variables$Subscription$get_user_orders>
      get copyWith => CopyWith$Variables$Subscription$get_user_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$get_user_orders) ||
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

abstract class CopyWith$Variables$Subscription$get_user_orders<TRes> {
  factory CopyWith$Variables$Subscription$get_user_orders(
    Variables$Subscription$get_user_orders instance,
    TRes Function(Variables$Subscription$get_user_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$get_user_orders;

  factory CopyWith$Variables$Subscription$get_user_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$get_user_orders;

  TRes call({int? order_id});
}

class _CopyWithImpl$Variables$Subscription$get_user_orders<TRes>
    implements CopyWith$Variables$Subscription$get_user_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$get_user_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$get_user_orders _instance;

  final TRes Function(Variables$Subscription$get_user_orders) _then;

  static const _undefined = {};

  TRes call({Object? order_id = _undefined}) =>
      _then(Variables$Subscription$get_user_orders._({
        ..._instance._$data,
        if (order_id != _undefined && order_id != null)
          'order_id': (order_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$get_user_orders<TRes>
    implements CopyWith$Variables$Subscription$get_user_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$get_user_orders(this._res);

  TRes _res;

  call({int? order_id}) => _res;
}

class Subscription$get_user_orders {
  Subscription$get_user_orders({
    this.restaurant_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$get_user_orders.fromJson(Map<String, dynamic> json) {
    final l$restaurant_order_by_pk = json['restaurant_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders(
      restaurant_order_by_pk: l$restaurant_order_by_pk == null
          ? null
          : Subscription$get_user_orders$restaurant_order_by_pk.fromJson(
              (l$restaurant_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_user_orders$restaurant_order_by_pk?
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
    if (!(other is Subscription$get_user_orders) ||
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

extension UtilityExtension$Subscription$get_user_orders
    on Subscription$get_user_orders {
  CopyWith$Subscription$get_user_orders<Subscription$get_user_orders>
      get copyWith => CopyWith$Subscription$get_user_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders<TRes> {
  factory CopyWith$Subscription$get_user_orders(
    Subscription$get_user_orders instance,
    TRes Function(Subscription$get_user_orders) then,
  ) = _CopyWithImpl$Subscription$get_user_orders;

  factory CopyWith$Subscription$get_user_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders;

  TRes call({
    Subscription$get_user_orders$restaurant_order_by_pk? restaurant_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk;
}

class _CopyWithImpl$Subscription$get_user_orders<TRes>
    implements CopyWith$Subscription$get_user_orders<TRes> {
  _CopyWithImpl$Subscription$get_user_orders(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders _instance;

  final TRes Function(Subscription$get_user_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_user_orders(
        restaurant_order_by_pk: restaurant_order_by_pk == _undefined
            ? _instance.restaurant_order_by_pk
            : (restaurant_order_by_pk
                as Subscription$get_user_orders$restaurant_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk {
    final local$restaurant_order_by_pk = _instance.restaurant_order_by_pk;
    return local$restaurant_order_by_pk == null
        ? CopyWith$Subscription$get_user_orders$restaurant_order_by_pk.stub(
            _then(_instance))
        : CopyWith$Subscription$get_user_orders$restaurant_order_by_pk(
            local$restaurant_order_by_pk,
            (e) => call(restaurant_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$get_user_orders<TRes>
    implements CopyWith$Subscription$get_user_orders<TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders(this._res);

  TRes _res;

  call({
    Subscription$get_user_orders$restaurant_order_by_pk? restaurant_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<TRes>
      get restaurant_order_by_pk =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk.stub(
              _res);
}

const documentNodeSubscriptionget_user_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'get_user_orders'),
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
Subscription$get_user_orders _parserFn$Subscription$get_user_orders(
        Map<String, dynamic> data) =>
    Subscription$get_user_orders.fromJson(data);

class Options$Subscription$get_user_orders
    extends graphql.SubscriptionOptions<Subscription$get_user_orders> {
  Options$Subscription$get_user_orders({
    String? operationName,
    required Variables$Subscription$get_user_orders variables,
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
          document: documentNodeSubscriptionget_user_orders,
          parserFn: _parserFn$Subscription$get_user_orders,
        );
}

class WatchOptions$Subscription$get_user_orders
    extends graphql.WatchQueryOptions<Subscription$get_user_orders> {
  WatchOptions$Subscription$get_user_orders({
    String? operationName,
    required Variables$Subscription$get_user_orders variables,
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
          document: documentNodeSubscriptionget_user_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$get_user_orders,
        );
}

class FetchMoreOptions$Subscription$get_user_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$get_user_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$get_user_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionget_user_orders,
        );
}

extension ClientExtension$Subscription$get_user_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$get_user_orders>>
      subscribe$get_user_orders(Options$Subscription$get_user_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$get_user_orders>
      watchSubscription$get_user_orders(
              WatchOptions$Subscription$get_user_orders options) =>
          this.watchQuery(options);
}

class Subscription$get_user_orders$restaurant_order_by_pk {
  Subscription$get_user_orders$restaurant_order_by_pk({
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
    this.notes,
    required this.tax,
    required this.chat_id,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk.fromJson(
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
    final l$notes = json['notes'];
    final l$tax = json['tax'];
    final l$chat_id = json['chat_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk(
      id: (l$id as int),
      restaurant: Subscription$get_user_orders$restaurant_order_by_pk$restaurant
          .fromJson((l$restaurant as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) => Subscription$get_user_orders$restaurant_order_by_pk$items
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
      notes: (l$notes as String?),
      tax: moneyFromJson(l$tax),
      chat_id: (l$chat_id as int),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery: l$delivery == null
          ? null
          : Subscription$get_user_orders$restaurant_order_by_pk$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$get_user_orders$restaurant_order_by_pk$restaurant
      restaurant;

  final List<Subscription$get_user_orders$restaurant_order_by_pk$items> items;

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

  final String? notes;

  final double tax;

  final int chat_id;

  final double delivery_cost;

  final Subscription$get_user_orders$restaurant_order_by_pk$delivery? delivery;

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
    if (!(other is Subscription$get_user_orders$restaurant_order_by_pk) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk
    on Subscription$get_user_orders$restaurant_order_by_pk {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<
          Subscription$get_user_orders$restaurant_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk(
    Subscription$get_user_orders$restaurant_order_by_pk instance,
    TRes Function(Subscription$get_user_orders$restaurant_order_by_pk) then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk;

  TRes call({
    int? id,
    Subscription$get_user_orders$restaurant_order_by_pk$restaurant? restaurant,
    List<Subscription$get_user_orders$restaurant_order_by_pk$items>? items,
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
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Subscription$get_user_orders$restaurant_order_by_pk$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<TRes>
      get restaurant;
  TRes items(
      Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items> Function(
              Iterable<
                  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
                      Subscription$get_user_orders$restaurant_order_by_pk$items>>)
          _fn);
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<TRes>
      get delivery;
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk<TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk _instance;

  final TRes Function(Subscription$get_user_orders$restaurant_order_by_pk)
      _then;

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
    Object? notes = _undefined,
    Object? tax = _undefined,
    Object? chat_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$get_user_orders$restaurant_order_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant
                as Subscription$get_user_orders$restaurant_order_by_pk$restaurant),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$get_user_orders$restaurant_order_by_pk$items>),
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
                as Subscription$get_user_orders$restaurant_order_by_pk$delivery?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
        local$restaurant, (e) => call(restaurant: e));
  }

  TRes items(
          Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items> Function(
                  Iterable<
                      CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
                          Subscription$get_user_orders$restaurant_order_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery
            .stub(_then(_instance))
        : CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery(
            local$delivery, (e) => call(delivery: e));
  }
}

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$get_user_orders$restaurant_order_by_pk$restaurant? restaurant,
    List<Subscription$get_user_orders$restaurant_order_by_pk$items>? items,
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
    String? notes,
    double? tax,
    int? chat_id,
    double? delivery_cost,
    Subscription$get_user_orders$restaurant_order_by_pk$delivery? delivery,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<TRes>
      get restaurant =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant
              .stub(_res);
  items(_fn) => _res;
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<TRes>
      get delivery =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery
              .stub(_res);
}

class Subscription$get_user_orders$restaurant_order_by_pk$restaurant {
  Subscription$get_user_orders$restaurant_order_by_pk$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
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
            is Subscription$get_user_orders$restaurant_order_by_pk$restaurant) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$restaurant
    on Subscription$get_user_orders$restaurant_order_by_pk$restaurant {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
          Subscription$get_user_orders$restaurant_order_by_pk$restaurant>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
    Subscription$get_user_orders$restaurant_order_by_pk$restaurant instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant;

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

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$restaurant
      _instance;

  final TRes Function(
      Subscription$get_user_orders$restaurant_order_by_pk$restaurant) _then;

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
      _then(Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
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

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$restaurant(
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

class Subscription$get_user_orders$restaurant_order_by_pk$items {
  Subscription$get_user_orders$restaurant_order_by_pk$items({
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$items(
      restaurant_item:
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
              .fromJson((l$restaurant_item as Map<String, dynamic>)),
      cost_per_one: moneyFromJson(l$cost_per_one),
      id: (l$id as int),
      notes: (l$notes as String?),
      quantity: (l$quantity as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
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
    if (!(other is Subscription$get_user_orders$restaurant_order_by_pk$items) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items
    on Subscription$get_user_orders$restaurant_order_by_pk$items {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
          Subscription$get_user_orders$restaurant_order_by_pk$items>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items(
    Subscription$get_user_orders$restaurant_order_by_pk$items instance,
    TRes Function(Subscription$get_user_orders$restaurant_order_by_pk$items)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items;

  TRes call({
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  });
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item;
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items _instance;

  final TRes Function(Subscription$get_user_orders$restaurant_order_by_pk$items)
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
      _then(Subscription$get_user_orders$restaurant_order_by_pk$items(
        restaurant_item: restaurant_item == _undefined ||
                restaurant_item == null
            ? _instance.restaurant_item
            : (restaurant_item
                as Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item),
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
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
      TRes> get restaurant_item {
    final local$restaurant_item = _instance.restaurant_item;
    return CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
        local$restaurant_item, (e) => call(restaurant_item: e));
  }
}

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items(
      this._res);

  TRes _res;

  call({
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item?
        restaurant_item,
    double? cost_per_one,
    int? id,
    String? notes,
    int? quantity,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
          TRes>
      get restaurant_item =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
              .stub(_res);
}

class Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item {
  Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item({
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

  factory Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item.fromJson(
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
    return Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
      item_type: (l$item_type as String),
      name:
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
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

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
      name;

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description?
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
            is Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
    on Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
        instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item;

  TRes call({
    String? item_type,
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description?
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
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name;
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description;
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item
      _instance;

  final TRes Function(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item)
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
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description?),
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
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
            .stub(_then(_instance))
        : CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item(
      this._res);

  TRes _res;

  call({
    String? item_type,
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name?
        name,
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description?
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
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
          TRes>
      get name =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
              .stub(_res);
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
          TRes>
      get description =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
              .stub(_res);
}

class Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name {
  Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>
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
            is Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
    on Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
        instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name;

  TRes call({
    List<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
                      Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name
      _instance;

  final TRes Function(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
                          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations {
  Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
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
            is Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations
    on Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations
        instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations
      _instance;

  final TRes Function(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description {
  Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>
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
            is Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
    on Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
        instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description;

  TRes call({
    List<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
                      Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description
      _instance;

  final TRes Function(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
                          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations {
  Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
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
            is Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations
    on Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
    Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations
        instance,
    TRes Function(
            Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations
      _instance;

  final TRes Function(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$items$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$get_user_orders$restaurant_order_by_pk$delivery {
  Subscription$get_user_orders$restaurant_order_by_pk$delivery({
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.actual_arrival_at_pickup_time,
    this.actual_arrival_at_dropoff_time,
    this.cancellation_time,
    this.current_gps,
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Subscription$get_user_orders$restaurant_order_by_pk$delivery.fromJson(
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
    return Subscription$get_user_orders$restaurant_order_by_pk$delivery(
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
            is Subscription$get_user_orders$restaurant_order_by_pk$delivery) ||
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

extension UtilityExtension$Subscription$get_user_orders$restaurant_order_by_pk$delivery
    on Subscription$get_user_orders$restaurant_order_by_pk$delivery {
  CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
          Subscription$get_user_orders$restaurant_order_by_pk$delivery>
      get copyWith =>
          CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
    TRes> {
  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery(
    Subscription$get_user_orders$restaurant_order_by_pk$delivery instance,
    TRes Function(Subscription$get_user_orders$restaurant_order_by_pk$delivery)
        then,
  ) = _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery;

  factory CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery;

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

class _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery(
    this._instance,
    this._then,
  );

  final Subscription$get_user_orders$restaurant_order_by_pk$delivery _instance;

  final TRes Function(
      Subscription$get_user_orders$restaurant_order_by_pk$delivery) _then;

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
      _then(Subscription$get_user_orders$restaurant_order_by_pk$delivery(
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

class _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
        TRes>
    implements
        CopyWith$Subscription$get_user_orders$restaurant_order_by_pk$delivery<
            TRes> {
  _CopyWithStubImpl$Subscription$get_user_orders$restaurant_order_by_pk$delivery(
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
