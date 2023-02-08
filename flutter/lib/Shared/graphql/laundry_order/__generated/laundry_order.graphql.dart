import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Subscription$liston_on_laundry_order_by_id {
  factory Variables$Subscription$liston_on_laundry_order_by_id(
          {required int orderId}) =>
      Variables$Subscription$liston_on_laundry_order_by_id._({
        r'orderId': orderId,
      });

  Variables$Subscription$liston_on_laundry_order_by_id._(this._$data);

  factory Variables$Subscription$liston_on_laundry_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$liston_on_laundry_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$liston_on_laundry_order_by_id<
          Variables$Subscription$liston_on_laundry_order_by_id>
      get copyWith =>
          CopyWith$Variables$Subscription$liston_on_laundry_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$liston_on_laundry_order_by_id) ||
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

abstract class CopyWith$Variables$Subscription$liston_on_laundry_order_by_id<
    TRes> {
  factory CopyWith$Variables$Subscription$liston_on_laundry_order_by_id(
    Variables$Subscription$liston_on_laundry_order_by_id instance,
    TRes Function(Variables$Subscription$liston_on_laundry_order_by_id) then,
  ) = _CopyWithImpl$Variables$Subscription$liston_on_laundry_order_by_id;

  factory CopyWith$Variables$Subscription$liston_on_laundry_order_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$liston_on_laundry_order_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$liston_on_laundry_order_by_id<TRes>
    implements
        CopyWith$Variables$Subscription$liston_on_laundry_order_by_id<TRes> {
  _CopyWithImpl$Variables$Subscription$liston_on_laundry_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Subscription$liston_on_laundry_order_by_id _instance;

  final TRes Function(Variables$Subscription$liston_on_laundry_order_by_id)
      _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$liston_on_laundry_order_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$liston_on_laundry_order_by_id<
        TRes>
    implements
        CopyWith$Variables$Subscription$liston_on_laundry_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Subscription$liston_on_laundry_order_by_id(
      this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$liston_on_laundry_order_by_id {
  Subscription$liston_on_laundry_order_by_id({
    this.laundry_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$laundry_order_by_pk = json['laundry_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id(
      laundry_order_by_pk: l$laundry_order_by_pk == null
          ? null
          : Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk
              .fromJson((l$laundry_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk?
      laundry_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order_by_pk = laundry_order_by_pk;
    _resultData['laundry_order_by_pk'] = l$laundry_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order_by_pk = laundry_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$liston_on_laundry_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order_by_pk = laundry_order_by_pk;
    final lOther$laundry_order_by_pk = other.laundry_order_by_pk;
    if (l$laundry_order_by_pk != lOther$laundry_order_by_pk) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id
    on Subscription$liston_on_laundry_order_by_id {
  CopyWith$Subscription$liston_on_laundry_order_by_id<
          Subscription$liston_on_laundry_order_by_id>
      get copyWith => CopyWith$Subscription$liston_on_laundry_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id<TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id(
    Subscription$liston_on_laundry_order_by_id instance,
    TRes Function(Subscription$liston_on_laundry_order_by_id) then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id;

  TRes call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk?
        laundry_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id<TRes>
    implements CopyWith$Subscription$liston_on_laundry_order_by_id<TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id _instance;

  final TRes Function(Subscription$liston_on_laundry_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$liston_on_laundry_order_by_id(
        laundry_order_by_pk: laundry_order_by_pk == _undefined
            ? _instance.laundry_order_by_pk
            : (laundry_order_by_pk
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk {
    final local$laundry_order_by_pk = _instance.laundry_order_by_pk;
    return local$laundry_order_by_pk == null
        ? CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
            local$laundry_order_by_pk, (e) => call(laundry_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id<TRes>
    implements CopyWith$Subscription$liston_on_laundry_order_by_id<TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id(this._res);

  TRes _res;

  call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk?
        laundry_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk
              .stub(_res);
}

const documentNodeSubscriptionliston_on_laundry_order_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'liston_on_laundry_order_by_id'),
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
        name: NameNode(value: 'laundry_order_by_pk'),
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
            name: NameNode(value: 'actual_ready_time'),
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
            name: NameNode(value: 'chat_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_address'),
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
            name: NameNode(value: 'customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_location_gps'),
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
            name: NameNode(value: 'delivery_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discount_value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_ready_time'),
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
            name: NameNode(value: 'from_customer_delivery_id'),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'scheduled_time'),
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
            name: NameNode(value: 'store_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
            name: NameNode(value: 'stripe_fees'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
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
            name: NameNode(value: 'to_customer_delivery_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'created_at'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_type'),
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
                name: NameNode(value: 'note'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_type'),
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
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'category_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'weight_in_kilo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'order_id'),
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
                name: NameNode(value: 'category'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'cost_by_kilo'),
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
                  FieldNode(
                    name: NameNode(value: 'position'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'store_id'),
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
Subscription$liston_on_laundry_order_by_id
    _parserFn$Subscription$liston_on_laundry_order_by_id(
            Map<String, dynamic> data) =>
        Subscription$liston_on_laundry_order_by_id.fromJson(data);

class Options$Subscription$liston_on_laundry_order_by_id extends graphql
    .SubscriptionOptions<Subscription$liston_on_laundry_order_by_id> {
  Options$Subscription$liston_on_laundry_order_by_id({
    String? operationName,
    required Variables$Subscription$liston_on_laundry_order_by_id variables,
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
          document: documentNodeSubscriptionliston_on_laundry_order_by_id,
          parserFn: _parserFn$Subscription$liston_on_laundry_order_by_id,
        );
}

class WatchOptions$Subscription$liston_on_laundry_order_by_id extends graphql
    .WatchQueryOptions<Subscription$liston_on_laundry_order_by_id> {
  WatchOptions$Subscription$liston_on_laundry_order_by_id({
    String? operationName,
    required Variables$Subscription$liston_on_laundry_order_by_id variables,
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
          document: documentNodeSubscriptionliston_on_laundry_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$liston_on_laundry_order_by_id,
        );
}

class FetchMoreOptions$Subscription$liston_on_laundry_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$liston_on_laundry_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$liston_on_laundry_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionliston_on_laundry_order_by_id,
        );
}

extension ClientExtension$Subscription$liston_on_laundry_order_by_id
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$liston_on_laundry_order_by_id>>
      subscribe$liston_on_laundry_order_by_id(
              Options$Subscription$liston_on_laundry_order_by_id options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$liston_on_laundry_order_by_id>
      watchSubscription$liston_on_laundry_order_by_id(
              WatchOptions$Subscription$liston_on_laundry_order_by_id
                  options) =>
          this.watchQuery(options);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk({
    this.actual_ready_time,
    this.cancellation_time,
    this.chat_id,
    this.customer_address,
    required this.customer_app_type,
    required this.customer_id,
    this.customer_location_gps,
    required this.delivery_cost,
    required this.delivery_type,
    required this.discount_value,
    this.estimated_ready_time,
    this.firebase_id,
    this.from_customer_delivery_id,
    required this.id,
    this.notes,
    required this.order_time,
    required this.payment_type,
    required this.refund_amount,
    this.scheduled_time,
    required this.status,
    required this.store_id,
    required this.store,
    required this.stripe_fees,
    this.stripe_info,
    required this.tax,
    this.to_customer_delivery_id,
    this.review,
    required this.customer,
    required this.categories,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$actual_ready_time = json['actual_ready_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$chat_id = json['chat_id'];
    final l$customer_address = json['customer_address'];
    final l$customer_app_type = json['customer_app_type'];
    final l$customer_id = json['customer_id'];
    final l$customer_location_gps = json['customer_location_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery_type = json['delivery_type'];
    final l$discount_value = json['discount_value'];
    final l$estimated_ready_time = json['estimated_ready_time'];
    final l$firebase_id = json['firebase_id'];
    final l$from_customer_delivery_id = json['from_customer_delivery_id'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$order_time = json['order_time'];
    final l$payment_type = json['payment_type'];
    final l$refund_amount = json['refund_amount'];
    final l$scheduled_time = json['scheduled_time'];
    final l$status = json['status'];
    final l$store_id = json['store_id'];
    final l$store = json['store'];
    final l$stripe_fees = json['stripe_fees'];
    final l$stripe_info = json['stripe_info'];
    final l$tax = json['tax'];
    final l$to_customer_delivery_id = json['to_customer_delivery_id'];
    final l$review = json['review'];
    final l$customer = json['customer'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
      actual_ready_time: (l$actual_ready_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      chat_id: (l$chat_id as int?),
      customer_address: (l$customer_address as String?),
      customer_app_type: (l$customer_app_type as String),
      customer_id: (l$customer_id as int),
      customer_location_gps: l$customer_location_gps == null
          ? null
          : geographyFromJson(l$customer_location_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery_type: (l$delivery_type as String),
      discount_value: moneyFromJson(l$discount_value),
      estimated_ready_time: (l$estimated_ready_time as String?),
      firebase_id: (l$firebase_id as String?),
      from_customer_delivery_id: (l$from_customer_delivery_id as int?),
      id: (l$id as int),
      notes: (l$notes as String?),
      order_time: (l$order_time as String),
      payment_type: (l$payment_type as String),
      refund_amount: moneyFromJson(l$refund_amount),
      scheduled_time: (l$scheduled_time as String?),
      status: (l$status as String),
      store_id: (l$store_id as int),
      store:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
              .fromJson((l$store as Map<String, dynamic>)),
      stripe_fees: moneyFromJson(l$stripe_fees),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      tax: moneyFromJson(l$tax),
      to_customer_delivery_id: (l$to_customer_delivery_id as int?),
      review: l$review == null
          ? null
          : Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
              .fromJson((l$review as Map<String, dynamic>)),
      customer:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      categories: (l$categories as List<dynamic>)
          .map((e) =>
              Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_ready_time;

  final String? cancellation_time;

  final int? chat_id;

  final String? customer_address;

  final String customer_app_type;

  final int customer_id;

  final Geography? customer_location_gps;

  final double delivery_cost;

  final String delivery_type;

  final double discount_value;

  final String? estimated_ready_time;

  final String? firebase_id;

  final int? from_customer_delivery_id;

  final int id;

  final String? notes;

  final String order_time;

  final String payment_type;

  final double refund_amount;

  final String? scheduled_time;

  final String status;

  final int store_id;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
      store;

  final double stripe_fees;

  final dynamic? stripe_info;

  final double tax;

  final int? to_customer_delivery_id;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review?
      review;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
      customer;

  final List<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>
      categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_ready_time = actual_ready_time;
    _resultData['actual_ready_time'] = l$actual_ready_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_location_gps = customer_location_gps;
    _resultData['customer_location_gps'] = l$customer_location_gps == null
        ? null
        : geographyToJson(l$customer_location_gps);
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery_type = delivery_type;
    _resultData['delivery_type'] = l$delivery_type;
    final l$discount_value = discount_value;
    _resultData['discount_value'] = moneyToJson(l$discount_value);
    final l$estimated_ready_time = estimated_ready_time;
    _resultData['estimated_ready_time'] = l$estimated_ready_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$from_customer_delivery_id = from_customer_delivery_id;
    _resultData['from_customer_delivery_id'] = l$from_customer_delivery_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$scheduled_time = scheduled_time;
    _resultData['scheduled_time'] = l$scheduled_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$store = store;
    _resultData['store'] = l$store.toJson();
    final l$stripe_fees = stripe_fees;
    _resultData['stripe_fees'] = moneyToJson(l$stripe_fees);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$to_customer_delivery_id = to_customer_delivery_id;
    _resultData['to_customer_delivery_id'] = l$to_customer_delivery_id;
    final l$review = review;
    _resultData['review'] = l$review?.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$categories = categories;
    _resultData['categories'] = l$categories.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_ready_time = actual_ready_time;
    final l$cancellation_time = cancellation_time;
    final l$chat_id = chat_id;
    final l$customer_address = customer_address;
    final l$customer_app_type = customer_app_type;
    final l$customer_id = customer_id;
    final l$customer_location_gps = customer_location_gps;
    final l$delivery_cost = delivery_cost;
    final l$delivery_type = delivery_type;
    final l$discount_value = discount_value;
    final l$estimated_ready_time = estimated_ready_time;
    final l$firebase_id = firebase_id;
    final l$from_customer_delivery_id = from_customer_delivery_id;
    final l$id = id;
    final l$notes = notes;
    final l$order_time = order_time;
    final l$payment_type = payment_type;
    final l$refund_amount = refund_amount;
    final l$scheduled_time = scheduled_time;
    final l$status = status;
    final l$store_id = store_id;
    final l$store = store;
    final l$stripe_fees = stripe_fees;
    final l$stripe_info = stripe_info;
    final l$tax = tax;
    final l$to_customer_delivery_id = to_customer_delivery_id;
    final l$review = review;
    final l$customer = customer;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_ready_time,
      l$cancellation_time,
      l$chat_id,
      l$customer_address,
      l$customer_app_type,
      l$customer_id,
      l$customer_location_gps,
      l$delivery_cost,
      l$delivery_type,
      l$discount_value,
      l$estimated_ready_time,
      l$firebase_id,
      l$from_customer_delivery_id,
      l$id,
      l$notes,
      l$order_time,
      l$payment_type,
      l$refund_amount,
      l$scheduled_time,
      l$status,
      l$store_id,
      l$store,
      l$stripe_fees,
      l$stripe_info,
      l$tax,
      l$to_customer_delivery_id,
      l$review,
      l$customer,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_ready_time = actual_ready_time;
    final lOther$actual_ready_time = other.actual_ready_time;
    if (l$actual_ready_time != lOther$actual_ready_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_location_gps = customer_location_gps;
    final lOther$customer_location_gps = other.customer_location_gps;
    if (l$customer_location_gps != lOther$customer_location_gps) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery_type = delivery_type;
    final lOther$delivery_type = other.delivery_type;
    if (l$delivery_type != lOther$delivery_type) {
      return false;
    }
    final l$discount_value = discount_value;
    final lOther$discount_value = other.discount_value;
    if (l$discount_value != lOther$discount_value) {
      return false;
    }
    final l$estimated_ready_time = estimated_ready_time;
    final lOther$estimated_ready_time = other.estimated_ready_time;
    if (l$estimated_ready_time != lOther$estimated_ready_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$from_customer_delivery_id = from_customer_delivery_id;
    final lOther$from_customer_delivery_id = other.from_customer_delivery_id;
    if (l$from_customer_delivery_id != lOther$from_customer_delivery_id) {
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
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$scheduled_time = scheduled_time;
    final lOther$scheduled_time = other.scheduled_time;
    if (l$scheduled_time != lOther$scheduled_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
      return false;
    }
    final l$store = store;
    final lOther$store = other.store;
    if (l$store != lOther$store) {
      return false;
    }
    final l$stripe_fees = stripe_fees;
    final lOther$stripe_fees = other.stripe_fees;
    if (l$stripe_fees != lOther$stripe_fees) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$to_customer_delivery_id = to_customer_delivery_id;
    final lOther$to_customer_delivery_id = other.to_customer_delivery_id;
    if (l$to_customer_delivery_id != lOther$to_customer_delivery_id) {
      return false;
    }
    final l$review = review;
    final lOther$review = other.review;
    if (l$review != lOther$review) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk;

  TRes call({
    String? actual_ready_time,
    String? cancellation_time,
    int? chat_id,
    String? customer_address,
    String? customer_app_type,
    int? customer_id,
    Geography? customer_location_gps,
    double? delivery_cost,
    String? delivery_type,
    double? discount_value,
    String? estimated_ready_time,
    String? firebase_id,
    int? from_customer_delivery_id,
    int? id,
    String? notes,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    String? scheduled_time,
    String? status,
    int? store_id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store? store,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    int? to_customer_delivery_id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review?
        review,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer?
        customer,
    List<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>?
        categories,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
      TRes> get store;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
      TRes> get review;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
      TRes> get customer;
  TRes categories(
      Iterable<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories> Function(
              Iterable<
                  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
                      Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>>)
          _fn);
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk
      _instance;

  final TRes Function(
      Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_ready_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? chat_id = _undefined,
    Object? customer_address = _undefined,
    Object? customer_app_type = _undefined,
    Object? customer_id = _undefined,
    Object? customer_location_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery_type = _undefined,
    Object? discount_value = _undefined,
    Object? estimated_ready_time = _undefined,
    Object? firebase_id = _undefined,
    Object? from_customer_delivery_id = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? order_time = _undefined,
    Object? payment_type = _undefined,
    Object? refund_amount = _undefined,
    Object? scheduled_time = _undefined,
    Object? status = _undefined,
    Object? store_id = _undefined,
    Object? store = _undefined,
    Object? stripe_fees = _undefined,
    Object? stripe_info = _undefined,
    Object? tax = _undefined,
    Object? to_customer_delivery_id = _undefined,
    Object? review = _undefined,
    Object? customer = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
        actual_ready_time: actual_ready_time == _undefined
            ? _instance.actual_ready_time
            : (actual_ready_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_location_gps: customer_location_gps == _undefined
            ? _instance.customer_location_gps
            : (customer_location_gps as Geography?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery_type: delivery_type == _undefined || delivery_type == null
            ? _instance.delivery_type
            : (delivery_type as String),
        discount_value: discount_value == _undefined || discount_value == null
            ? _instance.discount_value
            : (discount_value as double),
        estimated_ready_time: estimated_ready_time == _undefined
            ? _instance.estimated_ready_time
            : (estimated_ready_time as String?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        from_customer_delivery_id: from_customer_delivery_id == _undefined
            ? _instance.from_customer_delivery_id
            : (from_customer_delivery_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        scheduled_time: scheduled_time == _undefined
            ? _instance.scheduled_time
            : (scheduled_time as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        store: store == _undefined || store == null
            ? _instance.store
            : (store
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store),
        stripe_fees: stripe_fees == _undefined || stripe_fees == null
            ? _instance.stripe_fees
            : (stripe_fees as double),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        to_customer_delivery_id: to_customer_delivery_id == _undefined
            ? _instance.to_customer_delivery_id
            : (to_customer_delivery_id as int?),
        review: review == _undefined
            ? _instance.review
            : (review
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer),
        categories: categories == _undefined || categories == null
            ? _instance.categories
            : (categories as List<
                Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
      TRes> get store {
    final local$store = _instance.store;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
        local$store, (e) => call(store: e));
  }

  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
      TRes> get review {
    final local$review = _instance.review;
    return local$review == null
        ? CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
            .stub(_then(_instance))
        : CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
            local$review, (e) => call(review: e));
  }

  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes categories(
          Iterable<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories> Function(
                  Iterable<
                      CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
                          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>>)
              _fn) =>
      call(
          categories: _fn(_instance.categories.map((e) =>
              CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? actual_ready_time,
    String? cancellation_time,
    int? chat_id,
    String? customer_address,
    String? customer_app_type,
    int? customer_id,
    Geography? customer_location_gps,
    double? delivery_cost,
    String? delivery_type,
    double? discount_value,
    String? estimated_ready_time,
    String? firebase_id,
    int? from_customer_delivery_id,
    int? id,
    String? notes,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    String? scheduled_time,
    String? status,
    int? store_id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store? store,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    int? to_customer_delivery_id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review?
        review,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer?
        customer,
    List<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>?
        categories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
          TRes>
      get store =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
              .stub(_res);
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
          TRes>
      get review =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
              .stub(_res);
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
              .stub(_res);
  categories(_fn) => _res;
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store({
    required this.name,
    required this.image,
    required this.location,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
      name: (l$name as String),
      image: (l$image as String),
      location:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store) ||
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store;

  TRes call({
    String? name,
    String? image,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location?
        location,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
      TRes> get location;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
          TRes>
      get location =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$store$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review({
    required this.created_at,
    required this.from_entity_id,
    required this.from_entity_type,
    required this.id,
    this.note,
    required this.rating,
    required this.to_entity_id,
    required this.to_entity_type,
    this.customer,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review.fromJson(
      Map<String, dynamic> json) {
    final l$created_at = json['created_at'];
    final l$from_entity_id = json['from_entity_id'];
    final l$from_entity_type = json['from_entity_type'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$rating = json['rating'];
    final l$to_entity_id = json['to_entity_id'];
    final l$to_entity_type = json['to_entity_type'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
      created_at: (l$created_at as String),
      from_entity_id: (l$from_entity_id as int),
      from_entity_type: (l$from_entity_type as String),
      id: (l$id as int),
      note: (l$note as String?),
      rating: (l$rating as int),
      to_entity_id: (l$to_entity_id as int),
      to_entity_type: (l$to_entity_type as String),
      customer: l$customer == null
          ? null
          : Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String created_at;

  final int from_entity_id;

  final String from_entity_type;

  final int id;

  final String? note;

  final int rating;

  final int to_entity_id;

  final String to_entity_type;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$from_entity_id = from_entity_id;
    _resultData['from_entity_id'] = l$from_entity_id;
    final l$from_entity_type = from_entity_type;
    _resultData['from_entity_type'] = l$from_entity_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$to_entity_id = to_entity_id;
    _resultData['to_entity_id'] = l$to_entity_id;
    final l$to_entity_type = to_entity_type;
    _resultData['to_entity_type'] = l$to_entity_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$from_entity_id = from_entity_id;
    final l$from_entity_type = from_entity_type;
    final l$id = id;
    final l$note = note;
    final l$rating = rating;
    final l$to_entity_id = to_entity_id;
    final l$to_entity_type = to_entity_type;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$created_at,
      l$from_entity_id,
      l$from_entity_type,
      l$id,
      l$note,
      l$rating,
      l$to_entity_id,
      l$to_entity_type,
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
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$from_entity_id = from_entity_id;
    final lOther$from_entity_id = other.from_entity_id;
    if (l$from_entity_id != lOther$from_entity_id) {
      return false;
    }
    final l$from_entity_type = from_entity_type;
    final lOther$from_entity_type = other.from_entity_type;
    if (l$from_entity_type != lOther$from_entity_type) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$to_entity_id = to_entity_id;
    final lOther$to_entity_id = other.to_entity_id;
    if (l$to_entity_id != lOther$to_entity_id) {
      return false;
    }
    final l$to_entity_type = to_entity_type;
    final lOther$to_entity_type = other.to_entity_type;
    if (l$to_entity_type != lOther$to_entity_type) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review;

  TRes call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review)
      _then;

  static const _undefined = {};

  TRes call({
    Object? created_at = _undefined,
    Object? from_entity_id = _undefined,
    Object? from_entity_type = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? rating = _undefined,
    Object? to_entity_id = _undefined,
    Object? to_entity_type = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
        created_at: created_at == _undefined || created_at == null
            ? _instance.created_at
            : (created_at as String),
        from_entity_id: from_entity_id == _undefined || from_entity_id == null
            ? _instance.from_entity_id
            : (from_entity_id as int),
        from_entity_type:
            from_entity_type == _undefined || from_entity_type == null
                ? _instance.from_entity_type
                : (from_entity_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        rating: rating == _undefined || rating == null
            ? _instance.rating
            : (rating as int),
        to_entity_id: to_entity_id == _undefined || to_entity_id == null
            ? _instance.to_entity_id
            : (to_entity_id as int),
        to_entity_type: to_entity_type == _undefined || to_entity_type == null
            ? _instance.to_entity_type
            : (to_entity_type as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review(
      this._res);

  TRes _res;

  call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
      user:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
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
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer;

  TRes call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer(
      this._res);

  TRes _res;

  call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user({
    this.image,
    this.name,
    required this.id,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
      user:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
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
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer;

  TRes call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
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
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories({
    required this.category_id,
    this.weight_in_kilo,
    required this.order_id,
    required this.id,
    required this.category,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories.fromJson(
      Map<String, dynamic> json) {
    final l$category_id = json['category_id'];
    final l$weight_in_kilo = json['weight_in_kilo'];
    final l$order_id = json['order_id'];
    final l$id = json['id'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
      category_id: (l$category_id as int),
      weight_in_kilo: (l$weight_in_kilo as num?)?.toDouble(),
      order_id: (l$order_id as int),
      id: (l$id as int),
      category:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
              .fromJson((l$category as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int category_id;

  final double? weight_in_kilo;

  final int order_id;

  final int id;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
      category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$weight_in_kilo = weight_in_kilo;
    _resultData['weight_in_kilo'] = l$weight_in_kilo;
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category = category;
    _resultData['category'] = l$category.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category_id = category_id;
    final l$weight_in_kilo = weight_in_kilo;
    final l$order_id = order_id;
    final l$id = id;
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$category_id,
      l$weight_in_kilo,
      l$order_id,
      l$id,
      l$category,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$weight_in_kilo = weight_in_kilo;
    final lOther$weight_in_kilo = other.weight_in_kilo;
    if (l$weight_in_kilo != lOther$weight_in_kilo) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories;

  TRes call({
    int? category_id,
    double? weight_in_kilo,
    int? order_id,
    int? id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category?
        category,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
      TRes> get category;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories)
      _then;

  static const _undefined = {};

  TRes call({
    Object? category_id = _undefined,
    Object? weight_in_kilo = _undefined,
    Object? order_id = _undefined,
    Object? id = _undefined,
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
        category_id: category_id == _undefined || category_id == null
            ? _instance.category_id
            : (category_id as int),
        weight_in_kilo: weight_in_kilo == _undefined
            ? _instance.weight_in_kilo
            : (weight_in_kilo as double?),
        order_id: order_id == _undefined || order_id == null
            ? _instance.order_id
            : (order_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category: category == _undefined || category == null
            ? _instance.category
            : (category
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
      TRes> get category {
    final local$category = _instance.category;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
        local$category, (e) => call(category: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories(
      this._res);

  TRes _res;

  call({
    int? category_id,
    double? weight_in_kilo,
    int? order_id,
    int? id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category?
        category,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
          TRes>
      get category =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category({
    required this.cost_by_kilo,
    required this.id,
    required this.name,
    required this.position,
    required this.store_id,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category.fromJson(
      Map<String, dynamic> json) {
    final l$cost_by_kilo = json['cost_by_kilo'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$store_id = json['store_id'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
      cost_by_kilo: moneyFromJson(l$cost_by_kilo),
      id: (l$id as int),
      name:
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
              .fromJson((l$name as Map<String, dynamic>)),
      position: (l$position as int),
      store_id: (l$store_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_by_kilo;

  final int id;

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
      name;

  final int position;

  final int store_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_by_kilo = cost_by_kilo;
    _resultData['cost_by_kilo'] = moneyToJson(l$cost_by_kilo);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_by_kilo = cost_by_kilo;
    final l$id = id;
    final l$name = name;
    final l$position = position;
    final l$store_id = store_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_by_kilo,
      l$id,
      l$name,
      l$position,
      l$store_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_by_kilo = cost_by_kilo;
    final lOther$cost_by_kilo = other.cost_by_kilo;
    if (l$cost_by_kilo != lOther$cost_by_kilo) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category;

  TRes call({
    double? cost_by_kilo,
    int? id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name?
        name,
    int? position,
    int? store_id,
    String? $__typename,
  });
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_by_kilo = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? store_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
        cost_by_kilo: cost_by_kilo == _undefined || cost_by_kilo == null
            ? _instance.cost_by_kilo
            : (cost_by_kilo as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category(
      this._res);

  TRes _res;

  call({
    double? cost_by_kilo,
    int? id,
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name?
        name,
    int? position,
    int? store_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
          TRes>
      get name =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
              .stub(_res);
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>
      translations;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name;

  TRes call({
    List<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
                      Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
                          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations {
  Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
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
            is Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations) ||
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

extension UtilityExtension$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
    on Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations {
  CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>
      get copyWith =>
          CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
    TRes> {
  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
    Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
        instance,
    TRes Function(
            Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations;

  factory CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
      _instance;

  final TRes Function(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
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

class _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
        TRes>
    implements
        CopyWith$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$liston_on_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_laundry_order_by_id {
  factory Variables$Query$get_laundry_order_by_id({required int orderId}) =>
      Variables$Query$get_laundry_order_by_id._({
        r'orderId': orderId,
      });

  Variables$Query$get_laundry_order_by_id._(this._$data);

  factory Variables$Query$get_laundry_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_laundry_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_laundry_order_by_id<
          Variables$Query$get_laundry_order_by_id>
      get copyWith => CopyWith$Variables$Query$get_laundry_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_laundry_order_by_id) ||
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

abstract class CopyWith$Variables$Query$get_laundry_order_by_id<TRes> {
  factory CopyWith$Variables$Query$get_laundry_order_by_id(
    Variables$Query$get_laundry_order_by_id instance,
    TRes Function(Variables$Query$get_laundry_order_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_laundry_order_by_id;

  factory CopyWith$Variables$Query$get_laundry_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_laundry_order_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_laundry_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_laundry_order_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_laundry_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_laundry_order_by_id _instance;

  final TRes Function(Variables$Query$get_laundry_order_by_id) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_laundry_order_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_laundry_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_laundry_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_laundry_order_by_id(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_laundry_order_by_id {
  Query$get_laundry_order_by_id({
    this.laundry_order_by_pk,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id.fromJson(Map<String, dynamic> json) {
    final l$laundry_order_by_pk = json['laundry_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id(
      laundry_order_by_pk: l$laundry_order_by_pk == null
          ? null
          : Query$get_laundry_order_by_id$laundry_order_by_pk.fromJson(
              (l$laundry_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_laundry_order_by_id$laundry_order_by_pk? laundry_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order_by_pk = laundry_order_by_pk;
    _resultData['laundry_order_by_pk'] = l$laundry_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order_by_pk = laundry_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$laundry_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order_by_pk = laundry_order_by_pk;
    final lOther$laundry_order_by_pk = other.laundry_order_by_pk;
    if (l$laundry_order_by_pk != lOther$laundry_order_by_pk) {
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

extension UtilityExtension$Query$get_laundry_order_by_id
    on Query$get_laundry_order_by_id {
  CopyWith$Query$get_laundry_order_by_id<Query$get_laundry_order_by_id>
      get copyWith => CopyWith$Query$get_laundry_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id<TRes> {
  factory CopyWith$Query$get_laundry_order_by_id(
    Query$get_laundry_order_by_id instance,
    TRes Function(Query$get_laundry_order_by_id) then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id;

  factory CopyWith$Query$get_laundry_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id;

  TRes call({
    Query$get_laundry_order_by_id$laundry_order_by_pk? laundry_order_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk;
}

class _CopyWithImpl$Query$get_laundry_order_by_id<TRes>
    implements CopyWith$Query$get_laundry_order_by_id<TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id _instance;

  final TRes Function(Query$get_laundry_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id(
        laundry_order_by_pk: laundry_order_by_pk == _undefined
            ? _instance.laundry_order_by_pk
            : (laundry_order_by_pk
                as Query$get_laundry_order_by_id$laundry_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk {
    final local$laundry_order_by_pk = _instance.laundry_order_by_pk;
    return local$laundry_order_by_pk == null
        ? CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk(
            local$laundry_order_by_pk, (e) => call(laundry_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id<TRes>
    implements CopyWith$Query$get_laundry_order_by_id<TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id(this._res);

  TRes _res;

  call({
    Query$get_laundry_order_by_id$laundry_order_by_pk? laundry_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes>
      get laundry_order_by_pk =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk.stub(_res);
}

const documentNodeQueryget_laundry_order_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_laundry_order_by_id'),
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
        name: NameNode(value: 'laundry_order_by_pk'),
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
            name: NameNode(value: 'actual_ready_time'),
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
            name: NameNode(value: 'chat_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_address'),
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
            name: NameNode(value: 'customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_location_gps'),
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
            name: NameNode(value: 'delivery_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'discount_value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_ready_time'),
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
            name: NameNode(value: 'from_customer_delivery_id'),
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
            name: NameNode(value: 'order_time'),
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
            name: NameNode(value: 'refund_amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'scheduled_time'),
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
            name: NameNode(value: 'store_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'store'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
            name: NameNode(value: 'stripe_fees'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_info'),
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
            name: NameNode(value: 'to_customer_delivery_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'created_at'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_type'),
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
                name: NameNode(value: 'note'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_type'),
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
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'category_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'weight_in_kilo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'order_id'),
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
                name: NameNode(value: 'category'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'cost_by_kilo'),
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
                  FieldNode(
                    name: NameNode(value: 'position'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'store_id'),
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
Query$get_laundry_order_by_id _parserFn$Query$get_laundry_order_by_id(
        Map<String, dynamic> data) =>
    Query$get_laundry_order_by_id.fromJson(data);

class Options$Query$get_laundry_order_by_id
    extends graphql.QueryOptions<Query$get_laundry_order_by_id> {
  Options$Query$get_laundry_order_by_id({
    String? operationName,
    required Variables$Query$get_laundry_order_by_id variables,
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
          document: documentNodeQueryget_laundry_order_by_id,
          parserFn: _parserFn$Query$get_laundry_order_by_id,
        );
}

class WatchOptions$Query$get_laundry_order_by_id
    extends graphql.WatchQueryOptions<Query$get_laundry_order_by_id> {
  WatchOptions$Query$get_laundry_order_by_id({
    String? operationName,
    required Variables$Query$get_laundry_order_by_id variables,
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
          document: documentNodeQueryget_laundry_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_laundry_order_by_id,
        );
}

class FetchMoreOptions$Query$get_laundry_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_laundry_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_laundry_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_laundry_order_by_id,
        );
}

extension ClientExtension$Query$get_laundry_order_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_laundry_order_by_id>>
      query$get_laundry_order_by_id(
              Options$Query$get_laundry_order_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_laundry_order_by_id>
      watchQuery$get_laundry_order_by_id(
              WatchOptions$Query$get_laundry_order_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_laundry_order_by_id({
    required Query$get_laundry_order_by_id data,
    required Variables$Query$get_laundry_order_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_laundry_order_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_laundry_order_by_id? readQuery$get_laundry_order_by_id({
    required Variables$Query$get_laundry_order_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_laundry_order_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_laundry_order_by_id.fromJson(result);
  }
}

class Query$get_laundry_order_by_id$laundry_order_by_pk {
  Query$get_laundry_order_by_id$laundry_order_by_pk({
    this.actual_ready_time,
    this.cancellation_time,
    this.chat_id,
    this.customer_address,
    required this.customer_app_type,
    required this.customer_id,
    this.customer_location_gps,
    required this.delivery_cost,
    required this.delivery_type,
    required this.discount_value,
    this.estimated_ready_time,
    this.firebase_id,
    this.from_customer_delivery_id,
    required this.id,
    this.notes,
    required this.order_time,
    required this.payment_type,
    required this.refund_amount,
    this.scheduled_time,
    required this.status,
    required this.store_id,
    required this.store,
    required this.stripe_fees,
    this.stripe_info,
    required this.tax,
    this.to_customer_delivery_id,
    this.review,
    required this.customer,
    required this.categories,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$actual_ready_time = json['actual_ready_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$chat_id = json['chat_id'];
    final l$customer_address = json['customer_address'];
    final l$customer_app_type = json['customer_app_type'];
    final l$customer_id = json['customer_id'];
    final l$customer_location_gps = json['customer_location_gps'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery_type = json['delivery_type'];
    final l$discount_value = json['discount_value'];
    final l$estimated_ready_time = json['estimated_ready_time'];
    final l$firebase_id = json['firebase_id'];
    final l$from_customer_delivery_id = json['from_customer_delivery_id'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$order_time = json['order_time'];
    final l$payment_type = json['payment_type'];
    final l$refund_amount = json['refund_amount'];
    final l$scheduled_time = json['scheduled_time'];
    final l$status = json['status'];
    final l$store_id = json['store_id'];
    final l$store = json['store'];
    final l$stripe_fees = json['stripe_fees'];
    final l$stripe_info = json['stripe_info'];
    final l$tax = json['tax'];
    final l$to_customer_delivery_id = json['to_customer_delivery_id'];
    final l$review = json['review'];
    final l$customer = json['customer'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk(
      actual_ready_time: (l$actual_ready_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      chat_id: (l$chat_id as int?),
      customer_address: (l$customer_address as String?),
      customer_app_type: (l$customer_app_type as String),
      customer_id: (l$customer_id as int),
      customer_location_gps: l$customer_location_gps == null
          ? null
          : geographyFromJson(l$customer_location_gps),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery_type: (l$delivery_type as String),
      discount_value: moneyFromJson(l$discount_value),
      estimated_ready_time: (l$estimated_ready_time as String?),
      firebase_id: (l$firebase_id as String?),
      from_customer_delivery_id: (l$from_customer_delivery_id as int?),
      id: (l$id as int),
      notes: (l$notes as String?),
      order_time: (l$order_time as String),
      payment_type: (l$payment_type as String),
      refund_amount: moneyFromJson(l$refund_amount),
      scheduled_time: (l$scheduled_time as String?),
      status: (l$status as String),
      store_id: (l$store_id as int),
      store: Query$get_laundry_order_by_id$laundry_order_by_pk$store.fromJson(
          (l$store as Map<String, dynamic>)),
      stripe_fees: moneyFromJson(l$stripe_fees),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      tax: moneyFromJson(l$tax),
      to_customer_delivery_id: (l$to_customer_delivery_id as int?),
      review: l$review == null
          ? null
          : Query$get_laundry_order_by_id$laundry_order_by_pk$review.fromJson(
              (l$review as Map<String, dynamic>)),
      customer:
          Query$get_laundry_order_by_id$laundry_order_by_pk$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      categories: (l$categories as List<dynamic>)
          .map((e) =>
              Query$get_laundry_order_by_id$laundry_order_by_pk$categories
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_ready_time;

  final String? cancellation_time;

  final int? chat_id;

  final String? customer_address;

  final String customer_app_type;

  final int customer_id;

  final Geography? customer_location_gps;

  final double delivery_cost;

  final String delivery_type;

  final double discount_value;

  final String? estimated_ready_time;

  final String? firebase_id;

  final int? from_customer_delivery_id;

  final int id;

  final String? notes;

  final String order_time;

  final String payment_type;

  final double refund_amount;

  final String? scheduled_time;

  final String status;

  final int store_id;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$store store;

  final double stripe_fees;

  final dynamic? stripe_info;

  final double tax;

  final int? to_customer_delivery_id;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review? review;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$customer customer;

  final List<Query$get_laundry_order_by_id$laundry_order_by_pk$categories>
      categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_ready_time = actual_ready_time;
    _resultData['actual_ready_time'] = l$actual_ready_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_location_gps = customer_location_gps;
    _resultData['customer_location_gps'] = l$customer_location_gps == null
        ? null
        : geographyToJson(l$customer_location_gps);
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery_type = delivery_type;
    _resultData['delivery_type'] = l$delivery_type;
    final l$discount_value = discount_value;
    _resultData['discount_value'] = moneyToJson(l$discount_value);
    final l$estimated_ready_time = estimated_ready_time;
    _resultData['estimated_ready_time'] = l$estimated_ready_time;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$from_customer_delivery_id = from_customer_delivery_id;
    _resultData['from_customer_delivery_id'] = l$from_customer_delivery_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$scheduled_time = scheduled_time;
    _resultData['scheduled_time'] = l$scheduled_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$store = store;
    _resultData['store'] = l$store.toJson();
    final l$stripe_fees = stripe_fees;
    _resultData['stripe_fees'] = moneyToJson(l$stripe_fees);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$to_customer_delivery_id = to_customer_delivery_id;
    _resultData['to_customer_delivery_id'] = l$to_customer_delivery_id;
    final l$review = review;
    _resultData['review'] = l$review?.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$categories = categories;
    _resultData['categories'] = l$categories.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_ready_time = actual_ready_time;
    final l$cancellation_time = cancellation_time;
    final l$chat_id = chat_id;
    final l$customer_address = customer_address;
    final l$customer_app_type = customer_app_type;
    final l$customer_id = customer_id;
    final l$customer_location_gps = customer_location_gps;
    final l$delivery_cost = delivery_cost;
    final l$delivery_type = delivery_type;
    final l$discount_value = discount_value;
    final l$estimated_ready_time = estimated_ready_time;
    final l$firebase_id = firebase_id;
    final l$from_customer_delivery_id = from_customer_delivery_id;
    final l$id = id;
    final l$notes = notes;
    final l$order_time = order_time;
    final l$payment_type = payment_type;
    final l$refund_amount = refund_amount;
    final l$scheduled_time = scheduled_time;
    final l$status = status;
    final l$store_id = store_id;
    final l$store = store;
    final l$stripe_fees = stripe_fees;
    final l$stripe_info = stripe_info;
    final l$tax = tax;
    final l$to_customer_delivery_id = to_customer_delivery_id;
    final l$review = review;
    final l$customer = customer;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_ready_time,
      l$cancellation_time,
      l$chat_id,
      l$customer_address,
      l$customer_app_type,
      l$customer_id,
      l$customer_location_gps,
      l$delivery_cost,
      l$delivery_type,
      l$discount_value,
      l$estimated_ready_time,
      l$firebase_id,
      l$from_customer_delivery_id,
      l$id,
      l$notes,
      l$order_time,
      l$payment_type,
      l$refund_amount,
      l$scheduled_time,
      l$status,
      l$store_id,
      l$store,
      l$stripe_fees,
      l$stripe_info,
      l$tax,
      l$to_customer_delivery_id,
      l$review,
      l$customer,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_order_by_id$laundry_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_ready_time = actual_ready_time;
    final lOther$actual_ready_time = other.actual_ready_time;
    if (l$actual_ready_time != lOther$actual_ready_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_location_gps = customer_location_gps;
    final lOther$customer_location_gps = other.customer_location_gps;
    if (l$customer_location_gps != lOther$customer_location_gps) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$delivery_type = delivery_type;
    final lOther$delivery_type = other.delivery_type;
    if (l$delivery_type != lOther$delivery_type) {
      return false;
    }
    final l$discount_value = discount_value;
    final lOther$discount_value = other.discount_value;
    if (l$discount_value != lOther$discount_value) {
      return false;
    }
    final l$estimated_ready_time = estimated_ready_time;
    final lOther$estimated_ready_time = other.estimated_ready_time;
    if (l$estimated_ready_time != lOther$estimated_ready_time) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$from_customer_delivery_id = from_customer_delivery_id;
    final lOther$from_customer_delivery_id = other.from_customer_delivery_id;
    if (l$from_customer_delivery_id != lOther$from_customer_delivery_id) {
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
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$refund_amount = refund_amount;
    final lOther$refund_amount = other.refund_amount;
    if (l$refund_amount != lOther$refund_amount) {
      return false;
    }
    final l$scheduled_time = scheduled_time;
    final lOther$scheduled_time = other.scheduled_time;
    if (l$scheduled_time != lOther$scheduled_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
      return false;
    }
    final l$store = store;
    final lOther$store = other.store;
    if (l$store != lOther$store) {
      return false;
    }
    final l$stripe_fees = stripe_fees;
    final lOther$stripe_fees = other.stripe_fees;
    if (l$stripe_fees != lOther$stripe_fees) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$to_customer_delivery_id = to_customer_delivery_id;
    final lOther$to_customer_delivery_id = other.to_customer_delivery_id;
    if (l$to_customer_delivery_id != lOther$to_customer_delivery_id) {
      return false;
    }
    final l$review = review;
    final lOther$review = other.review;
    if (l$review != lOther$review) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk
    on Query$get_laundry_order_by_id$laundry_order_by_pk {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<
          Query$get_laundry_order_by_id$laundry_order_by_pk>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk(
    Query$get_laundry_order_by_id$laundry_order_by_pk instance,
    TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk) then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk;

  TRes call({
    String? actual_ready_time,
    String? cancellation_time,
    int? chat_id,
    String? customer_address,
    String? customer_app_type,
    int? customer_id,
    Geography? customer_location_gps,
    double? delivery_cost,
    String? delivery_type,
    double? discount_value,
    String? estimated_ready_time,
    String? firebase_id,
    int? from_customer_delivery_id,
    int? id,
    String? notes,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    String? scheduled_time,
    String? status,
    int? store_id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$store? store,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    int? to_customer_delivery_id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$review? review,
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer? customer,
    List<Query$get_laundry_order_by_id$laundry_order_by_pk$categories>?
        categories,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<TRes>
      get store;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<TRes>
      get review;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<TRes>
      get customer;
  TRes categories(
      Iterable<Query$get_laundry_order_by_id$laundry_order_by_pk$categories> Function(
              Iterable<
                  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
                      Query$get_laundry_order_by_id$laundry_order_by_pk$categories>>)
          _fn);
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk _instance;

  final TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_ready_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? chat_id = _undefined,
    Object? customer_address = _undefined,
    Object? customer_app_type = _undefined,
    Object? customer_id = _undefined,
    Object? customer_location_gps = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery_type = _undefined,
    Object? discount_value = _undefined,
    Object? estimated_ready_time = _undefined,
    Object? firebase_id = _undefined,
    Object? from_customer_delivery_id = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? order_time = _undefined,
    Object? payment_type = _undefined,
    Object? refund_amount = _undefined,
    Object? scheduled_time = _undefined,
    Object? status = _undefined,
    Object? store_id = _undefined,
    Object? store = _undefined,
    Object? stripe_fees = _undefined,
    Object? stripe_info = _undefined,
    Object? tax = _undefined,
    Object? to_customer_delivery_id = _undefined,
    Object? review = _undefined,
    Object? customer = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk(
        actual_ready_time: actual_ready_time == _undefined
            ? _instance.actual_ready_time
            : (actual_ready_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_location_gps: customer_location_gps == _undefined
            ? _instance.customer_location_gps
            : (customer_location_gps as Geography?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery_type: delivery_type == _undefined || delivery_type == null
            ? _instance.delivery_type
            : (delivery_type as String),
        discount_value: discount_value == _undefined || discount_value == null
            ? _instance.discount_value
            : (discount_value as double),
        estimated_ready_time: estimated_ready_time == _undefined
            ? _instance.estimated_ready_time
            : (estimated_ready_time as String?),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        from_customer_delivery_id: from_customer_delivery_id == _undefined
            ? _instance.from_customer_delivery_id
            : (from_customer_delivery_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        scheduled_time: scheduled_time == _undefined
            ? _instance.scheduled_time
            : (scheduled_time as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        store: store == _undefined || store == null
            ? _instance.store
            : (store
                as Query$get_laundry_order_by_id$laundry_order_by_pk$store),
        stripe_fees: stripe_fees == _undefined || stripe_fees == null
            ? _instance.stripe_fees
            : (stripe_fees as double),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        to_customer_delivery_id: to_customer_delivery_id == _undefined
            ? _instance.to_customer_delivery_id
            : (to_customer_delivery_id as int?),
        review: review == _undefined
            ? _instance.review
            : (review
                as Query$get_laundry_order_by_id$laundry_order_by_pk$review?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_laundry_order_by_id$laundry_order_by_pk$customer),
        categories: categories == _undefined || categories == null
            ? _instance.categories
            : (categories as List<
                Query$get_laundry_order_by_id$laundry_order_by_pk$categories>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<TRes>
      get store {
    final local$store = _instance.store;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store(
        local$store, (e) => call(store: e));
  }

  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<TRes>
      get review {
    final local$review = _instance.review;
    return local$review == null
        ? CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review
            .stub(_then(_instance))
        : CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review(
            local$review, (e) => call(review: e));
  }

  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes categories(
          Iterable<Query$get_laundry_order_by_id$laundry_order_by_pk$categories> Function(
                  Iterable<
                      CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
                          Query$get_laundry_order_by_id$laundry_order_by_pk$categories>>)
              _fn) =>
      call(
          categories: _fn(_instance.categories.map((e) =>
              CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? actual_ready_time,
    String? cancellation_time,
    int? chat_id,
    String? customer_address,
    String? customer_app_type,
    int? customer_id,
    Geography? customer_location_gps,
    double? delivery_cost,
    String? delivery_type,
    double? discount_value,
    String? estimated_ready_time,
    String? firebase_id,
    int? from_customer_delivery_id,
    int? id,
    String? notes,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    String? scheduled_time,
    String? status,
    int? store_id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$store? store,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    int? to_customer_delivery_id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$review? review,
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer? customer,
    List<Query$get_laundry_order_by_id$laundry_order_by_pk$categories>?
        categories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<TRes>
      get store =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store.stub(
              _res);
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<TRes>
      get review =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review
              .stub(_res);
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<TRes>
      get customer =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer
              .stub(_res);
  categories(_fn) => _res;
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$store {
  Query$get_laundry_order_by_id$laundry_order_by_pk$store({
    required this.name,
    required this.image,
    required this.location,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$store.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$store(
      name: (l$name as String),
      image: (l$image as String),
      location: Query$get_laundry_order_by_id$laundry_order_by_pk$store$location
          .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$store$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_order_by_id$laundry_order_by_pk$store) ||
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
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$store
    on Query$get_laundry_order_by_id$laundry_order_by_pk$store {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<
          Query$get_laundry_order_by_id$laundry_order_by_pk$store>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store(
    Query$get_laundry_order_by_id$laundry_order_by_pk$store instance,
    TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$store) then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store;

  TRes call({
    String? name,
    String? image,
    Query$get_laundry_order_by_id$laundry_order_by_pk$store$location? location,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$store _instance;

  final TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$store)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$store(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_laundry_order_by_id$laundry_order_by_pk$store$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store<TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    Query$get_laundry_order_by_id$laundry_order_by_pk$store$location? location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
          TRes>
      get location =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$store$location {
  Query$get_laundry_order_by_id$laundry_order_by_pk$store$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$store$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_laundry_order_by_id$laundry_order_by_pk$store$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location
    on Query$get_laundry_order_by_id$laundry_order_by_pk$store$location {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
          Query$get_laundry_order_by_id$laundry_order_by_pk$store$location>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
    Query$get_laundry_order_by_id$laundry_order_by_pk$store$location instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$store$location)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$store$location
      _instance;

  final TRes Function(
      Query$get_laundry_order_by_id$laundry_order_by_pk$store$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$store$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$review {
  Query$get_laundry_order_by_id$laundry_order_by_pk$review({
    required this.created_at,
    required this.from_entity_id,
    required this.from_entity_type,
    required this.id,
    this.note,
    required this.rating,
    required this.to_entity_id,
    required this.to_entity_type,
    this.customer,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$review.fromJson(
      Map<String, dynamic> json) {
    final l$created_at = json['created_at'];
    final l$from_entity_id = json['from_entity_id'];
    final l$from_entity_type = json['from_entity_type'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$rating = json['rating'];
    final l$to_entity_id = json['to_entity_id'];
    final l$to_entity_type = json['to_entity_type'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$review(
      created_at: (l$created_at as String),
      from_entity_id: (l$from_entity_id as int),
      from_entity_type: (l$from_entity_type as String),
      id: (l$id as int),
      note: (l$note as String?),
      rating: (l$rating as int),
      to_entity_id: (l$to_entity_id as int),
      to_entity_type: (l$to_entity_type as String),
      customer: l$customer == null
          ? null
          : Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String created_at;

  final int from_entity_id;

  final String from_entity_type;

  final int id;

  final String? note;

  final int rating;

  final int to_entity_id;

  final String to_entity_type;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$from_entity_id = from_entity_id;
    _resultData['from_entity_id'] = l$from_entity_id;
    final l$from_entity_type = from_entity_type;
    _resultData['from_entity_type'] = l$from_entity_type;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$to_entity_id = to_entity_id;
    _resultData['to_entity_id'] = l$to_entity_id;
    final l$to_entity_type = to_entity_type;
    _resultData['to_entity_type'] = l$to_entity_type;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$from_entity_id = from_entity_id;
    final l$from_entity_type = from_entity_type;
    final l$id = id;
    final l$note = note;
    final l$rating = rating;
    final l$to_entity_id = to_entity_id;
    final l$to_entity_type = to_entity_type;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$created_at,
      l$from_entity_id,
      l$from_entity_type,
      l$id,
      l$note,
      l$rating,
      l$to_entity_id,
      l$to_entity_type,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_order_by_id$laundry_order_by_pk$review) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$from_entity_id = from_entity_id;
    final lOther$from_entity_id = other.from_entity_id;
    if (l$from_entity_id != lOther$from_entity_id) {
      return false;
    }
    final l$from_entity_type = from_entity_type;
    final lOther$from_entity_type = other.from_entity_type;
    if (l$from_entity_type != lOther$from_entity_type) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$to_entity_id = to_entity_id;
    final lOther$to_entity_id = other.to_entity_id;
    if (l$to_entity_id != lOther$to_entity_id) {
      return false;
    }
    final l$to_entity_type = to_entity_type;
    final lOther$to_entity_type = other.to_entity_type;
    if (l$to_entity_type != lOther$to_entity_type) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$review
    on Query$get_laundry_order_by_id$laundry_order_by_pk$review {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
          Query$get_laundry_order_by_id$laundry_order_by_pk$review>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review(
    Query$get_laundry_order_by_id$laundry_order_by_pk$review instance,
    TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$review)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review;

  TRes call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
      TRes> get customer;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review _instance;

  final TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$review)
      _then;

  static const _undefined = {};

  TRes call({
    Object? created_at = _undefined,
    Object? from_entity_id = _undefined,
    Object? from_entity_type = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? rating = _undefined,
    Object? to_entity_id = _undefined,
    Object? to_entity_type = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$review(
        created_at: created_at == _undefined || created_at == null
            ? _instance.created_at
            : (created_at as String),
        from_entity_id: from_entity_id == _undefined || from_entity_id == null
            ? _instance.from_entity_id
            : (from_entity_id as int),
        from_entity_type:
            from_entity_type == _undefined || from_entity_type == null
                ? _instance.from_entity_type
                : (from_entity_type as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        note: note == _undefined ? _instance.note : (note as String?),
        rating: rating == _undefined || rating == null
            ? _instance.rating
            : (rating as int),
        to_entity_id: to_entity_id == _undefined || to_entity_id == null
            ? _instance.to_entity_id
            : (to_entity_id as int),
        to_entity_type: to_entity_type == _undefined || to_entity_type == null
            ? _instance.to_entity_type
            : (to_entity_type as String),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer
            .stub(_then(_instance))
        : CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review(
      this._res);

  TRes _res;

  call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
          TRes>
      get customer =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer {
  Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
      user:
          Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
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
            is Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer
    on Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
          Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer;

  TRes call({
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer
      _instance;

  final TRes Function(
      Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer(
      this._res);

  TRes _res;

  call({
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user {
  Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user({
    this.image,
    this.name,
    required this.id,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
      image: (l$image as String?),
      name: (l$name as String?),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? image;

  final String? name;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
    on Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
          Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
    Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
        instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user
      _instance;

  final TRes Function(
          Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$review$customer$user(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$customer {
  Query$get_laundry_order_by_id$laundry_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
      user: Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user user;

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
            is Query$get_laundry_order_by_id$laundry_order_by_pk$customer) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$customer
    on Query$get_laundry_order_by_id$laundry_order_by_pk$customer {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
          Query$get_laundry_order_by_id$laundry_order_by_pk$customer>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer instance,
    TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$customer)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer;

  TRes call({
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$customer _instance;

  final TRes Function(
      Query$get_laundry_order_by_id$laundry_order_by_pk$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<TRes>
      get user =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user {
  Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
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
            is Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user
    on Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
          Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
    Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user
      _instance;

  final TRes Function(
      Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$categories {
  Query$get_laundry_order_by_id$laundry_order_by_pk$categories({
    required this.category_id,
    this.weight_in_kilo,
    required this.order_id,
    required this.id,
    required this.category,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$categories.fromJson(
      Map<String, dynamic> json) {
    final l$category_id = json['category_id'];
    final l$weight_in_kilo = json['weight_in_kilo'];
    final l$order_id = json['order_id'];
    final l$id = json['id'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
      category_id: (l$category_id as int),
      weight_in_kilo: (l$weight_in_kilo as num?)?.toDouble(),
      order_id: (l$order_id as int),
      id: (l$id as int),
      category:
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
              .fromJson((l$category as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int category_id;

  final double? weight_in_kilo;

  final int order_id;

  final int id;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
      category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$weight_in_kilo = weight_in_kilo;
    _resultData['weight_in_kilo'] = l$weight_in_kilo;
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category = category;
    _resultData['category'] = l$category.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category_id = category_id;
    final l$weight_in_kilo = weight_in_kilo;
    final l$order_id = order_id;
    final l$id = id;
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$category_id,
      l$weight_in_kilo,
      l$order_id,
      l$id,
      l$category,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_laundry_order_by_id$laundry_order_by_pk$categories) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$weight_in_kilo = weight_in_kilo;
    final lOther$weight_in_kilo = other.weight_in_kilo;
    if (l$weight_in_kilo != lOther$weight_in_kilo) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$categories
    on Query$get_laundry_order_by_id$laundry_order_by_pk$categories {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories instance,
    TRes Function(Query$get_laundry_order_by_id$laundry_order_by_pk$categories)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories;

  TRes call({
    int? category_id,
    double? weight_in_kilo,
    int? order_id,
    int? id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category?
        category,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
      TRes> get category;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories _instance;

  final TRes Function(
      Query$get_laundry_order_by_id$laundry_order_by_pk$categories) _then;

  static const _undefined = {};

  TRes call({
    Object? category_id = _undefined,
    Object? weight_in_kilo = _undefined,
    Object? order_id = _undefined,
    Object? id = _undefined,
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
        category_id: category_id == _undefined || category_id == null
            ? _instance.category_id
            : (category_id as int),
        weight_in_kilo: weight_in_kilo == _undefined
            ? _instance.weight_in_kilo
            : (weight_in_kilo as double?),
        order_id: order_id == _undefined || order_id == null
            ? _instance.order_id
            : (order_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category: category == _undefined || category == null
            ? _instance.category
            : (category
                as Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
      TRes> get category {
    final local$category = _instance.category;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
        local$category, (e) => call(category: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories(
      this._res);

  TRes _res;

  call({
    int? category_id,
    double? weight_in_kilo,
    int? order_id,
    int? id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category?
        category,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
          TRes>
      get category =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category {
  Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category({
    required this.cost_by_kilo,
    required this.id,
    required this.name,
    required this.position,
    required this.store_id,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category.fromJson(
      Map<String, dynamic> json) {
    final l$cost_by_kilo = json['cost_by_kilo'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$store_id = json['store_id'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
      cost_by_kilo: moneyFromJson(l$cost_by_kilo),
      id: (l$id as int),
      name:
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
              .fromJson((l$name as Map<String, dynamic>)),
      position: (l$position as int),
      store_id: (l$store_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_by_kilo;

  final int id;

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
      name;

  final int position;

  final int store_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_by_kilo = cost_by_kilo;
    _resultData['cost_by_kilo'] = moneyToJson(l$cost_by_kilo);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$store_id = store_id;
    _resultData['store_id'] = l$store_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_by_kilo = cost_by_kilo;
    final l$id = id;
    final l$name = name;
    final l$position = position;
    final l$store_id = store_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_by_kilo,
      l$id,
      l$name,
      l$position,
      l$store_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_by_kilo = cost_by_kilo;
    final lOther$cost_by_kilo = other.cost_by_kilo;
    if (l$cost_by_kilo != lOther$cost_by_kilo) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$store_id = store_id;
    final lOther$store_id = other.store_id;
    if (l$store_id != lOther$store_id) {
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
    on Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
        instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category;

  TRes call({
    double? cost_by_kilo,
    int? id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name?
        name,
    int? position,
    int? store_id,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
      TRes> get name;
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category
      _instance;

  final TRes Function(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category)
      _then;

  static const _undefined = {};

  TRes call({
    Object? cost_by_kilo = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? store_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
        cost_by_kilo: cost_by_kilo == _undefined || cost_by_kilo == null
            ? _instance.cost_by_kilo
            : (cost_by_kilo as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        store_id: store_id == _undefined || store_id == null
            ? _instance.store_id
            : (store_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category(
      this._res);

  TRes _res;

  call({
    double? cost_by_kilo,
    int? id,
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name?
        name,
    int? position,
    int? store_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
          TRes>
      get name =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
              .stub(_res);
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name {
  Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>
      translations;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
    on Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
        instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name;

  TRes call({
    List<Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
                      Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name
      _instance;

  final TRes Function(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
                          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations {
  Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
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
            is Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations) ||
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

extension UtilityExtension$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
    on Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations {
  CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations>
      get copyWith =>
          CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
    TRes> {
  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
    Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
        instance,
    TRes Function(
            Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations;

  factory CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations
      _instance;

  final TRes Function(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
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

class _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
        TRes>
    implements
        CopyWith$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_laundry_order_by_id$laundry_order_by_pk$categories$category$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_laundry_orders {
  factory Variables$Query$get_laundry_orders({
    required int laundryStoreId,
    required bool inProcess,
  }) =>
      Variables$Query$get_laundry_orders._({
        r'laundryStoreId': laundryStoreId,
        r'inProcess': inProcess,
      });

  Variables$Query$get_laundry_orders._(this._$data);

  factory Variables$Query$get_laundry_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$laundryStoreId = data['laundryStoreId'];
    result$data['laundryStoreId'] = (l$laundryStoreId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    return Variables$Query$get_laundry_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get laundryStoreId => (_$data['laundryStoreId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$laundryStoreId = laundryStoreId;
    result$data['laundryStoreId'] = l$laundryStoreId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
    return result$data;
  }

  CopyWith$Variables$Query$get_laundry_orders<
          Variables$Query$get_laundry_orders>
      get copyWith => CopyWith$Variables$Query$get_laundry_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_laundry_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundryStoreId = laundryStoreId;
    final lOther$laundryStoreId = other.laundryStoreId;
    if (l$laundryStoreId != lOther$laundryStoreId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$laundryStoreId = laundryStoreId;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$laundryStoreId,
      l$inProcess,
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_laundry_orders<TRes> {
  factory CopyWith$Variables$Query$get_laundry_orders(
    Variables$Query$get_laundry_orders instance,
    TRes Function(Variables$Query$get_laundry_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_laundry_orders;

  factory CopyWith$Variables$Query$get_laundry_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_laundry_orders;

  TRes call({
    int? laundryStoreId,
    bool? inProcess,
  });
}

class _CopyWithImpl$Variables$Query$get_laundry_orders<TRes>
    implements CopyWith$Variables$Query$get_laundry_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_laundry_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_laundry_orders _instance;

  final TRes Function(Variables$Query$get_laundry_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? laundryStoreId = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Query$get_laundry_orders._({
        ..._instance._$data,
        if (laundryStoreId != _undefined && laundryStoreId != null)
          'laundryStoreId': (laundryStoreId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_laundry_orders<TRes>
    implements CopyWith$Variables$Query$get_laundry_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_laundry_orders(this._res);

  TRes _res;

  call({
    int? laundryStoreId,
    bool? inProcess,
  }) =>
      _res;
}

class Query$get_laundry_orders {
  Query$get_laundry_orders({
    required this.laundry_order,
    required this.$__typename,
  });

  factory Query$get_laundry_orders.fromJson(Map<String, dynamic> json) {
    final l$laundry_order = json['laundry_order'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_orders(
      laundry_order: (l$laundry_order as List<dynamic>)
          .map((e) => Query$get_laundry_orders$laundry_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_laundry_orders$laundry_order> laundry_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order = laundry_order;
    _resultData['laundry_order'] =
        l$laundry_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order = laundry_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order = laundry_order;
    final lOther$laundry_order = other.laundry_order;
    if (l$laundry_order.length != lOther$laundry_order.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_order.length; i++) {
      final l$laundry_order$entry = l$laundry_order[i];
      final lOther$laundry_order$entry = lOther$laundry_order[i];
      if (l$laundry_order$entry != lOther$laundry_order$entry) {
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

extension UtilityExtension$Query$get_laundry_orders
    on Query$get_laundry_orders {
  CopyWith$Query$get_laundry_orders<Query$get_laundry_orders> get copyWith =>
      CopyWith$Query$get_laundry_orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_laundry_orders<TRes> {
  factory CopyWith$Query$get_laundry_orders(
    Query$get_laundry_orders instance,
    TRes Function(Query$get_laundry_orders) then,
  ) = _CopyWithImpl$Query$get_laundry_orders;

  factory CopyWith$Query$get_laundry_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_laundry_orders;

  TRes call({
    List<Query$get_laundry_orders$laundry_order>? laundry_order,
    String? $__typename,
  });
  TRes laundry_order(
      Iterable<Query$get_laundry_orders$laundry_order> Function(
              Iterable<
                  CopyWith$Query$get_laundry_orders$laundry_order<
                      Query$get_laundry_orders$laundry_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_laundry_orders<TRes>
    implements CopyWith$Query$get_laundry_orders<TRes> {
  _CopyWithImpl$Query$get_laundry_orders(
    this._instance,
    this._then,
  );

  final Query$get_laundry_orders _instance;

  final TRes Function(Query$get_laundry_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_orders(
        laundry_order: laundry_order == _undefined || laundry_order == null
            ? _instance.laundry_order
            : (laundry_order as List<Query$get_laundry_orders$laundry_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_order(
          Iterable<Query$get_laundry_orders$laundry_order> Function(
                  Iterable<
                      CopyWith$Query$get_laundry_orders$laundry_order<
                          Query$get_laundry_orders$laundry_order>>)
              _fn) =>
      call(
          laundry_order: _fn(_instance.laundry_order
              .map((e) => CopyWith$Query$get_laundry_orders$laundry_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_laundry_orders<TRes>
    implements CopyWith$Query$get_laundry_orders<TRes> {
  _CopyWithStubImpl$Query$get_laundry_orders(this._res);

  TRes _res;

  call({
    List<Query$get_laundry_orders$laundry_order>? laundry_order,
    String? $__typename,
  }) =>
      _res;
  laundry_order(_fn) => _res;
}

const documentNodeQueryget_laundry_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_laundry_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'laundryStoreId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
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
        name: NameNode(value: 'laundry_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'store_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value:
                        VariableNode(name: NameNode(value: 'laundryStoreId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
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
            name: NameNode(value: 'customer_address'),
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
Query$get_laundry_orders _parserFn$Query$get_laundry_orders(
        Map<String, dynamic> data) =>
    Query$get_laundry_orders.fromJson(data);

class Options$Query$get_laundry_orders
    extends graphql.QueryOptions<Query$get_laundry_orders> {
  Options$Query$get_laundry_orders({
    String? operationName,
    required Variables$Query$get_laundry_orders variables,
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
          document: documentNodeQueryget_laundry_orders,
          parserFn: _parserFn$Query$get_laundry_orders,
        );
}

class WatchOptions$Query$get_laundry_orders
    extends graphql.WatchQueryOptions<Query$get_laundry_orders> {
  WatchOptions$Query$get_laundry_orders({
    String? operationName,
    required Variables$Query$get_laundry_orders variables,
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
          document: documentNodeQueryget_laundry_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_laundry_orders,
        );
}

class FetchMoreOptions$Query$get_laundry_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_laundry_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_laundry_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_laundry_orders,
        );
}

extension ClientExtension$Query$get_laundry_orders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_laundry_orders>>
      query$get_laundry_orders(
              Options$Query$get_laundry_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_laundry_orders>
      watchQuery$get_laundry_orders(
              WatchOptions$Query$get_laundry_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_laundry_orders({
    required Query$get_laundry_orders data,
    required Variables$Query$get_laundry_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_laundry_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_laundry_orders? readQuery$get_laundry_orders({
    required Variables$Query$get_laundry_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_laundry_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_laundry_orders.fromJson(result);
  }
}

class Query$get_laundry_orders$laundry_order {
  Query$get_laundry_orders$laundry_order({
    required this.id,
    required this.order_time,
    required this.status,
    this.customer_address,
    required this.customer,
    required this.$__typename,
  });

  factory Query$get_laundry_orders$laundry_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$customer_address = json['customer_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_orders$laundry_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      customer_address: (l$customer_address as String?),
      customer: Query$get_laundry_orders$laundry_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final String? customer_address;

  final Query$get_laundry_orders$laundry_order$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
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
    final l$customer_address = customer_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$customer_address,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_laundry_orders$laundry_order) ||
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
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
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

extension UtilityExtension$Query$get_laundry_orders$laundry_order
    on Query$get_laundry_orders$laundry_order {
  CopyWith$Query$get_laundry_orders$laundry_order<
          Query$get_laundry_orders$laundry_order>
      get copyWith => CopyWith$Query$get_laundry_orders$laundry_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_orders$laundry_order<TRes> {
  factory CopyWith$Query$get_laundry_orders$laundry_order(
    Query$get_laundry_orders$laundry_order instance,
    TRes Function(Query$get_laundry_orders$laundry_order) then,
  ) = _CopyWithImpl$Query$get_laundry_orders$laundry_order;

  factory CopyWith$Query$get_laundry_orders$laundry_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_laundry_orders$laundry_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    String? customer_address,
    Query$get_laundry_orders$laundry_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> get customer;
}

class _CopyWithImpl$Query$get_laundry_orders$laundry_order<TRes>
    implements CopyWith$Query$get_laundry_orders$laundry_order<TRes> {
  _CopyWithImpl$Query$get_laundry_orders$laundry_order(
    this._instance,
    this._then,
  );

  final Query$get_laundry_orders$laundry_order _instance;

  final TRes Function(Query$get_laundry_orders$laundry_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? customer_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_orders$laundry_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer as Query$get_laundry_orders$laundry_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_laundry_orders$laundry_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_orders$laundry_order<TRes>
    implements CopyWith$Query$get_laundry_orders$laundry_order<TRes> {
  _CopyWithStubImpl$Query$get_laundry_orders$laundry_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    String? customer_address,
    Query$get_laundry_orders$laundry_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> get customer =>
      CopyWith$Query$get_laundry_orders$laundry_order$customer.stub(_res);
}

class Query$get_laundry_orders$laundry_order$customer {
  Query$get_laundry_orders$laundry_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_laundry_orders$laundry_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_orders$laundry_order$customer(
      user: Query$get_laundry_orders$laundry_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_laundry_orders$laundry_order$customer$user user;

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
    if (!(other is Query$get_laundry_orders$laundry_order$customer) ||
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

extension UtilityExtension$Query$get_laundry_orders$laundry_order$customer
    on Query$get_laundry_orders$laundry_order$customer {
  CopyWith$Query$get_laundry_orders$laundry_order$customer<
          Query$get_laundry_orders$laundry_order$customer>
      get copyWith => CopyWith$Query$get_laundry_orders$laundry_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> {
  factory CopyWith$Query$get_laundry_orders$laundry_order$customer(
    Query$get_laundry_orders$laundry_order$customer instance,
    TRes Function(Query$get_laundry_orders$laundry_order$customer) then,
  ) = _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer;

  factory CopyWith$Query$get_laundry_orders$laundry_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer;

  TRes call({
    Query$get_laundry_orders$laundry_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_laundry_orders$laundry_order$customer$user<TRes> get user;
}

class _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer<TRes>
    implements CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> {
  _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_laundry_orders$laundry_order$customer _instance;

  final TRes Function(Query$get_laundry_orders$laundry_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_orders$laundry_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_laundry_orders$laundry_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_laundry_orders$laundry_order$customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_laundry_orders$laundry_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer<TRes>
    implements CopyWith$Query$get_laundry_orders$laundry_order$customer<TRes> {
  _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer(this._res);

  TRes _res;

  call({
    Query$get_laundry_orders$laundry_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_laundry_orders$laundry_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_laundry_orders$laundry_order$customer$user.stub(
              _res);
}

class Query$get_laundry_orders$laundry_order$customer$user {
  Query$get_laundry_orders$laundry_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_laundry_orders$laundry_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_laundry_orders$laundry_order$customer$user(
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
    if (!(other is Query$get_laundry_orders$laundry_order$customer$user) ||
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

extension UtilityExtension$Query$get_laundry_orders$laundry_order$customer$user
    on Query$get_laundry_orders$laundry_order$customer$user {
  CopyWith$Query$get_laundry_orders$laundry_order$customer$user<
          Query$get_laundry_orders$laundry_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_laundry_orders$laundry_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_laundry_orders$laundry_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_laundry_orders$laundry_order$customer$user(
    Query$get_laundry_orders$laundry_order$customer$user instance,
    TRes Function(Query$get_laundry_orders$laundry_order$customer$user) then,
  ) = _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer$user;

  factory CopyWith$Query$get_laundry_orders$laundry_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer$user<TRes>
    implements
        CopyWith$Query$get_laundry_orders$laundry_order$customer$user<TRes> {
  _CopyWithImpl$Query$get_laundry_orders$laundry_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_laundry_orders$laundry_order$customer$user _instance;

  final TRes Function(Query$get_laundry_orders$laundry_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_laundry_orders$laundry_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_laundry_orders$laundry_order$customer$user<TRes> {
  _CopyWithStubImpl$Query$get_laundry_orders$laundry_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_laundry_orders {
  factory Variables$Subscription$listen_on_laundry_orders({
    required int laundryStoreId,
    required bool inProcess,
  }) =>
      Variables$Subscription$listen_on_laundry_orders._({
        r'laundryStoreId': laundryStoreId,
        r'inProcess': inProcess,
      });

  Variables$Subscription$listen_on_laundry_orders._(this._$data);

  factory Variables$Subscription$listen_on_laundry_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$laundryStoreId = data['laundryStoreId'];
    result$data['laundryStoreId'] = (l$laundryStoreId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    return Variables$Subscription$listen_on_laundry_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get laundryStoreId => (_$data['laundryStoreId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$laundryStoreId = laundryStoreId;
    result$data['laundryStoreId'] = l$laundryStoreId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_laundry_orders<
          Variables$Subscription$listen_on_laundry_orders>
      get copyWith => CopyWith$Variables$Subscription$listen_on_laundry_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_laundry_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundryStoreId = laundryStoreId;
    final lOther$laundryStoreId = other.laundryStoreId;
    if (l$laundryStoreId != lOther$laundryStoreId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$laundryStoreId = laundryStoreId;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$laundryStoreId,
      l$inProcess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_laundry_orders<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_laundry_orders(
    Variables$Subscription$listen_on_laundry_orders instance,
    TRes Function(Variables$Subscription$listen_on_laundry_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_laundry_orders;

  factory CopyWith$Variables$Subscription$listen_on_laundry_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_laundry_orders;

  TRes call({
    int? laundryStoreId,
    bool? inProcess,
  });
}

class _CopyWithImpl$Variables$Subscription$listen_on_laundry_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_laundry_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_laundry_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_laundry_orders _instance;

  final TRes Function(Variables$Subscription$listen_on_laundry_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? laundryStoreId = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Subscription$listen_on_laundry_orders._({
        ..._instance._$data,
        if (laundryStoreId != _undefined && laundryStoreId != null)
          'laundryStoreId': (laundryStoreId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_laundry_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_laundry_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_laundry_orders(this._res);

  TRes _res;

  call({
    int? laundryStoreId,
    bool? inProcess,
  }) =>
      _res;
}

class Subscription$listen_on_laundry_orders {
  Subscription$listen_on_laundry_orders({
    required this.laundry_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_laundry_orders.fromJson(
      Map<String, dynamic> json) {
    final l$laundry_order = json['laundry_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_laundry_orders(
      laundry_order: (l$laundry_order as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_laundry_orders$laundry_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_laundry_orders$laundry_order> laundry_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_order = laundry_order;
    _resultData['laundry_order'] =
        l$laundry_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_order = laundry_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_laundry_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_order = laundry_order;
    final lOther$laundry_order = other.laundry_order;
    if (l$laundry_order.length != lOther$laundry_order.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_order.length; i++) {
      final l$laundry_order$entry = l$laundry_order[i];
      final lOther$laundry_order$entry = lOther$laundry_order[i];
      if (l$laundry_order$entry != lOther$laundry_order$entry) {
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

extension UtilityExtension$Subscription$listen_on_laundry_orders
    on Subscription$listen_on_laundry_orders {
  CopyWith$Subscription$listen_on_laundry_orders<
          Subscription$listen_on_laundry_orders>
      get copyWith => CopyWith$Subscription$listen_on_laundry_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_laundry_orders<TRes> {
  factory CopyWith$Subscription$listen_on_laundry_orders(
    Subscription$listen_on_laundry_orders instance,
    TRes Function(Subscription$listen_on_laundry_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_laundry_orders;

  factory CopyWith$Subscription$listen_on_laundry_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_laundry_orders;

  TRes call({
    List<Subscription$listen_on_laundry_orders$laundry_order>? laundry_order,
    String? $__typename,
  });
  TRes laundry_order(
      Iterable<Subscription$listen_on_laundry_orders$laundry_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_laundry_orders$laundry_order<
                      Subscription$listen_on_laundry_orders$laundry_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_laundry_orders<TRes>
    implements CopyWith$Subscription$listen_on_laundry_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_laundry_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_laundry_orders _instance;

  final TRes Function(Subscription$listen_on_laundry_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_laundry_orders(
        laundry_order: laundry_order == _undefined || laundry_order == null
            ? _instance.laundry_order
            : (laundry_order
                as List<Subscription$listen_on_laundry_orders$laundry_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_order(
          Iterable<Subscription$listen_on_laundry_orders$laundry_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_laundry_orders$laundry_order<
                          Subscription$listen_on_laundry_orders$laundry_order>>)
              _fn) =>
      call(
          laundry_order: _fn(_instance.laundry_order.map((e) =>
              CopyWith$Subscription$listen_on_laundry_orders$laundry_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_laundry_orders<TRes>
    implements CopyWith$Subscription$listen_on_laundry_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_laundry_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_laundry_orders$laundry_order>? laundry_order,
    String? $__typename,
  }) =>
      _res;
  laundry_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_laundry_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_laundry_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'laundryStoreId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
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
        name: NameNode(value: 'laundry_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'store_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value:
                        VariableNode(name: NameNode(value: 'laundryStoreId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
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
            name: NameNode(value: 'customer_address'),
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
Subscription$listen_on_laundry_orders
    _parserFn$Subscription$listen_on_laundry_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_laundry_orders.fromJson(data);

class Options$Subscription$listen_on_laundry_orders
    extends graphql.SubscriptionOptions<Subscription$listen_on_laundry_orders> {
  Options$Subscription$listen_on_laundry_orders({
    String? operationName,
    required Variables$Subscription$listen_on_laundry_orders variables,
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
          document: documentNodeSubscriptionlisten_on_laundry_orders,
          parserFn: _parserFn$Subscription$listen_on_laundry_orders,
        );
}

class WatchOptions$Subscription$listen_on_laundry_orders
    extends graphql.WatchQueryOptions<Subscription$listen_on_laundry_orders> {
  WatchOptions$Subscription$listen_on_laundry_orders({
    String? operationName,
    required Variables$Subscription$listen_on_laundry_orders variables,
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
          document: documentNodeSubscriptionlisten_on_laundry_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_laundry_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_laundry_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_laundry_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_laundry_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_laundry_orders,
        );
}

extension ClientExtension$Subscription$listen_on_laundry_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_laundry_orders>>
      subscribe$listen_on_laundry_orders(
              Options$Subscription$listen_on_laundry_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_laundry_orders>
      watchSubscription$listen_on_laundry_orders(
              WatchOptions$Subscription$listen_on_laundry_orders options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_laundry_orders$laundry_order {
  Subscription$listen_on_laundry_orders$laundry_order({
    required this.id,
    required this.order_time,
    required this.status,
    this.customer_address,
    required this.customer,
    required this.$__typename,
  });

  factory Subscription$listen_on_laundry_orders$laundry_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$customer_address = json['customer_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_laundry_orders$laundry_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      customer_address: (l$customer_address as String?),
      customer:
          Subscription$listen_on_laundry_orders$laundry_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final String? customer_address;

  final Subscription$listen_on_laundry_orders$laundry_order$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$customer_address = customer_address;
    _resultData['customer_address'] = l$customer_address;
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
    final l$customer_address = customer_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$customer_address,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_laundry_orders$laundry_order) ||
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
    final l$customer_address = customer_address;
    final lOther$customer_address = other.customer_address;
    if (l$customer_address != lOther$customer_address) {
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

extension UtilityExtension$Subscription$listen_on_laundry_orders$laundry_order
    on Subscription$listen_on_laundry_orders$laundry_order {
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order<
          Subscription$listen_on_laundry_orders$laundry_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_laundry_orders$laundry_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_laundry_orders$laundry_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order(
    Subscription$listen_on_laundry_orders$laundry_order instance,
    TRes Function(Subscription$listen_on_laundry_orders$laundry_order) then,
  ) = _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order;

  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    String? customer_address,
    Subscription$listen_on_laundry_orders$laundry_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<TRes>
      get customer;
}

class _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order<TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order<TRes> {
  _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_laundry_orders$laundry_order _instance;

  final TRes Function(Subscription$listen_on_laundry_orders$laundry_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? customer_address = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_laundry_orders$laundry_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        customer_address: customer_address == _undefined
            ? _instance.customer_address
            : (customer_address as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_laundry_orders$laundry_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    String? customer_address,
    Subscription$listen_on_laundry_orders$laundry_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<TRes>
      get customer =>
          CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer
              .stub(_res);
}

class Subscription$listen_on_laundry_orders$laundry_order$customer {
  Subscription$listen_on_laundry_orders$laundry_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_laundry_orders$laundry_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_laundry_orders$laundry_order$customer(
      user: Subscription$listen_on_laundry_orders$laundry_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_laundry_orders$laundry_order$customer$user user;

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
            is Subscription$listen_on_laundry_orders$laundry_order$customer) ||
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

extension UtilityExtension$Subscription$listen_on_laundry_orders$laundry_order$customer
    on Subscription$listen_on_laundry_orders$laundry_order$customer {
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<
          Subscription$listen_on_laundry_orders$laundry_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer(
    Subscription$listen_on_laundry_orders$laundry_order$customer instance,
    TRes Function(Subscription$listen_on_laundry_orders$laundry_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer;

  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer;

  TRes call({
    Subscription$listen_on_laundry_orders$laundry_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_laundry_orders$laundry_order$customer _instance;

  final TRes Function(
      Subscription$listen_on_laundry_orders$laundry_order$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_laundry_orders$laundry_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_laundry_orders$laundry_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_laundry_orders$laundry_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_laundry_orders$laundry_order$customer$user {
  Subscription$listen_on_laundry_orders$laundry_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_laundry_orders$laundry_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_laundry_orders$laundry_order$customer$user(
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
            is Subscription$listen_on_laundry_orders$laundry_order$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_laundry_orders$laundry_order$customer$user
    on Subscription$listen_on_laundry_orders$laundry_order$customer$user {
  CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
          Subscription$listen_on_laundry_orders$laundry_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user(
    Subscription$listen_on_laundry_orders$laundry_order$customer$user instance,
    TRes Function(
            Subscription$listen_on_laundry_orders$laundry_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user;

  factory CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_laundry_orders$laundry_order$customer$user
      _instance;

  final TRes Function(
      Subscription$listen_on_laundry_orders$laundry_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_laundry_orders$laundry_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_laundry_orders$laundry_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_laundry_orders$laundry_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
