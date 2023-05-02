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
            name: NameNode(value: 'scheduled_time'),
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
                    name: NameNode(value: 'language'),
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
                name: NameNode(value: 'in_json'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'order_time'),
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
                name: NameNode(value: 'trip_polyline'),
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
                name: NameNode(value: 'service_provider_type'),
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
                name: NameNode(value: 'chat_with_service_provider_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'chat_with_customer_id'),
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
                name: NameNode(value: 'cancellation_time'),
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
                name: NameNode(value: 'delivery_driver'),
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
                        name: NameNode(value: 'firebase_id'),
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
    this.scheduled_time,
    this.stripe_info,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    this.review,
    required this.order_time,
    required this.customer_app_type,
    required this.tax,
    this.total_cost,
    this.items_cost,
    this.chat_id,
    required this.customer,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$scheduled_time = json['scheduled_time'];
    final l$stripe_info = json['stripe_info'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$review = json['review'];
    final l$order_time = json['order_time'];
    final l$customer_app_type = json['customer_app_type'];
    final l$tax = json['tax'];
    final l$total_cost = json['total_cost'];
    final l$items_cost = json['items_cost'];
    final l$chat_id = json['chat_id'];
    final l$customer = json['customer'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
      id: (l$id as int),
      notes: (l$notes as String?),
      scheduled_time: (l$scheduled_time as String?),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
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
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      review: l$review == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
              .fromJson((l$review as Map<String, dynamic>)),
      order_time: (l$order_time as String),
      customer_app_type: (l$customer_app_type as String),
      tax: moneyFromJson(l$tax),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      chat_id: (l$chat_id as int?),
      customer:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
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

  final String? scheduled_time;

  final dynamic? stripe_info;

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

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review?
      review;

  final String order_time;

  final String customer_app_type;

  final double tax;

  final double? total_cost;

  final double? items_cost;

  final int? chat_id;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer
      customer;

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
    final l$scheduled_time = scheduled_time;
    _resultData['scheduled_time'] = l$scheduled_time;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
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
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$review = review;
    _resultData['review'] = l$review?.toJson();
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
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
    final l$scheduled_time = scheduled_time;
    final l$stripe_info = stripe_info;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$review = review;
    final l$order_time = order_time;
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
      l$scheduled_time,
      l$stripe_info,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$review,
      l$order_time,
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
    final l$scheduled_time = scheduled_time;
    final lOther$scheduled_time = other.scheduled_time;
    if (l$scheduled_time != lOther$scheduled_time) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
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
    final l$review = review;
    final lOther$review = other.review;
    if (l$review != lOther$review) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
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
    String? scheduled_time,
    dynamic? stripe_info,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review?
        review,
    String? order_time,
    String? customer_app_type,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer?
        customer,
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
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
      TRes> get review;
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
    Object? scheduled_time = _undefined,
    Object? stripe_info = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? review = _undefined,
    Object? order_time = _undefined,
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
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        scheduled_time: scheduled_time == _undefined
            ? _instance.scheduled_time
            : (scheduled_time as String?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
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
        review: review == _undefined
            ? _instance.review
            : (review
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
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
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer),
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
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
      TRes> get review {
    final local$review = _instance.review;
    return local$review == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
            local$review, (e) => call(review: e));
  }

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
    String? scheduled_time,
    dynamic? stripe_info,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items>?
        items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review?
        review,
    String? order_time,
    String? customer_app_type,
    double? tax,
    double? total_cost,
    double? items_cost,
    int? chat_id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$customer?
        customer,
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
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
          TRes>
      get review =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
              .stub(_res);
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
    this.details,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant) ||
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
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
      TRes> get details;
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
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
            local$details, (e) => call(details: e));
  }
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
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
          TRes>
      get details =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language,
    required this.currency,
    required this.location,
    required this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$currency = json['currency'];
    final l$location = json['location'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language: mapFromJson(l$language),
      currency: (l$currency as String),
      location:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final dynamic language;

  final String currency;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
      location;

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
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
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
    final l$language = language;
    final l$currency = currency;
    final l$location = location;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language,
      l$currency,
      l$location,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details) ||
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    String? currency,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? currency = _undefined,
    Object? location = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    String? currency,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
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

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items({
    required this.in_json,
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$in_json = json['in_json'];
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
      in_json: mapFromJson(l$in_json),
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

  final dynamic in_json;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$in_json = in_json;
    _resultData['in_json'] = mapToJson(l$in_json);
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
    final l$in_json = in_json;
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$in_json,
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
    final l$in_json = in_json;
    final lOther$in_json = other.in_json;
    if (l$in_json != lOther$in_json) {
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
    dynamic? in_json,
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
    Object? in_json = _undefined,
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$items(
        in_json: in_json == _undefined || in_json == null
            ? _instance.in_json
            : (in_json as dynamic),
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
    dynamic? in_json,
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
    required this.id,
    this.image,
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
    final l$id = json['id'];
    final l$image = json['image'];
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
      id: (l$id as int),
      image: (l$image as String?),
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

  final int id;

  final String? image;

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
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
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
    final l$id = id;
    final l$image = image;
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
      l$id,
      l$image,
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
    int? id,
    String? image,
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
    Object? id = _undefined,
    Object? image = _undefined,
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
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
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
    int? id,
    String? image,
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

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review({
    required this.created_at,
    required this.from_entity_id,
    required this.from_entity_type,
    this.from_name,
    this.from_image,
    this.to_name,
    this.to_image,
    required this.id,
    this.note,
    required this.rating,
    required this.to_entity_id,
    required this.to_entity_type,
    this.customer,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review.fromJson(
      Map<String, dynamic> json) {
    final l$created_at = json['created_at'];
    final l$from_entity_id = json['from_entity_id'];
    final l$from_entity_type = json['from_entity_type'];
    final l$from_name = json['from_name'];
    final l$from_image = json['from_image'];
    final l$to_name = json['to_name'];
    final l$to_image = json['to_image'];
    final l$id = json['id'];
    final l$note = json['note'];
    final l$rating = json['rating'];
    final l$to_entity_id = json['to_entity_id'];
    final l$to_entity_type = json['to_entity_type'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
      created_at: (l$created_at as String),
      from_entity_id: (l$from_entity_id as int),
      from_entity_type: (l$from_entity_type as String),
      from_name: (l$from_name as String?),
      from_image: (l$from_image as String?),
      to_name: (l$to_name as String?),
      to_image: (l$to_image as String?),
      id: (l$id as int),
      note: (l$note as String?),
      rating: (l$rating as int),
      to_entity_id: (l$to_entity_id as int),
      to_entity_type: (l$to_entity_type as String),
      customer: l$customer == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String created_at;

  final int from_entity_id;

  final String from_entity_type;

  final String? from_name;

  final String? from_image;

  final String? to_name;

  final String? to_image;

  final int id;

  final String? note;

  final int rating;

  final int to_entity_id;

  final String to_entity_type;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
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
    final l$from_name = from_name;
    _resultData['from_name'] = l$from_name;
    final l$from_image = from_image;
    _resultData['from_image'] = l$from_image;
    final l$to_name = to_name;
    _resultData['to_name'] = l$to_name;
    final l$to_image = to_image;
    _resultData['to_image'] = l$to_image;
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
    final l$from_name = from_name;
    final l$from_image = from_image;
    final l$to_name = to_name;
    final l$to_image = to_image;
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
      l$from_name,
      l$from_image,
      l$to_name,
      l$to_image,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review;

  TRes call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review)
      _then;

  static const _undefined = {};

  TRes call({
    Object? created_at = _undefined,
    Object? from_entity_id = _undefined,
    Object? from_entity_type = _undefined,
    Object? from_name = _undefined,
    Object? from_image = _undefined,
    Object? to_name = _undefined,
    Object? to_image = _undefined,
    Object? id = _undefined,
    Object? note = _undefined,
    Object? rating = _undefined,
    Object? to_entity_id = _undefined,
    Object? to_entity_type = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
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
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review(
      this._res);

  TRes _res;

  call({
    String? created_at,
    int? from_entity_id,
    String? from_entity_type,
    String? from_name,
    String? from_image,
    String? to_name,
    String? to_image,
    int? id,
    String? note,
    int? rating,
    int? to_entity_id,
    String? to_entity_type,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
      user:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer) ||
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer;

  TRes call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
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
    this.trip_polyline,
    this.trip_distance,
    required this.service_provider_type,
    this.trip_duration,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.id,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.cancellation_time,
    required this.delivery_cost,
    this.delivery_driver,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$trip_polyline = json['trip_polyline'];
    final l$trip_distance = json['trip_distance'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_duration = json['trip_duration'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$id = json['id'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      trip_polyline: (l$trip_polyline as String?),
      trip_distance: (l$trip_distance as int?),
      service_provider_type: (l$service_provider_type as String),
      trip_duration: (l$trip_duration as int?),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      id: (l$id as int),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery_driver: l$delivery_driver == null
          ? null
          : Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? trip_polyline;

  final int? trip_distance;

  final String service_provider_type;

  final int? trip_duration;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final int id;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? cancellation_time;

  final double delivery_cost;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
      delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$trip_polyline = trip_polyline;
    final l$trip_distance = trip_distance;
    final l$service_provider_type = service_provider_type;
    final l$trip_duration = trip_duration;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$id = id;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$cancellation_time = cancellation_time;
    final l$delivery_cost = delivery_cost;
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$trip_polyline,
      l$trip_distance,
      l$service_provider_type,
      l$trip_duration,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$id,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$cancellation_time,
      l$delivery_cost,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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
    String? trip_polyline,
    int? trip_distance,
    String? service_provider_type,
    int? trip_duration,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    int? id,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? cancellation_time,
    double? delivery_cost,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
        delivery_driver,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
      TRes> get delivery_driver;
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
    Object? trip_polyline = _undefined,
    Object? trip_distance = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_duration = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? id = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery(
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
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
    String? trip_polyline,
    int? trip_distance,
    String? service_provider_type,
    int? trip_duration,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    int? id,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? cancellation_time,
    double? delivery_cost,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
        delivery_driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver({
    required this.id,
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
      id: (l$id as int),
      user:
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver;

  TRes call({
    int? id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
              .stub(_res);
}

class Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user {
  Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user({
    required this.id,
    this.image,
    this.name,
    required this.firebase_id,
    required this.language_id,
    required this.$__typename,
  });

  factory Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String firebase_id;

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
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
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
    final l$firebase_id = firebase_id;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$firebase_id,
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
            is Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user) ||
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
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
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

extension UtilityExtension$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
    on Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user {
  CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
    Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
        instance,
    TRes Function(
            Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user;

  factory CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
      _instance;

  final TRes Function(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
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
            name: NameNode(value: 'scheduled_time'),
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
                    name: NameNode(value: 'language'),
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
                name: NameNode(value: 'in_json'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'review'),
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
            name: NameNode(value: 'order_time'),
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
                name: NameNode(value: 'trip_polyline'),
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
                name: NameNode(value: 'chat_with_service_provider_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'chat_with_customer_id'),
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
                name: NameNode(value: 'cancellation_time'),
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
                name: NameNode(value: 'delivery_driver'),
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
                        name: NameNode(value: 'firebase_id'),
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
    this.scheduled_time,
    this.stripe_info,
    required this.restaurant,
    required this.items,
    required this.payment_type,
    this.to_location_gps,
    this.to_location_address,
    this.estimated_food_ready_time,
    this.actual_food_ready_time,
    required this.refund_amount,
    this.delivery_id,
    required this.status,
    this.review_id,
    this.review,
    required this.order_time,
    required this.customer_app_type,
    required this.tax,
    this.total_cost,
    this.items_cost,
    this.chat_id,
    required this.customer,
    required this.delivery_cost,
    this.delivery,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$scheduled_time = json['scheduled_time'];
    final l$stripe_info = json['stripe_info'];
    final l$restaurant = json['restaurant'];
    final l$items = json['items'];
    final l$payment_type = json['payment_type'];
    final l$to_location_gps = json['to_location_gps'];
    final l$to_location_address = json['to_location_address'];
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$actual_food_ready_time = json['actual_food_ready_time'];
    final l$refund_amount = json['refund_amount'];
    final l$delivery_id = json['delivery_id'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$review = json['review'];
    final l$order_time = json['order_time'];
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
      scheduled_time: (l$scheduled_time as String?),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
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
      refund_amount: moneyFromJson(l$refund_amount),
      delivery_id: (l$delivery_id as int?),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      review: l$review == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$review
              .fromJson((l$review as Map<String, dynamic>)),
      order_time: (l$order_time as String),
      customer_app_type: (l$customer_app_type as String),
      tax: moneyFromJson(l$tax),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      items_cost: l$items_cost == null ? null : moneyFromJson(l$items_cost),
      chat_id: (l$chat_id as int?),
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

  final String? scheduled_time;

  final dynamic? stripe_info;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant
      restaurant;

  final List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>
      items;

  final String payment_type;

  final Geography? to_location_gps;

  final String? to_location_address;

  final String? estimated_food_ready_time;

  final String? actual_food_ready_time;

  final double refund_amount;

  final int? delivery_id;

  final String status;

  final int? review_id;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review? review;

  final String order_time;

  final String customer_app_type;

  final double tax;

  final double? total_cost;

  final double? items_cost;

  final int? chat_id;

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
    final l$scheduled_time = scheduled_time;
    _resultData['scheduled_time'] = l$scheduled_time;
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
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
    final l$refund_amount = refund_amount;
    _resultData['refund_amount'] = moneyToJson(l$refund_amount);
    final l$delivery_id = delivery_id;
    _resultData['delivery_id'] = l$delivery_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$review = review;
    _resultData['review'] = l$review?.toJson();
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
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
    final l$scheduled_time = scheduled_time;
    final l$stripe_info = stripe_info;
    final l$restaurant = restaurant;
    final l$items = items;
    final l$payment_type = payment_type;
    final l$to_location_gps = to_location_gps;
    final l$to_location_address = to_location_address;
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$actual_food_ready_time = actual_food_ready_time;
    final l$refund_amount = refund_amount;
    final l$delivery_id = delivery_id;
    final l$status = status;
    final l$review_id = review_id;
    final l$review = review;
    final l$order_time = order_time;
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
      l$scheduled_time,
      l$stripe_info,
      l$restaurant,
      Object.hashAll(l$items.map((v) => v)),
      l$payment_type,
      l$to_location_gps,
      l$to_location_address,
      l$estimated_food_ready_time,
      l$actual_food_ready_time,
      l$refund_amount,
      l$delivery_id,
      l$status,
      l$review_id,
      l$review,
      l$order_time,
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
    final l$scheduled_time = scheduled_time;
    final lOther$scheduled_time = other.scheduled_time;
    if (l$scheduled_time != lOther$scheduled_time) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
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
    final l$review = review;
    final lOther$review = other.review;
    if (l$review != lOther$review) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
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
    String? scheduled_time,
    dynamic? stripe_info,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review? review,
    String? order_time,
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
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<TRes>
      get review;
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
    Object? scheduled_time = _undefined,
    Object? stripe_info = _undefined,
    Object? restaurant = _undefined,
    Object? items = _undefined,
    Object? payment_type = _undefined,
    Object? to_location_gps = _undefined,
    Object? to_location_address = _undefined,
    Object? estimated_food_ready_time = _undefined,
    Object? actual_food_ready_time = _undefined,
    Object? refund_amount = _undefined,
    Object? delivery_id = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? review = _undefined,
    Object? order_time = _undefined,
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
        scheduled_time: scheduled_time == _undefined
            ? _instance.scheduled_time
            : (scheduled_time as String?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
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
        review: review == _undefined
            ? _instance.review
            : (review
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$review?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
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
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
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
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<TRes>
      get review {
    final local$review = _instance.review;
    return local$review == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
            local$review, (e) => call(review: e));
  }

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
    String? scheduled_time,
    dynamic? stripe_info,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant?
        restaurant,
    List<Query$get_restaurant_order_by_id$restaurant_order_by_pk$items>? items,
    String? payment_type,
    Geography? to_location_gps,
    String? to_location_address,
    String? estimated_food_ready_time,
    String? actual_food_ready_time,
    double? refund_amount,
    int? delivery_id,
    String? status,
    int? review_id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review? review,
    String? order_time,
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
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<TRes>
      get review =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review
              .stub(_res);
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
    this.details,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
      id: (l$id as int),
      details: l$details == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant) ||
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
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
      TRes> get details;
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
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
            local$details, (e) => call(details: e));
  }
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
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language,
    required this.currency,
    required this.location,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$currency = json['currency'];
    final l$location = json['location'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language: mapFromJson(l$language),
      currency: (l$currency as String),
      location:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final dynamic language;

  final String currency;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
      location;

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
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
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
    final l$language = language;
    final l$currency = currency;
    final l$location = location;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language,
      l$currency,
      l$location,
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details) ||
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    String? currency,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? currency = _undefined,
    Object? location = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    dynamic? language,
    String? currency,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location?
        location,
    String? name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
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

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$items {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$items({
    required this.in_json,
    required this.restaurant_item,
    required this.cost_per_one,
    required this.id,
    this.notes,
    required this.quantity,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$in_json = json['in_json'];
    final l$restaurant_item = json['restaurant_item'];
    final l$cost_per_one = json['cost_per_one'];
    final l$id = json['id'];
    final l$notes = json['notes'];
    final l$quantity = json['quantity'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
      in_json: mapFromJson(l$in_json),
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

  final dynamic in_json;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$items$restaurant_item
      restaurant_item;

  final double cost_per_one;

  final int id;

  final String? notes;

  final int quantity;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$in_json = in_json;
    _resultData['in_json'] = mapToJson(l$in_json);
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
    final l$in_json = in_json;
    final l$restaurant_item = restaurant_item;
    final l$cost_per_one = cost_per_one;
    final l$id = id;
    final l$notes = notes;
    final l$quantity = quantity;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$in_json,
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
    final l$in_json = in_json;
    final lOther$in_json = other.in_json;
    if (l$in_json != lOther$in_json) {
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
    dynamic? in_json,
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
    Object? in_json = _undefined,
    Object? restaurant_item = _undefined,
    Object? cost_per_one = _undefined,
    Object? id = _undefined,
    Object? notes = _undefined,
    Object? quantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$items(
        in_json: in_json == _undefined || in_json == null
            ? _instance.in_json
            : (in_json as dynamic),
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
    dynamic? in_json,
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
    required this.id,
    this.image,
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
    final l$id = json['id'];
    final l$image = json['image'];
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
      id: (l$id as int),
      image: (l$image as String?),
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

  final int id;

  final String? image;

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
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
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
    final l$id = id;
    final l$image = image;
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
      l$id,
      l$image,
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
    int? id,
    String? image,
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
    Object? id = _undefined,
    Object? image = _undefined,
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
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
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
    int? id,
    String? image,
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

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$review {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$review({
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

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$review.fromJson(
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
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
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
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
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

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$review) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$review {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$review)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review;

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
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
      TRes> get customer;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review
      _instance;

  final TRes Function(
      Query$get_restaurant_order_by_id$restaurant_order_by_pk$review) _then;

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
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
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
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review(
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
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
          TRes>
      get customer =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
      user:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer) ||
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer;

  TRes call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
          TRes>
      get user =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$review$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
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
    this.trip_polyline,
    required this.service_provider_type,
    this.trip_distance,
    this.trip_duration,
    this.chat_with_service_provider_id,
    required this.chat_with_customer_id,
    required this.id,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.cancellation_time,
    required this.delivery_cost,
    this.delivery_driver,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$trip_polyline = json['trip_polyline'];
    final l$service_provider_type = json['service_provider_type'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$id = json['id'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$delivery_cost = json['delivery_cost'];
    final l$delivery_driver = json['delivery_driver'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
      trip_polyline: (l$trip_polyline as String?),
      service_provider_type: (l$service_provider_type as String),
      trip_distance: (l$trip_distance as int?),
      trip_duration: (l$trip_duration as int?),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      id: (l$id as int),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      delivery_driver: l$delivery_driver == null
          ? null
          : Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? trip_polyline;

  final String service_provider_type;

  final int? trip_distance;

  final int? trip_duration;

  final int? chat_with_service_provider_id;

  final int chat_with_customer_id;

  final int id;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? cancellation_time;

  final double delivery_cost;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
      delivery_driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$trip_polyline = trip_polyline;
    final l$service_provider_type = service_provider_type;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$id = id;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$cancellation_time = cancellation_time;
    final l$delivery_cost = delivery_cost;
    final l$delivery_driver = delivery_driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$trip_polyline,
      l$service_provider_type,
      l$trip_distance,
      l$trip_duration,
      l$chat_with_service_provider_id,
      l$chat_with_customer_id,
      l$id,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$cancellation_time,
      l$delivery_cost,
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
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
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
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
    String? trip_polyline,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    int? id,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? cancellation_time,
    double? delivery_cost,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
        delivery_driver,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
      TRes> get delivery_driver;
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
    Object? trip_polyline = _undefined,
    Object? service_provider_type = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? id = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? delivery_cost = _undefined,
    Object? delivery_driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery(
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
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
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }
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
    String? trip_polyline,
    String? service_provider_type,
    int? trip_distance,
    int? trip_duration,
    int? chat_with_service_provider_id,
    int? chat_with_customer_id,
    int? id,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? cancellation_time,
    double? delivery_cost,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver?
        delivery_driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver({
    required this.id,
    required this.user,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
      id: (l$id as int),
      user:
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver;

  TRes call({
    int? id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
      TRes> get user;
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
          TRes>
      get user =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
              .stub(_res);
}

class Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user {
  Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user({
    required this.id,
    this.image,
    this.name,
    required this.firebase_id,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String firebase_id;

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
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
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
    final l$firebase_id = firebase_id;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$firebase_id,
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
            is Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user) ||
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
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
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

extension UtilityExtension$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
    on Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user {
  CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user>
      get copyWith =>
          CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
    TRes> {
  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
    Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
        instance,
    TRes Function(
            Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user;

  factory CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user
      _instance;

  final TRes Function(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
        TRes>
    implements
        CopyWith$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_order_by_id$restaurant_order_by_pk$delivery$delivery_driver$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? firebase_id,
    String? language_id,
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
    this.delivery,
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
    final l$delivery = json['delivery'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      total_cost: l$total_cost == null ? null : moneyFromJson(l$total_cost),
      to_location_address: (l$to_location_address as String?),
      delivery: l$delivery == null
          ? null
          : Subscription$listen_restaurant_current_orders$restaurant_order$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
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

  final Subscription$listen_restaurant_current_orders$restaurant_order$delivery?
      delivery;

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
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
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
    final l$delivery = delivery;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$total_cost,
      l$to_location_address,
      l$delivery,
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
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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
    Subscription$listen_restaurant_current_orders$restaurant_order$delivery?
        delivery,
    Subscription$listen_restaurant_current_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
      TRes> get delivery;
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
    Object? delivery = _undefined,
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
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Subscription$listen_restaurant_current_orders$restaurant_order$delivery?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_restaurant_current_orders$restaurant_order$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
      TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }

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
    Subscription$listen_restaurant_current_orders$restaurant_order$delivery?
        delivery,
    Subscription$listen_restaurant_current_orders$restaurant_order$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
          TRes>
      get delivery =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery
              .stub(_res);
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$customer
              .stub(_res);
}

class Subscription$listen_restaurant_current_orders$restaurant_order$delivery {
  Subscription$listen_restaurant_current_orders$restaurant_order$delivery({
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Subscription$listen_restaurant_current_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Subscription$listen_restaurant_current_orders$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Subscription$listen_restaurant_current_orders$restaurant_order$delivery
    on Subscription$listen_restaurant_current_orders$restaurant_order$delivery {
  CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
          Subscription$listen_restaurant_current_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
    Subscription$listen_restaurant_current_orders$restaurant_order$delivery
        instance,
    TRes Function(
            Subscription$listen_restaurant_current_orders$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery;

  factory CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery;

  TRes call({
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Subscription$listen_restaurant_current_orders$restaurant_order$delivery
      _instance;

  final TRes Function(
          Subscription$listen_restaurant_current_orders$restaurant_order$delivery)
      _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Subscription$listen_restaurant_current_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_restaurant_current_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
    this.delivery,
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
    final l$delivery = json['delivery'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery: l$delivery == null
          ? null
          : Query$get_restaurant_current_orders$restaurant_order$delivery
              .fromJson((l$delivery as Map<String, dynamic>)),
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

  final Query$get_restaurant_current_orders$restaurant_order$delivery? delivery;

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
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
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
    final l$delivery = delivery;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery,
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
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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
    Query$get_restaurant_current_orders$restaurant_order$delivery? delivery,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_current_orders$restaurant_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<TRes>
      get delivery;
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
    Object? delivery = _undefined,
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
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$get_restaurant_current_orders$restaurant_order$delivery?),
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
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }

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
    Query$get_restaurant_current_orders$restaurant_order$delivery? delivery,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_current_orders$restaurant_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<TRes>
      get delivery =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery
              .stub(_res);
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$customer
              .stub(_res);
}

class Query$get_restaurant_current_orders$restaurant_order$delivery {
  Query$get_restaurant_current_orders$restaurant_order$delivery({
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$get_restaurant_current_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_current_orders$restaurant_order$delivery(
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$get_restaurant_current_orders$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_restaurant_current_orders$restaurant_order$delivery
    on Query$get_restaurant_current_orders$restaurant_order$delivery {
  CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<
          Query$get_restaurant_current_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery(
    Query$get_restaurant_current_orders$restaurant_order$delivery instance,
    TRes Function(Query$get_restaurant_current_orders$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$delivery;

  factory CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$delivery;

  TRes call({
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_current_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_current_orders$restaurant_order$delivery _instance;

  final TRes Function(
      Query$get_restaurant_current_orders$restaurant_order$delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_current_orders$restaurant_order$delivery(
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_current_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_current_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
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
  factory Variables$Query$get_restaurant_past_orders({
    required int restaurantId,
    int? offset,
    int? limit,
  }) =>
      Variables$Query$get_restaurant_past_orders._({
        r'restaurantId': restaurantId,
        if (offset != null) r'offset': offset,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$get_restaurant_past_orders._(this._$data);

  factory Variables$Query$get_restaurant_past_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$get_restaurant_past_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  int? get offset => (_$data['offset'] as int?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
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
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    final l$offset = offset;
    final l$limit = limit;
    return Object.hashAll([
      l$restaurantId,
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_past_orders<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_past_orders(
    Variables$Query$get_restaurant_past_orders instance,
    TRes Function(Variables$Query$get_restaurant_past_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_past_orders;

  factory CopyWith$Variables$Query$get_restaurant_past_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders;

  TRes call({
    int? restaurantId,
    int? offset,
    int? limit,
  });
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

  TRes call({
    Object? restaurantId = _undefined,
    Object? offset = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$get_restaurant_past_orders._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
        if (offset != _undefined) 'offset': (offset as int?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders<TRes>
    implements CopyWith$Variables$Query$get_restaurant_past_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_past_orders(this._res);

  TRes _res;

  call({
    int? restaurantId,
    int? offset,
    int? limit,
  }) =>
      _res;
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
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'order_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
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
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
    this.delivery,
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
    final l$delivery = json['delivery'];
    final l$total_cost = json['total_cost'];
    final l$to_location_address = json['to_location_address'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders$restaurant_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      delivery: l$delivery == null
          ? null
          : Query$get_restaurant_past_orders$restaurant_order$delivery.fromJson(
              (l$delivery as Map<String, dynamic>)),
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

  final Query$get_restaurant_past_orders$restaurant_order$delivery? delivery;

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
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
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
    final l$delivery = delivery;
    final l$total_cost = total_cost;
    final l$to_location_address = to_location_address;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$delivery,
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
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
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
    Query$get_restaurant_past_orders$restaurant_order$delivery? delivery,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_past_orders$restaurant_order$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<TRes>
      get delivery;
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
    Object? delivery = _undefined,
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
        delivery: delivery == _undefined
            ? _instance.delivery
            : (delivery
                as Query$get_restaurant_past_orders$restaurant_order$delivery?),
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
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<TRes>
      get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery(
            local$delivery, (e) => call(delivery: e));
  }

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
    Query$get_restaurant_past_orders$restaurant_order$delivery? delivery,
    double? total_cost,
    String? to_location_address,
    Query$get_restaurant_past_orders$restaurant_order$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<TRes>
      get delivery =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery
              .stub(_res);
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$customer
              .stub(_res);
}

class Query$get_restaurant_past_orders$restaurant_order$delivery {
  Query$get_restaurant_past_orders$restaurant_order$delivery({
    required this.delivery_cost,
    required this.$__typename,
  });

  factory Query$get_restaurant_past_orders$restaurant_order$delivery.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_cost = json['delivery_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_past_orders$restaurant_order$delivery(
      delivery_cost: moneyFromJson(l$delivery_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double delivery_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_cost = delivery_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Query$get_restaurant_past_orders$restaurant_order$delivery) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_restaurant_past_orders$restaurant_order$delivery
    on Query$get_restaurant_past_orders$restaurant_order$delivery {
  CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<
          Query$get_restaurant_past_orders$restaurant_order$delivery>
      get copyWith =>
          CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<
    TRes> {
  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery(
    Query$get_restaurant_past_orders$restaurant_order$delivery instance,
    TRes Function(Query$get_restaurant_past_orders$restaurant_order$delivery)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$delivery;

  factory CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$delivery;

  TRes call({
    double? delivery_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_past_orders$restaurant_order$delivery(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_past_orders$restaurant_order$delivery _instance;

  final TRes Function(
      Query$get_restaurant_past_orders$restaurant_order$delivery) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_past_orders$restaurant_order$delivery(
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$delivery<
        TRes>
    implements
        CopyWith$Query$get_restaurant_past_orders$restaurant_order$delivery<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_past_orders$restaurant_order$delivery(
      this._res);

  TRes _res;

  call({
    double? delivery_cost,
    String? $__typename,
  }) =>
      _res;
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

class Variables$Mutation$setRestaurantOrderEstFoodReadyTime {
  factory Variables$Mutation$setRestaurantOrderEstFoodReadyTime({
    required int orderId,
    required int deliveryOrderId,
    required String time,
  }) =>
      Variables$Mutation$setRestaurantOrderEstFoodReadyTime._({
        r'orderId': orderId,
        r'deliveryOrderId': deliveryOrderId,
        r'time': time,
      });

  Variables$Mutation$setRestaurantOrderEstFoodReadyTime._(this._$data);

  factory Variables$Mutation$setRestaurantOrderEstFoodReadyTime.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    final l$deliveryOrderId = data['deliveryOrderId'];
    result$data['deliveryOrderId'] = (l$deliveryOrderId as int);
    final l$time = data['time'];
    result$data['time'] = (l$time as String);
    return Variables$Mutation$setRestaurantOrderEstFoodReadyTime._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  int get deliveryOrderId => (_$data['deliveryOrderId'] as int);
  String get time => (_$data['time'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    final l$deliveryOrderId = deliveryOrderId;
    result$data['deliveryOrderId'] = l$deliveryOrderId;
    final l$time = time;
    result$data['time'] = l$time;
    return result$data;
  }

  CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<
          Variables$Mutation$setRestaurantOrderEstFoodReadyTime>
      get copyWith =>
          CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$setRestaurantOrderEstFoodReadyTime) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    final l$deliveryOrderId = deliveryOrderId;
    final lOther$deliveryOrderId = other.deliveryOrderId;
    if (l$deliveryOrderId != lOther$deliveryOrderId) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    final l$deliveryOrderId = deliveryOrderId;
    final l$time = time;
    return Object.hashAll([
      l$orderId,
      l$deliveryOrderId,
      l$time,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<
    TRes> {
  factory CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime(
    Variables$Mutation$setRestaurantOrderEstFoodReadyTime instance,
    TRes Function(Variables$Mutation$setRestaurantOrderEstFoodReadyTime) then,
  ) = _CopyWithImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime;

  factory CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime;

  TRes call({
    int? orderId,
    int? deliveryOrderId,
    String? time,
  });
}

class _CopyWithImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<TRes>
    implements
        CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<TRes> {
  _CopyWithImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime(
    this._instance,
    this._then,
  );

  final Variables$Mutation$setRestaurantOrderEstFoodReadyTime _instance;

  final TRes Function(Variables$Mutation$setRestaurantOrderEstFoodReadyTime)
      _then;

  static const _undefined = {};

  TRes call({
    Object? orderId = _undefined,
    Object? deliveryOrderId = _undefined,
    Object? time = _undefined,
  }) =>
      _then(Variables$Mutation$setRestaurantOrderEstFoodReadyTime._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
        if (deliveryOrderId != _undefined && deliveryOrderId != null)
          'deliveryOrderId': (deliveryOrderId as int),
        if (time != _undefined && time != null) 'time': (time as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<
        TRes>
    implements
        CopyWith$Variables$Mutation$setRestaurantOrderEstFoodReadyTime<TRes> {
  _CopyWithStubImpl$Variables$Mutation$setRestaurantOrderEstFoodReadyTime(
      this._res);

  TRes _res;

  call({
    int? orderId,
    int? deliveryOrderId,
    String? time,
  }) =>
      _res;
}

class Mutation$setRestaurantOrderEstFoodReadyTime {
  Mutation$setRestaurantOrderEstFoodReadyTime({
    this.update_restaurant_order_by_pk,
    this.update_delivery_order_by_pk,
    required this.$__typename,
  });

  factory Mutation$setRestaurantOrderEstFoodReadyTime.fromJson(
      Map<String, dynamic> json) {
    final l$update_restaurant_order_by_pk =
        json['update_restaurant_order_by_pk'];
    final l$update_delivery_order_by_pk = json['update_delivery_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$setRestaurantOrderEstFoodReadyTime(
      update_restaurant_order_by_pk: l$update_restaurant_order_by_pk == null
          ? null
          : Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
              .fromJson(
                  (l$update_restaurant_order_by_pk as Map<String, dynamic>)),
      update_delivery_order_by_pk: l$update_delivery_order_by_pk == null
          ? null
          : Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
              .fromJson(
                  (l$update_delivery_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk?
      update_restaurant_order_by_pk;

  final Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk?
      update_delivery_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    _resultData['update_restaurant_order_by_pk'] =
        l$update_restaurant_order_by_pk?.toJson();
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    _resultData['update_delivery_order_by_pk'] =
        l$update_delivery_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_order_by_pk,
      l$update_delivery_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setRestaurantOrderEstFoodReadyTime) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    final lOther$update_restaurant_order_by_pk =
        other.update_restaurant_order_by_pk;
    if (l$update_restaurant_order_by_pk !=
        lOther$update_restaurant_order_by_pk) {
      return false;
    }
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    final lOther$update_delivery_order_by_pk =
        other.update_delivery_order_by_pk;
    if (l$update_delivery_order_by_pk != lOther$update_delivery_order_by_pk) {
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

extension UtilityExtension$Mutation$setRestaurantOrderEstFoodReadyTime
    on Mutation$setRestaurantOrderEstFoodReadyTime {
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime<
          Mutation$setRestaurantOrderEstFoodReadyTime>
      get copyWith => CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime<TRes> {
  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime(
    Mutation$setRestaurantOrderEstFoodReadyTime instance,
    TRes Function(Mutation$setRestaurantOrderEstFoodReadyTime) then,
  ) = _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime;

  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime.stub(TRes res) =
      _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime;

  TRes call({
    Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk?
        update_restaurant_order_by_pk,
    Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
      TRes> get update_restaurant_order_by_pk;
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
      TRes> get update_delivery_order_by_pk;
}

class _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime<TRes>
    implements CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime<TRes> {
  _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime(
    this._instance,
    this._then,
  );

  final Mutation$setRestaurantOrderEstFoodReadyTime _instance;

  final TRes Function(Mutation$setRestaurantOrderEstFoodReadyTime) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_order_by_pk = _undefined,
    Object? update_delivery_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setRestaurantOrderEstFoodReadyTime(
        update_restaurant_order_by_pk: update_restaurant_order_by_pk ==
                _undefined
            ? _instance.update_restaurant_order_by_pk
            : (update_restaurant_order_by_pk
                as Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk?),
        update_delivery_order_by_pk: update_delivery_order_by_pk == _undefined
            ? _instance.update_delivery_order_by_pk
            : (update_delivery_order_by_pk
                as Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
      TRes> get update_restaurant_order_by_pk {
    final local$update_restaurant_order_by_pk =
        _instance.update_restaurant_order_by_pk;
    return local$update_restaurant_order_by_pk == null
        ? CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
            local$update_restaurant_order_by_pk,
            (e) => call(update_restaurant_order_by_pk: e));
  }

  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
      TRes> get update_delivery_order_by_pk {
    final local$update_delivery_order_by_pk =
        _instance.update_delivery_order_by_pk;
    return local$update_delivery_order_by_pk == null
        ? CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
            local$update_delivery_order_by_pk,
            (e) => call(update_delivery_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime<TRes>
    implements CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime<TRes> {
  _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime(this._res);

  TRes _res;

  call({
    Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk?
        update_restaurant_order_by_pk,
    Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
          TRes>
      get update_restaurant_order_by_pk =>
          CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
              .stub(_res);
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
          TRes>
      get update_delivery_order_by_pk =>
          CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
              .stub(_res);
}

const documentNodeMutationsetRestaurantOrderEstFoodReadyTime =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setRestaurantOrderEstFoodReadyTime'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        variable: VariableNode(name: NameNode(value: 'time')),
        type: NamedTypeNode(
          name: NameNode(value: 'timestamptz'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'estimated_food_ready_time'),
                value: VariableNode(name: NameNode(value: 'time')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'estimated_food_ready_time'),
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
        name: NameNode(value: 'update_delivery_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'deliveryOrderId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'estimated_package_ready_time'),
                value: VariableNode(name: NameNode(value: 'time')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
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
Mutation$setRestaurantOrderEstFoodReadyTime
    _parserFn$Mutation$setRestaurantOrderEstFoodReadyTime(
            Map<String, dynamic> data) =>
        Mutation$setRestaurantOrderEstFoodReadyTime.fromJson(data);
typedef OnMutationCompleted$Mutation$setRestaurantOrderEstFoodReadyTime
    = FutureOr<void> Function(
  dynamic,
  Mutation$setRestaurantOrderEstFoodReadyTime?,
);

class Options$Mutation$setRestaurantOrderEstFoodReadyTime extends graphql
    .MutationOptions<Mutation$setRestaurantOrderEstFoodReadyTime> {
  Options$Mutation$setRestaurantOrderEstFoodReadyTime({
    String? operationName,
    required Variables$Mutation$setRestaurantOrderEstFoodReadyTime variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setRestaurantOrderEstFoodReadyTime?
        onCompleted,
    graphql.OnMutationUpdate<Mutation$setRestaurantOrderEstFoodReadyTime>?
        update,
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
                        : _parserFn$Mutation$setRestaurantOrderEstFoodReadyTime(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetRestaurantOrderEstFoodReadyTime,
          parserFn: _parserFn$Mutation$setRestaurantOrderEstFoodReadyTime,
        );

  final OnMutationCompleted$Mutation$setRestaurantOrderEstFoodReadyTime?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$setRestaurantOrderEstFoodReadyTime extends graphql
    .WatchQueryOptions<Mutation$setRestaurantOrderEstFoodReadyTime> {
  WatchOptions$Mutation$setRestaurantOrderEstFoodReadyTime({
    String? operationName,
    required Variables$Mutation$setRestaurantOrderEstFoodReadyTime variables,
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
          document: documentNodeMutationsetRestaurantOrderEstFoodReadyTime,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$setRestaurantOrderEstFoodReadyTime,
        );
}

extension ClientExtension$Mutation$setRestaurantOrderEstFoodReadyTime
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$setRestaurantOrderEstFoodReadyTime>>
      mutate$setRestaurantOrderEstFoodReadyTime(
              Options$Mutation$setRestaurantOrderEstFoodReadyTime
                  options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$setRestaurantOrderEstFoodReadyTime>
      watchMutation$setRestaurantOrderEstFoodReadyTime(
              WatchOptions$Mutation$setRestaurantOrderEstFoodReadyTime
                  options) =>
          this.watchMutation(options);
}

class Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk {
  Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk({
    this.estimated_food_ready_time,
    required this.$__typename,
  });

  factory Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$estimated_food_ready_time = json['estimated_food_ready_time'];
    final l$$__typename = json['__typename'];
    return Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
      estimated_food_ready_time: (l$estimated_food_ready_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? estimated_food_ready_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$estimated_food_ready_time = estimated_food_ready_time;
    _resultData['estimated_food_ready_time'] = l$estimated_food_ready_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$estimated_food_ready_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$estimated_food_ready_time = estimated_food_ready_time;
    final lOther$estimated_food_ready_time = other.estimated_food_ready_time;
    if (l$estimated_food_ready_time != lOther$estimated_food_ready_time) {
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

extension UtilityExtension$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
    on Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk {
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
          Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
    Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
        instance,
    TRes Function(
            Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk;

  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk;

  TRes call({
    String? estimated_food_ready_time,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk
      _instance;

  final TRes Function(
          Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? estimated_food_ready_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
        estimated_food_ready_time: estimated_food_ready_time == _undefined
            ? _instance.estimated_food_ready_time
            : (estimated_food_ready_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_restaurant_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? estimated_food_ready_time,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk {
  Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk({
    this.estimated_package_ready_time,
    required this.$__typename,
  });

  factory Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$$__typename = json['__typename'];
    return Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? estimated_package_ready_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$estimated_package_ready_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
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

extension UtilityExtension$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
    on Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk {
  CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
          Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
    Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
        instance,
    TRes Function(
            Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk;

  factory CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk;

  TRes call({
    String? estimated_package_ready_time,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk
      _instance;

  final TRes Function(
          Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? estimated_package_ready_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$setRestaurantOrderEstFoodReadyTime$update_delivery_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? estimated_package_ready_time,
    String? $__typename,
  }) =>
      _res;
}
