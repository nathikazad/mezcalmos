import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_courier_order_by_id {
  factory Variables$Query$get_courier_order_by_id({required int orderId}) =>
      Variables$Query$get_courier_order_by_id._({
        r'orderId': orderId,
      });

  Variables$Query$get_courier_order_by_id._(this._$data);

  factory Variables$Query$get_courier_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_courier_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_courier_order_by_id<
          Variables$Query$get_courier_order_by_id>
      get copyWith => CopyWith$Variables$Query$get_courier_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_courier_order_by_id) ||
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

abstract class CopyWith$Variables$Query$get_courier_order_by_id<TRes> {
  factory CopyWith$Variables$Query$get_courier_order_by_id(
    Variables$Query$get_courier_order_by_id instance,
    TRes Function(Variables$Query$get_courier_order_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_courier_order_by_id;

  factory CopyWith$Variables$Query$get_courier_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_courier_order_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_courier_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_courier_order_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_courier_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_courier_order_by_id _instance;

  final TRes Function(Variables$Query$get_courier_order_by_id) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_courier_order_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_courier_order_by_id<TRes>
    implements CopyWith$Variables$Query$get_courier_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_courier_order_by_id(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_courier_order_by_id {
  Query$get_courier_order_by_id({
    this.delivery_courier_order_by_pk,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id.fromJson(Map<String, dynamic> json) {
    final l$delivery_courier_order_by_pk = json['delivery_courier_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id(
      delivery_courier_order_by_pk: l$delivery_courier_order_by_pk == null
          ? null
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk.fromJson(
              (l$delivery_courier_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk?
      delivery_courier_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    _resultData['delivery_courier_order_by_pk'] =
        l$delivery_courier_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_courier_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_courier_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    final lOther$delivery_courier_order_by_pk =
        other.delivery_courier_order_by_pk;
    if (l$delivery_courier_order_by_pk != lOther$delivery_courier_order_by_pk) {
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

extension UtilityExtension$Query$get_courier_order_by_id
    on Query$get_courier_order_by_id {
  CopyWith$Query$get_courier_order_by_id<Query$get_courier_order_by_id>
      get copyWith => CopyWith$Query$get_courier_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id<TRes> {
  factory CopyWith$Query$get_courier_order_by_id(
    Query$get_courier_order_by_id instance,
    TRes Function(Query$get_courier_order_by_id) then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id;

  factory CopyWith$Query$get_courier_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id;

  TRes call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk?
        delivery_courier_order_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<TRes>
      get delivery_courier_order_by_pk;
}

class _CopyWithImpl$Query$get_courier_order_by_id<TRes>
    implements CopyWith$Query$get_courier_order_by_id<TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id _instance;

  final TRes Function(Query$get_courier_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_courier_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_by_id(
        delivery_courier_order_by_pk: delivery_courier_order_by_pk == _undefined
            ? _instance.delivery_courier_order_by_pk
            : (delivery_courier_order_by_pk
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<TRes>
      get delivery_courier_order_by_pk {
    final local$delivery_courier_order_by_pk =
        _instance.delivery_courier_order_by_pk;
    return local$delivery_courier_order_by_pk == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk(
            local$delivery_courier_order_by_pk,
            (e) => call(delivery_courier_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id<TRes>
    implements CopyWith$Query$get_courier_order_by_id<TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id(this._res);

  TRes _res;

  call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk?
        delivery_courier_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<TRes>
      get delivery_courier_order_by_pk =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk
              .stub(_res);
}

const documentNodeQueryget_courier_order_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_courier_order_by_id'),
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
        name: NameNode(value: 'delivery_courier_order_by_pk'),
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
            name: NameNode(value: 'customer_id'),
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
            name: NameNode(value: 'from_location_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'from_location_text'),
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
            name: NameNode(value: 'to_location_address'),
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
            name: NameNode(value: 'total_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_items_cost'),
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
            name: NameNode(value: 'stripe_fees'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'actual_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_cost'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'unavailable'),
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
            name: NameNode(value: 'bill_image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'schedule_time'),
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
                        name: NameNode(value: 'language_id'),
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
                name: NameNode(value: 'driver_review_by_customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'from_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'from_image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'to_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'to_image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
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
                name: NameNode(value: 'chat_with_customer_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'chat_with_service_provider_id'),
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
                name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_arrival_at_pickup_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_package_ready_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'pickup_address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'pickup_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_company'),
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
                        name: NameNode(value: 'currency'),
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
                name: NameNode(value: 'in_process'),
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
                name: NameNode(value: 'schedule_time'),
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
                name: NameNode(value: 'service_provider_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_distance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_duration'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_polyline'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'package_ready'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'direction'),
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
                name: NameNode(value: 'delivery_driver'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'current_location'),
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
                        name: NameNode(value: 'image'),
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
Query$get_courier_order_by_id _parserFn$Query$get_courier_order_by_id(
        Map<String, dynamic> data) =>
    Query$get_courier_order_by_id.fromJson(data);

class Options$Query$get_courier_order_by_id
    extends graphql.QueryOptions<Query$get_courier_order_by_id> {
  Options$Query$get_courier_order_by_id({
    String? operationName,
    required Variables$Query$get_courier_order_by_id variables,
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
          document: documentNodeQueryget_courier_order_by_id,
          parserFn: _parserFn$Query$get_courier_order_by_id,
        );
}

class WatchOptions$Query$get_courier_order_by_id
    extends graphql.WatchQueryOptions<Query$get_courier_order_by_id> {
  WatchOptions$Query$get_courier_order_by_id({
    String? operationName,
    required Variables$Query$get_courier_order_by_id variables,
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
          document: documentNodeQueryget_courier_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_courier_order_by_id,
        );
}

class FetchMoreOptions$Query$get_courier_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_courier_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_courier_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_courier_order_by_id,
        );
}

extension ClientExtension$Query$get_courier_order_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_courier_order_by_id>>
      query$get_courier_order_by_id(
              Options$Query$get_courier_order_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_courier_order_by_id>
      watchQuery$get_courier_order_by_id(
              WatchOptions$Query$get_courier_order_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_courier_order_by_id({
    required Query$get_courier_order_by_id data,
    required Variables$Query$get_courier_order_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_courier_order_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_courier_order_by_id? readQuery$get_courier_order_by_id({
    required Variables$Query$get_courier_order_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_courier_order_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_courier_order_by_id.fromJson(result);
  }
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk({
    required this.customer_id,
    required this.discount_value,
    this.from_location_gps,
    this.from_location_text,
    required this.id,
    required this.order_time,
    required this.payment_type,
    required this.refund_amount,
    required this.stripe_fees,
    this.stripe_info,
    required this.tax,
    required this.to_location_address,
    required this.to_location_gps,
    this.total_cost,
    this.actual_items_cost,
    required this.items,
    this.bill_image,
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$customer_id = json['customer_id'];
    final l$discount_value = json['discount_value'];
    final l$from_location_gps = json['from_location_gps'];
    final l$from_location_text = json['from_location_text'];
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$payment_type = json['payment_type'];
    final l$refund_amount = json['refund_amount'];
    final l$stripe_fees = json['stripe_fees'];
    final l$stripe_info = json['stripe_info'];
    final l$tax = json['tax'];
    final l$to_location_address = json['to_location_address'];
    final l$to_location_gps = json['to_location_gps'];
    final l$total_cost = json['total_cost'];
    final l$actual_items_cost = json['actual_items_cost'];
    final l$items = json['items'];
    final l$bill_image = json['bill_image'];
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk(
      customer_id: (l$customer_id as int),
      discount_value: moneyFromJson(l$discount_value),
      from_location_gps: l$from_location_gps == null
          ? null
          : geographyFromJson(l$from_location_gps),
      from_location_text: (l$from_location_text as String?),
      id: (l$id as int),
      order_time: (l$order_time as String),
      payment_type: (l$payment_type as String),
      refund_amount: moneyFromJson(l$refund_amount),
      stripe_fees: moneyFromJson(l$stripe_fees),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      tax: moneyFromJson(l$tax),
      to_location_address: (l$to_location_address as String),
      to_location_gps: geographyFromJson(l$to_location_gps),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      actual_items_cost: l$actual_items_cost == null
          ? null
          : moneyFromJson(l$actual_items_cost),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$get_courier_order_by_id$delivery_courier_order_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      bill_image: (l$bill_image as String?),
      delivery_order:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
              .fromJson((l$delivery_order as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int customer_id;

  final double discount_value;

  final Geography? from_location_gps;

  final String? from_location_text;

  final int id;

  final String order_time;

  final String payment_type;

  final double refund_amount;

  final double stripe_fees;

  final dynamic? stripe_info;

  final double tax;

  final String to_location_address;

  final Geography to_location_gps;

  final double? total_cost;

  final double? actual_items_cost;

  final List<Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>
      items;

  final String? bill_image;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
      delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$discount_value = discount_value;
    _resultData['discount_value'] = moneyToJson(l$discount_value);
    final l$from_location_gps = from_location_gps;
    _resultData['from_location_gps'] = l$from_location_gps == null
        ? null
        : geographyToJson(l$from_location_gps);
    final l$from_location_text = from_location_text;
    _resultData['from_location_text'] = l$from_location_text;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$stripe_fees = stripe_fees;
    _resultData['stripe_fees'] = moneyToJson(l$stripe_fees);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] = geographyToJson(l$to_location_gps);
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$actual_items_cost = actual_items_cost;
    _resultData['actual_items_cost'] =
        l$actual_items_cost == null ? null : moneyToJson(l$actual_items_cost);
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$bill_image = bill_image;
    _resultData['bill_image'] = l$bill_image;
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] = l$delivery_order.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$discount_value = discount_value;
    final l$from_location_gps = from_location_gps;
    final l$from_location_text = from_location_text;
    final l$id = id;
    final l$order_time = order_time;
    final l$payment_type = payment_type;
    final l$refund_amount = refund_amount;
    final l$stripe_fees = stripe_fees;
    final l$stripe_info = stripe_info;
    final l$tax = tax;
    final l$to_location_address = to_location_address;
    final l$to_location_gps = to_location_gps;
    final l$total_cost = total_cost;
    final l$actual_items_cost = actual_items_cost;
    final l$items = items;
    final l$bill_image = bill_image;
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_id,
      l$discount_value,
      l$from_location_gps,
      l$from_location_text,
      l$id,
      l$order_time,
      l$payment_type,
      l$refund_amount,
      l$stripe_fees,
      l$stripe_info,
      l$tax,
      l$to_location_address,
      l$to_location_gps,
      l$total_cost,
      l$actual_items_cost,
      Object.hashAll(l$items.map((v) => v)),
      l$bill_image,
      l$delivery_order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$discount_value = discount_value;
    final lOther$discount_value = other.discount_value;
    if (l$discount_value != lOther$discount_value) {
      return false;
    }
    final l$from_location_gps = from_location_gps;
    final lOther$from_location_gps = other.from_location_gps;
    if (l$from_location_gps != lOther$from_location_gps) {
      return false;
    }
    final l$from_location_text = from_location_text;
    final lOther$from_location_text = other.from_location_text;
    if (l$from_location_text != lOther$from_location_text) {
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
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$actual_items_cost = actual_items_cost;
    final lOther$actual_items_cost = other.actual_items_cost;
    if (l$actual_items_cost != lOther$actual_items_cost) {
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
    final l$bill_image = bill_image;
    final lOther$bill_image = other.bill_image;
    if (l$bill_image != lOther$bill_image) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order != lOther$delivery_order) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk instance,
    TRes Function(Query$get_courier_order_by_id$delivery_courier_order_by_pk)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk;

  TRes call({
    int? customer_id,
    double? discount_value,
    Geography? from_location_gps,
    String? from_location_text,
    int? id,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    String? to_location_address,
    Geography? to_location_gps,
    double? total_cost,
    double? actual_items_cost,
    List<Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>?
        items,
    String? bill_image,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order?
        delivery_order,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$get_courier_order_by_id$delivery_courier_order_by_pk$items> Function(
              Iterable<
                  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
                      Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>>)
          _fn);
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
      TRes> get delivery_order;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk _instance;

  final TRes Function(
      Query$get_courier_order_by_id$delivery_courier_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? discount_value = _undefined,
    Object? from_location_gps = _undefined,
    Object? from_location_text = _undefined,
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? payment_type = _undefined,
    Object? refund_amount = _undefined,
    Object? stripe_fees = _undefined,
    Object? stripe_info = _undefined,
    Object? tax = _undefined,
    Object? to_location_address = _undefined,
    Object? to_location_gps = _undefined,
    Object? total_cost = _undefined,
    Object? actual_items_cost = _undefined,
    Object? items = _undefined,
    Object? bill_image = _undefined,
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_by_id$delivery_courier_order_by_pk(
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        discount_value: discount_value == _undefined || discount_value == null
            ? _instance.discount_value
            : (discount_value as double),
        from_location_gps: from_location_gps == _undefined
            ? _instance.from_location_gps
            : (from_location_gps as Geography?),
        from_location_text: from_location_text == _undefined
            ? _instance.from_location_text
            : (from_location_text as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        stripe_fees: stripe_fees == _undefined || stripe_fees == null
            ? _instance.stripe_fees
            : (stripe_fees as double),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        to_location_address:
            to_location_address == _undefined || to_location_address == null
                ? _instance.to_location_address
                : (to_location_address as String),
        to_location_gps:
            to_location_gps == _undefined || to_location_gps == null
                ? _instance.to_location_gps
                : (to_location_gps as Geography),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        actual_items_cost: actual_items_cost == _undefined
            ? _instance.actual_items_cost
            : (actual_items_cost as double?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>),
        bill_image: bill_image == _undefined
            ? _instance.bill_image
            : (bill_image as String?),
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$get_courier_order_by_id$delivery_courier_order_by_pk$items> Function(
                  Iterable<
                      CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
                          Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
      TRes> get delivery_order {
    final local$delivery_order = _instance.delivery_order;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
        local$delivery_order, (e) => call(delivery_order: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? customer_id,
    double? discount_value,
    Geography? from_location_gps,
    String? from_location_text,
    int? id,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    double? stripe_fees,
    dynamic? stripe_info,
    double? tax,
    String? to_location_address,
    Geography? to_location_gps,
    double? total_cost,
    double? actual_items_cost,
    List<Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>?
        items,
    String? bill_image,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order?
        delivery_order,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
          TRes>
      get delivery_order =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$items {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$items({
    this.actual_cost,
    this.estimated_cost,
    required this.id,
    this.image,
    required this.name,
    this.notes,
    required this.unavailable,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$actual_cost = json['actual_cost'];
    final l$estimated_cost = json['estimated_cost'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$notes = json['notes'];
    final l$unavailable = json['unavailable'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
      actual_cost: l$actual_cost == null ? null : moneyFromJson(l$actual_cost),
      estimated_cost:
          l$estimated_cost == null ? null : moneyFromJson(l$estimated_cost),
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String),
      notes: (l$notes as String?),
      unavailable: (l$unavailable as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? actual_cost;

  final double? estimated_cost;

  final int id;

  final String? image;

  final String name;

  final String? notes;

  final bool unavailable;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_cost = actual_cost;
    _resultData['actual_cost'] =
        l$actual_cost == null ? null : moneyToJson(l$actual_cost);
    final l$estimated_cost = estimated_cost;
    _resultData['estimated_cost'] =
        l$estimated_cost == null ? null : moneyToJson(l$estimated_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$unavailable = unavailable;
    _resultData['unavailable'] = l$unavailable;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_cost = actual_cost;
    final l$estimated_cost = estimated_cost;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$notes = notes;
    final l$unavailable = unavailable;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_cost,
      l$estimated_cost,
      l$id,
      l$image,
      l$name,
      l$notes,
      l$unavailable,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_cost = actual_cost;
    final lOther$actual_cost = other.actual_cost;
    if (l$actual_cost != lOther$actual_cost) {
      return false;
    }
    final l$estimated_cost = estimated_cost;
    final lOther$estimated_cost = other.estimated_cost;
    if (l$estimated_cost != lOther$estimated_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$unavailable = unavailable;
    final lOther$unavailable = other.unavailable;
    if (l$unavailable != lOther$unavailable) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$items {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$items>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$items instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$items)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items;

  TRes call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$items
      _instance;

  final TRes Function(
      Query$get_courier_order_by_id$delivery_courier_order_by_pk$items) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_cost = _undefined,
    Object? estimated_cost = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? notes = _undefined,
    Object? unavailable = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
        actual_cost: actual_cost == _undefined
            ? _instance.actual_cost
            : (actual_cost as double?),
        estimated_cost: estimated_cost == _undefined
            ? _instance.estimated_cost
            : (estimated_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        unavailable: unavailable == _undefined || unavailable == null
            ? _instance.unavailable
            : (unavailable as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$items(
      this._res);

  TRes _res;

  call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order({
    this.schedule_time,
    required this.customer,
    this.driver_review_by_customer,
    required this.chat_with_customer_id,
    this.chat_with_service_provider_id,
    required this.dropoff_address,
    required this.dropoff_gps,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.estimated_package_ready_time,
    this.pickup_address,
    this.pickup_gps,
    this.delivery_company,
    required this.delivery_cost,
    this.in_process,
    required this.id,
    required this.status,
    required this.service_provider_type,
    this.trip_distance,
    this.trip_duration,
    this.trip_polyline,
    required this.package_ready,
    required this.direction,
    required this.service_provider_id,
    this.delivery_driver,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$schedule_time = json['schedule_time'];
    final l$customer = json['customer'];
    final l$driver_review_by_customer = json['driver_review_by_customer'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$pickup_address = json['pickup_address'];
    final l$pickup_gps = json['pickup_gps'];
    final l$delivery_company = json['delivery_company'];
    final l$delivery_cost = json['delivery_cost'];
    final l$in_process = json['in_process'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_polyline = json['trip_polyline'];
    final l$package_ready = json['package_ready'];
    final l$direction = json['direction'];
    final l$service_provider_id = json['service_provider_id'];
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
      schedule_time: (l$schedule_time as String?),
      customer:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      driver_review_by_customer: l$driver_review_by_customer == null
          ? null
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
              .fromJson((l$driver_review_by_customer as Map<String, dynamic>)),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      pickup_address: (l$pickup_address as String?),
      pickup_gps: l$pickup_gps == null ? null : geographyFromJson(l$pickup_gps),
      delivery_company: l$delivery_company == null
          ? null
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      delivery_cost: moneyFromJson(l$delivery_cost),
      in_process: (l$in_process as bool?),
      id: (l$id as int),
      status: (l$status as String),
      service_provider_type: (l$service_provider_type as String),
      trip_distance: (l$trip_distance as int?),
      trip_duration: (l$trip_duration as int?),
      trip_polyline: (l$trip_polyline as String?),
      package_ready: (l$package_ready as bool),
      direction: (l$direction as String),
      service_provider_id: (l$service_provider_id as int),
      delivery_driver: l$delivery_driver == null
          ? null
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? schedule_time;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
      customer;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
      driver_review_by_customer;

  final int chat_with_customer_id;

  final int? chat_with_service_provider_id;

  final String dropoff_address;

  final Geography dropoff_gps;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? estimated_package_ready_time;

  final String? pickup_address;

  final Geography? pickup_gps;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
      delivery_company;

  final double delivery_cost;

  final bool? in_process;

  final int id;

  final String status;

  final String service_provider_type;

  final int? trip_distance;

  final int? trip_duration;

  final String? trip_polyline;

  final bool package_ready;

  final String direction;

  final int service_provider_id;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
      delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$schedule_time = schedule_time;
    _resultData['schedule_time'] = l$schedule_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$driver_review_by_customer = driver_review_by_customer;
    _resultData['driver_review_by_customer'] =
        l$driver_review_by_customer?.toJson();
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] =
        l$pickup_gps == null ? null : geographyToJson(l$pickup_gps);
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$package_ready = package_ready;
    _resultData['package_ready'] = l$package_ready;
    final l$direction = direction;
    _resultData['direction'] = l$direction;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$schedule_time = schedule_time;
    final l$customer = customer;
    final l$driver_review_by_customer = driver_review_by_customer;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$pickup_address = pickup_address;
    final l$pickup_gps = pickup_gps;
    final l$delivery_company = delivery_company;
    final l$delivery_cost = delivery_cost;
    final l$in_process = in_process;
    final l$id = id;
    final l$status = status;
    final l$service_provider_type = service_provider_type;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$trip_polyline = trip_polyline;
    final l$package_ready = package_ready;
    final l$direction = direction;
    final l$service_provider_id = service_provider_id;
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$schedule_time,
      l$customer,
      l$driver_review_by_customer,
      l$chat_with_customer_id,
      l$chat_with_service_provider_id,
      l$dropoff_address,
      l$dropoff_gps,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$estimated_package_ready_time,
      l$pickup_address,
      l$pickup_gps,
      l$delivery_company,
      l$delivery_cost,
      l$in_process,
      l$id,
      l$status,
      l$service_provider_type,
      l$trip_distance,
      l$trip_duration,
      l$trip_polyline,
      l$package_ready,
      l$direction,
      l$service_provider_id,
      l$delivery_driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$schedule_time = schedule_time;
    final lOther$schedule_time = other.schedule_time;
    if (l$schedule_time != lOther$schedule_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$driver_review_by_customer = driver_review_by_customer;
    final lOther$driver_review_by_customer = other.driver_review_by_customer;
    if (l$driver_review_by_customer != lOther$driver_review_by_customer) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
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
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$package_ready = package_ready;
    final lOther$package_ready = other.package_ready;
    if (l$package_ready != lOther$package_ready) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order;

  TRes call({
    String? schedule_time,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer?
        customer,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
        driver_review_by_customer,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    String? pickup_address,
    Geography? pickup_gps,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
        delivery_company,
    double? delivery_cost,
    bool? in_process,
    int? id,
    String? status,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    bool? package_ready,
    String? direction,
    int? service_provider_id,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
        delivery_driver,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
      TRes> get customer;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
      TRes> get driver_review_by_customer;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
      TRes> get delivery_driver;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? schedule_time = _undefined,
    Object? customer = _undefined,
    Object? driver_review_by_customer = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? pickup_address = _undefined,
    Object? pickup_gps = _undefined,
    Object? delivery_company = _undefined,
    Object? delivery_cost = _undefined,
    Object? in_process = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_polyline = _undefined,
    Object? package_ready = _undefined,
    Object? direction = _undefined,
    Object? service_provider_id = _undefined,
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
        schedule_time: schedule_time == _undefined
            ? _instance.schedule_time
            : (schedule_time as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer),
        driver_review_by_customer: driver_review_by_customer == _undefined
            ? _instance.driver_review_by_customer
            : (driver_review_by_customer
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        pickup_address: pickup_address == _undefined
            ? _instance.pickup_address
            : (pickup_address as String?),
        pickup_gps: pickup_gps == _undefined
            ? _instance.pickup_gps
            : (pickup_gps as Geography?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        in_process: in_process == _undefined
            ? _instance.in_process
            : (in_process as bool?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        package_ready: package_ready == _undefined || package_ready == null
            ? _instance.package_ready
            : (package_ready as bool),
        direction: direction == _undefined || direction == null
            ? _instance.direction
            : (direction as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
      TRes> get driver_review_by_customer {
    final local$driver_review_by_customer = _instance.driver_review_by_customer;
    return local$driver_review_by_customer == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
            local$driver_review_by_customer,
            (e) => call(driver_review_by_customer: e));
  }

  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
      this._res);

  TRes _res;

  call({
    String? schedule_time,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer?
        customer,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
        driver_review_by_customer,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    String? pickup_address,
    Geography? pickup_gps,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
        delivery_company,
    double? delivery_cost,
    bool? in_process,
    int? id,
    String? status,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    bool? package_ready,
    String? direction,
    int? service_provider_id,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
        delivery_driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
          TRes>
      get customer =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
              .stub(_res);
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
          TRes>
      get driver_review_by_customer =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
              .stub(_res);
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
              .stub(_res);
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
      user:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer;

  TRes call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer({
    this.from_name,
    this.from_image,
    this.to_name,
    this.to_image,
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

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer.fromJson(
      Map<String, dynamic> json) {
    final l$from_name = json['from_name'];
    final l$from_image = json['from_image'];
    final l$to_name = json['to_name'];
    final l$to_image = json['to_image'];
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
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
      from_name: (l$from_name as String?),
      from_image: (l$from_image as String?),
      to_name: (l$to_name as String?),
      to_image: (l$to_image as String?),
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
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? from_name;

  final String? from_image;

  final String? to_name;

  final String? to_image;

  final String created_at;

  final int from_entity_id;

  final String from_entity_type;

  final int id;

  final String? note;

  final int rating;

  final int to_entity_id;

  final String to_entity_type;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$from_name = from_name;
    _resultData['from_name'] = l$from_name;
    final l$from_image = from_image;
    _resultData['from_image'] = l$from_image;
    final l$to_name = to_name;
    _resultData['to_name'] = l$to_name;
    final l$to_image = to_image;
    _resultData['to_image'] = l$to_image;
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
    final l$from_name = from_name;
    final l$from_image = from_image;
    final l$to_name = to_name;
    final l$to_image = to_image;
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
      l$from_name,
      l$from_image,
      l$to_name,
      l$to_image,
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$from_name = from_name;
    final lOther$from_name = other.from_name;
    if (l$from_name != lOther$from_name) {
      return false;
    }
    final l$from_image = from_image;
    final lOther$from_image = other.from_image;
    if (l$from_image != lOther$from_image) {
      return false;
    }
    final l$to_name = to_name;
    final lOther$to_name = other.to_name;
    if (l$to_name != lOther$to_name) {
      return false;
    }
    final l$to_image = to_image;
    final lOther$to_image = other.to_image;
    if (l$to_image != lOther$to_image) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer;

  TRes call({
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
      TRes> get customer;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? from_name = _undefined,
    Object? from_image = _undefined,
    Object? to_name = _undefined,
    Object? to_image = _undefined,
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
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
        from_name: from_name == _undefined
            ? _instance.from_name
            : (from_name as String?),
        from_image: from_image == _undefined
            ? _instance.from_image
            : (from_image as String?),
        to_name:
            to_name == _undefined ? _instance.to_name : (to_name as String?),
        to_image:
            to_image == _undefined ? _instance.to_image : (to_image as String?),
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
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
      this._res);

  TRes _res;

  call({
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
          TRes>
      get customer =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
      user:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer;

  TRes call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
      this._res);

  TRes _res;

  call({
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user({
    this.image,
    this.name,
    required this.id,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
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

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company;

  TRes call({
    int? id,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details({
    required this.image,
    required this.name,
    required this.currency,
    required this.location,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
      image: (l$image as String),
      name: (l$name as String),
      currency: (l$currency as String),
      location:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String currency;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$currency = currency;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$currency,
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details;

  TRes call({
    String? image,
    String? name,
    String? currency,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? currency,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
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

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver({
    this.current_location,
    required this.user,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$current_location = json['current_location'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      user:
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography? current_location;

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$current_location = current_location;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$current_location,
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver;

  TRes call({
    Geography? current_location,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? current_location = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
      this._res);

  TRes _res;

  call({
    Geography? current_location,
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
              .stub(_res);
}

class Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user {
  Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user({
    this.name,
    this.image,
    required this.id,
    required this.$__typename,
  });

  factory Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
      name: (l$name as String?),
      image: (l$image as String?),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
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
            is Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user) ||
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

extension UtilityExtension$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
    on Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user {
  CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user>
      get copyWith =>
          CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
    TRes> {
  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
    Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
        instance,
    TRes Function(
            Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user;

  factory CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user;

  TRes call({
    String? name,
    String? image,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
      _instance;

  final TRes Function(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_courier_order_items_by_id {
  factory Variables$Query$get_courier_order_items_by_id(
          {required int orderId}) =>
      Variables$Query$get_courier_order_items_by_id._({
        r'orderId': orderId,
      });

  Variables$Query$get_courier_order_items_by_id._(this._$data);

  factory Variables$Query$get_courier_order_items_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_courier_order_items_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_courier_order_items_by_id<
          Variables$Query$get_courier_order_items_by_id>
      get copyWith => CopyWith$Variables$Query$get_courier_order_items_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_courier_order_items_by_id) ||
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

abstract class CopyWith$Variables$Query$get_courier_order_items_by_id<TRes> {
  factory CopyWith$Variables$Query$get_courier_order_items_by_id(
    Variables$Query$get_courier_order_items_by_id instance,
    TRes Function(Variables$Query$get_courier_order_items_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_courier_order_items_by_id;

  factory CopyWith$Variables$Query$get_courier_order_items_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_courier_order_items_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_courier_order_items_by_id<TRes>
    implements CopyWith$Variables$Query$get_courier_order_items_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_courier_order_items_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_courier_order_items_by_id _instance;

  final TRes Function(Variables$Query$get_courier_order_items_by_id) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_courier_order_items_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_courier_order_items_by_id<TRes>
    implements CopyWith$Variables$Query$get_courier_order_items_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_courier_order_items_by_id(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_courier_order_items_by_id {
  Query$get_courier_order_items_by_id({
    required this.delivery_courier_order,
    required this.$__typename,
  });

  factory Query$get_courier_order_items_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_courier_order = json['delivery_courier_order'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_items_by_id(
      delivery_courier_order: (l$delivery_courier_order as List<dynamic>)
          .map((e) => Query$get_courier_order_items_by_id$delivery_courier_order
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_courier_order_items_by_id$delivery_courier_order>
      delivery_courier_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_courier_order = delivery_courier_order;
    _resultData['delivery_courier_order'] =
        l$delivery_courier_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_courier_order = delivery_courier_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_courier_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_courier_order_items_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_courier_order = delivery_courier_order;
    final lOther$delivery_courier_order = other.delivery_courier_order;
    if (l$delivery_courier_order.length !=
        lOther$delivery_courier_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_courier_order.length; i++) {
      final l$delivery_courier_order$entry = l$delivery_courier_order[i];
      final lOther$delivery_courier_order$entry =
          lOther$delivery_courier_order[i];
      if (l$delivery_courier_order$entry !=
          lOther$delivery_courier_order$entry) {
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

extension UtilityExtension$Query$get_courier_order_items_by_id
    on Query$get_courier_order_items_by_id {
  CopyWith$Query$get_courier_order_items_by_id<
          Query$get_courier_order_items_by_id>
      get copyWith => CopyWith$Query$get_courier_order_items_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_items_by_id<TRes> {
  factory CopyWith$Query$get_courier_order_items_by_id(
    Query$get_courier_order_items_by_id instance,
    TRes Function(Query$get_courier_order_items_by_id) then,
  ) = _CopyWithImpl$Query$get_courier_order_items_by_id;

  factory CopyWith$Query$get_courier_order_items_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_items_by_id;

  TRes call({
    List<Query$get_courier_order_items_by_id$delivery_courier_order>?
        delivery_courier_order,
    String? $__typename,
  });
  TRes delivery_courier_order(
      Iterable<Query$get_courier_order_items_by_id$delivery_courier_order> Function(
              Iterable<
                  CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
                      Query$get_courier_order_items_by_id$delivery_courier_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_courier_order_items_by_id<TRes>
    implements CopyWith$Query$get_courier_order_items_by_id<TRes> {
  _CopyWithImpl$Query$get_courier_order_items_by_id(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_items_by_id _instance;

  final TRes Function(Query$get_courier_order_items_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_courier_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_items_by_id(
        delivery_courier_order: delivery_courier_order == _undefined ||
                delivery_courier_order == null
            ? _instance.delivery_courier_order
            : (delivery_courier_order as List<
                Query$get_courier_order_items_by_id$delivery_courier_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_courier_order(
          Iterable<Query$get_courier_order_items_by_id$delivery_courier_order> Function(
                  Iterable<
                      CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
                          Query$get_courier_order_items_by_id$delivery_courier_order>>)
              _fn) =>
      call(
          delivery_courier_order: _fn(_instance.delivery_courier_order.map((e) =>
              CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_courier_order_items_by_id<TRes>
    implements CopyWith$Query$get_courier_order_items_by_id<TRes> {
  _CopyWithStubImpl$Query$get_courier_order_items_by_id(this._res);

  TRes _res;

  call({
    List<Query$get_courier_order_items_by_id$delivery_courier_order>?
        delivery_courier_order,
    String? $__typename,
  }) =>
      _res;
  delivery_courier_order(_fn) => _res;
}

const documentNodeQueryget_courier_order_items_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_courier_order_items_by_id'),
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
        name: NameNode(value: 'delivery_courier_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_order_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'orderId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'actual_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_cost'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'unavailable'),
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
Query$get_courier_order_items_by_id
    _parserFn$Query$get_courier_order_items_by_id(Map<String, dynamic> data) =>
        Query$get_courier_order_items_by_id.fromJson(data);

class Options$Query$get_courier_order_items_by_id
    extends graphql.QueryOptions<Query$get_courier_order_items_by_id> {
  Options$Query$get_courier_order_items_by_id({
    String? operationName,
    required Variables$Query$get_courier_order_items_by_id variables,
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
          document: documentNodeQueryget_courier_order_items_by_id,
          parserFn: _parserFn$Query$get_courier_order_items_by_id,
        );
}

class WatchOptions$Query$get_courier_order_items_by_id
    extends graphql.WatchQueryOptions<Query$get_courier_order_items_by_id> {
  WatchOptions$Query$get_courier_order_items_by_id({
    String? operationName,
    required Variables$Query$get_courier_order_items_by_id variables,
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
          document: documentNodeQueryget_courier_order_items_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_courier_order_items_by_id,
        );
}

class FetchMoreOptions$Query$get_courier_order_items_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_courier_order_items_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_courier_order_items_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_courier_order_items_by_id,
        );
}

extension ClientExtension$Query$get_courier_order_items_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_courier_order_items_by_id>>
      query$get_courier_order_items_by_id(
              Options$Query$get_courier_order_items_by_id options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_courier_order_items_by_id>
      watchQuery$get_courier_order_items_by_id(
              WatchOptions$Query$get_courier_order_items_by_id options) =>
          this.watchQuery(options);
  void writeQuery$get_courier_order_items_by_id({
    required Query$get_courier_order_items_by_id data,
    required Variables$Query$get_courier_order_items_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_courier_order_items_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_courier_order_items_by_id? readQuery$get_courier_order_items_by_id({
    required Variables$Query$get_courier_order_items_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_courier_order_items_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_courier_order_items_by_id.fromJson(result);
  }
}

class Query$get_courier_order_items_by_id$delivery_courier_order {
  Query$get_courier_order_items_by_id$delivery_courier_order({
    required this.items,
    required this.$__typename,
  });

  factory Query$get_courier_order_items_by_id$delivery_courier_order.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_items_by_id$delivery_courier_order(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$get_courier_order_items_by_id$delivery_courier_order$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_courier_order_items_by_id$delivery_courier_order$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$get_courier_order_items_by_id$delivery_courier_order) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_courier_order_items_by_id$delivery_courier_order
    on Query$get_courier_order_items_by_id$delivery_courier_order {
  CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
          Query$get_courier_order_items_by_id$delivery_courier_order>
      get copyWith =>
          CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
    TRes> {
  factory CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order(
    Query$get_courier_order_items_by_id$delivery_courier_order instance,
    TRes Function(Query$get_courier_order_items_by_id$delivery_courier_order)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order;

  factory CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order;

  TRes call({
    List<Query$get_courier_order_items_by_id$delivery_courier_order$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$get_courier_order_items_by_id$delivery_courier_order$items> Function(
              Iterable<
                  CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
                      Query$get_courier_order_items_by_id$delivery_courier_order$items>>)
          _fn);
}

class _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order<
        TRes>
    implements
        CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_items_by_id$delivery_courier_order _instance;

  final TRes Function(
      Query$get_courier_order_items_by_id$delivery_courier_order) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_items_by_id$delivery_courier_order(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$get_courier_order_items_by_id$delivery_courier_order$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$get_courier_order_items_by_id$delivery_courier_order$items> Function(
                  Iterable<
                      CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
                          Query$get_courier_order_items_by_id$delivery_courier_order$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order<
        TRes>
    implements
        CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order(
      this._res);

  TRes _res;

  call({
    List<Query$get_courier_order_items_by_id$delivery_courier_order$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$get_courier_order_items_by_id$delivery_courier_order$items {
  Query$get_courier_order_items_by_id$delivery_courier_order$items({
    this.actual_cost,
    this.estimated_cost,
    required this.id,
    this.image,
    required this.name,
    this.notes,
    required this.unavailable,
    required this.$__typename,
  });

  factory Query$get_courier_order_items_by_id$delivery_courier_order$items.fromJson(
      Map<String, dynamic> json) {
    final l$actual_cost = json['actual_cost'];
    final l$estimated_cost = json['estimated_cost'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$notes = json['notes'];
    final l$unavailable = json['unavailable'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_items_by_id$delivery_courier_order$items(
      actual_cost: l$actual_cost == null ? null : moneyFromJson(l$actual_cost),
      estimated_cost:
          l$estimated_cost == null ? null : moneyFromJson(l$estimated_cost),
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String),
      notes: (l$notes as String?),
      unavailable: (l$unavailable as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? actual_cost;

  final double? estimated_cost;

  final int id;

  final String? image;

  final String name;

  final String? notes;

  final bool unavailable;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_cost = actual_cost;
    _resultData['actual_cost'] =
        l$actual_cost == null ? null : moneyToJson(l$actual_cost);
    final l$estimated_cost = estimated_cost;
    _resultData['estimated_cost'] =
        l$estimated_cost == null ? null : moneyToJson(l$estimated_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$unavailable = unavailable;
    _resultData['unavailable'] = l$unavailable;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_cost = actual_cost;
    final l$estimated_cost = estimated_cost;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$notes = notes;
    final l$unavailable = unavailable;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_cost,
      l$estimated_cost,
      l$id,
      l$image,
      l$name,
      l$notes,
      l$unavailable,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_courier_order_items_by_id$delivery_courier_order$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_cost = actual_cost;
    final lOther$actual_cost = other.actual_cost;
    if (l$actual_cost != lOther$actual_cost) {
      return false;
    }
    final l$estimated_cost = estimated_cost;
    final lOther$estimated_cost = other.estimated_cost;
    if (l$estimated_cost != lOther$estimated_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$unavailable = unavailable;
    final lOther$unavailable = other.unavailable;
    if (l$unavailable != lOther$unavailable) {
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

extension UtilityExtension$Query$get_courier_order_items_by_id$delivery_courier_order$items
    on Query$get_courier_order_items_by_id$delivery_courier_order$items {
  CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
          Query$get_courier_order_items_by_id$delivery_courier_order$items>
      get copyWith =>
          CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
    TRes> {
  factory CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items(
    Query$get_courier_order_items_by_id$delivery_courier_order$items instance,
    TRes Function(
            Query$get_courier_order_items_by_id$delivery_courier_order$items)
        then,
  ) = _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items;

  factory CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items;

  TRes call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items<
        TRes>
    implements
        CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
            TRes> {
  _CopyWithImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_items_by_id$delivery_courier_order$items
      _instance;

  final TRes Function(
      Query$get_courier_order_items_by_id$delivery_courier_order$items) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_cost = _undefined,
    Object? estimated_cost = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? notes = _undefined,
    Object? unavailable = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_items_by_id$delivery_courier_order$items(
        actual_cost: actual_cost == _undefined
            ? _instance.actual_cost
            : (actual_cost as double?),
        estimated_cost: estimated_cost == _undefined
            ? _instance.estimated_cost
            : (estimated_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        unavailable: unavailable == _undefined || unavailable == null
            ? _instance.unavailable
            : (unavailable as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items<
        TRes>
    implements
        CopyWith$Query$get_courier_order_items_by_id$delivery_courier_order$items<
            TRes> {
  _CopyWithStubImpl$Query$get_courier_order_items_by_id$delivery_courier_order$items(
      this._res);

  TRes _res;

  call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_courier_order_bill {
  factory Variables$Query$get_courier_order_bill({required int orderId}) =>
      Variables$Query$get_courier_order_bill._({
        r'orderId': orderId,
      });

  Variables$Query$get_courier_order_bill._(this._$data);

  factory Variables$Query$get_courier_order_bill.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_courier_order_bill._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_courier_order_bill<
          Variables$Query$get_courier_order_bill>
      get copyWith => CopyWith$Variables$Query$get_courier_order_bill(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_courier_order_bill) ||
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

abstract class CopyWith$Variables$Query$get_courier_order_bill<TRes> {
  factory CopyWith$Variables$Query$get_courier_order_bill(
    Variables$Query$get_courier_order_bill instance,
    TRes Function(Variables$Query$get_courier_order_bill) then,
  ) = _CopyWithImpl$Variables$Query$get_courier_order_bill;

  factory CopyWith$Variables$Query$get_courier_order_bill.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_courier_order_bill;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_courier_order_bill<TRes>
    implements CopyWith$Variables$Query$get_courier_order_bill<TRes> {
  _CopyWithImpl$Variables$Query$get_courier_order_bill(
    this._instance,
    this._then,
  );

  final Variables$Query$get_courier_order_bill _instance;

  final TRes Function(Variables$Query$get_courier_order_bill) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_courier_order_bill._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_courier_order_bill<TRes>
    implements CopyWith$Variables$Query$get_courier_order_bill<TRes> {
  _CopyWithStubImpl$Variables$Query$get_courier_order_bill(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_courier_order_bill {
  Query$get_courier_order_bill({
    required this.delivery_courier_order,
    required this.$__typename,
  });

  factory Query$get_courier_order_bill.fromJson(Map<String, dynamic> json) {
    final l$delivery_courier_order = json['delivery_courier_order'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_bill(
      delivery_courier_order: (l$delivery_courier_order as List<dynamic>)
          .map((e) =>
              Query$get_courier_order_bill$delivery_courier_order.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_courier_order_bill$delivery_courier_order>
      delivery_courier_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_courier_order = delivery_courier_order;
    _resultData['delivery_courier_order'] =
        l$delivery_courier_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_courier_order = delivery_courier_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_courier_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_courier_order_bill) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_courier_order = delivery_courier_order;
    final lOther$delivery_courier_order = other.delivery_courier_order;
    if (l$delivery_courier_order.length !=
        lOther$delivery_courier_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_courier_order.length; i++) {
      final l$delivery_courier_order$entry = l$delivery_courier_order[i];
      final lOther$delivery_courier_order$entry =
          lOther$delivery_courier_order[i];
      if (l$delivery_courier_order$entry !=
          lOther$delivery_courier_order$entry) {
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

extension UtilityExtension$Query$get_courier_order_bill
    on Query$get_courier_order_bill {
  CopyWith$Query$get_courier_order_bill<Query$get_courier_order_bill>
      get copyWith => CopyWith$Query$get_courier_order_bill(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_bill<TRes> {
  factory CopyWith$Query$get_courier_order_bill(
    Query$get_courier_order_bill instance,
    TRes Function(Query$get_courier_order_bill) then,
  ) = _CopyWithImpl$Query$get_courier_order_bill;

  factory CopyWith$Query$get_courier_order_bill.stub(TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_bill;

  TRes call({
    List<Query$get_courier_order_bill$delivery_courier_order>?
        delivery_courier_order,
    String? $__typename,
  });
  TRes delivery_courier_order(
      Iterable<Query$get_courier_order_bill$delivery_courier_order> Function(
              Iterable<
                  CopyWith$Query$get_courier_order_bill$delivery_courier_order<
                      Query$get_courier_order_bill$delivery_courier_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_courier_order_bill<TRes>
    implements CopyWith$Query$get_courier_order_bill<TRes> {
  _CopyWithImpl$Query$get_courier_order_bill(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_bill _instance;

  final TRes Function(Query$get_courier_order_bill) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_courier_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_bill(
        delivery_courier_order: delivery_courier_order == _undefined ||
                delivery_courier_order == null
            ? _instance.delivery_courier_order
            : (delivery_courier_order
                as List<Query$get_courier_order_bill$delivery_courier_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_courier_order(
          Iterable<Query$get_courier_order_bill$delivery_courier_order> Function(
                  Iterable<
                      CopyWith$Query$get_courier_order_bill$delivery_courier_order<
                          Query$get_courier_order_bill$delivery_courier_order>>)
              _fn) =>
      call(
          delivery_courier_order: _fn(_instance.delivery_courier_order.map(
              (e) =>
                  CopyWith$Query$get_courier_order_bill$delivery_courier_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_courier_order_bill<TRes>
    implements CopyWith$Query$get_courier_order_bill<TRes> {
  _CopyWithStubImpl$Query$get_courier_order_bill(this._res);

  TRes _res;

  call({
    List<Query$get_courier_order_bill$delivery_courier_order>?
        delivery_courier_order,
    String? $__typename,
  }) =>
      _res;
  delivery_courier_order(_fn) => _res;
}

const documentNodeQueryget_courier_order_bill = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_courier_order_bill'),
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
        name: NameNode(value: 'delivery_courier_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_order_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'orderId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'bill_image'),
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
Query$get_courier_order_bill _parserFn$Query$get_courier_order_bill(
        Map<String, dynamic> data) =>
    Query$get_courier_order_bill.fromJson(data);

class Options$Query$get_courier_order_bill
    extends graphql.QueryOptions<Query$get_courier_order_bill> {
  Options$Query$get_courier_order_bill({
    String? operationName,
    required Variables$Query$get_courier_order_bill variables,
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
          document: documentNodeQueryget_courier_order_bill,
          parserFn: _parserFn$Query$get_courier_order_bill,
        );
}

class WatchOptions$Query$get_courier_order_bill
    extends graphql.WatchQueryOptions<Query$get_courier_order_bill> {
  WatchOptions$Query$get_courier_order_bill({
    String? operationName,
    required Variables$Query$get_courier_order_bill variables,
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
          document: documentNodeQueryget_courier_order_bill,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_courier_order_bill,
        );
}

class FetchMoreOptions$Query$get_courier_order_bill
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_courier_order_bill({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_courier_order_bill variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_courier_order_bill,
        );
}

extension ClientExtension$Query$get_courier_order_bill
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_courier_order_bill>>
      query$get_courier_order_bill(
              Options$Query$get_courier_order_bill options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_courier_order_bill>
      watchQuery$get_courier_order_bill(
              WatchOptions$Query$get_courier_order_bill options) =>
          this.watchQuery(options);
  void writeQuery$get_courier_order_bill({
    required Query$get_courier_order_bill data,
    required Variables$Query$get_courier_order_bill variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_courier_order_bill),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_courier_order_bill? readQuery$get_courier_order_bill({
    required Variables$Query$get_courier_order_bill variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_courier_order_bill),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_courier_order_bill.fromJson(result);
  }
}

class Query$get_courier_order_bill$delivery_courier_order {
  Query$get_courier_order_bill$delivery_courier_order({
    this.bill_image,
    required this.$__typename,
  });

  factory Query$get_courier_order_bill$delivery_courier_order.fromJson(
      Map<String, dynamic> json) {
    final l$bill_image = json['bill_image'];
    final l$$__typename = json['__typename'];
    return Query$get_courier_order_bill$delivery_courier_order(
      bill_image: (l$bill_image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? bill_image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bill_image = bill_image;
    _resultData['bill_image'] = l$bill_image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bill_image = bill_image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bill_image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_courier_order_bill$delivery_courier_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bill_image = bill_image;
    final lOther$bill_image = other.bill_image;
    if (l$bill_image != lOther$bill_image) {
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

extension UtilityExtension$Query$get_courier_order_bill$delivery_courier_order
    on Query$get_courier_order_bill$delivery_courier_order {
  CopyWith$Query$get_courier_order_bill$delivery_courier_order<
          Query$get_courier_order_bill$delivery_courier_order>
      get copyWith =>
          CopyWith$Query$get_courier_order_bill$delivery_courier_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_courier_order_bill$delivery_courier_order<
    TRes> {
  factory CopyWith$Query$get_courier_order_bill$delivery_courier_order(
    Query$get_courier_order_bill$delivery_courier_order instance,
    TRes Function(Query$get_courier_order_bill$delivery_courier_order) then,
  ) = _CopyWithImpl$Query$get_courier_order_bill$delivery_courier_order;

  factory CopyWith$Query$get_courier_order_bill$delivery_courier_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_courier_order_bill$delivery_courier_order;

  TRes call({
    String? bill_image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_courier_order_bill$delivery_courier_order<TRes>
    implements
        CopyWith$Query$get_courier_order_bill$delivery_courier_order<TRes> {
  _CopyWithImpl$Query$get_courier_order_bill$delivery_courier_order(
    this._instance,
    this._then,
  );

  final Query$get_courier_order_bill$delivery_courier_order _instance;

  final TRes Function(Query$get_courier_order_bill$delivery_courier_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bill_image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_courier_order_bill$delivery_courier_order(
        bill_image: bill_image == _undefined
            ? _instance.bill_image
            : (bill_image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_courier_order_bill$delivery_courier_order<
        TRes>
    implements
        CopyWith$Query$get_courier_order_bill$delivery_courier_order<TRes> {
  _CopyWithStubImpl$Query$get_courier_order_bill$delivery_courier_order(
      this._res);

  TRes _res;

  call({
    String? bill_image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateCourierOrderItem {
  factory Variables$Mutation$updateCourierOrderItem({
    Input$delivery_courier_order_item_set_input? data,
    required int id,
  }) =>
      Variables$Mutation$updateCourierOrderItem._({
        if (data != null) r'data': data,
        r'id': id,
      });

  Variables$Mutation$updateCourierOrderItem._(this._$data);

  factory Variables$Mutation$updateCourierOrderItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$delivery_courier_order_item_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$updateCourierOrderItem._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$delivery_courier_order_item_set_input? get data =>
      (_$data['data'] as Input$delivery_courier_order_item_set_input?);
  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateCourierOrderItem<
          Variables$Mutation$updateCourierOrderItem>
      get copyWith => CopyWith$Variables$Mutation$updateCourierOrderItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateCourierOrderItem) ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$id = id;
    return Object.hashAll([
      _$data.containsKey('data') ? l$data : const {},
      l$id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateCourierOrderItem<TRes> {
  factory CopyWith$Variables$Mutation$updateCourierOrderItem(
    Variables$Mutation$updateCourierOrderItem instance,
    TRes Function(Variables$Mutation$updateCourierOrderItem) then,
  ) = _CopyWithImpl$Variables$Mutation$updateCourierOrderItem;

  factory CopyWith$Variables$Mutation$updateCourierOrderItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateCourierOrderItem;

  TRes call({
    Input$delivery_courier_order_item_set_input? data,
    int? id,
  });
}

class _CopyWithImpl$Variables$Mutation$updateCourierOrderItem<TRes>
    implements CopyWith$Variables$Mutation$updateCourierOrderItem<TRes> {
  _CopyWithImpl$Variables$Mutation$updateCourierOrderItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateCourierOrderItem _instance;

  final TRes Function(Variables$Mutation$updateCourierOrderItem) _then;

  static const _undefined = {};

  TRes call({
    Object? data = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Variables$Mutation$updateCourierOrderItem._({
        ..._instance._$data,
        if (data != _undefined)
          'data': (data as Input$delivery_courier_order_item_set_input?),
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateCourierOrderItem<TRes>
    implements CopyWith$Variables$Mutation$updateCourierOrderItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateCourierOrderItem(this._res);

  TRes _res;

  call({
    Input$delivery_courier_order_item_set_input? data,
    int? id,
  }) =>
      _res;
}

class Mutation$updateCourierOrderItem {
  Mutation$updateCourierOrderItem({
    this.update_delivery_courier_order_item_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateCourierOrderItem.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_courier_order_item_by_pk =
        json['update_delivery_courier_order_item_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCourierOrderItem(
      update_delivery_courier_order_item_by_pk:
          l$update_delivery_courier_order_item_by_pk == null
              ? null
              : Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
                  .fromJson((l$update_delivery_courier_order_item_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk?
      update_delivery_courier_order_item_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_courier_order_item_by_pk =
        update_delivery_courier_order_item_by_pk;
    _resultData['update_delivery_courier_order_item_by_pk'] =
        l$update_delivery_courier_order_item_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_courier_order_item_by_pk =
        update_delivery_courier_order_item_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_courier_order_item_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCourierOrderItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_courier_order_item_by_pk =
        update_delivery_courier_order_item_by_pk;
    final lOther$update_delivery_courier_order_item_by_pk =
        other.update_delivery_courier_order_item_by_pk;
    if (l$update_delivery_courier_order_item_by_pk !=
        lOther$update_delivery_courier_order_item_by_pk) {
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

extension UtilityExtension$Mutation$updateCourierOrderItem
    on Mutation$updateCourierOrderItem {
  CopyWith$Mutation$updateCourierOrderItem<Mutation$updateCourierOrderItem>
      get copyWith => CopyWith$Mutation$updateCourierOrderItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCourierOrderItem<TRes> {
  factory CopyWith$Mutation$updateCourierOrderItem(
    Mutation$updateCourierOrderItem instance,
    TRes Function(Mutation$updateCourierOrderItem) then,
  ) = _CopyWithImpl$Mutation$updateCourierOrderItem;

  factory CopyWith$Mutation$updateCourierOrderItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateCourierOrderItem;

  TRes call({
    Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk?
        update_delivery_courier_order_item_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
      TRes> get update_delivery_courier_order_item_by_pk;
}

class _CopyWithImpl$Mutation$updateCourierOrderItem<TRes>
    implements CopyWith$Mutation$updateCourierOrderItem<TRes> {
  _CopyWithImpl$Mutation$updateCourierOrderItem(
    this._instance,
    this._then,
  );

  final Mutation$updateCourierOrderItem _instance;

  final TRes Function(Mutation$updateCourierOrderItem) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_courier_order_item_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCourierOrderItem(
        update_delivery_courier_order_item_by_pk:
            update_delivery_courier_order_item_by_pk == _undefined
                ? _instance.update_delivery_courier_order_item_by_pk
                : (update_delivery_courier_order_item_by_pk
                    as Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
      TRes> get update_delivery_courier_order_item_by_pk {
    final local$update_delivery_courier_order_item_by_pk =
        _instance.update_delivery_courier_order_item_by_pk;
    return local$update_delivery_courier_order_item_by_pk == null
        ? CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
            local$update_delivery_courier_order_item_by_pk,
            (e) => call(update_delivery_courier_order_item_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCourierOrderItem<TRes>
    implements CopyWith$Mutation$updateCourierOrderItem<TRes> {
  _CopyWithStubImpl$Mutation$updateCourierOrderItem(this._res);

  TRes _res;

  call({
    Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk?
        update_delivery_courier_order_item_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
          TRes>
      get update_delivery_courier_order_item_by_pk =>
          CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
              .stub(_res);
}

const documentNodeMutationupdateCourierOrderItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateCourierOrderItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_courier_order_item_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'update_delivery_courier_order_item_by_pk'),
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
            name: NameNode(value: 'actual_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_cost'),
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
            name: NameNode(value: 'notes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'unavailable'),
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
Mutation$updateCourierOrderItem _parserFn$Mutation$updateCourierOrderItem(
        Map<String, dynamic> data) =>
    Mutation$updateCourierOrderItem.fromJson(data);
typedef OnMutationCompleted$Mutation$updateCourierOrderItem = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateCourierOrderItem?,
);

class Options$Mutation$updateCourierOrderItem
    extends graphql.MutationOptions<Mutation$updateCourierOrderItem> {
  Options$Mutation$updateCourierOrderItem({
    String? operationName,
    required Variables$Mutation$updateCourierOrderItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateCourierOrderItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateCourierOrderItem>? update,
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
                        : _parserFn$Mutation$updateCourierOrderItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateCourierOrderItem,
          parserFn: _parserFn$Mutation$updateCourierOrderItem,
        );

  final OnMutationCompleted$Mutation$updateCourierOrderItem?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateCourierOrderItem
    extends graphql.WatchQueryOptions<Mutation$updateCourierOrderItem> {
  WatchOptions$Mutation$updateCourierOrderItem({
    String? operationName,
    required Variables$Mutation$updateCourierOrderItem variables,
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
          document: documentNodeMutationupdateCourierOrderItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateCourierOrderItem,
        );
}

extension ClientExtension$Mutation$updateCourierOrderItem
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateCourierOrderItem>>
      mutate$updateCourierOrderItem(
              Options$Mutation$updateCourierOrderItem options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateCourierOrderItem>
      watchMutation$updateCourierOrderItem(
              WatchOptions$Mutation$updateCourierOrderItem options) =>
          this.watchMutation(options);
}

class Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk {
  Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk({
    this.actual_cost,
    this.estimated_cost,
    required this.id,
    this.image,
    required this.name,
    this.notes,
    required this.unavailable,
    required this.order_id,
    required this.$__typename,
  });

  factory Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$actual_cost = json['actual_cost'];
    final l$estimated_cost = json['estimated_cost'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$notes = json['notes'];
    final l$unavailable = json['unavailable'];
    final l$order_id = json['order_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
      actual_cost: l$actual_cost == null ? null : moneyFromJson(l$actual_cost),
      estimated_cost:
          l$estimated_cost == null ? null : moneyFromJson(l$estimated_cost),
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String),
      notes: (l$notes as String?),
      unavailable: (l$unavailable as bool),
      order_id: (l$order_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? actual_cost;

  final double? estimated_cost;

  final int id;

  final String? image;

  final String name;

  final String? notes;

  final bool unavailable;

  final int order_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_cost = actual_cost;
    _resultData['actual_cost'] =
        l$actual_cost == null ? null : moneyToJson(l$actual_cost);
    final l$estimated_cost = estimated_cost;
    _resultData['estimated_cost'] =
        l$estimated_cost == null ? null : moneyToJson(l$estimated_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$unavailable = unavailable;
    _resultData['unavailable'] = l$unavailable;
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_cost = actual_cost;
    final l$estimated_cost = estimated_cost;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$notes = notes;
    final l$unavailable = unavailable;
    final l$order_id = order_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_cost,
      l$estimated_cost,
      l$id,
      l$image,
      l$name,
      l$notes,
      l$unavailable,
      l$order_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_cost = actual_cost;
    final lOther$actual_cost = other.actual_cost;
    if (l$actual_cost != lOther$actual_cost) {
      return false;
    }
    final l$estimated_cost = estimated_cost;
    final lOther$estimated_cost = other.estimated_cost;
    if (l$estimated_cost != lOther$estimated_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$unavailable = unavailable;
    final lOther$unavailable = other.unavailable;
    if (l$unavailable != lOther$unavailable) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
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

extension UtilityExtension$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
    on Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk {
  CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
          Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
    Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
        instance,
    TRes Function(
            Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk;

  factory CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk;

  TRes call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    int? order_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk
      _instance;

  final TRes Function(
          Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_cost = _undefined,
    Object? estimated_cost = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? notes = _undefined,
    Object? unavailable = _undefined,
    Object? order_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
        actual_cost: actual_cost == _undefined
            ? _instance.actual_cost
            : (actual_cost as double?),
        estimated_cost: estimated_cost == _undefined
            ? _instance.estimated_cost
            : (estimated_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        unavailable: unavailable == _undefined || unavailable == null
            ? _instance.unavailable
            : (unavailable as bool),
        order_id: order_id == _undefined || order_id == null
            ? _instance.order_id
            : (order_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCourierOrderItem$update_delivery_courier_order_item_by_pk(
      this._res);

  TRes _res;

  call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    int? order_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateCourierOrder {
  factory Variables$Mutation$updateCourierOrder({
    required int deliveryOrderId,
    Input$delivery_courier_order_set_input? data,
  }) =>
      Variables$Mutation$updateCourierOrder._({
        r'deliveryOrderId': deliveryOrderId,
        if (data != null) r'data': data,
      });

  Variables$Mutation$updateCourierOrder._(this._$data);

  factory Variables$Mutation$updateCourierOrder.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$deliveryOrderId = data['deliveryOrderId'];
    result$data['deliveryOrderId'] = (l$deliveryOrderId as int);
    if (data.containsKey('data')) {
      final l$data = data['data'];
      result$data['data'] = l$data == null
          ? null
          : Input$delivery_courier_order_set_input.fromJson(
              (l$data as Map<String, dynamic>));
    }
    return Variables$Mutation$updateCourierOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  int get deliveryOrderId => (_$data['deliveryOrderId'] as int);
  Input$delivery_courier_order_set_input? get data =>
      (_$data['data'] as Input$delivery_courier_order_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$deliveryOrderId = deliveryOrderId;
    result$data['deliveryOrderId'] = l$deliveryOrderId;
    if (_$data.containsKey('data')) {
      final l$data = data;
      result$data['data'] = l$data?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateCourierOrder<
          Variables$Mutation$updateCourierOrder>
      get copyWith => CopyWith$Variables$Mutation$updateCourierOrder(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateCourierOrder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deliveryOrderId = deliveryOrderId;
    final lOther$deliveryOrderId = other.deliveryOrderId;
    if (l$deliveryOrderId != lOther$deliveryOrderId) {
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
    final l$deliveryOrderId = deliveryOrderId;
    final l$data = data;
    return Object.hashAll([
      l$deliveryOrderId,
      _$data.containsKey('data') ? l$data : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateCourierOrder<TRes> {
  factory CopyWith$Variables$Mutation$updateCourierOrder(
    Variables$Mutation$updateCourierOrder instance,
    TRes Function(Variables$Mutation$updateCourierOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$updateCourierOrder;

  factory CopyWith$Variables$Mutation$updateCourierOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateCourierOrder;

  TRes call({
    int? deliveryOrderId,
    Input$delivery_courier_order_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateCourierOrder<TRes>
    implements CopyWith$Variables$Mutation$updateCourierOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$updateCourierOrder(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateCourierOrder _instance;

  final TRes Function(Variables$Mutation$updateCourierOrder) _then;

  static const _undefined = {};

  TRes call({
    Object? deliveryOrderId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateCourierOrder._({
        ..._instance._$data,
        if (deliveryOrderId != _undefined && deliveryOrderId != null)
          'deliveryOrderId': (deliveryOrderId as int),
        if (data != _undefined)
          'data': (data as Input$delivery_courier_order_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateCourierOrder<TRes>
    implements CopyWith$Variables$Mutation$updateCourierOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateCourierOrder(this._res);

  TRes _res;

  call({
    int? deliveryOrderId,
    Input$delivery_courier_order_set_input? data,
  }) =>
      _res;
}

class Mutation$updateCourierOrder {
  Mutation$updateCourierOrder({
    this.update_delivery_courier_order,
    required this.$__typename,
  });

  factory Mutation$updateCourierOrder.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_courier_order =
        json['update_delivery_courier_order'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCourierOrder(
      update_delivery_courier_order: l$update_delivery_courier_order == null
          ? null
          : Mutation$updateCourierOrder$update_delivery_courier_order.fromJson(
              (l$update_delivery_courier_order as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateCourierOrder$update_delivery_courier_order?
      update_delivery_courier_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_courier_order = update_delivery_courier_order;
    _resultData['update_delivery_courier_order'] =
        l$update_delivery_courier_order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_courier_order = update_delivery_courier_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_courier_order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCourierOrder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_courier_order = update_delivery_courier_order;
    final lOther$update_delivery_courier_order =
        other.update_delivery_courier_order;
    if (l$update_delivery_courier_order !=
        lOther$update_delivery_courier_order) {
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

extension UtilityExtension$Mutation$updateCourierOrder
    on Mutation$updateCourierOrder {
  CopyWith$Mutation$updateCourierOrder<Mutation$updateCourierOrder>
      get copyWith => CopyWith$Mutation$updateCourierOrder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCourierOrder<TRes> {
  factory CopyWith$Mutation$updateCourierOrder(
    Mutation$updateCourierOrder instance,
    TRes Function(Mutation$updateCourierOrder) then,
  ) = _CopyWithImpl$Mutation$updateCourierOrder;

  factory CopyWith$Mutation$updateCourierOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateCourierOrder;

  TRes call({
    Mutation$updateCourierOrder$update_delivery_courier_order?
        update_delivery_courier_order,
    String? $__typename,
  });
  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<TRes>
      get update_delivery_courier_order;
}

class _CopyWithImpl$Mutation$updateCourierOrder<TRes>
    implements CopyWith$Mutation$updateCourierOrder<TRes> {
  _CopyWithImpl$Mutation$updateCourierOrder(
    this._instance,
    this._then,
  );

  final Mutation$updateCourierOrder _instance;

  final TRes Function(Mutation$updateCourierOrder) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_courier_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCourierOrder(
        update_delivery_courier_order: update_delivery_courier_order ==
                _undefined
            ? _instance.update_delivery_courier_order
            : (update_delivery_courier_order
                as Mutation$updateCourierOrder$update_delivery_courier_order?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<TRes>
      get update_delivery_courier_order {
    final local$update_delivery_courier_order =
        _instance.update_delivery_courier_order;
    return local$update_delivery_courier_order == null
        ? CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order
            .stub(_then(_instance))
        : CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order(
            local$update_delivery_courier_order,
            (e) => call(update_delivery_courier_order: e));
  }
}

class _CopyWithStubImpl$Mutation$updateCourierOrder<TRes>
    implements CopyWith$Mutation$updateCourierOrder<TRes> {
  _CopyWithStubImpl$Mutation$updateCourierOrder(this._res);

  TRes _res;

  call({
    Mutation$updateCourierOrder$update_delivery_courier_order?
        update_delivery_courier_order,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<TRes>
      get update_delivery_courier_order =>
          CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order
              .stub(_res);
}

const documentNodeMutationupdateCourierOrder = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateCourierOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'deliveryOrderId')),
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
          name: NameNode(value: 'delivery_courier_order_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_courier_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_order_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value:
                        VariableNode(name: NameNode(value: 'deliveryOrderId')),
                  )
                ]),
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
            name: NameNode(value: 'affected_rows'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'returning'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bill_image'),
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
                name: NameNode(value: 'tax'),
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
Mutation$updateCourierOrder _parserFn$Mutation$updateCourierOrder(
        Map<String, dynamic> data) =>
    Mutation$updateCourierOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$updateCourierOrder = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateCourierOrder?,
);

class Options$Mutation$updateCourierOrder
    extends graphql.MutationOptions<Mutation$updateCourierOrder> {
  Options$Mutation$updateCourierOrder({
    String? operationName,
    required Variables$Mutation$updateCourierOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateCourierOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateCourierOrder>? update,
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
                        : _parserFn$Mutation$updateCourierOrder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateCourierOrder,
          parserFn: _parserFn$Mutation$updateCourierOrder,
        );

  final OnMutationCompleted$Mutation$updateCourierOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateCourierOrder
    extends graphql.WatchQueryOptions<Mutation$updateCourierOrder> {
  WatchOptions$Mutation$updateCourierOrder({
    String? operationName,
    required Variables$Mutation$updateCourierOrder variables,
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
          document: documentNodeMutationupdateCourierOrder,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateCourierOrder,
        );
}

extension ClientExtension$Mutation$updateCourierOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateCourierOrder>>
      mutate$updateCourierOrder(
              Options$Mutation$updateCourierOrder options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateCourierOrder>
      watchMutation$updateCourierOrder(
              WatchOptions$Mutation$updateCourierOrder options) =>
          this.watchMutation(options);
}

class Mutation$updateCourierOrder$update_delivery_courier_order {
  Mutation$updateCourierOrder$update_delivery_courier_order({
    required this.affected_rows,
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$updateCourierOrder$update_delivery_courier_order.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCourierOrder$update_delivery_courier_order(
      affected_rows: (l$affected_rows as int),
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$updateCourierOrder$update_delivery_courier_order$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final List<
          Mutation$updateCourierOrder$update_delivery_courier_order$returning>
      returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateCourierOrder$update_delivery_courier_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
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

extension UtilityExtension$Mutation$updateCourierOrder$update_delivery_courier_order
    on Mutation$updateCourierOrder$update_delivery_courier_order {
  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<
          Mutation$updateCourierOrder$update_delivery_courier_order>
      get copyWith =>
          CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<
    TRes> {
  factory CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order(
    Mutation$updateCourierOrder$update_delivery_courier_order instance,
    TRes Function(Mutation$updateCourierOrder$update_delivery_courier_order)
        then,
  ) = _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order;

  factory CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order;

  TRes call({
    int? affected_rows,
    List<Mutation$updateCourierOrder$update_delivery_courier_order$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$updateCourierOrder$update_delivery_courier_order$returning> Function(
              Iterable<
                  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
                      Mutation$updateCourierOrder$update_delivery_courier_order$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<
            TRes> {
  _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order(
    this._instance,
    this._then,
  );

  final Mutation$updateCourierOrder$update_delivery_courier_order _instance;

  final TRes Function(Mutation$updateCourierOrder$update_delivery_courier_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCourierOrder$update_delivery_courier_order(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$updateCourierOrder$update_delivery_courier_order$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$updateCourierOrder$update_delivery_courier_order$returning> Function(
                  Iterable<
                      CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
                          Mutation$updateCourierOrder$update_delivery_courier_order$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    List<Mutation$updateCourierOrder$update_delivery_courier_order$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$updateCourierOrder$update_delivery_courier_order$returning {
  Mutation$updateCourierOrder$update_delivery_courier_order$returning({
    this.bill_image,
    required this.id,
    required this.tax,
    required this.$__typename,
  });

  factory Mutation$updateCourierOrder$update_delivery_courier_order$returning.fromJson(
      Map<String, dynamic> json) {
    final l$bill_image = json['bill_image'];
    final l$id = json['id'];
    final l$tax = json['tax'];
    final l$$__typename = json['__typename'];
    return Mutation$updateCourierOrder$update_delivery_courier_order$returning(
      bill_image: (l$bill_image as String?),
      id: (l$id as int),
      tax: moneyFromJson(l$tax),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? bill_image;

  final int id;

  final double tax;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bill_image = bill_image;
    _resultData['bill_image'] = l$bill_image;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bill_image = bill_image;
    final l$id = id;
    final l$tax = tax;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bill_image,
      l$id,
      l$tax,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateCourierOrder$update_delivery_courier_order$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bill_image = bill_image;
    final lOther$bill_image = other.bill_image;
    if (l$bill_image != lOther$bill_image) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
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

extension UtilityExtension$Mutation$updateCourierOrder$update_delivery_courier_order$returning
    on Mutation$updateCourierOrder$update_delivery_courier_order$returning {
  CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
          Mutation$updateCourierOrder$update_delivery_courier_order$returning>
      get copyWith =>
          CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
    TRes> {
  factory CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning(
    Mutation$updateCourierOrder$update_delivery_courier_order$returning
        instance,
    TRes Function(
            Mutation$updateCourierOrder$update_delivery_courier_order$returning)
        then,
  ) = _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning;

  factory CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning;

  TRes call({
    String? bill_image,
    int? id,
    double? tax,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
            TRes> {
  _CopyWithImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning(
    this._instance,
    this._then,
  );

  final Mutation$updateCourierOrder$update_delivery_courier_order$returning
      _instance;

  final TRes Function(
          Mutation$updateCourierOrder$update_delivery_courier_order$returning)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bill_image = _undefined,
    Object? id = _undefined,
    Object? tax = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateCourierOrder$update_delivery_courier_order$returning(
        bill_image: bill_image == _undefined
            ? _instance.bill_image
            : (bill_image as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
        TRes>
    implements
        CopyWith$Mutation$updateCourierOrder$update_delivery_courier_order$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$updateCourierOrder$update_delivery_courier_order$returning(
      this._res);

  TRes _res;

  call({
    String? bill_image,
    int? id,
    double? tax,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_courier_order_by_id {
  factory Variables$Subscription$listen_on_courier_order_by_id(
          {required int orderId}) =>
      Variables$Subscription$listen_on_courier_order_by_id._({
        r'orderId': orderId,
      });

  Variables$Subscription$listen_on_courier_order_by_id._(this._$data);

  factory Variables$Subscription$listen_on_courier_order_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$listen_on_courier_order_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_courier_order_by_id<
          Variables$Subscription$listen_on_courier_order_by_id>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_courier_order_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_courier_order_by_id) ||
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

abstract class CopyWith$Variables$Subscription$listen_on_courier_order_by_id<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_courier_order_by_id(
    Variables$Subscription$listen_on_courier_order_by_id instance,
    TRes Function(Variables$Subscription$listen_on_courier_order_by_id) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_courier_order_by_id;

  factory CopyWith$Variables$Subscription$listen_on_courier_order_by_id.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_courier_order_by_id;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$listen_on_courier_order_by_id<TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_courier_order_by_id<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_courier_order_by_id(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_courier_order_by_id _instance;

  final TRes Function(Variables$Subscription$listen_on_courier_order_by_id)
      _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$listen_on_courier_order_by_id._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_courier_order_by_id<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_courier_order_by_id<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_courier_order_by_id(
      this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$listen_on_courier_order_by_id {
  Subscription$listen_on_courier_order_by_id({
    this.delivery_courier_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_courier_order_by_pk = json['delivery_courier_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id(
      delivery_courier_order_by_pk: l$delivery_courier_order_by_pk == null
          ? null
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
              .fromJson(
                  (l$delivery_courier_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk?
      delivery_courier_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    _resultData['delivery_courier_order_by_pk'] =
        l$delivery_courier_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_courier_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_courier_order_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_courier_order_by_pk = delivery_courier_order_by_pk;
    final lOther$delivery_courier_order_by_pk =
        other.delivery_courier_order_by_pk;
    if (l$delivery_courier_order_by_pk != lOther$delivery_courier_order_by_pk) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id
    on Subscription$listen_on_courier_order_by_id {
  CopyWith$Subscription$listen_on_courier_order_by_id<
          Subscription$listen_on_courier_order_by_id>
      get copyWith => CopyWith$Subscription$listen_on_courier_order_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id<TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id(
    Subscription$listen_on_courier_order_by_id instance,
    TRes Function(Subscription$listen_on_courier_order_by_id) then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id;

  factory CopyWith$Subscription$listen_on_courier_order_by_id.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id;

  TRes call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk?
        delivery_courier_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
      TRes> get delivery_courier_order_by_pk;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_courier_order_by_id<TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id _instance;

  final TRes Function(Subscription$listen_on_courier_order_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_courier_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_courier_order_by_id(
        delivery_courier_order_by_pk: delivery_courier_order_by_pk == _undefined
            ? _instance.delivery_courier_order_by_pk
            : (delivery_courier_order_by_pk
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
      TRes> get delivery_courier_order_by_pk {
    final local$delivery_courier_order_by_pk =
        _instance.delivery_courier_order_by_pk;
    return local$delivery_courier_order_by_pk == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
            local$delivery_courier_order_by_pk,
            (e) => call(delivery_courier_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id<TRes>
    implements CopyWith$Subscription$listen_on_courier_order_by_id<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id(this._res);

  TRes _res;

  call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk?
        delivery_courier_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
          TRes>
      get delivery_courier_order_by_pk =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
              .stub(_res);
}

const documentNodeSubscriptionlisten_on_courier_order_by_id =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_courier_order_by_id'),
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
        name: NameNode(value: 'delivery_courier_order_by_pk'),
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
            name: NameNode(value: 'customer_id'),
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
            name: NameNode(value: 'from_location_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'from_location_text'),
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
            name: NameNode(value: 'bill_image'),
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
            name: NameNode(value: 'actual_items_cost'),
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
            name: NameNode(value: 'stripe_fees'),
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
            name: NameNode(value: 'to_location_address'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'actual_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_cost'),
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
                name: NameNode(value: 'notes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'unavailable'),
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
            name: NameNode(value: 'delivery_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'driver_review_by_customer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'from_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'from_image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'to_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'to_image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
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
                name: NameNode(value: 'change_price_request'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'schedule_time'),
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
                        name: NameNode(value: 'language_id'),
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
                name: NameNode(value: 'chat_with_customer_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'chat_with_service_provider_id'),
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
                name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_arrival_at_pickup_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_package_ready_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'pickup_address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'pickup_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_company'),
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
                        name: NameNode(value: 'currency'),
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
                name: NameNode(value: 'in_process'),
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
                name: NameNode(value: 'schedule_time'),
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
                name: NameNode(value: 'service_provider_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_distance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_duration'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trip_polyline'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'package_ready'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'direction'),
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
                name: NameNode(value: 'delivery_driver'),
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
Subscription$listen_on_courier_order_by_id
    _parserFn$Subscription$listen_on_courier_order_by_id(
            Map<String, dynamic> data) =>
        Subscription$listen_on_courier_order_by_id.fromJson(data);

class Options$Subscription$listen_on_courier_order_by_id extends graphql
    .SubscriptionOptions<Subscription$listen_on_courier_order_by_id> {
  Options$Subscription$listen_on_courier_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_courier_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_courier_order_by_id,
          parserFn: _parserFn$Subscription$listen_on_courier_order_by_id,
        );
}

class WatchOptions$Subscription$listen_on_courier_order_by_id extends graphql
    .WatchQueryOptions<Subscription$listen_on_courier_order_by_id> {
  WatchOptions$Subscription$listen_on_courier_order_by_id({
    String? operationName,
    required Variables$Subscription$listen_on_courier_order_by_id variables,
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
          document: documentNodeSubscriptionlisten_on_courier_order_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_courier_order_by_id,
        );
}

class FetchMoreOptions$Subscription$listen_on_courier_order_by_id
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_courier_order_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_courier_order_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_courier_order_by_id,
        );
}

extension ClientExtension$Subscription$listen_on_courier_order_by_id
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_courier_order_by_id>>
      subscribe$listen_on_courier_order_by_id(
              Options$Subscription$listen_on_courier_order_by_id options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_courier_order_by_id>
      watchSubscription$listen_on_courier_order_by_id(
              WatchOptions$Subscription$listen_on_courier_order_by_id
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk({
    required this.customer_id,
    required this.discount_value,
    this.from_location_gps,
    this.from_location_text,
    required this.id,
    required this.order_time,
    required this.payment_type,
    required this.refund_amount,
    required this.stripe_fees,
    this.stripe_info,
    this.bill_image,
    this.total_cost,
    this.actual_items_cost,
    required this.tax,
    required this.to_location_address,
    required this.to_location_gps,
    required this.items,
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$customer_id = json['customer_id'];
    final l$discount_value = json['discount_value'];
    final l$from_location_gps = json['from_location_gps'];
    final l$from_location_text = json['from_location_text'];
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$payment_type = json['payment_type'];
    final l$refund_amount = json['refund_amount'];
    final l$stripe_fees = json['stripe_fees'];
    final l$stripe_info = json['stripe_info'];
    final l$bill_image = json['bill_image'];
    final l$total_cost = json['total_cost'];
    final l$actual_items_cost = json['actual_items_cost'];
    final l$tax = json['tax'];
    final l$to_location_address = json['to_location_address'];
    final l$to_location_gps = json['to_location_gps'];
    final l$items = json['items'];
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
      customer_id: (l$customer_id as int),
      discount_value: moneyFromJson(l$discount_value),
      from_location_gps: l$from_location_gps == null
          ? null
          : geographyFromJson(l$from_location_gps),
      from_location_text: (l$from_location_text as String?),
      id: (l$id as int),
      order_time: (l$order_time as String),
      payment_type: (l$payment_type as String),
      refund_amount: moneyFromJson(l$refund_amount),
      stripe_fees: moneyFromJson(l$stripe_fees),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      bill_image: (l$bill_image as String?),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      actual_items_cost: l$actual_items_cost == null
          ? null
          : moneyFromJson(l$actual_items_cost),
      tax: moneyFromJson(l$tax),
      to_location_address: (l$to_location_address as String),
      to_location_gps: geographyFromJson(l$to_location_gps),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      delivery_order:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
              .fromJson((l$delivery_order as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int customer_id;

  final double discount_value;

  final Geography? from_location_gps;

  final String? from_location_text;

  final int id;

  final String order_time;

  final String payment_type;

  final double refund_amount;

  final double stripe_fees;

  final dynamic? stripe_info;

  final String? bill_image;

  final double? total_cost;

  final double? actual_items_cost;

  final double tax;

  final String to_location_address;

  final Geography to_location_gps;

  final List<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>
      items;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
      delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$discount_value = discount_value;
    _resultData['discount_value'] = moneyToJson(l$discount_value);
    final l$from_location_gps = from_location_gps;
    _resultData['from_location_gps'] = l$from_location_gps == null
        ? null
        : geographyToJson(l$from_location_gps);
    final l$from_location_text = from_location_text;
    _resultData['from_location_text'] = l$from_location_text;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$stripe_fees = stripe_fees;
    _resultData['stripe_fees'] = moneyToJson(l$stripe_fees);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$bill_image = bill_image;
    _resultData['bill_image'] = l$bill_image;
    final l$total_cost = total_cost;
    _resultData['total_cost'] =
        l$total_cost == null ? null : moneyToJson(l$total_cost);
    final l$actual_items_cost = actual_items_cost;
    _resultData['actual_items_cost'] =
        l$actual_items_cost == null ? null : moneyToJson(l$actual_items_cost);
    final l$tax = tax;
    _resultData['tax'] = moneyToJson(l$tax);
    final l$to_location_address = to_location_address;
    _resultData['to_location_address'] = l$to_location_address;
    final l$to_location_gps = to_location_gps;
    _resultData['to_location_gps'] = geographyToJson(l$to_location_gps);
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] = l$delivery_order.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$discount_value = discount_value;
    final l$from_location_gps = from_location_gps;
    final l$from_location_text = from_location_text;
    final l$id = id;
    final l$order_time = order_time;
    final l$payment_type = payment_type;
    final l$refund_amount = refund_amount;
    final l$stripe_fees = stripe_fees;
    final l$stripe_info = stripe_info;
    final l$bill_image = bill_image;
    final l$total_cost = total_cost;
    final l$actual_items_cost = actual_items_cost;
    final l$tax = tax;
    final l$to_location_address = to_location_address;
    final l$to_location_gps = to_location_gps;
    final l$items = items;
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_id,
      l$discount_value,
      l$from_location_gps,
      l$from_location_text,
      l$id,
      l$order_time,
      l$payment_type,
      l$refund_amount,
      l$stripe_fees,
      l$stripe_info,
      l$bill_image,
      l$total_cost,
      l$actual_items_cost,
      l$tax,
      l$to_location_address,
      l$to_location_gps,
      Object.hashAll(l$items.map((v) => v)),
      l$delivery_order,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$discount_value = discount_value;
    final lOther$discount_value = other.discount_value;
    if (l$discount_value != lOther$discount_value) {
      return false;
    }
    final l$from_location_gps = from_location_gps;
    final lOther$from_location_gps = other.from_location_gps;
    if (l$from_location_gps != lOther$from_location_gps) {
      return false;
    }
    final l$from_location_text = from_location_text;
    final lOther$from_location_text = other.from_location_text;
    if (l$from_location_text != lOther$from_location_text) {
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
    final l$bill_image = bill_image;
    final lOther$bill_image = other.bill_image;
    if (l$bill_image != lOther$bill_image) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
      return false;
    }
    final l$actual_items_cost = actual_items_cost;
    final lOther$actual_items_cost = other.actual_items_cost;
    if (l$actual_items_cost != lOther$actual_items_cost) {
      return false;
    }
    final l$tax = tax;
    final lOther$tax = other.tax;
    if (l$tax != lOther$tax) {
      return false;
    }
    final l$to_location_address = to_location_address;
    final lOther$to_location_address = other.to_location_address;
    if (l$to_location_address != lOther$to_location_address) {
      return false;
    }
    final l$to_location_gps = to_location_gps;
    final lOther$to_location_gps = other.to_location_gps;
    if (l$to_location_gps != lOther$to_location_gps) {
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
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order != lOther$delivery_order) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk;

  TRes call({
    int? customer_id,
    double? discount_value,
    Geography? from_location_gps,
    String? from_location_text,
    int? id,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    double? stripe_fees,
    dynamic? stripe_info,
    String? bill_image,
    double? total_cost,
    double? actual_items_cost,
    double? tax,
    String? to_location_address,
    Geography? to_location_gps,
    List<Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>?
        items,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order?
        delivery_order,
    String? $__typename,
  });
  TRes items(
      Iterable<Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
                      Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>>)
          _fn);
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
      TRes> get delivery_order;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? discount_value = _undefined,
    Object? from_location_gps = _undefined,
    Object? from_location_text = _undefined,
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? payment_type = _undefined,
    Object? refund_amount = _undefined,
    Object? stripe_fees = _undefined,
    Object? stripe_info = _undefined,
    Object? bill_image = _undefined,
    Object? total_cost = _undefined,
    Object? actual_items_cost = _undefined,
    Object? tax = _undefined,
    Object? to_location_address = _undefined,
    Object? to_location_gps = _undefined,
    Object? items = _undefined,
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        discount_value: discount_value == _undefined || discount_value == null
            ? _instance.discount_value
            : (discount_value as double),
        from_location_gps: from_location_gps == _undefined
            ? _instance.from_location_gps
            : (from_location_gps as Geography?),
        from_location_text: from_location_text == _undefined
            ? _instance.from_location_text
            : (from_location_text as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        refund_amount: refund_amount == _undefined || refund_amount == null
            ? _instance.refund_amount
            : (refund_amount as double),
        stripe_fees: stripe_fees == _undefined || stripe_fees == null
            ? _instance.stripe_fees
            : (stripe_fees as double),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        bill_image: bill_image == _undefined
            ? _instance.bill_image
            : (bill_image as String?),
        total_cost: total_cost == _undefined
            ? _instance.total_cost
            : (total_cost as double?),
        actual_items_cost: actual_items_cost == _undefined
            ? _instance.actual_items_cost
            : (actual_items_cost as double?),
        tax: tax == _undefined || tax == null ? _instance.tax : (tax as double),
        to_location_address:
            to_location_address == _undefined || to_location_address == null
                ? _instance.to_location_address
                : (to_location_address as String),
        to_location_gps:
            to_location_gps == _undefined || to_location_gps == null
                ? _instance.to_location_gps
                : (to_location_gps as Geography),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>),
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
                          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
      TRes> get delivery_order {
    final local$delivery_order = _instance.delivery_order;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
        local$delivery_order, (e) => call(delivery_order: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? customer_id,
    double? discount_value,
    Geography? from_location_gps,
    String? from_location_text,
    int? id,
    String? order_time,
    String? payment_type,
    double? refund_amount,
    double? stripe_fees,
    dynamic? stripe_info,
    String? bill_image,
    double? total_cost,
    double? actual_items_cost,
    double? tax,
    String? to_location_address,
    Geography? to_location_gps,
    List<Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>?
        items,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order?
        delivery_order,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
          TRes>
      get delivery_order =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items({
    this.actual_cost,
    this.estimated_cost,
    required this.id,
    this.image,
    required this.name,
    this.notes,
    required this.unavailable,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$actual_cost = json['actual_cost'];
    final l$estimated_cost = json['estimated_cost'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$notes = json['notes'];
    final l$unavailable = json['unavailable'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
      actual_cost: l$actual_cost == null ? null : moneyFromJson(l$actual_cost),
      estimated_cost:
          l$estimated_cost == null ? null : moneyFromJson(l$estimated_cost),
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String),
      notes: (l$notes as String?),
      unavailable: (l$unavailable as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? actual_cost;

  final double? estimated_cost;

  final int id;

  final String? image;

  final String name;

  final String? notes;

  final bool unavailable;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_cost = actual_cost;
    _resultData['actual_cost'] =
        l$actual_cost == null ? null : moneyToJson(l$actual_cost);
    final l$estimated_cost = estimated_cost;
    _resultData['estimated_cost'] =
        l$estimated_cost == null ? null : moneyToJson(l$estimated_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$unavailable = unavailable;
    _resultData['unavailable'] = l$unavailable;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_cost = actual_cost;
    final l$estimated_cost = estimated_cost;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$notes = notes;
    final l$unavailable = unavailable;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_cost,
      l$estimated_cost,
      l$id,
      l$image,
      l$name,
      l$notes,
      l$unavailable,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_cost = actual_cost;
    final lOther$actual_cost = other.actual_cost;
    if (l$actual_cost != lOther$actual_cost) {
      return false;
    }
    final l$estimated_cost = estimated_cost;
    final lOther$estimated_cost = other.estimated_cost;
    if (l$estimated_cost != lOther$estimated_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$unavailable = unavailable;
    final lOther$unavailable = other.unavailable;
    if (l$unavailable != lOther$unavailable) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items;

  TRes call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_cost = _undefined,
    Object? estimated_cost = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? notes = _undefined,
    Object? unavailable = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
        actual_cost: actual_cost == _undefined
            ? _instance.actual_cost
            : (actual_cost as double?),
        estimated_cost: estimated_cost == _undefined
            ? _instance.estimated_cost
            : (estimated_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        unavailable: unavailable == _undefined || unavailable == null
            ? _instance.unavailable
            : (unavailable as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$items(
      this._res);

  TRes _res;

  call({
    double? actual_cost,
    double? estimated_cost,
    int? id,
    String? image,
    String? name,
    String? notes,
    bool? unavailable,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order({
    this.driver_review_by_customer,
    this.change_price_request,
    this.schedule_time,
    required this.customer,
    required this.chat_with_customer_id,
    this.chat_with_service_provider_id,
    required this.dropoff_address,
    required this.dropoff_gps,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.estimated_package_ready_time,
    this.pickup_address,
    this.pickup_gps,
    this.delivery_company,
    required this.delivery_cost,
    this.in_process,
    required this.id,
    required this.status,
    required this.service_provider_type,
    this.trip_distance,
    this.trip_duration,
    this.trip_polyline,
    required this.package_ready,
    required this.direction,
    required this.service_provider_id,
    this.delivery_driver,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$driver_review_by_customer = json['driver_review_by_customer'];
    final l$change_price_request = json['change_price_request'];
    final l$schedule_time = json['schedule_time'];
    final l$customer = json['customer'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$pickup_address = json['pickup_address'];
    final l$pickup_gps = json['pickup_gps'];
    final l$delivery_company = json['delivery_company'];
    final l$delivery_cost = json['delivery_cost'];
    final l$in_process = json['in_process'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_polyline = json['trip_polyline'];
    final l$package_ready = json['package_ready'];
    final l$direction = json['direction'];
    final l$service_provider_id = json['service_provider_id'];
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
      driver_review_by_customer: l$driver_review_by_customer == null
          ? null
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
              .fromJson((l$driver_review_by_customer as Map<String, dynamic>)),
      change_price_request: l$change_price_request == null
          ? null
          : mapFromJson(l$change_price_request),
      schedule_time: (l$schedule_time as String?),
      customer:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      pickup_address: (l$pickup_address as String?),
      pickup_gps: l$pickup_gps == null ? null : geographyFromJson(l$pickup_gps),
      delivery_company: l$delivery_company == null
          ? null
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      delivery_cost: moneyFromJson(l$delivery_cost),
      in_process: (l$in_process as bool?),
      id: (l$id as int),
      status: (l$status as String),
      service_provider_type: (l$service_provider_type as String),
      trip_distance: (l$trip_distance as int?),
      trip_duration: (l$trip_duration as int?),
      trip_polyline: (l$trip_polyline as String?),
      package_ready: (l$package_ready as bool),
      direction: (l$direction as String),
      service_provider_id: (l$service_provider_id as int),
      delivery_driver: l$delivery_driver == null
          ? null
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
      driver_review_by_customer;

  final dynamic? change_price_request;

  final String? schedule_time;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
      customer;

  final int chat_with_customer_id;

  final int? chat_with_service_provider_id;

  final String dropoff_address;

  final Geography dropoff_gps;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? estimated_package_ready_time;

  final String? pickup_address;

  final Geography? pickup_gps;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
      delivery_company;

  final double delivery_cost;

  final bool? in_process;

  final int id;

  final String status;

  final String service_provider_type;

  final int? trip_distance;

  final int? trip_duration;

  final String? trip_polyline;

  final bool package_ready;

  final String direction;

  final int service_provider_id;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
      delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$driver_review_by_customer = driver_review_by_customer;
    _resultData['driver_review_by_customer'] =
        l$driver_review_by_customer?.toJson();
    final l$change_price_request = change_price_request;
    _resultData['change_price_request'] = l$change_price_request == null
        ? null
        : mapToJson(l$change_price_request);
    final l$schedule_time = schedule_time;
    _resultData['schedule_time'] = l$schedule_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] =
        l$pickup_gps == null ? null : geographyToJson(l$pickup_gps);
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$package_ready = package_ready;
    _resultData['package_ready'] = l$package_ready;
    final l$direction = direction;
    _resultData['direction'] = l$direction;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$driver_review_by_customer = driver_review_by_customer;
    final l$change_price_request = change_price_request;
    final l$schedule_time = schedule_time;
    final l$customer = customer;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$pickup_address = pickup_address;
    final l$pickup_gps = pickup_gps;
    final l$delivery_company = delivery_company;
    final l$delivery_cost = delivery_cost;
    final l$in_process = in_process;
    final l$id = id;
    final l$status = status;
    final l$service_provider_type = service_provider_type;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$trip_polyline = trip_polyline;
    final l$package_ready = package_ready;
    final l$direction = direction;
    final l$service_provider_id = service_provider_id;
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$driver_review_by_customer,
      l$change_price_request,
      l$schedule_time,
      l$customer,
      l$chat_with_customer_id,
      l$chat_with_service_provider_id,
      l$dropoff_address,
      l$dropoff_gps,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$estimated_package_ready_time,
      l$pickup_address,
      l$pickup_gps,
      l$delivery_company,
      l$delivery_cost,
      l$in_process,
      l$id,
      l$status,
      l$service_provider_type,
      l$trip_distance,
      l$trip_duration,
      l$trip_polyline,
      l$package_ready,
      l$direction,
      l$service_provider_id,
      l$delivery_driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver_review_by_customer = driver_review_by_customer;
    final lOther$driver_review_by_customer = other.driver_review_by_customer;
    if (l$driver_review_by_customer != lOther$driver_review_by_customer) {
      return false;
    }
    final l$change_price_request = change_price_request;
    final lOther$change_price_request = other.change_price_request;
    if (l$change_price_request != lOther$change_price_request) {
      return false;
    }
    final l$schedule_time = schedule_time;
    final lOther$schedule_time = other.schedule_time;
    if (l$schedule_time != lOther$schedule_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
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
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$package_ready = package_ready;
    final lOther$package_ready = other.package_ready;
    if (l$package_ready != lOther$package_ready) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order;

  TRes call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
        driver_review_by_customer,
    dynamic? change_price_request,
    String? schedule_time,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer?
        customer,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    String? pickup_address,
    Geography? pickup_gps,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
        delivery_company,
    double? delivery_cost,
    bool? in_process,
    int? id,
    String? status,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    bool? package_ready,
    String? direction,
    int? service_provider_id,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
        delivery_driver,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
      TRes> get driver_review_by_customer;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
      TRes> get customer;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
      TRes> get delivery_company;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
      TRes> get delivery_driver;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? driver_review_by_customer = _undefined,
    Object? change_price_request = _undefined,
    Object? schedule_time = _undefined,
    Object? customer = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? pickup_address = _undefined,
    Object? pickup_gps = _undefined,
    Object? delivery_company = _undefined,
    Object? delivery_cost = _undefined,
    Object? in_process = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_polyline = _undefined,
    Object? package_ready = _undefined,
    Object? direction = _undefined,
    Object? service_provider_id = _undefined,
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
        driver_review_by_customer: driver_review_by_customer == _undefined
            ? _instance.driver_review_by_customer
            : (driver_review_by_customer
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?),
        change_price_request: change_price_request == _undefined
            ? _instance.change_price_request
            : (change_price_request as dynamic?),
        schedule_time: schedule_time == _undefined
            ? _instance.schedule_time
            : (schedule_time as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        pickup_address: pickup_address == _undefined
            ? _instance.pickup_address
            : (pickup_address as String?),
        pickup_gps: pickup_gps == _undefined
            ? _instance.pickup_gps
            : (pickup_gps as Geography?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        in_process: in_process == _undefined
            ? _instance.in_process
            : (in_process as bool?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        package_ready: package_ready == _undefined || package_ready == null
            ? _instance.package_ready
            : (package_ready as bool),
        direction: direction == _undefined || direction == null
            ? _instance.direction
            : (direction as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
      TRes> get driver_review_by_customer {
    final local$driver_review_by_customer = _instance.driver_review_by_customer;
    return local$driver_review_by_customer == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
            local$driver_review_by_customer,
            (e) => call(driver_review_by_customer: e));
  }

  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer?
        driver_review_by_customer,
    dynamic? change_price_request,
    String? schedule_time,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer?
        customer,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    String? pickup_address,
    Geography? pickup_gps,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company?
        delivery_company,
    double? delivery_cost,
    bool? in_process,
    int? id,
    String? status,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    bool? package_ready,
    String? direction,
    int? service_provider_id,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver?
        delivery_driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
          TRes>
      get driver_review_by_customer =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
              .stub(_res);
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
              .stub(_res);
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer({
    this.from_name,
    this.from_image,
    this.to_name,
    this.to_image,
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

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer.fromJson(
      Map<String, dynamic> json) {
    final l$from_name = json['from_name'];
    final l$from_image = json['from_image'];
    final l$to_name = json['to_name'];
    final l$to_image = json['to_image'];
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
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
      from_name: (l$from_name as String?),
      from_image: (l$from_image as String?),
      to_name: (l$to_name as String?),
      to_image: (l$to_image as String?),
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
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? from_name;

  final String? from_image;

  final String? to_name;

  final String? to_image;

  final String created_at;

  final int from_entity_id;

  final String from_entity_type;

  final int id;

  final String? note;

  final int rating;

  final int to_entity_id;

  final String to_entity_type;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$from_name = from_name;
    _resultData['from_name'] = l$from_name;
    final l$from_image = from_image;
    _resultData['from_image'] = l$from_image;
    final l$to_name = to_name;
    _resultData['to_name'] = l$to_name;
    final l$to_image = to_image;
    _resultData['to_image'] = l$to_image;
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
    final l$from_name = from_name;
    final l$from_image = from_image;
    final l$to_name = to_name;
    final l$to_image = to_image;
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
      l$from_name,
      l$from_image,
      l$to_name,
      l$to_image,
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$from_name = from_name;
    final lOther$from_name = other.from_name;
    if (l$from_name != lOther$from_name) {
      return false;
    }
    final l$from_image = from_image;
    final lOther$from_image = other.from_image;
    if (l$from_image != lOther$from_image) {
      return false;
    }
    final l$to_name = to_name;
    final lOther$to_name = other.to_name;
    if (l$to_name != lOther$to_name) {
      return false;
    }
    final l$to_image = to_image;
    final lOther$to_image = other.to_image;
    if (l$to_image != lOther$to_image) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer;

  TRes call({
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? from_name = _undefined,
    Object? from_image = _undefined,
    Object? to_name = _undefined,
    Object? to_image = _undefined,
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
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
        from_name: from_name == _undefined
            ? _instance.from_name
            : (from_name as String?),
        from_image: from_image == _undefined
            ? _instance.from_image
            : (from_image as String?),
        to_name:
            to_name == _undefined ? _instance.to_name : (to_name as String?),
        to_image:
            to_image == _undefined ? _instance.to_image : (to_image as String?),
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
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer(
      this._res);

  TRes _res;

  call({
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
      user:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer;

  TRes call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user({
    this.image,
    this.name,
    required this.id,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user;

  TRes call({
    String? image,
    String? name,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$driver_review_by_customer$customer$user(
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

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
      user:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer;

  TRes call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.language_id,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company({
    required this.id,
    this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company;

  TRes call({
    int? id,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details({
    required this.image,
    required this.name,
    required this.currency,
    required this.location,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
      image: (l$image as String),
      name: (l$name as String),
      currency: (l$currency as String),
      location:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String image;

  final String name;

  final String currency;

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$name = name;
    final l$currency = currency;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$name,
      l$currency,
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details;

  TRes call({
    String? image,
    String? name,
    String? currency,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
      TRes> get location;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? image,
    String? name,
    String? currency,
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
          TRes>
      get location =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
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

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_company$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
      user:
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver;

  TRes call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
              .stub(_res);
}

class Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user {
  Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user({
    this.name,
    this.image,
    required this.id,
    required this.$__typename,
  });

  factory Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
      name: (l$name as String?),
      image: (l$image as String?),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
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
            is Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user) ||
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

extension UtilityExtension$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
    on Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user {
  CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
    Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
        instance,
    TRes Function(
            Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user;

  factory CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user;

  TRes call({
    String? name,
    String? image,
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user
      _instance;

  final TRes Function(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_courier_order_by_id$delivery_courier_order_by_pk$delivery_order$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    int? id,
    String? $__typename,
  }) =>
      _res;
}
